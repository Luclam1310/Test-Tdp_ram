class tdpram_agent1 extends uvm_agent;
`uvm_component_utils(tdpram_agent1)

	tdpram_seqr seqr;
	tdpram_drv drv;
	tdpram_mon1 mon1;

	function new(string name="tdpram_agent1",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		seqr=tdpram_seqr::type_id::create("seqr",this);
		drv=tdpram_drv::type_id::create("drv",this);
		mon1=tdpram_mon1::type_id::create("mon1",this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		drv.seq_item_port.connect(seqr.seq_item_export);  //seq_item_export nối với sequencer
	endfunction

endclass
