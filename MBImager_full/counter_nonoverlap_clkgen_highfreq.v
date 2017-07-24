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
module counter_nonoverlap_clkgen(
	input [1:0] OPTION_SEL,
	input CLK_IN,
	input DRAIN_B,
	input [2:0] FREQ_SEL,
	input [4:0] PHASE_SEL,
	input [3:0] DUTY_SEL,
	input FLAG_HIGH_FREQ,
	output CLK_OUT_MOD,	
	output CLK_OUT_MODN,
	output CLK_OUT_MODL
);

	reg [16:0] count;
	reg [16:0] count_l;
	reg [4:0] count_32; //testmodimp
	reg [3:0] count_16;
	reg [2:0] count_8;
	reg [2:0] R_CLK_OUT_MOD;
	reg [2:0] R_CLK_OUT_MODN;
	reg [2:0] R_CLK_OUT_MODL;

	always @ (posedge CLK_IN) begin
		if (count == 17'hFFFFF) R_CLK_OUT_MODL[0] = 0;
		if (count == 17'h0FFFF) R_CLK_OUT_MODL[0] = 1;
		if (count == {PHASE_SEL,12'h000}) R_CLK_OUT_MOD[0] = 0;
		if (count == {PHASE_SEL,12'h000} - 1'b1 - {DUTY_SEL,12'h000}) R_CLK_OUT_MOD[0] = 1;
		if (count == {PHASE_SEL,12'h000} - 17'h10000) R_CLK_OUT_MODN[0] = 0;
		if (count == {PHASE_SEL,12'h000} - 17'h10000 - 1'b1 - {DUTY_SEL,12'h000}) R_CLK_OUT_MODN[0] = 1;
		if ((~DRAIN_B) & (count == {PHASE_SEL,12'h000} - 4'hF - {DUTY_SEL,12'h000})) ;
		else count = count - 1'b1;
	end
	
//	always @ (posedge CLK_IN) begin
//		if (count_l == 229375) R_CLK_OUT_MOD[0] = 1;
//		if (count_l == 184687) R_CLK_OUT_MOD[0] = 0;
//		if (count_l == 0) count_l = 229376;
//		else count_l = count_l - 1'b1;
//	end
	
//	always @ (posedge CLK_IN) begin
//		if (count_32 == 31) R_CLK_OUT_MODL[0] = 0;
//		if (count_32 == 15) R_CLK_OUT_MODL[0] = 1;
//		if (count_32 == PHASE_SEL) R_CLK_OUT_MOD[0] = 0;
//		if (count_32 == PHASE_SEL - 1'b1 - DUTY_SEL) R_CLK_OUT_MOD[0] = 1;
//		if (count_32 == PHASE_SEL - 5'b10000) R_CLK_OUT_MODN[0] = 0;
//		if (count_32 == PHASE_SEL - 5'b10000 - 1'b1 - DUTY_SEL) R_CLK_OUT_MODN[0] = 1;
//		if ((~DRAIN_B) & (count_32 == PHASE_SEL + 1)) ;
//		else count_32 = count_32 - 1'b1;
////		if ((count_32 == 0) & (DRAIN_B)) count_32 = 31;
////		else if (count_32 > 0) count_32 = count_32 - 1'b1;
//	end
	
//	always @ (posedge CLK_IN) begin
//		if (count_16 == 15) R_CLK_OUT_MODL[1] = 1;
//		if (count_16 == 7) R_CLK_OUT_MODL[1] = 0;
//		if (count_16 == PHASE_SEL[4:1]) R_CLK_OUT_MOD[1] = 1;
//		if (count_16 == PHASE_SEL[4:1] - 1'b1 - DUTY_SEL[3:1]) R_CLK_OUT_MOD[1] = 0;
//		if (count_16 == PHASE_SEL[4:1] - 4'b1000) R_CLK_OUT_MODN[1] = 1;
//		if (count_16 == PHASE_SEL[4:1] - 4'b1000 - 1'b1 - DUTY_SEL[3:1]) R_CLK_OUT_MODN[1] = 0;
//		if (count_16 == 0) count_16 = 15;
//		else if (DRAIN_B) count_16 = count_16 - 1'b1;
//	end
//	
//	always @ (posedge CLK_IN) begin
//		if (count_8 == 7) R_CLK_OUT_MODL[2] = 1;
//		if (count_8 == 3) R_CLK_OUT_MODL[2] = 0;
//		if (count_8 == PHASE_SEL[4:2]) R_CLK_OUT_MOD[2] = 1;
//		if (count_8 == PHASE_SEL[4:2] - 1'b1 - DUTY_SEL[3:2]) R_CLK_OUT_MOD[2] = 0;
//		if (count_8 == PHASE_SEL[4:2] - 3'b100) R_CLK_OUT_MODN[2] = 1;
//		if (count_8 == PHASE_SEL[4:2] - 3'b100 - 1'b1 - DUTY_SEL[3:2]) R_CLK_OUT_MODN[2] = 0;
//		if (count_8 == 0) count_8 = 7;
//		else if(DRAIN_B) count_8 = count_8 - 1'b1;
//	end
	
	assign CLK_OUT_MOD = (~DRAIN_B? 1:(~FLAG_HIGH_FREQ ? R_CLK_OUT_MOD[0] : (FREQ_SEL[1] ? R_CLK_OUT_MOD[2] : R_CLK_OUT_MOD[1])));
	assign CLK_OUT_MODN = (~DRAIN_B? 1:(~FLAG_HIGH_FREQ ? R_CLK_OUT_MODN[0] : (FREQ_SEL[1] ? R_CLK_OUT_MODN[2] : R_CLK_OUT_MODN[1])));
	assign CLK_OUT_MODL = ~DRAIN_B ? 0:(~FLAG_HIGH_FREQ ? R_CLK_OUT_MODL[0] : (FREQ_SEL[1] ? R_CLK_OUT_MODL[2] : R_CLK_OUT_MODL[1]));
//testmodimp
endmodule
