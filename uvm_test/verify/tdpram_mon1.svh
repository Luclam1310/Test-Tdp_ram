class tdpram_mon1 extends uvm_monitor;
`uvm_component_utils(tdpram_mon1)

	virtual tdpram_interface inf;
	tdpram_seq_item pkt;
		
	uvm_analysis_port #(tdpram_seq_item) item_collected_port; // MỞ port đi đến 1 filo trong  scoreboard
	uvm_analysis_port #(tdpram_seq_item) cov_ap;  //MỞ port đi về cov
	
	function new(string name = "tdpram_mon1", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db #(virtual tdpram_interface) ::get(this,"","inf",inf);
		item_collected_port = new("item_collected_port",this);
		cov_ap = new("analysis_port",this);
	endfunction
	
	task run_phase(uvm_phase phase);
		pkt = tdpram_seq_item::type_id::create("pkt");
		forever // nội cdung dữ liệu chuyển đi
		begin
			#5;
			@(posedge inf.clk)
			if((inf.sclr == 1) && (inf.we_a == 0)) begin
			pkt.sclr = inf.sclr;
			pkt.we = inf.we_a;
			pkt.data_in = inf.din_a;
			pkt.add = inf.addr_a;	
			`uvm_info("MON1","MON1 TRANSACTIONS" ,UVM_NONE);
		end
		`uvm_info("MON","MON TRANSACTIONS",UVM_NONE); // kết thúc phần nội dung dữ liệu truyền đi
		@(posedge inf.clk)
		item_collected_port.write(pkt); //CHUYỂN các pkt(seq_item) về scoreboard
		cov_ap.write (pkt); //CHUYỂN các pkt(seq_item) về coverage
		end
	endtask
	
endclass	