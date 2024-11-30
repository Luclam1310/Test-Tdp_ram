class tdpram_env extends uvm_env;
`uvm_component_utils(tdpram_env)
	
	tdpram_agent1 agent1;
	tdpram_agent2 agent2;
	tdpram_sb sb;
	tdpram_cov cov;
	
	
	function new(string name = "tdpram_env", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent1 = tdpram_agent1::type_id::create("agent1", this);
		agent2 = tdpram_agent2::type_id::create("agent2", this);
		sb = tdpram_sb::type_id::create("sb", this);
		cov = tdpram_cov::type_id::create("cov", this);//////////////
	endfunction
	
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		agent1.mon1.item_collected_port.connect(sb.ip_fifo.analysis_export);
		agent1.mon1.cov_ap.connect(cov.analysis_export);
		agent2.mon2.item_collected_port_B.connect(sb.op_fifo.analysis_export);
	endfunction
	
	
endclass
