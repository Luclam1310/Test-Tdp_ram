class tdpram_agent2 extends uvm_agent;
	
	tdpram_mon2 mon2; // agent2 chỉ chứa monitor 2
	
	`uvm_component_utils(tdpram_agent2)
	
	function new(string name = "tdpram_agent2", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		mon2 = tdpram_mon2::type_id::create("mon2", this);
	endfunction
	
	
endclass