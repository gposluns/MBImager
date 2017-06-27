`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:14 06/20/2016 
// Design Name: 
// Module Name:    Imager_SPI 
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
module Imager_SPI(
	input SPI_CLK,
    input RESETN_spi,
    output DATA,
    output REGCLK,
    output UPLOAD
    );
	 
	 integer count;
	 reg clk_en;
	 reg [39:0] regdata;
	 reg [39:0] regs;
	 reg upload_i;
	 
	 initial
		begin
		count <= 0;
		clk_en <= 0;
		upload_i <= 0;
		regs[39:35] <= 5'b00000;	// Extra registers
		regs[34:31] <= 4'b1000;		// Column load current adjustment
		regs[30:27]	<= 4'b1111;		// Dig-Mux output choice. 4'b1111 -> SPI register output chosen.
		regs[26:14] <= 13'b0000000000000;	// Multiplexer to register the correct masking data to clk
		regs[13:11]	<=	3'b011;		// Amplifier gain register (determines the number of caps in the feedback loop)
		regs[10:8]	<= 3'b011;		// Amplifier att register (determines the number of caps in the input of amp)
		regs[7:4]	<= 4'b0100;		// Output buffer biasing adjustment
		regs[3:0]	<= 4'b0100;		// Amplifier buffer adjustment
		end
		
	always @(posedge SPI_CLK)
		begin
			if (~RESETN_spi)
				count <= 0;
			else if(count < 5000)
				count <= count + 1;
			else if (count < 5040)
				begin
				count <= count + 1;
				clk_en <= 1;
				end
			else if (count < 5041)
				begin
				count <= count + 1;
				upload_i <= 1;
				clk_en <= 0;
				end
			else if (count < 5042)
				begin
				count <= count + 1;
				upload_i <= 0;
				end
		end
		
	 always @(posedge SPI_CLK)
		begin
			if(clk_en)
				regdata <= regdata << 1;
			else
				regdata <= regs;
		end
	
	// BUFGCE: Global Clock Buffer with Clock Enable
	// Spartan-6
	// Xilinx HDL Libraries Guide, version 14.7
	BUFGCE BUFGCE_inst (
	.O(REGCLK), // 1-bit output: Clock buffer output
	.CE(clk_en), // 1-bit input: Clock buffer select
	.I(~SPI_CLK) // 1-bit input: Clock buffer input (S=0)
	);
	// End of BUFGCE_inst instantiation
	
	 assign DATA = regdata [39];
	 assign UPLOAD = upload_i;

endmodule
