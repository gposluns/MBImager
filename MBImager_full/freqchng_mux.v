`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:16 05/29/2017 
// Design Name: 
// Module Name:    freqchng_mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module freqchng_mux(
	input [5:0] FREQ_IN,
	input [2:0]	FREQ_SEL,
	output 		FREQ_OUT
);
	
	BUFGMUX #(
		.CLK_SEL_TYPE("SYNC")
	) MUX_0a (
		.O(W_freq0_freq1),
		.I0(FREQ_IN[0]),
		.I1(FREQ_IN[1]),
		.S(FREQ_SEL[0])
	);
	
	BUFGMUX #(
		.CLK_SEL_TYPE("SYNC")
	) MUX_0b (
		.O(W_freq2_freq3),
		.I0(FREQ_IN[2]),
		.I1(FREQ_IN[3]),
		.S(FREQ_SEL[0])
	);
	
	BUFGMUX #(
		.CLK_SEL_TYPE("SYNC")
	) MUX_0c (
		.O(W_freq4_freq5),
		.I0(FREQ_IN[4]),
		.I1(FREQ_IN[5]),
		.S(FREQ_SEL[0])
	);
	
	BUFGMUX #(
		.CLK_SEL_TYPE("SYNC")
	) MUX_1 (
		.O(W_freq0123),
		.I0(W_freq0_freq1),
		.I1(W_freq2_freq3),
		.S(FREQ_SEL[1])
	);
	
	BUFGMUX #(
		.CLK_SEL_TYPE("SYNC")
	) MUX_2 (
		.O(FREQ_OUT),
		.I0(W_freq0123),
		.I1(W_freq4_freq5),
		.S(FREQ_SEL[2])
	);

endmodule
