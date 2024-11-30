class tdpram_drv extends uvm_driver#(tdpram_seq_item);
	`uvm_component_utils(tdpram_drv)
	virtual tdpram_interface inf;
	
	//hàm khởi tạo của lớp
	function new(string name = "tdpram_drv", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	// Lấy interface từ database của factory
	// Đây là interface đã được khởi tạo trước đó trong top block.
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(virtual tdpram_interface)::get(this, "", "inf", inf);
	endfunction 
	
	///////////////////////////////////
	task run_phase(uvm_phase phase);
		tdpram_seq_item pkt;
		pkt=tdpram_seq_item::type_id::create("pkt");
	 	forever  //chạy liên tục
		begin
		seq_item_port.get_next_item(pkt);  // seq_item_port kết nối với seq_item_export(của seqr) ở agent1
		pkt.sclr = 1;
		
		@(negedge inf.clk); //Chờ cạnh xuống của tín hiệu inf.clk
		inf.sclr=pkt.sclr;
		// Truyền giá trị sclr từ pkt sang tín hiệu sclr của DUT qua inf.

		if(pkt.we == 0) begin
			inf.we_a = pkt.we;
			inf.din_a = pkt.data_in;
			inf.addr_a = pkt.add;
			`uvm_info("DRV TRANSACTIONS", $sformatf("inf.din_a=%d,inf.addr_a=%d, inf.we_a=%b",inf.din_a,inf.addr_a,inf.we_a) ,UVM_NONE);
		end
		else begin
			inf.we_b = pkt.we;
			inf.addr_b = pkt.add;
			`uvm_info("DRV TRANSACTIONS", $sformatf("inf.addr_b=%d, inf.we_b=%b",inf.addr_b,inf.we_b) ,UVM_NONE);
		end
		@(negedge inf.clk);
		seq_item_port.item_done();
		`uvm_info("DRV","DRV TRANSACTION TO DUT",UVM_NONE);
		#5;
		end
	endtask
	
endclass