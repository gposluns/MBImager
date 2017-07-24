`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:39 07/14/2017 
// Design Name: 
// Module Name:    spi_master 
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
module spi_master_4byte(
    MISO,
    MOSI,
    SPI_CLK,
    SPI_SS,
    CLK_IN,
    din,
    dout,
    trigger,
    target,
	 valid,
	 CPOL,
	 CPHA
    );
	 
	 parameter N = 1; //number of slave select bits
	 parameter C = 32; //maximum transmission length in bits, up to 2^32
	 parameter CLK_RATIO = 100;
	 parameter SS_SPACE = 1;

	 input MISO;
    output MOSI;
    output SPI_CLK;
    output [N - 1:0] SPI_SS;
    input CLK_IN;
    input [C - 1:0] din;
    output [C - 1:0] dout;
    input trigger;
    input [N - 1:0] target;
	 output valid;
	 input CPOL;
	 input CPHA;
	 
	 reg [C - 1:0] shift_out;
	 reg [C - 1:0] shift_in;
	 reg [31:0] counter;
	 reg running;
	 reg valid_i;
	 reg [N - 1: 0] SS_i;
	 reg SPI_CLK_i;
	 reg [31:0] clk_div;
	 
	 initial running = 0;
	 initial valid_i = 0;
	 initial SS_i = 0;
	 initial SPI_CLK_i = 0;
	 initial clk_div = CLK_RATIO;
	 
	 always @(posedge CLK_IN) begin
		if (trigger & ~running) begin
			running <= 1;
			counter <= C;
			shift_out <= din;
			shift_in <= 0;
			SS_i <= target;
			valid_i <= 0;
			clk_div <= CLK_RATIO*SS_SPACE;
			SPI_CLK_i <= 0;
		end else if (clk_div > 0) begin
			clk_div <= clk_div - 1;  
		end else begin
			clk_div <= CLK_RATIO;
			if (SPI_CLK_i == 0) begin
				SPI_CLK_i <= 1;
				if (running) begin
					shift_in <= {shift_in[C - 2:0], MISO};
					if (counter == 0) begin
						running <= 0;
						clk_div <= CLK_RATIO*SS_SPACE;
					end
				end
			end else begin
				SPI_CLK_i <= 0;
				if (running) begin		
					shift_out <= {1'b0, shift_out[C - 1:1]};
					counter <= counter - 1;
				end else begin
					SS_i <= 0;
					valid_i <= 1;
				end
			end
		end
	 end
	 
	 assign SPI_CLK = ((SPI_CLK_i ^ CPHA) & running) ^ CPOL;
	 assign SPI_SS = ~SS_i;
	 assign MOSI = shift_out[0];
	 assign dout = shift_in;
	 assign valid = valid_i;
endmodule
