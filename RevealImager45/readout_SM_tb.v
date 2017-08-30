`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:07:17 08/04/2017
// Design Name:   readoutSM
// Module Name:   C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/RevealImager/readout_SM_tb.v
// Project Name:  RevealImager
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: readoutSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module readout_SM_tb;

	// Inputs
	reg CLK100MHz;
	reg trigger;
	reg RESET;
	reg [9:0] T2;
	reg ADC_INCLK;

	// Outputs
	wire [7:0] ROWADD;
	wire COL_L_EN;
	wire PIXRES_L;
	wire PIXRES_R;
	wire STDBY;
	wire PRECH_COL;
	wire PGA_RES;
	wire CK_PH1;
	wire SAMP_S;
	wire SAMP_R;
	wire READ_R;
	wire READ_S;
	wire MUX_START;
	wire CP_COLMUX_IN;
	wire DRAIN;
	wire PIXGLOB_RES;

	wire ADC_DATA_VALID;
	wire ADC_PIXCLK;

	// Instantiate the Unit Under Test (UUT)
	readoutSM uut (
		.ROWADD(ROWADD), 
		.COL_L_EN(COL_L_EN), 
		.PIXRES_L(PIXRES_L), 
		.PIXRES_R(PIXRES_R), 
		.STDBY(STDBY), 
		.PRECH_COL(PRECH_COL), 
		.PGA_RES(PGA_RES), 
		.CK_PH1(CK_PH1), 
		.SAMP_S(SAMP_S), 
		.SAMP_R(SAMP_R), 
		.READ_R(READ_R), 
		.READ_S(READ_S), 
		.MUX_START(MUX_START), 
		.CP_COLMUX_IN(CP_COLMUX_IN), 
		.DRAIN(DRAIN), 
		.PIXGLOB_RES(PIXGLOB_RES), 
		.CLK100MHz(CLK100MHz), 
		.trigger(trigger), 
		.T1(10), 
		.T2(T2), 
		.T3(2), 
		.T4(40), 
		.T5L(56),
		.T5R(20),
		.T6(1), 
		.T7(1), 
		.T8(4), 
		.T9(3), 
		.T10(1), 
		.RESET(RESET),
		.ADC_CLKOUT(ADC_INCLK),
		.ADC_DATA_VALID(ADC_DATA_VALID),
		.ADC_PIXCLK(ADC_PIXCLK)
	);

	initial begin
		// Initialize Inputs
		trigger = 0;
		RESET = 1;
		CLK100MHz = 0;
		ADC_INCLK = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
		
		RESET = 0;
		
		#100;
		T2 = 100;
		trigger = 1;
		#100;
		
		trigger = 0;
        
		#2000000;
		T2 = 101;
		
		trigger = 1;
		#100;
		
		trigger = 0;
        
		#2000000;
		T2 = 102;
		
		trigger = 1;
		#100;
		
		trigger = 0;
        
		#2000000;
		T2 = 103;
		
		trigger = 1;
		#100;
		
		trigger = 0;
        
		#2000000;
		T2 = 104;
		
		trigger = 1;
		#100;
		
		trigger = 0;
		// Add stimulus here

	end
   
always #5 CLK100MHz = ~CLK100MHz;
always #(25/3) ADC_INCLK = ~ADC_INCLK;
		
endmodule

