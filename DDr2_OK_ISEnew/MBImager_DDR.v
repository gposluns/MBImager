`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:09 02/17/2017 
// Design Name: 
// Module Name:    MBImager_DDR 
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
module MBImager_DDR#
(
   parameter C3_P0_MASK_SIZE           = 8,
   parameter C3_P0_DATA_PORT_SIZE      = 64,
   parameter C3_P1_MASK_SIZE           = 8,
   parameter C3_P1_DATA_PORT_SIZE      = 64,
   parameter DEBUG_EN                = 0,       
                                       // # = 1, Enable debug signals/controls,
                                       //   = 0, Disable debug signals/controls.
   parameter C3_MEMCLK_PERIOD        = 3200,       
                                       // Memory data transfer clock period
   parameter C3_CALIB_SOFT_IP        = "TRUE",       
                                       // # = TRUE, Enables the soft calibration logic,
                                       // # = FALSE, Disables the soft calibration logic.
   parameter C3_SIMULATION           = "FALSE",       
                                       // # = TRUE, Simulating the design. Useful to reduce the simulation time,
                                       // # = FALSE, Implementing the design.
   parameter C3_HW_TESTING           = "TRUE",       
                                       // Determines the address space accessed by the traffic generator,
                                       // # = FALSE, Smaller address space,
                                       // # = TRUE, Large address space.
   parameter C3_RST_ACT_LOW          = 0,       
                                       // # = 1 for active low reset,
                                       // # = 0 for active high reset.
   parameter C3_INPUT_CLK_TYPE       = "DIFFERENTIAL",       
                                       // input clock type DIFFERENTIAL or SINGLE_ENDED
   parameter C3_MEM_ADDR_ORDER       = "BANK_ROW_COLUMN",       
                                       // The order in which user address is provided to the memory controller,
                                       // ROW_BANK_COLUMN or BANK_ROW_COLUMN
   parameter C3_NUM_DQ_PINS          = 16,       
                                       // External memory data width
   parameter C3_MEM_ADDR_WIDTH       = 13,       
                                       // External memory address width
   parameter C3_MEM_BANKADDR_WIDTH   = 3        
                                       // External memory bank address width
)
(
	input wire [4:0] okUH,
	output wire[2:0] okHU,
	inout wire[31:0] okUHU,
	inout wire okAA,
	input wire c3_sys_clk_n,
	input wire c3_sys_clk_p,
	output wire[7:0] led,
	inout wire [15:0] mcb3_dram_dq,
	output [12:0] mcb3_dram_a,
	output [2:0] mcb3_dram_ba,
	output mcb3_dram_ras_n,
	output mcb3_dram_cas_n,
	output mcb3_dram_we_n,
	output mcb3_dram_odt,
	output mcb3_dram_cke,
	output mcb3_dram_dm,
	inout wire mcb3_dram_udqs,
	inout wire mcb3_dram_udqs_n,
	inout wire mcb3_rzq,
	inout wire mcb3_zio,
	output mcb3_dram_udm,
	inout wire mcb3_dram_dqs,
	inout wire mcb3_dram_dqs_n,
	output mcb3_dram_ck,
	output mcb3_dram_ck_n
    );

// MIG signal declarations
wire 		c3_sys_rst_i;
wire 		c3_clk0;
wire 		c3_calib_done;
wire 		c3_rst0;
wire		c3_p0_cmd_en;
wire [2:0]	c3_p0_cmd_instr;
wire [5:0]	c3_p0_cmd_bl;
wire [29:0]	c3_p0_cmd_byte_addr;
wire		c3_p0_cmd_empty;
wire		c3_p0_cmd_full;
wire		c3_p0_wr_en;
wire [C3_P0_MASK_SIZE - 1:0]	c3_p0_wr_mask;
wire [C3_P0_DATA_PORT_SIZE - 1:0]	c3_p0_wr_data;
wire		c3_p0_wr_full;
wire		c3_p0_wr_empty;
wire [6:0]	c3_p0_wr_count;
wire		c3_p0_wr_underrun;
wire		c3_p0_wr_error;
wire		c3_p0_rd_en;
wire [C3_P0_DATA_PORT_SIZE - 1:0]	c3_p0_rd_data;
wire		c3_p0_rd_full;
wire		c3_p0_rd_empty;
wire [6:0]	c3_p0_rd_count;
wire		c3_p0_rd_overflow;
wire		c3_p0_rd_error;
wire		c3_p1_cmd_en;
wire [2:0]	c3_p1_cmd_instr;
wire [5:0]	c3_p1_cmd_bl;
wire [29:0]	c3_p1_cmd_byte_addr;
wire		c3_p1_cmd_empty;
wire		c3_p1_cmd_full;
wire		c3_p1_wr_en;
wire [C3_P1_MASK_SIZE - 1:0]	c3_p1_wr_mask;
wire [C3_P1_DATA_PORT_SIZE - 1:0]	c3_p1_wr_data;
wire		c3_p1_wr_full;
wire		c3_p1_wr_empty;
wire [6:0]	c3_p1_wr_count;
wire		c3_p1_wr_underrun;
wire		c3_p1_wr_error;
wire		c3_p1_rd_en;
wire [C3_P1_DATA_PORT_SIZE - 1:0]	c3_p1_rd_data;
wire		c3_p1_rd_full;
wire		c3_p1_rd_empty;
wire [6:0]	c3_p1_rd_count;
wire		c3_p1_rd_overflow;
wire		c3_p1_rd_error;


//FP wires	
wire okClk;
wire [112:0] okHE;
wire [64:0] okEH;
wire [6*65-1:0] okEHx;
// Adjust size of okEHx to fit the number of outgoing endpoints in your design (n*65-1:0)
wire [31:0] rd_len;
wire [31:0] start_rd_addr_i;
wire [31:0] start_wr_addr_i;
wire [31:0] end_wr_addr_i;
wire [31:0] usb2mem_p0;
wire usb2mem_en_p0;
wire [31:0] mem2usb_p0;
wire mem2usb_en_p0;
wire [31:0] usb2mem_p1;
wire usb2mem_en_p1;
wire [31:0] mem2usb_p1;
wire mem2usb_en_p1;
wire empty_inFIFO_p0;
wire outFIFO_flag_p0;
wire empty_outFIFO_p0;
wire [8:0] wr_data_count_outFIFO_p0;	// count of 64-bit writes to the FIFO on the wr-path
wire empty_inFIFO_p1;
wire outFIFO_flag_p1;
wire empty_outFIFO_p1;
wire [8:0] wr_data_count_outFIFO_p1;	// count of 64-bit writes to the FIFO on the wr-path

// Circuit wires
wire rst;				// FIFO reset
wire [31:0] wire00in;	// wire in endpoint
wire [31:0] wire30out;	 
wire [31:0] trig60out;	 
wire data_rd_req_p0;
wire data_wr_req_p0;
wire data_rd_req_p1;
wire data_wr_req_p1;
wire new_wraddr_req_p0;
wire new_wraddr_req_p1;


// Circuit assignements
assign c3_sys_rst_i = wire00in[0];
assign rst = wire00in[1] | c3_sys_rst_i | c3_rst0;
assign data_rd_req_p0 = wire00in[2];
assign data_wr_req_p0 = wire00in[3];
assign data_rd_req_p1 = wire00in[4];
assign data_wr_req_p1 = wire00in[5];
assign new_wraddr_req_p0 = wire00in[6];
assign new_wraddr_req_p1 = wire00in[7];
assign wire30out[0] = empty_inFIFO_p0;
assign wire30out[1] = empty_inFIFO_p1;
assign wire30out[2] = outFIFO_flag_p0;
assign wire30out[3] = outFIFO_flag_p1;
assign wire30out[4] = empty_outFIFO_p0;
assign wire30out[5] = empty_outFIFO_p1;
assign wire30out[18:10] = wr_data_count_outFIFO_p0;
assign wire30out[28:20] = wr_data_count_outFIFO_p1;
assign wire30out[9:6] = 4'b0;
assign wire30out[19] = 1'b0;
assign wire30out[31:29] = 3'b0;
assign trig60out[0] = empty_inFIFO_p0;
assign trig60out[1] = empty_inFIFO_p1;
assign trig60out[31:2] = 30'b0;

// Instantiate the module
mig_39 memc_inst (
    .mcb3_dram_dq(mcb3_dram_dq), 
    .mcb3_dram_a(mcb3_dram_a), 
    .mcb3_dram_ba(mcb3_dram_ba), 
    .mcb3_dram_ras_n(mcb3_dram_ras_n), 
    .mcb3_dram_cas_n(mcb3_dram_cas_n), 
    .mcb3_dram_we_n(mcb3_dram_we_n), 
    .mcb3_dram_odt(mcb3_dram_odt), 
    .mcb3_dram_cke(mcb3_dram_cke), 
    .mcb3_dram_dm(mcb3_dram_dm), 
    .mcb3_dram_udqs(mcb3_dram_udqs), 
    .mcb3_dram_udqs_n(mcb3_dram_udqs_n), 
    .mcb3_rzq(mcb3_rzq), 
    .mcb3_zio(mcb3_zio), 
    .mcb3_dram_udm(mcb3_dram_udm), 
    .c3_sys_clk_p(c3_sys_clk_p),
    .c3_sys_clk_n(c3_sys_clk_n),
    .c3_sys_rst_i(c3_sys_rst_i), 
    .c3_calib_done(c3_calib_done), 
    .c3_clk0(c3_clk0), 
    .c3_rst0(c3_rst0), 
    .mcb3_dram_dqs(mcb3_dram_dqs), 
    .mcb3_dram_dqs_n(mcb3_dram_dqs_n), 
    .mcb3_dram_ck(mcb3_dram_ck), 
    .mcb3_dram_ck_n(mcb3_dram_ck_n), 
    .c3_p0_cmd_clk(c3_clk0), 
    .c3_p0_cmd_en(c3_p0_cmd_en), 
    .c3_p0_cmd_instr(c3_p0_cmd_instr), 
    .c3_p0_cmd_bl(c3_p0_cmd_bl),
    .c3_p0_cmd_byte_addr(c3_p0_cmd_byte_addr),
    .c3_p0_cmd_empty(c3_p0_cmd_empty),
    .c3_p0_cmd_full(c3_p0_cmd_full), 
    .c3_p0_wr_clk(c3_clk0), 
    .c3_p0_wr_en(c3_p0_wr_en), 
    .c3_p0_wr_mask(c3_p0_wr_mask),
    .c3_p0_wr_data(c3_p0_wr_data), 
    .c3_p0_wr_full(c3_p0_wr_full),
    .c3_p0_wr_empty(c3_p0_wr_empty), 
    .c3_p0_wr_count(c3_p0_wr_count), 
    .c3_p0_wr_underrun(c3_p0_wr_underrun), 
    .c3_p0_wr_error(c3_p0_wr_error), 
    .c3_p0_rd_clk(c3_clk0), 
    .c3_p0_rd_en(c3_p0_rd_en), 					
    .c3_p0_rd_data(c3_p0_rd_data), 
    .c3_p0_rd_full(c3_p0_rd_full), 
    .c3_p0_rd_empty(c3_p0_rd_empty), 
    .c3_p0_rd_count(c3_p0_rd_count), 
    .c3_p0_rd_overflow(c3_p0_rd_overflow), 
    .c3_p0_rd_error(c3_p0_rd_error), 
    .c3_p1_cmd_clk(c3_clk0), 
    .c3_p1_cmd_en(c3_p1_cmd_en), 
    .c3_p1_cmd_instr(c3_p1_cmd_instr), 
    .c3_p1_cmd_bl(c3_p1_cmd_bl), 
    .c3_p1_cmd_byte_addr(c3_p1_cmd_byte_addr), 
    .c3_p1_cmd_empty(c3_p1_cmd_empty), 
    .c3_p1_cmd_full(c3_p1_cmd_full), 
    .c3_p1_wr_clk(c3_clk0), 
    .c3_p1_wr_en(c3_p1_wr_en), 
    .c3_p1_wr_mask(c3_p1_wr_mask), 
    .c3_p1_wr_data(c3_p1_wr_data), 
    .c3_p1_wr_full(c3_p1_wr_full), 
    .c3_p1_wr_empty(c3_p1_wr_empty), 
    .c3_p1_wr_count(c3_p1_wr_count), 
    .c3_p1_wr_underrun(c3_p1_wr_underrun), 
    .c3_p1_wr_error(c3_p1_wr_error), 
    .c3_p1_rd_clk(c3_clk0), 
    .c3_p1_rd_en(c3_p1_rd_en), 
    .c3_p1_rd_data(c3_p1_rd_data), 
    .c3_p1_rd_full(c3_p1_rd_full), 
    .c3_p1_rd_empty(c3_p1_rd_empty), 
    .c3_p1_rd_count(c3_p1_rd_count), 
    .c3_p1_rd_overflow(c3_p1_rd_overflow), 
    .c3_p1_rd_error(c3_p1_rd_error) 
    );

// this module includes the command generation block and the required FIFO
// for buffering the data to/from okHost
memc_USB_intfce memc_USB_interface (
    .rst_i(rst), 
    .c3_p0_cmd_clk(c3_clk0), //
    .c3_p0_cmd_en(c3_p0_cmd_en), //
    .c3_p0_cmd_instr(c3_p0_cmd_instr), //
    .c3_p0_cmd_bl(c3_p0_cmd_bl), //
    .c3_p0_cmd_byte_addr(c3_p0_cmd_byte_addr), //
    .c3_p0_cmd_empty(c3_p0_cmd_empty), //
    .c3_p0_cmd_full(c3_p0_cmd_full), 
    .c3_p0_wr_clk(c3_clk0), //
    .c3_p0_wr_en(c3_p0_wr_en), //
    .c3_p0_wr_mask(c3_p0_wr_mask), //
    .c3_p0_wr_data(c3_p0_wr_data), //
    .c3_p0_wr_full(c3_p0_wr_full), //
    .c3_p0_wr_empty(c3_p0_wr_empty), //
    .c3_p0_wr_count(c3_p0_wr_count), //
    .c3_p0_wr_underrun(c3_p0_wr_underrun), //
    .c3_p0_wr_error(c3_p0_wr_error), //
    .c3_p0_rd_clk(c3_clk0), //
    .c3_p0_rd_en(c3_p0_rd_en), //
    .c3_p0_rd_data(c3_p0_rd_data), //
    .c3_p0_rd_full(c3_p0_rd_full), //
    .c3_p0_rd_empty(c3_p0_rd_empty), //
    .c3_p0_rd_count(c3_p0_rd_count), //
    .c3_p0_rd_overflow(c3_p0_rd_overflow), //
    .c3_p0_rd_error(c3_p0_rd_error), //
    .c3_p1_cmd_clk(c3_clk0), //
    .c3_p1_cmd_en(c3_p1_cmd_en), //
    .c3_p1_cmd_instr(c3_p1_cmd_instr), //
    .c3_p1_cmd_bl(c3_p1_cmd_bl), //
    .c3_p1_cmd_byte_addr(c3_p1_cmd_byte_addr), //
    .c3_p1_cmd_empty(c3_p1_cmd_empty), //
    .c3_p1_cmd_full(c3_p1_cmd_full), //
    .c3_p1_wr_clk(c3_clk0), //
    .c3_p1_wr_en(c3_p1_wr_en), //
    .c3_p1_wr_mask(c3_p1_wr_mask), //
    .c3_p1_wr_data(c3_p1_wr_data), //
    .c3_p1_wr_full(c3_p1_wr_full), //
    .c3_p1_wr_empty(c3_p1_wr_empty), //
    .c3_p1_wr_count(c3_p1_wr_count), //
    .c3_p1_wr_underrun(c3_p1_wr_underrun), //
    .c3_p1_wr_error(c3_p1_wr_error), //
    .c3_p1_rd_clk(c3_clk0), //
    .c3_p1_rd_en(c3_p1_rd_en), //
    .c3_p1_rd_data(c3_p1_rd_data), //
    .c3_p1_rd_full(c3_p1_rd_full), //
    .c3_p1_rd_empty(c3_p1_rd_empty), //
    .c3_p1_rd_count(c3_p1_rd_count), //
    .c3_p1_rd_overflow(c3_p1_rd_overflow), //
    .c3_p1_rd_error(c3_p1_rd_error), //
    .c3_calib_done(c3_calib_done), //
    .rd_len(rd_len[29:0]), 
    .start_rd_addr_i(start_rd_addr_i[29:0]), 
    .start_wr_addr_i(start_wr_addr_i[29:0]), 
    .end_wr_addr_i(end_wr_addr_i[29:0]), 
    .data_rd_req_p0(data_rd_req_p0), 
    .data_wr_req_p0(data_wr_req_p0), 
    .data_rd_req_p1(1'b0), 
    .data_wr_req_p1(1'b0), 
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

	
okHost hostIF (
	.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okClk(okClk),
	.okAA(okAA),
	.okHE(okHE),
	.okEH(okEH)
);

// Adjust N to fit the number of outgoing endpoints in your design (.N(n))
okWireOR # (.N(6)) wireOR (okEH, okEHx);

// FrontPanel module instantiations
okWireIn	wire00		(.okHE(okHE),								.ep_addr(8'h00),								.ep_dataout(wire00in));
okWireIn	wire01		(.okHE(okHE),								.ep_addr(8'h01),								.ep_dataout(rd_len));
okWireIn	wire02		(.okHE(okHE),								.ep_addr(8'h02),								.ep_dataout(start_rd_addr_i));
okWireIn	wire03		(.okHE(okHE),								.ep_addr(8'h03),								.ep_dataout(start_wr_addr_i));
okWireIn	wire04		(.okHE(okHE),								.ep_addr(8'h04),								.ep_dataout(end_wr_addr_i));
okWireOut 	wire30		(.okHE(okHE),	.okEH(okEHx[0*65 +: 65]),	.ep_addr(8'h30),								.ep_datain(wire30out));
// okTriggerIn trigIn40 	(.okHE(okHE),								.ep_addr(8'h40), 	.ep_clk(CLKDV), 			.ep_trigger(trig40in));
okTriggerOut trigOut60	(.okHE(okHE), 	.okEH(okEHx[1*65 +: 65]),	.ep_addr(8'h60), 	.ep_clk(c3_clk0), 			.ep_trigger(trig60out));
okPipeOut	pipeA0		(.okHE(okHE),	.okEH(okEHx[2*65 +: 65]),	.ep_addr(8'hA0),	.ep_read(mem2usb_en_p0),	.ep_datain(mem2usb_p0));
okPipeOut	pipeA1		(.okHE(okHE),	.okEH(okEHx[3*65 +: 65]),	.ep_addr(8'hA1),	.ep_read(mem2usb_en_p1),	.ep_datain(mem2usb_p1));
okPipeIn 	pipe80		(.okHE(okHE),	.okEH(okEHx[4*65 +: 65]),	.ep_addr(8'h80),	.ep_write(usb2mem_en_p0),	.ep_dataout(usb2mem_p0));
okPipeIn 	pipe81		(.okHE(okHE),	.okEH(okEHx[5*65 +: 65]),	.ep_addr(8'h81),	.ep_write(usb2mem_en_p1),	.ep_dataout(usb2mem_p1));

endmodule
