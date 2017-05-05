`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:59:21 03/16/2017
// Design Name:   memc_USB_intfce
// Module Name:   C:/Users/MBImager/Documents/Navid_ISE/DDR2_design/DDR2_OK_ISEnew/tb_memc_USB_interface.v
// Project Name:  DDR2_OK_ISEnew
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memc_USB_intfce
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_memc_USB_interface;

	// Inputs
	reg rst_i;
	reg c3_p0_cmd_clk;
	reg c3_p0_cmd_empty;
	reg c3_p0_cmd_full;
	reg c3_p0_wr_clk;
	reg c3_p0_wr_full;
	reg c3_p0_wr_empty;
	reg [6:0] c3_p0_wr_count;
	reg c3_p0_wr_underrun;
	reg c3_p0_wr_error;
	reg c3_p0_rd_clk;
	reg [63:0] c3_p0_rd_data;
	reg c3_p0_rd_full;
	reg c3_p0_rd_empty;
	reg [6:0] c3_p0_rd_count;
	reg c3_p0_rd_overflow;
	reg c3_p0_rd_error;
	reg c3_p1_cmd_clk;
	reg c3_p1_cmd_empty;
	reg c3_p1_cmd_full;
	reg c3_p1_wr_clk;
	reg c3_p1_wr_full;
	reg c3_p1_wr_empty;
	reg [6:0] c3_p1_wr_count;
	reg c3_p1_wr_underrun;
	reg c3_p1_wr_error;
	reg c3_p1_rd_clk;
	reg [63:0] c3_p1_rd_data;
	reg c3_p1_rd_full;
	reg c3_p1_rd_empty;
	reg [6:0] c3_p1_rd_count;
	reg c3_p1_rd_overflow;
	reg c3_p1_rd_error;
	reg c3_calib_done;
	reg [29:0] rd_len;
	reg [29:0] start_rd_addr_i;
	reg [29:0] start_wr_addr_i;
	reg [29:0] end_wr_addr_i;
	reg data_rd_req_p0;
	reg data_wr_req_p0;
	reg data_rd_req_p1;
	reg data_wr_req_p1;
	reg new_wraddr_req_p0;
	reg new_wraddr_req_p1;
	reg [31:0] usb2mem_p0;
	reg usb2mem_en_p0;
	reg [31:0] usb2mem_p1;
	reg usb2mem_en_p1;
	reg okClk;

	// Outputs
	wire c3_p0_cmd_en;
	wire [2:0] c3_p0_cmd_instr;
	wire [5:0] c3_p0_cmd_bl;
	wire [29:0] c3_p0_cmd_byte_addr;
	wire c3_p0_wr_en;
	wire [7:0] c3_p0_wr_mask;
	wire [63:0] c3_p0_wr_data;
	wire c3_p0_rd_en;
	wire c3_p1_cmd_en;
	wire [2:0] c3_p1_cmd_instr;
	wire [5:0] c3_p1_cmd_bl;
	wire [29:0] c3_p1_cmd_byte_addr;
	wire c3_p1_wr_en;
	wire [7:0] c3_p1_wr_mask;
	wire [63:0] c3_p1_wr_data;
	wire c3_p1_rd_en;
	wire [31:0] mem2usb_p0;
	wire mem2usb_en_p0;
	wire empty_inFIFO_p0;
	wire outFIFO_flag_p0;
	wire empty_outFIFO_p0;
	wire [8:0] wr_data_count_outFIFO_p0;
	wire [31:0] mem2usb_p1;
	wire mem2usb_en_p1;
	wire empty_inFIFO_p1;
	wire outFIFO_flag_p1;
	wire empty_outFIFO_p1;
	wire [8:0] wr_data_count_outFIFO_p1;

	// Instantiate the Unit Under Test (UUT)
	memc_USB_intfce uut (
		.rst_i(rst_i), 
		.c3_p0_cmd_clk(c3_p0_cmd_clk), 
		.c3_p0_cmd_en(c3_p0_cmd_en), 
		.c3_p0_cmd_instr(c3_p0_cmd_instr), 
		.c3_p0_cmd_bl(c3_p0_cmd_bl), 
		.c3_p0_cmd_byte_addr(c3_p0_cmd_byte_addr), 
		.c3_p0_cmd_empty(c3_p0_cmd_empty), 
		.c3_p0_cmd_full(c3_p0_cmd_full), 
		.c3_p0_wr_clk(c3_p0_wr_clk), 
		.c3_p0_wr_en(c3_p0_wr_en), 
		.c3_p0_wr_mask(c3_p0_wr_mask), 
		.c3_p0_wr_data(c3_p0_wr_data), 
		.c3_p0_wr_full(c3_p0_wr_full), 
		.c3_p0_wr_empty(c3_p0_wr_empty), 
		.c3_p0_wr_count(c3_p0_wr_count), 
		.c3_p0_wr_underrun(c3_p0_wr_underrun), 
		.c3_p0_wr_error(c3_p0_wr_error), 
		.c3_p0_rd_clk(c3_p0_rd_clk), 
		.c3_p0_rd_en(c3_p0_rd_en), 
		.c3_p0_rd_data(c3_p0_rd_data), 
		.c3_p0_rd_full(c3_p0_rd_full), 
		.c3_p0_rd_empty(c3_p0_rd_empty), 
		.c3_p0_rd_count(c3_p0_rd_count), 
		.c3_p0_rd_overflow(c3_p0_rd_overflow), 
		.c3_p0_rd_error(c3_p0_rd_error), 
		.c3_p1_cmd_clk(c3_p1_cmd_clk), 
		.c3_p1_cmd_en(c3_p1_cmd_en), 
		.c3_p1_cmd_instr(c3_p1_cmd_instr), 
		.c3_p1_cmd_bl(c3_p1_cmd_bl), 
		.c3_p1_cmd_byte_addr(c3_p1_cmd_byte_addr), 
		.c3_p1_cmd_empty(c3_p1_cmd_empty), 
		.c3_p1_cmd_full(c3_p1_cmd_full), 
		.c3_p1_wr_clk(c3_p1_wr_clk), 
		.c3_p1_wr_en(c3_p1_wr_en), 
		.c3_p1_wr_mask(c3_p1_wr_mask), 
		.c3_p1_wr_data(c3_p1_wr_data), 
		.c3_p1_wr_full(c3_p1_wr_full), 
		.c3_p1_wr_empty(c3_p1_wr_empty), 
		.c3_p1_wr_count(c3_p1_wr_count), 
		.c3_p1_wr_underrun(c3_p1_wr_underrun), 
		.c3_p1_wr_error(c3_p1_wr_error), 
		.c3_p1_rd_clk(c3_p1_rd_clk), 
		.c3_p1_rd_en(c3_p1_rd_en), 
		.c3_p1_rd_data(c3_p1_rd_data), 
		.c3_p1_rd_full(c3_p1_rd_full), 
		.c3_p1_rd_empty(c3_p1_rd_empty), 
		.c3_p1_rd_count(c3_p1_rd_count), 
		.c3_p1_rd_overflow(c3_p1_rd_overflow), 
		.c3_p1_rd_error(c3_p1_rd_error), 
		.c3_calib_done(c3_calib_done), 
		.rd_len(rd_len), 
		.start_rd_addr_i(start_rd_addr_i), 
		.start_wr_addr_i(start_wr_addr_i), 
		.end_wr_addr_i(end_wr_addr_i), 
		.data_rd_req_p0(data_rd_req_p0), 
		.data_wr_req_p0(data_wr_req_p0), 
		.data_rd_req_p1(data_rd_req_p1), 
		.data_wr_req_p1(data_wr_req_p1), 
		.new_wraddr_req_p0(new_wraddr_req_p0), 
		.new_wraddr_req_p1(new_wraddr_req_p1), 
		.usb2mem_p0(usb2mem_p0), 
		.usb2mem_en_p0(usb2mem_en_p0), 
		.mem2usb_p0(mem2usb_p0), 
		.mem2usb_en_p0(mem2usb_en_p0), 
		.empty_inFIFO_p0(empty_inFIFO_p0), 
		.outFIFO_flag_p0(outFIFO_flag_p0), 
		.empty_outFIFO_p0(empty_outFIFO_p0), 
		.wr_data_count_outFIFO_p0(wr_data_count_outFIFO_p0), 
		.usb2mem_p1(usb2mem_p1), 
		.usb2mem_en_p1(usb2mem_en_p1), 
		.mem2usb_p1(mem2usb_p1), 
		.mem2usb_en_p1(mem2usb_en_p1), 
		.empty_inFIFO_p1(empty_inFIFO_p1), 
		.outFIFO_flag_p1(outFIFO_flag_p1), 
		.empty_outFIFO_p1(empty_outFIFO_p1), 
		.wr_data_count_outFIFO_p1(wr_data_count_outFIFO_p1), 
		.okClk(okClk)
	);

	initial begin
		// Initialize Inputs
		rst_i = 0;
		c3_p0_cmd_clk = 0;
		c3_p0_cmd_empty = 0;
		c3_p0_cmd_full = 0;
		c3_p0_wr_clk = 0;
		c3_p0_wr_full = 0;
		c3_p0_wr_empty = 0;
		c3_p0_wr_count = 0;
		c3_p0_wr_underrun = 0;
		c3_p0_wr_error = 0;
		c3_p0_rd_clk = 0;
		c3_p0_rd_data = 0;
		c3_p0_rd_full = 0;
		c3_p0_rd_empty = 0;
		c3_p0_rd_count = 0;
		c3_p0_rd_overflow = 0;
		c3_p0_rd_error = 0;
		c3_p1_cmd_clk = 0;
		c3_p1_cmd_empty = 0;
		c3_p1_cmd_full = 0;
		c3_p1_wr_clk = 0;
		c3_p1_wr_full = 0;
		c3_p1_wr_empty = 0;
		c3_p1_wr_count = 0;
		c3_p1_wr_underrun = 0;
		c3_p1_wr_error = 0;
		c3_p1_rd_clk = 0;
		c3_p1_rd_data = 0;
		c3_p1_rd_full = 0;
		c3_p1_rd_empty = 0;
		c3_p1_rd_count = 0;
		c3_p1_rd_overflow = 0;
		c3_p1_rd_error = 0;
		c3_calib_done = 0;
		rd_len = 0;
		start_rd_addr_i = 0;
		start_wr_addr_i = 0;
		end_wr_addr_i = 0;
		data_rd_req_p0 = 0;
		data_wr_req_p0 = 0;
		data_rd_req_p1 = 0;
		data_wr_req_p1 = 0;
		new_wraddr_req_p0 = 0;
		new_wraddr_req_p1 = 0;
		usb2mem_p0 = 0;
		usb2mem_en_p0 = 0;
		usb2mem_p1 = 0;
		usb2mem_en_p1 = 0;
		okClk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

