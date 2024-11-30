// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sat Nov 30 11:46:16 2024
// Host        : Lam running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim tdp_ram_netlist.v
// Design      : tdp_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module tdp_ram
   (clk,
    din_a,
    dout_a,
    addr_a,
    we_a,
    din_b,
    dout_b,
    addr_b,
    we_b,
    sclr);
  input clk;
  input [7:0]din_a;
  output [7:0]dout_a;
  input [5:0]addr_a;
  input we_a;
  input [7:0]din_b;
  output [7:0]dout_b;
  input [5:0]addr_b;
  input we_b;
  input sclr;

  wire [7:0]dout_a;
  wire [7:0]dout_b;

  OBUF \dout_a_OBUF[0]_inst 
       (.I(1'b0),
        .O(dout_a[0]));
  OBUF \dout_a_OBUF[1]_inst 
       (.I(1'b0),
        .O(dout_a[1]));
  OBUF \dout_a_OBUF[2]_inst 
       (.I(1'b0),
        .O(dout_a[2]));
  OBUF \dout_a_OBUF[3]_inst 
       (.I(1'b0),
        .O(dout_a[3]));
  OBUF \dout_a_OBUF[4]_inst 
       (.I(1'b0),
        .O(dout_a[4]));
  OBUF \dout_a_OBUF[5]_inst 
       (.I(1'b0),
        .O(dout_a[5]));
  OBUF \dout_a_OBUF[6]_inst 
       (.I(1'b0),
        .O(dout_a[6]));
  OBUF \dout_a_OBUF[7]_inst 
       (.I(1'b0),
        .O(dout_a[7]));
  OBUF \dout_b_OBUF[0]_inst 
       (.I(1'b0),
        .O(dout_b[0]));
  OBUF \dout_b_OBUF[1]_inst 
       (.I(1'b0),
        .O(dout_b[1]));
  OBUF \dout_b_OBUF[2]_inst 
       (.I(1'b0),
        .O(dout_b[2]));
  OBUF \dout_b_OBUF[3]_inst 
       (.I(1'b0),
        .O(dout_b[3]));
  OBUF \dout_b_OBUF[4]_inst 
       (.I(1'b0),
        .O(dout_b[4]));
  OBUF \dout_b_OBUF[5]_inst 
       (.I(1'b0),
        .O(dout_b[5]));
  OBUF \dout_b_OBUF[6]_inst 
       (.I(1'b0),
        .O(dout_b[6]));
  OBUF \dout_b_OBUF[7]_inst 
       (.I(1'b0),
        .O(dout_b[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
