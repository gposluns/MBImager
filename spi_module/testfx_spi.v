`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:20:25 07/17/2017
// Design Name:   spi_master_4byte
// Module Name:   C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/spi_module/testfx_spi.v
// Project Name:  spi_module
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: spi_master_4byte
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testfx_spi;

	// Inputs
	reg MISO;
	reg CLK_IN;
	wire [15:0] din;
	wire trigger;
	wire [9:0] target;
	wire CPOL;
	wire CPHA;

	// Outputs
	wire MOSI;
	wire SPI_CLK;
	wire [9:0] SPI_SS;
	wire [15:0] dout;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	spi_master # (.N(10), .C(16)) uut (
		.MISO(MISO), 
		.MOSI(MOSI), 
		.SPI_CLK(SPI_CLK), 
		.SPI_SS(SPI_SS), 
		.CLK_IN(CLK_IN), 
		.din(din), 
		.dout(dout), 
		.trigger(trigger), 
		.target(target), 
		.valid(valid), 
		.CPOL(CPOL), 
		.CPHA(CPHA)
	);
	
	spi_programmer programmer (
		.command(din),
		.ss(target),
		.ready(valid),
		.trigger(trigger),
		.clock(CLK_IN),
		.CPOL(CPOL),
		.CPHA(CPHA)
	);

	initial begin
		// Initialize Inputs
		MISO = 0;
		CLK_IN = 0;

		// Wait 100 ns for global reset to finish
		

	end
	
	always #5 CLK_IN = ~CLK_IN;
      
endmodule

