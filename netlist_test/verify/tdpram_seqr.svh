class tdpram_seqr extends uvm_sequencer#(tdpram_seq_item);
	
	`uvm_component_utils(tdpram_seqr)
	
	function new(string name = "tdpram_seqr", uvm_component parent);
		super.new(name, parent);
	endfunction
	
endclass