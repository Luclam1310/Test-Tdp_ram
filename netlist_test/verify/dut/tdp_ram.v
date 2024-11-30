module tdp_ram (	
				clk,
				din_a,  // data in at port A
				dout_a, // data out at port A
				addr_a, // address in at port A
				we_a,   // write enable at port A
				din_b,  // data in at port B
				dout_b, // data out at port B
				addr_b, // address in at port B
				we_b,   // write enable at port B
				sclr    // synchronous clear/reset port; used to clear the registered data output ports.
			  );

input clk;
input [7:0] din_a, din_b;
output [7:0] dout_a, dout_b;
reg [7:0] dout_a, dout_b;
input [5:0] addr_a, addr_b;
input we_a, we_b;
input sclr;

// memory array
reg [7:0] mem [0:63];

always @(posedge clk) begin
  if (sclr == 1'b0) begin
	dout_a <= 8'b0;
	dout_b <= 8'b0;
  end
  else if (we_a == 1'b0)
	mem[addr_a] <= din_a;
  else
	dout_a <= mem[addr_a];
end

always@(posedge  clk) begin
  if (sclr == 1'b0) begin
	dout_a <= 8'b0;
	dout_b <= 8'b0;
  end
  else if(we_b == 1'b0)
	mem[addr_b] <= din_b;
  else
	dout_b <= mem[addr_b];
end

endmodule
