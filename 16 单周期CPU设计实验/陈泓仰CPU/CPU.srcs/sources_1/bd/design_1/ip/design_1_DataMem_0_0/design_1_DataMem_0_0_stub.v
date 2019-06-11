// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (win64) Build 1756540 Mon Jan 23 19:11:23 MST 2017
// Date        : Wed Nov 15 23:45:10 2017
// Host        : DESKTOP-91Q36U2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/.Xilinx/CPU/CPU.srcs/sources_1/bd/design_1/ip/design_1_DataMem_0_0/design_1_DataMem_0_0_stub.v
// Design      : design_1_DataMem_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "DataMem,Vivado 2016.4" *)
module design_1_DataMem_0_0(CLK, DataAddress, Datain, RD, WR, DataOut)
/* synthesis syn_black_box black_box_pad_pin="CLK,DataAddress[31:0],Datain[31:0],RD,WR,DataOut[31:0]" */;
  input CLK;
  input [31:0]DataAddress;
  input [31:0]Datain;
  input RD;
  input WR;
  output [31:0]DataOut;
endmodule
