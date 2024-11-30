class tdpram_test extends uvm_test;
`uvm_component_utils(tdpram_test) 
// có 2 loại component và object, chỉ có seq_item là loại object

	tdpram_seq seq;
	tdpram_env env;
	
	
	function new(string name = "tdpram_test", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		seq = tdpram_seq::type_id::create("seq", this);
		env = tdpram_env::type_id::create("env", this);
	endfunction

	task run_phase (uvm_phase phase);
		seq = tdpram_seq::type_id::create("seq", this);
		phase.raise_objection(this);
		seq.start(env.agent1.seqr);
		#50;
		phase.drop_objection(this);
	endtask

endclass