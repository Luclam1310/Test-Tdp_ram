virtual class uvm_subscriber #(type T=int) extends uvm_component;
	
	typedef uvm_subscriber #(T) this_type;
	uvm_analysis_imp #(T, this_type) analysis_export;
	
	function new (string name, uvm_component parent);
		super.new(name, parent);
		analysis_export = new("analysis_imp", this);
	endfunction
	
	pure virtual function void write(T t);
endclass 

class tdpram_cov extends uvm_subscriber #(tdpram_seq_item);
	`uvm_component_utils(tdpram_cov)
	tdpram_seq_item trans; 
	
	covergroup cov_inst;
	ADDRESS:coverpoint trans.add {option.auto_bin_max = 6;}
	DATA:coverpoint trans.data_in {option.auto_bin_max = 8;}
	endgroup
	
	function new(string name = "", uvm_component parent);
		super.new(name, parent);
		cov_inst = new(); //
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction
	
	virtual function void write(tdpram_seq_item t);
		$cast(trans, t);
		cov_inst.sample();
	endfunction 

endclass