`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:38 08/02/2017 
// Design Name: 
// Module Name:    Reveal_top 
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
module Reveal_top(
    output [17:0] MSTREAM,    //Pattern upload signal
    output CLKM,					//100MHz clock to imager
    output EN_STREAM,			//Enable pattern upload (active high)
    output CLKMPRE,				//6.25MHz clock to imager (period = 1 mask upload)
	 output DRAIN,					//
	 output PIXGLOB_RES,			//
	 output [7:0] ROW_ADD,		//Row address for readout
	 output COL_L_EN,				//When high, read from left bucket, when low read from right bucket
	 output PIXRES_L,				//Reset left bucket
	 output PIXRES_R,				//Reset right bucket
	 output STDBY,					//Standby signal high when no readout is occuring
	 output PRECH_COL,			//Signal to start readout
	 output PGA_RES,				//Reset Programmable Gain Amplifier circuit
	 output CK_PH1,				//Clock signal to PGA (more like a pump imo)
	 output SAMP_S,				//Sample signal
	 output SAMP_R,				//Sampe Reset
	 output READ_R,				//Read Reset from ADC
	 output READ_S,				//Read Signal from ADC
	 output MUX_START,			//Signal to start imager multiplexer
	 output CP_COLMUX_IN			//Signal to multiplexer to select next level
    );

	
endmodule
