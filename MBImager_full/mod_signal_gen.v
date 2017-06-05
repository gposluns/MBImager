`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:11 05/17/2017 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices:	Spartan 6 lx25t
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
module mod_signal_gen(
	input 			USER_CLOCK,
	input	[2:0] 	W_FREQ_SEL,
	input [4:0]		W_PHASE_SEL,
	input [3:0]		W_DUTY_SEL,
	output 			MBI_CLK_MOD,
	output 			MBI_CLKN_MOD,
	output 			MBI_CLKL_MOD
);
	
	wire				W_CLK_MOD;
	wire				W_CLKN_MOD;
	wire				W_CLKL_MOD;
	wire	[5:0]		W_FREQ;
	wire				W_SELECTED_FREQ;

	reg	[5:0]		COUNT;
	
	freqchng_clkgen freqchng(
		.CLK_IN(USER_CLOCK),
		.RESET(1'b0),
		.LOCKED(LOCKED),
		.CLK_OUT_100kHz(W_FREQ[0]),
		.CLK_OUT_200kHz(W_FREQ[1]),
		.CLK_OUT_500kHz(W_FREQ[2]),
		.CLK_OUT_1MHz(W_FREQ[3]),
		.CLK_OUT_2MHz(W_FREQ[4]),
		.CLK_OUT_4MHz(W_FREQ[5])
	);

//	freqchng_clkgen_highfreq freqchng(
//		.CLK_IN(USER_CLOCK),
//		.RESET(1'b0),
//		.LOCKED(LOCKED),
//		.CLK_OUT_10MHz(W_FREQ[0]),
//		.CLK_OUT_25MHz(W_FREQ[1]),
//		.CLK_OUT_50MHz(W_FREQ[2])
//	);
	
	BUFG BUFG_freqmux(
		.O(W_SELECTED_FREQ),
		.I(W_FREQ[W_FREQ_SEL])
	);
	
	counter_nonoverlap_clkgen nonoverlap_clkgen (
		.CLK_IN(W_SELECTED_FREQ),
		.FREQ_SEL(W_FREQ_SEL),
		.PHASE_SEL(W_PHASE_SEL),
		.DUTY_SEL(W_DUTY_SEL),
		.CLK_OUT_MOD(W_CLK_MOD),
		.CLK_OUT_MODN(W_CLKN_MOD),
		.CLK_OUT_MODL(W_CLKL_MOD)
	);
	
	ODDR2 #(
		.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
		.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
		.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
		) ODDR2_CLK_MOD_buf (
		.Q(MBI_CLK_MOD), // 1-bit DDR output data
		.C0(~W_CLK_MOD), // 1-bit clock input
		.C1(W_CLK_MOD), // 1-bit clock input
		.CE(1'b1), // 1-bit clock enable input
		.D0(1'b0), // 1-bit data input (associated with C0)
		.D1(1'b1), // 1-bit data input (associated with C1)
		.R(1'b0), // 1-bit reset input
		.S(1'b0) // 1-bit set input
	);

	ODDR2 #(
		.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
		.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
		.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
		) ODDR2_CLKN_MOD_buf (
		.Q(MBI_CLKN_MOD), // 1-bit DDR output data
		.C0(~W_CLKN_MOD), // 1-bit clock input
		.C1(W_CLKN_MOD), // 1-bit clock input
		.CE(1'b1), // 1-bit clock enable input
		.D0(1'b0), // 1-bit data input (associated with C0)
		.D1(1'b1), // 1-bit data input (associated with C1)
		.R(1'b0), // 1-bit reset input
		.S(1'b0) // 1-bit set input
	);
	
	ODDR2 #(
		.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
		.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
		.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
		) ODDR2_CLKL_MOD_buf (
		.Q(MBI_CLKL_MOD), // 1-bit DDR output data
		.C0(~W_CLKL_MOD), // 1-bit clock input
		.C1(W_CLKL_MOD), // 1-bit clock input
		.CE(1'b1), // 1-bit clock enable input
		.D0(1'b0), // 1-bit data input (associated with C0)
		.D1(1'b1), // 1-bit data input (associated with C1)
		.R(1'b0), // 1-bit reset input
		.S(1'b0) // 1-bit set input
	);
endmodule
