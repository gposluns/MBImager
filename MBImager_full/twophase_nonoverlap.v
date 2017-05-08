`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:45 05/08/2017 
// Design Name: 
// Module Name:    twophase_nonoverlap 
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
module twophase_nonoverlap(
    input CLK_IN,
    output CLK_OUT,
    output CLK_OUT_N
    );

	wire PHI1, PHI2, ORR1, ORR2;
	
	nor1 nor1(CLK_IN, PHI2, ORR1);
	nor1 nor2(!CLK_IN, PHI1, ORR2);
	
	assign #1 PHI1 = !ORR1;
	assign #1 PHI2 = !ORR2;
	
	assign CLK_OUT = PHI1;
	assign CLK_OUT_N = PHI2;
	
endmodule

module nor1(
	input I1, 
	input I2,
	output O
	);
	
	assign O = !(I1&I2);
endmodule