// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed May 27 14:25:52 2015
// Host        : ECE-RM215-06 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.srcs/sources_1/ip/c_accum_0/c_accum_0_stub.v
// Design      : c_accum_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_accum_v12_0,Vivado 2014.4" *)
module c_accum_0(B, CLK, SCLR, Q)
/* synthesis syn_black_box black_box_pad_pin="B[3:0],CLK,SCLR,Q[7:0]" */;
  input [3:0]B;
  input CLK;
  input SCLR;
  output [7:0]Q;
endmodule
