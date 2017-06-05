`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:36:26 06/02/2017 
// Design Name: 
// Module Name:    counter_nonoverlap_clkgen_highfreq 
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
module counter_nonoverlap_clkgen_highfreq(
	input CLK_IN,
	input [2:0] FREQ_SEL,
	input [4:0] PHASE_SEL,
	input [3:0] DUTY_SEL,
	output CLK_OUT_MOD,		//reg for testing
	output CLK_OUT_MODN,
	output CLK_OUT_MODL
);

	reg [3:0] count_16;
	reg [2:0] count_8;
	reg CLK_OUT_MOD_1;
	reg CLK_OUT_MODN_1;
	reg CLK_OUT_MODL_1;
	reg CLK_OUT_MOD_2;
	reg CLK_OUT_MODN_2;
	reg CLK_OUT_MODL_2;
	
	always @ (posedge CLK_IN) begin
		if (count_16 == 15) CLK_OUT_MODL_1 = 1;
		if (count_16 == 7) CLK_OUT_MODL_1 = 0;
		if (count_16 == PHASE_SEL[4:1]) CLK_OUT_MOD_1 = 1;
		if (count_16 == PHASE_SEL[4:1] - 1'b1 - DUTY_SEL[3:1]) CLK_OUT_MOD_1 = 0;
		if (count_16 == PHASE_SEL[4:1] - 4'b1000) CLK_OUT_MODN_1 = 1;
		if (count_16 == PHASE_SEL[4:1] - 4'b1000 - 1'b1 - DUTY_SEL[3:1]) CLK_OUT_MODN_1 = 0;
		if (count_16 == 0) count_16 = 15;
		else count_16 = count_16 - 1'b1;
	end
	
	always @ (posedge CLK_IN) begin
		if (count_8 == 7) CLK_OUT_MODL_2 = 1;
		if (count_8 == 3) CLK_OUT_MODL_2 = 0;
		if (count_8 == PHASE_SEL[4:2]) CLK_OUT_MOD_2 = 1;
		if (count_8 == PHASE_SEL[4:2] - 1'b1 - DUTY_SEL[3:2]) CLK_OUT_MOD_2 = 0;
		if (count_8 == PHASE_SEL[4:2] - 3'b100) CLK_OUT_MODN_2 = 1;
		if (count_8 == PHASE_SEL[4:2] - 3'b100 - 1'b1 - DUTY_SEL[3:2]) CLK_OUT_MODN_2 = 0;
		if (count_8 == 0) count_8 = 7;
		else count_8 = count_8 - 1'b1;
	end
//	
	assign CLK_OUT_MOD = (FREQ_SEL[1]) ? CLK_OUT_MOD_2 : CLK_OUT_MOD_1;
	assign CLK_OUT_MODN = (FREQ_SEL[1]) ? CLK_OUT_MODN_2 : CLK_OUT_MODN_1;
	assign CLK_OUT_MODL = (FREQ_SEL[1]) ? CLK_OUT_MODL_2 : CLK_OUT_MODL_1;
//	
//	BUFGMUX # (
//		.CLK_SEL_TYPE("SYNC")
//	) BUFGMUX_clkin1 (
//		.O(CLK_OUT_MOD),
//		.I1(CLK_OUT_MOD_2),
//		.I0(CLK_OUT_MOD_1),
//		.S(FREQ_SEL[1])
//	);
//	
//	BUFGMUX # (
//		.CLK_SEL_TYPE("SYNC")
//	) BUFGMUX_clkout2 (
//		.O(CLK_OUT_MODN),
//		.I1(CLK_OUT_MODN_2),
//		.I0(CLK_OUT_MODN_1),
//		.S(FREQ_SEL[1])
//	);
//	
//	BUFGMUX # (
//		.CLK_SEL_TYPE("SYNC")
//	) BUFGMUX_clkout3 (
//		.O(CLK_OUT_MODL),
//		.I1(CLK_OUT_MODL_2),
//		.I0(CLK_OUT_MODL_1),
//		.S(FREQ_SEL[1])
//	);
	
endmodule
