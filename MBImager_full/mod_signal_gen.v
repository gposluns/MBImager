`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:11 05/17/2017 
// Design Name: 
// Module Name:    modulated_signal_gn
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
	input 			USER_CLOCK,			//clk input
	input	[2:0] 	FREQ_SEL,			//OK board input for frequency selection of generated signals
	input [4:0]		PHASE_SEL,			//OK board input for phase selection between CLK and CLKL
	input [3:0]		DUTY_SEL,			//OK board input for duty selection of CLK and CLKN
	input				DRAIN_B,				//drain_b reset input
	output 			MBI_CLK_MOD,		//clk output to MB imager board
	output 			MBI_CLKN_MOD,		//clkn output to MB imager board, 180deg phase shifted from clk
	output 			MBI_CLKL_MOD		//clkl output to MB imager board, for light source
);
	
	wire				W_CLK_MOD;
	wire				W_CLKN_MOD;
	wire				W_CLKL_MOD;
	wire	[5:0]		W_FREQ;						//stores freq output from PLL
	wire				W_SELECTED_FREQ;
	wire				FLAG_HIGH_FREQ;			//for clk and clkn generation, passes information about if highfreq module is used
	
	freqchng_clkgen freqchng(					//PLL for frequency generation from USER_CLOCK
		.CLK_IN(USER_CLOCK),						//to cover larger frequency range, there is a high and a low frequency version of this module
		.RESET(1'b0),								//use module name "freqchng_clkgen" for lowfreq or "freqchng_clkgen_highfreq" for high freq
		.LOCKED(LOCKED),							//availiable frequences (refers to final output freq for signals):
		.FLAG_HIGH_FREQ(FLAG_HIGH_FREQ),		//clk_out	|	freqchng_clkgen output	|	freqchng_clkgen_highfreq output
		.CLK_OUT_0(W_FREQ[0]),					//		0		|			100kHz				|			10MHz
		.CLK_OUT_1(W_FREQ[1]),					//		1		|			200kHz				|			25MHz
		.CLK_OUT_2(W_FREQ[2]),					//		2		|			500kHz				|			50MHz
		.CLK_OUT_3(W_FREQ[3]),					//		3		|			1MHz					|			n/a
		.CLK_OUT_4(W_FREQ[4]),					//		4		|			2MHz					|			n/a
		.CLK_OUT_5(W_FREQ[5])					//		5		|			4MHz					|			n/a
	);

	BUFG BUFG_freqmux(							//buffer for selected freqchng output
		.O(W_SELECTED_FREQ),
		.I(W_FREQ[FREQ_SEL])
	);

//	assign W_CLK_MOD = W_FREQ[FREQ_SEL];
	
	counter_nonoverlap_clkgen nonoverlap_clkgen (	//generates clk, clkn, clkl using counters and operates phase and duty changes
		.CLK_IN(W_SELECTED_FREQ),							//for higher frequencies, resolution of phase and duty change lowers
		.FREQ_SEL(FREQ_SEL),									//100kHz-4MHz: 5-bit resolution ps, 4-bit resolution duty
		.PHASE_SEL(PHASE_SEL),								//10MHz & 25MHz: 4-bit resolution ps, 3-bit resolution duty
		.DUTY_SEL(1'b1110),									//50MHz: 3-bit resolution ps, 2-bit resolution duty
		.FLAG_HIGH_FREQ(FLAG_HIGH_FREQ),
		.DRAIN_B(1'b1),
		.CLK_OUT_MOD(W_CLK_MOD),
		.CLK_OUT_MODN(W_CLKN_MOD),
		.CLK_OUT_MODL(W_CLKL_MOD)
	);
	
	//ODDR2's for Spartan 6 pin output------------------------
	
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
