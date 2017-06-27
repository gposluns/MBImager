`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:52:53 12/04/2016
// Design Name:   OK_imager
// Module Name:   C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/OKelly/ISEproj/OK_imager1/TB_OKimager.v
// Project Name:  OK_imager1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: OK_imager
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_OKimager;

	// Inputs
	reg [4:0] okUH;
	reg sys_clkn;
	reg sys_clkp;
	reg [5:0] im_data;
	reg im_data_val;
	reg im_data_clk;

	// Outputs
	wire [2:0] okHU;
	wire [7:0] led;

	// Bidirs
	wire [31:0] okUHU;
	wire okAA;

	// User defined values
	real ADC_data_rate = 40;
	real USER_CLOCK_PERIOD = 10;
	integer clkcnt;
	
	// Nets
	reg ADC_PIXCLK;
	wire FSMIND0;
	wire FSMIND1;
	wire FSMIND0ACK;
	wire FSMIND1ACK;
	wire [10:1] MSTREAM;

	// Instantiate the Unit Under Test (UUT)
	OK_imager uut (
		.okUH(okUH), 
		.okHU(okHU), 
		.okUHU(okUHU), 
		.okAA(okAA), 
		.sys_clkn(sys_clkn), 
		.sys_clkp(sys_clkp), 
		.led(led), 
		.im_data(im_data), 
		.im_data_val(im_data_val), 
		.im_data_clk(im_data_clk), 
		.FPGA_rst_n(FPGA_rst_n), 
		.CLKM(CLKM), 
		.CLKMPRE(CLKMPRE), 
		.STREAM(STREAM), 
		.MSTREAM(MSTREAM), 
		.OK_DRAIN_B(OK_DRAIN_B), 
		.OK_PIXRES_GLOB(OK_PIXRES_GLOB), 
		.FSMIND0(FSMIND0), 
		.FSMIND1(FSMIND1), 
		.FSMIND0ACK(FSMIND0ACK), 
		.FSMIND1ACK(FSMIND1ACK)
	);

	ROImager FSM_MOBO (
		.RESET(1'b0), 
		.PHI1(PHI1), 
		.ROW_ADD(ROW_ADD), 
		.PIXRES(PIXRES), 
		.PRECHN_AMP(PRECHN_AMP), 
		.MUX_ADD(MUX_ADD), 
		.ADC_PIXCLK(ADC_PIXCLK), 
		.ADC_CLK(im_data_clk), 
		.CLK_MOD(CLK_MOD), 
		.CLKN_MOD(CLKN_MOD), 
		.PRECH_COL(PRECH_COL), 
		.ADC_DATA_VALID(ADC_DATA_VALID), 
		.DDR_DATA_VALID(DDR_DATA_VALID), 
		.FSMIND0(FSMIND0), 
		.FSMIND1(FSMIND1), 
		.FSMIND0ACK(FSMIND0ACK), 
		.FSMIND1ACK(FSMIND1ACK)
    );

	
	initial begin
		// Initialize Inputs
		okUH = 1;
		sys_clkn = 0;
		sys_clkp = 1;
		im_data = 0;
		im_data_val = 0;
		im_data_clk = 0;
		clkcnt = 0;
		ADC_PIXCLK = 0;

		// Wait 100 ns for global reset to finish
		#100;
 		okUH = 0;
		im_data_val = 1;
       
		// Add stimulus here
		forever #(USER_CLOCK_PERIOD/2.00) begin
			sys_clkn = ~sys_clkn;
			sys_clkp = ~sys_clkp;
			okUH[0] = ~okUH[0];
			clkcnt = clkcnt + 1;
			if(clkcnt == 6*ADC_data_rate/USER_CLOCK_PERIOD) begin
				clkcnt = 0;
				ADC_PIXCLK = ~ADC_PIXCLK;
				im_data = im_data + 1;
			end else if(clkcnt == 5*ADC_data_rate/USER_CLOCK_PERIOD) begin
				ADC_PIXCLK = ~ADC_PIXCLK;
			end else if(clkcnt == 4*ADC_data_rate/USER_CLOCK_PERIOD) begin
				ADC_PIXCLK = ~ADC_PIXCLK;
				im_data_clk = ~im_data_clk;
			end else if(clkcnt == 3*ADC_data_rate/USER_CLOCK_PERIOD) begin
				ADC_PIXCLK = ~ADC_PIXCLK;
			end else if(clkcnt == 2*ADC_data_rate/USER_CLOCK_PERIOD) begin
				ADC_PIXCLK = ~ADC_PIXCLK;
			end else if(clkcnt == ADC_data_rate/USER_CLOCK_PERIOD) begin
				ADC_PIXCLK = ~ADC_PIXCLK;
				im_data_clk = ~im_data_clk;
			end
		end

	end
      
endmodule

