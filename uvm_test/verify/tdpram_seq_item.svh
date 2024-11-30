`include "uvm_macros.svh"  // Bao gồm macro UVM
import uvm_pkg::*;

class tdpram_seq_item extends uvm_sequence_item;
`uvm_object_utils(tdpram_seq_item)
	
	
	rand bit[7:0] data_in; 
	rand bit[5:0] add;
	bit we;
	bit sclr;
	bit[7:0] data_out;
		
	
	///////////
	
	function new(string name = "tdpram_seq_item");
		super.new(name);
	endfunction

endclass