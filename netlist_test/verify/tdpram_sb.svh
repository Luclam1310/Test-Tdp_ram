class tdpram_sb extends uvm_scoreboard;
	`uvm_component_utils(tdpram_sb);
	
	tdpram_seq_item pkt;
	tdpram_seq_item pkt_B;
	
	bit [7:0] mem [0:63];

	int pass = 0;
	int fail = 0;

	uvm_tlm_analysis_fifo #(tdpram_seq_item) ip_fifo;
	uvm_tlm_analysis_fifo #(tdpram_seq_item) op_fifo;
	
	function new(string name ="tdpram_sb", uvm_component parent);
		super.new(name, parent);
		ip_fifo = new ("ip_fifo",this);
		op_fifo = new ("op_fifo",this);
	endfunction
	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		pkt = tdpram_seq_item::type_id::create("pkt",this);
		pkt_B = tdpram_seq_item::type_id::create("pkt_B",this);
	endfunction
		
	task run_phase(uvm_phase phase);
		forever begin
			fork
				ip_fifo.get(pkt);
				`uvm_info("SB","TRANSACTIONS FROM MON1",UVM_NONE);
				$display("sb data_in=%d,add=%d",pkt.data_in,pkt.add);
				op_fifo.get(pkt_B);
				`uvm_info("SB","TRANSACTIONS FROM MON2",UVM_NONE);
				$display("sb data_out=%d,add=%d",pkt_B.data_out,pkt_B.add);
			join
				if(pkt.we == 0) begin
					mem[pkt.add]=pkt.data_in;
				end

				if(pkt_B.data_out == mem[pkt_B.add]) begin
				`uvm_info("SB MATCHED",$sformatf("DATA pkt.din_a=%d,pkt_B.dout_b=%d",mem[pkt_B.add],pkt_B.data_out),UVM_NONE);
				pass++;
				end
				else begin
				`uvm_info("SB NOT MATCHED",$sformatf("DATA pkt.din_a=%d,pkt_B.dout_b=%d",mem[pkt_B.add],pkt_B.data_out),UVM_NONE);
				fail++;
				end
		end
	endtask

	function void report_phase(uvm_phase phase);
		if(fail == 0) begin
			$display("____________________________________________TEST PASSED__________________________________________");
			$display("*************************************************************************************************");
			uvm_report_info("Scoreboard Report", $sformatf("Transactions PASS = %0d FAIL = %0d", pass, fail), UVM_MEDIUM);
			$display("*************************************************************************************************");
			$display("_________________________________________________________________________________________________");
		end
		else begin
			$display("__________________________________________TEST FAILED___________________________________________");
			$display("************************************************************************************************");
			uvm_report_info("Scoreboard Report", $sformatf("Trasactions PASS = %0d FAIL = %0d", pass, fail), UVM_MEDIUM);
			$display("************************************************************************************************");
			$display("________________________________________________________________________________________________");
		end
	endfunction
endclass