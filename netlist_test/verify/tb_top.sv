`timescale 1 ns/ 1 ps
`include "uvm_macros.svh"
`include "tdpram_interface.sv"
//`include "tdp_ram_netlist.v"
//`include "tdp_ram.v"
//`include "tdpram_tb_pkg.sv"

import uvm_pkg::*;    // nhúng thư viện UVM  
import tdpram_tb_pkg::*;

module tb_top ();
	bit clk;
	initial begin
		clk = 1'b1;
	end 
		always #5 clk = ~clk;
	
	tdpram_interface inf(clk);
	
	tdp_ram dut(.clk(inf.clk),   
				 .din_a(inf.din_a),
				 .dout_a(inf.dout_a),
				 .addr_a(inf.addr_a),
				 .we_a(inf.we_a),
				 .din_b(inf.din_b),
				 .dout_b(inf.dout_b),
				 .addr_b(inf.addr_b),
				 .we_b(inf.we_b),
				 .sclr(inf.sclr)); 
		// kết nối các tín hiệu trong UVM tb đến DUT thông qua interface 
	
	initial begin 
		uvm_config_db#(virtual tdpram_interface)::set(null, "*", "inf", inf);
		// đăng ký interface với UVM factory với tên tdpram_interface
		//Điều này giúp interface có thể được truy cập và sử dụng bởi các lớp khác trong testbench
		//	thông qua uvm_config_db
		run_test("tdpram_test"); 
		//Chạy một trong các test class được định nghĩa trong thời gian biên dịch (runtime).
		//Tên của test class này được chỉ định trong Makefile, 
		//cho phép chọn bài kiểm tra phù hợp với cấu hình.
	end
endmodule