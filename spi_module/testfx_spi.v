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
	reg [31:0] din;
	reg trigger;
	reg [0:0] target;
	reg CPOL;
	reg CPHA;

	// Outputs
	wire MOSI;
	wire SPI_CLK;
	wire [0:0] SPI_SS;
	wire [31:0] dout;
	wire valid;

	// Instantiate the Unit Under Test (UUT)
	spi_master_4byte uut (
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

	initial begin
		// Initialize Inputs
		MISO = 0;
		CLK_IN = 0;
		din = 0;
		trigger = 0;
		target = 0;
		CPOL = 0;
		CPHA = 0;

		// Wait 100 ns for global reset to finish
		#1000;
      
		din = 32'haaaa3333;
		target = 1;
		trigger = 1;
		
		#10;
		trigger = 0;
		
		#1000;
		
		CPHA = 1;
		din = 32'hbbbb4444;
		trigger = 1;
		
		#10;
		trigger = 0;
		
		#1000;
		CPOL = 1;
		din = 32'hcccc5555;
		trigger = 1;
		
		#10;
		trigger = 0;
		
		#1000;
		
		CPHA = 0;
		din = 32'hdddd6666;
		trigger = 1;
		
		#10;
		trigger = 0;
		// Add stimulus here

	end
	
	always #5 CLK_IN = ~CLK_IN;
      
endmodule

