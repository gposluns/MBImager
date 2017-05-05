`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:26 02/21/2017 
// Design Name: 
// Module Name:    mem_controller 
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

module memc_USB_intfce #
(
	parameter TCQ           = 100,
	parameter C3_P0_MASK_SIZE           = 8,
	parameter C3_P0_DATA_PORT_SIZE      = 64,
	parameter C3_P1_MASK_SIZE           = 8,
	parameter C3_P1_DATA_PORT_SIZE      = 64
)
(
   /////////////////////////////////////////////////////////////////////////////
	input wire					 rst_i,				

   //  MCB INTERFACE
   // interface to mcb command port0
	input wire c3_p0_cmd_clk,
	output c3_p0_cmd_en,
	output [2:0] c3_p0_cmd_instr,
	output [5:0] c3_p0_cmd_bl,
	output [29:0]	c3_p0_cmd_byte_addr,
	input wire		c3_p0_cmd_empty,
	input wire		c3_p0_cmd_full,

   // interface to mcb wr data port0
	input wire		c3_p0_wr_clk,
	output		c3_p0_wr_en,
	output [C3_P0_MASK_SIZE - 1:0]	c3_p0_wr_mask,
	output [C3_P0_DATA_PORT_SIZE - 1:0]	c3_p0_wr_data,
	input wire		c3_p0_wr_full,
	input wire		c3_p0_wr_empty,
	input wire [6:0]	c3_p0_wr_count,
	input wire		c3_p0_wr_underrun,
	input wire		c3_p0_wr_error,

   // interface to mcb rd data port0
	input wire		c3_p0_rd_clk,
	output		c3_p0_rd_en,
	input wire [C3_P0_DATA_PORT_SIZE - 1:0]	c3_p0_rd_data,
	input wire		c3_p0_rd_full,
	input wire		c3_p0_rd_empty,
	input wire [6:0]	c3_p0_rd_count,
	input wire		c3_p0_rd_overflow,
	input wire		c3_p0_rd_error,


   // interface to mcb command port1
	input wire		c3_p1_cmd_clk,
	output		c3_p1_cmd_en,
	output [2:0]	c3_p1_cmd_instr,
	output [5:0]	c3_p1_cmd_bl,
	output [29:0]	c3_p1_cmd_byte_addr,
	input wire		c3_p1_cmd_empty,
	input wire		c3_p1_cmd_full,

   // interface to mcb wr data port1
	input wire		c3_p1_wr_clk,
	output		c3_p1_wr_en,
	output [C3_P1_MASK_SIZE - 1:0]	c3_p1_wr_mask,
	output [C3_P1_DATA_PORT_SIZE - 1:0]	c3_p1_wr_data,
	input wire		c3_p1_wr_full,
	input wire		c3_p1_wr_empty,
	input wire [6:0]	c3_p1_wr_count,
	input wire		c3_p1_wr_underrun,
	input wire		c3_p1_wr_error,

   // interface to mcb rd data port1
	input wire		c3_p1_rd_clk,
	output		c3_p1_rd_en,
	input wire [C3_P1_DATA_PORT_SIZE - 1:0]	c3_p1_rd_data,
	input wire		c3_p1_rd_full,
	input wire		c3_p1_rd_empty,
	input wire [6:0]	c3_p1_rd_count,
	input wire		c3_p1_rd_overflow,
	input wire		c3_p1_rd_error,	

   /////////////////////////////////////////////////////////////////////////////
	input wire 					 c3_calib_done,		

	input wire [29:0]			 rd_len,		
	input wire [29:0]			 start_rd_addr_i,		
	input wire [29:0]			 start_wr_addr_i,		
	input wire [29:0]			 end_wr_addr_i,		

	input wire					 data_rd_req_p0,		
	input wire					 data_wr_req_p0,				
	input wire					 data_rd_req_p1,		
	input wire					 data_wr_req_p1,
	input wire					 new_wraddr_req_p0,
	input wire					 new_wraddr_req_p1,

   /////////////////////////////////////////////////////////////////////////////
	// FIFO interface signals
    input wire [31:0]			 usb2mem_p0,
    input wire 					 usb2mem_en_p0,
    output [31:0]			 mem2usb_p0,
    output 					 mem2usb_en_p0,
	output					 empty_inFIFO_p0,
	output					 outFIFO_flag_p0,
	output					 empty_outFIFO_p0,
	output [8:0]			 wr_data_count_outFIFO_p0,
    input wire [31:0]			 usb2mem_p1,
    input wire 					 usb2mem_en_p1,
    output [31:0]			 mem2usb_p1,
    output 					 mem2usb_en_p1,
	output					 empty_inFIFO_p1,
	output					 outFIFO_flag_p1,
	output					 empty_outFIFO_p1,
	output [8:0]			 wr_data_count_outFIFO_p1,
    input wire 					 okClk
	);

wire rst_int;
wire rst_outFIFO_p0;
wire rst_outFIFO_p1;
wire inFIFO_rd_en_p0;
wire full_inFIFO_p0;
wire [8:0] rd_data_count_p0;
wire [9:0] wr_data_count_inFIFO_p0;
wire full_outFIFO_p0;
wire inFIFO_rd_en_p1;
wire full_inFIFO_p1;
wire [8:0] rd_data_count_p1;
wire [9:0] wr_data_count_inFIFO_p1;
wire full_outFIFO_p1;

assign rst_int = rst_i | ~c3_calib_done;
assign rst_outFIFO_p0 = rst_i | ~data_rd_req_p0 | ~c3_calib_done;
assign rst_outFIFO_p1 = rst_i | ~data_rd_req_p1 | ~c3_calib_done;

inFIFO fifo_wr_DDR_p0 (
  .rst(rst_outFIFO_p0), // input rst
  .wr_clk(okClk), // input wr_clk
  .rd_clk(c3_p0_wr_clk), // input rd_clk
  .din(usb2mem_p0), // input [31 : 0] din
  .wr_en(usb2mem_en_p0), // input wr_en
  .rd_en(inFIFO_rd_en_p0), // input rd_en
  .dout(c3_p0_wr_data), // output [63 : 0] dout
  .full(full_inFIFO_p0), // output full
  .empty(empty_inFIFO_p0), // output empty
  .valid(c3_p0_wr_en), // output valid
  .rd_data_count(rd_data_count_p0), // output [8 : 0] rd_data_count
  .wr_data_count(wr_data_count_inFIFO_p0) // output [9 : 0] wr_data_count
);

outFIFO fifo_rd_DDR_p0 (
  .rst(rst_int), // input rst
  .wr_clk(c3_p0_rd_clk), // input wr_clk
  .rd_clk(okClk), // input rd_clk
  .din(c3_p0_rd_data), // input [63 : 0] din
  .wr_en(c3_p0_rd_en), // input wr_en
  .rd_en(mem2usb_en_p0), // input rd_en
  .dout(mem2usb_p0), // output [31 : 0] dout
  .full(full_outFIFO_p0), // output full
  .empty(empty_outFIFO_p0), // output empty
  .wr_data_count(wr_data_count_outFIFO_p0), // output [8 : 0] wr_data_count
  .prog_full(outFIFO_flag_p0) // output prog_full (asserted at 416 wr data)
);

mcb_instr_ctrl p0_instr (
    .clk_i(c3_p0_cmd_clk), 
    .rst_i(rst_int), 
	.new_wraddr_req(new_wraddr_req_p0),
    .data_wr_req(data_wr_req_p0), 
    .start_wr_addr_i(start_wr_addr_i), 
    .end_wr_addr_i(end_wr_addr_i), 
    .FIFOwr_data_count(wr_data_count_inFIFO_p0), 
	.wr_count(c3_p0_wr_count),
    .data_rd_req(data_rd_req_p0), 
    .start_rd_addr_i(start_rd_addr_i), 
    .rd_len(rd_len), 
    .outFIFO_flag(outFIFO_flag_p0), 
    .rdFIFO_rd_en(c3_p0_rd_en), 
    .rd_count(c3_p0_rd_count), 
    .inFIFO_rd_en(inFIFO_rd_en_p0), 
    .cmd_en(c3_p0_cmd_en), 
    .cmd_addr(c3_p0_cmd_byte_addr), 
    .cmd_bl(c3_p0_cmd_bl), 
    .cmd_instr(c3_p0_cmd_instr), 
	.wr_mask(c3_p0_wr_mask)
    );

inFIFO fifo_wr_DDR_p1 (
  .rst(rst_outFIFO_p1), // input rst
  .wr_clk(okClk), // input wr_clk
  .rd_clk(c3_p1_wr_clk), // input rd_clk
  .din(usb2mem_p1), // input [31 : 0] din
  .wr_en(usb2mem_en_p1), // input wr_en
  .rd_en(inFIFO_rd_en_p1), // input rd_en
  .dout(c3_p1_wr_data), // output [63 : 0] dout
  .full(full_inFIFO_p1), // output full
  .empty(empty_inFIFO_p1), // output empty
  .valid(c3_p1_wr_en), // output valid
  .rd_data_count(rd_data_count_p1), // output [8 : 0] rd_data_count
  .wr_data_count(wr_data_count_inFIFO_p1) // output [9 : 0] wr_data_count
);

outFIFO fifo_rd_DDR_p1 (
  .rst(rst_int), // input rst
  .wr_clk(c3_p1_rd_clk), // input wr_clk
  .rd_clk(okClk), // input rd_clk
  .din(c3_p1_rd_data), // input [63 : 0] din
  .wr_en(c3_p1_rd_en), // input wr_en
  .rd_en(mem2usb_en_p1), // input rd_en
  .dout(mem2usb_p1), // output [31 : 0] dout
  .full(full_outFIFO_p1), // output full
  .empty(empty_outFIFO_p1), // output empty
  .wr_data_count(wr_data_count_outFIFO_p1), // output [8 : 0] wr_data_count
  .prog_full(outFIFO_flag_p1) // output prog_full (asserted at 416 wr data)
);

mcb_instr_ctrl p1_instr (
    .clk_i(c3_p1_cmd_clk), 
    .rst_i(rst_int), 
	.new_wraddr_req(new_wraddr_req_p1),
    .data_wr_req(data_wr_req_p1), 
    .start_wr_addr_i(start_wr_addr_i), 
    .end_wr_addr_i(end_wr_addr_i), 
    .FIFOwr_data_count(wr_data_count_inFIFO_p1), 
	.wr_count(c3_p1_wr_count),
    .data_rd_req(data_rd_req_p1), 
    .start_rd_addr_i(start_rd_addr_i), 
    .rd_len(rd_len), 
    .outFIFO_flag(outFIFO_flag_p1), 
    .rdFIFO_rd_en(c3_p1_rd_en), 
    .rd_count(c3_p1_rd_count), 
    .inFIFO_rd_en(inFIFO_rd_en_p1), 
    .cmd_en(c3_p1_cmd_en), 
    .cmd_addr(c3_p1_cmd_byte_addr), 
    .cmd_bl(c3_p1_cmd_bl), 
    .cmd_instr(c3_p1_cmd_instr), 
	.wr_mask(c3_p1_wr_mask)
    );
endmodule
