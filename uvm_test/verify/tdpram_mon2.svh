class tdpram_mon2 extends uvm_monitor;
`uvm_component_utils(tdpram_mon2)

virtual tdpram_interface inf;	
tdpram_seq_item pkt_B;
uvm_analysis_port #(tdpram_seq_item)item_collected_port_B;
	
	
	///////////////////
	
	function new(string name = "tdpram_mon2", uvm_component parent);
		super.new(name, parent);
		item_collected_port_B = new ("item_collected_port_B", this);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db #(virtual tdpram_interface)::get(this,"","inf",inf);
	endfunction
	
	task run_phase(uvm_phase phase);
		pkt_B = tdpram_seq_item::type_id::create("pkt_B");
		forever // nội cdung dữ liệu chuyển đi
		begin
			#2;
			@(posedge inf.clk) 
		begin
			if(inf.we_b == 1) begin
				pkt_B.data_out = inf.dout_b;
				pkt_B.add = inf.addr_b;	
				`uvm_info("MON2","MON2 TRANSACTIONS" ,UVM_NONE);
			end
		end
			`uvm_info("MON2","MON2 TRANSACTIONS",UVM_NONE); 
			@(posedge inf.clk)
			item_collected_port_B.write(pkt_B); 
		end
	endtask
	
	
endclass