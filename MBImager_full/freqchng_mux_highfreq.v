`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:15 06/02/2017 
// Design Name: 
// Module Name:    freqchng_mux_highfreq 
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
module freqchng_mux_highfreq(
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
		.O(FREQ_OUT),
		.I0(W_freq0_freq1),
		.I1(FREQ_IN[2]),
		.S(FREQ_SEL[1])
	);

endmodule
