interface tdpram_interface (input bit clk);

logic [7:0] din_a;
logic [7:0] dout_a;
logic [5:0] addr_a;
logic we_a;
logic [7:0] din_b;
logic [7:0] dout_b;
logic [5:0] addr_b;
logic we_b;
logic sclr;

modport tb (
			output clk, sclr, we_a, we_b, din_a, din_b, addr_a, addr_b,
			input dout_a, dout_b
			);

modport dut (
			input clk, sclr, we_a, we_b, din_a, din_b, addr_a, addr_b, 
			output dout_a, dout_b
			);
endinterface