`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:17 11/04/2016
// Design Name:   MB_top
// Module Name:   C:/Users/MBImager/Documents/Navid_ISE/MBImager_full/tb_MB_top.v
// Project Name:  MBImager_full
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MB_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_MB_top;

	// Inputs
	reg EXT_RESET_N;
	reg USER_CLOCK;
	reg SPI_FLASH_MISO;
	reg [7:0] ADC_DATA3;
	reg [7:0] ADC_DATA2;
	reg [7:0] ADC_DATA1;

	// Outputs
	wire SPI_FLASH_MOSI;
	wire [9:0] SPI_FLASH_SS;
	wire SPI_FLASH_SCLK;
	wire ADC_READ_ACLK;
	wire SPI_5V_EN;
	wire RS_POT;
	wire ADC_INCLK;
	wire MBI_CLK_CDS;
	wire [7:0] MBI_ROW_ADD;
	wire MBI_PIXRES;
	wire MBI_PRECHN_AMP;
	wire [5:0] MBI_MUX_ADD;
	wire MBI_PIXRES_GLOB;
	wire MBI_CLKN_MOD;
	wire MBI_CLK_MOD;
	wire MBI_PRECH_COL;
	wire MBI_RESETN_GLOB;
	wire MBI_DRAIN_B;
	wire ISPI_DATA;
	wire ISPI_REGCLK;
	wire ISPI_UPLOAD;
	wire [5:0] dout;
	wire fifo_dout_valid;
	wire OK_PIXRES_GLOB;
	wire CLKMPRE;
	wire STREAM;
	wire [10:1] MSTREAM;

	// User defined values
	real ADC_data_rate = 40;
	real USER_CLOCK_PERIOD = 10;
	real EXT_RESET_LENGTH = 160;
	integer clkcnt;

	// END USER CODE (Do not remove this line)

	// Instantiate the Unit Under Test (UUT)
	MB_top uut (
    .EXT_RESET_N(EXT_RESET_N), 
	.EXT_RESET_N_spi(EXT_RESET_N),
    .USER_CLOCK(USER_CLOCK), 
    .SPI_FLASH_MISO(SPI_FLASH_MISO), 
    .SPI_FLASH_MOSI(SPI_FLASH_MOSI), 
    .SPI_FLASH_SS(SPI_FLASH_SS), 
    .SPI_FLASH_SCLK(SPI_FLASH_SCLK), 
    .ADC_READ_ACLK(ADC_READ_ACLK), 
    .SPI_5V_EN(SPI_5V_EN), 
    .RS_POT(RS_POT), 
    .ADC_DATA3(ADC_DATA3), 
    .ADC_DATA2(ADC_DATA2), 
    .ADC_DATA1(ADC_DATA1), 
    .ADC_INCLK(ADC_INCLK), 
    .MBI_CLK_CDS(MBI_CLK_CDS), 
    .MBI_ROW_ADD(MBI_ROW_ADD), 
    .MBI_PIXRES(MBI_PIXRES), 
    .MBI_PRECHN_AMP(MBI_PRECHN_AMP), 
    .MBI_MUX_ADD(MBI_MUX_ADD), 
    .MBI_PIXRES_GLOB(MBI_PIXRES_GLOB), 
    .MBI_CLKN_MOD(MBI_CLKN_MOD), 
    .MBI_CLK_MOD(MBI_CLK_MOD), 
    .MBI_PRECH_COL(MBI_PRECH_COL), 
    .MBI_RESETN_GLOB(MBI_RESETN_GLOB), 
    .MBI_DRAIN_B(MBI_DRAIN_B), 
    .OK_DRAIN_B(OK_DRAIN_B), 
    .ISPI_DATA(ISPI_DATA), 
    .ISPI_REGCLK(ISPI_REGCLK), 
    .ISPI_UPLOAD(ISPI_UPLOAD), 
    .dout(dout), 
    .fifo_dout_valid(fifo_dout_valid), 
    .fifo_clk(fifo_clk), 
    .FSMIND0(FSMIND0), 
    .FSMIND1(FSMIND1), 
    .FSMIND0ACK(FSMIND0ACK), 
    .FSMIND1ACK(FSMIND1ACK), 
    .OK_PIXRES_GLOB(OK_PIXRES_GLOB)
	);
	
	ROImager_exp OK_imagerFSM (
    .RESET(~EXT_RESET_N), 
    .CLK_HS(USER_CLOCK), 
    .OK_PIXRES_GLOB(OK_PIXRES_GLOB), 
    .CLKMPRE(CLKMPRE), 
    .STREAM(STREAM), 
    .OK_DRAIN_B(OK_DRAIN_B), 
    .MSTREAM(MSTREAM), 
    .FSMIND0(FSMIND0), 
    .FSMIND1(FSMIND1), 
    .FSMIND0ACK(FSMIND0ACK), 
    .FSMIND1ACK(FSMIND1ACK)
    );


	initial begin
		// Initialize Inputs
		EXT_RESET_N = 0;
		USER_CLOCK = 0;
		SPI_FLASH_MISO = 0;
		ADC_DATA3 = 0;
		ADC_DATA2 = 0;
		ADC_DATA1 = 0;
		clkcnt = 0;

		// Wait EXT_RESET_LENGTH for global reset to finish
		#(EXT_RESET_LENGTH) EXT_RESET_N = ~EXT_RESET_N;
        
		// Add stimulus here
		#(ADC_data_rate/2.00) ADC_DATA1 = 1;
		ADC_DATA2 = 2;
		ADC_DATA3 = 4;
		
		forever #(USER_CLOCK_PERIOD/2.00) begin
			USER_CLOCK = ~USER_CLOCK;
			clkcnt = clkcnt + 1;
			if(clkcnt == 2*ADC_data_rate/USER_CLOCK_PERIOD) begin
				clkcnt = 0;
				ADC_DATA1 = ADC_DATA1 + 1;
				ADC_DATA2 = ADC_DATA2 + 2;
				ADC_DATA3 = ADC_DATA3 + 4;
			end
		end

	end
      
endmodule

