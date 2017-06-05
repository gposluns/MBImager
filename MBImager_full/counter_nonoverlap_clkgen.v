`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:19 06/01/2017 
// Design Name: 
// Module Name:    counter_nonoverlap_clkgen 
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
	input CLK_IN,
	input [2:0] FREQ_SEL,
	input [4:0] PHASE_SEL,
	input [3:0] DUTY_SEL,
	output reg CLK_OUT_MOD,		//reg for testing
	output reg CLK_OUT_MODN,
	output reg CLK_OUT_MODL
);

	reg [4:0] count;
	
	always @ (posedge CLK_IN) begin
		if (count == 31) CLK_OUT_MODL = 1;
		if (count == 15) CLK_OUT_MODL = 0;
		if (count == PHASE_SEL) CLK_OUT_MOD = 1;
		if (count == PHASE_SEL - 1'b1 - DUTY_SEL) CLK_OUT_MOD = 0;
		if (count == PHASE_SEL - 5'b10000) CLK_OUT_MODN = 1;
		if (count == PHASE_SEL - 5'b10000 - 1'b1 - DUTY_SEL) CLK_OUT_MODN = 0;
		if (count == 0) count = 31;
		else count = count - 1'b1;
	end
endmodule

