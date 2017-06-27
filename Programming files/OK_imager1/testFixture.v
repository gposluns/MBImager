`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:37:43 11/29/2016
// Design Name:   okHost
// Module Name:   C:/Users/MBImager/Documents/OpalKelly/Navid/ISEproj/OK_imager1/testFixture.v
// Project Name:  OK_imager1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: okHost
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testFixture;

	// Inputs
	reg [4:0] okUH;
	reg [64:0] okEH;

	// Outputs
	wire [2:0] okHU;
	wire okClk;
	wire [112:0] okHE;

	// Bidirs
	wire [31:0] okUHU;
	wire okAA;

	// Instantiate the Unit Under Test (UUT)
	okHost uut (
		.okUH(okUH), 
		.okHU(okHU), 
		.okUHU(okUHU), 
		.okAA(okAA), 
		.okClk(okClk), 
		.okHE(okHE), 
		.okEH(okEH)
	);

	initial begin
		// Initialize Inputs
		okUH = 0;
		okEH = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

