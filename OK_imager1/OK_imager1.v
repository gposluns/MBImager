`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:10 11/10/2016 
// Design Name: 
// Module Name:    OK_imager 
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
module OK_imager(
	input wire [4:0] okUH,
	output wire[2:0] okHU,
	inout wire[31:0] okUHU,
	inout wire okAA,
	input wire sys_clkn,
	input wire sys_clkp,
	output wire[7:0] led,
	input wire[7:0] im_data, //changed from 5:0
	input wire im_data_val,
	input wire im_data_clk,
	output wire FPGA_rst_n,
	output wire CLKM,
	output wire CLKMPRE,
	output wire STREAM,
	output wire [10:1] MSTREAM,
	output wire OK_DRAIN_B,
	output wire OK_PIXRES_GLOB,
	//output	[31:0] PHASE_SEL, //testmodimp
	input wire FSMIND0,				// If high, the Exposure FSM (on OK) is active
	output wire FSMIND1,
	output wire FSMIND0ACK,
	input wire FSMIND1ACK,
	
	//ddr2 inputs and outputs
//	input wire c3_sys_clk_n,
//	input wire c3_sys_clk_p,

	inout wire [15:0] mcb3_dram_dq,
	output wire [12:0] mcb3_dram_a,
	output wire [2:0] mcb3_dram_ba,
	output wire mcb3_dram_ras_n,
	output wire mcb3_dram_cas_n,
	output wire mcb3_dram_we_n,
	output wire mcb3_dram_odt,
	output wire mcb3_dram_cke,
	output wire mcb3_dram_dm,
	inout wire mcb3_dram_udqs,
	inout wire mcb3_dram_udqs_n,
	inout wire mcb3_rzq,
	inout wire mcb3_zio,
	output wire mcb3_dram_udm,
	inout wire mcb3_dram_dqs,
	inout wire mcb3_dram_dqs_n,
	output wire mcb3_dram_ck,
	output wire mcb3_dram_ck_n,
//	output wire c3_calib_done,
	
	output wire trigger_proj,
	output wire exposure_trig
    );

// -- Parameters
parameter	C_CLKHS_D		= 3;	// Devide value for CLKHS to USER_CLOCK. value - D - (1-256)
parameter	C_CLKHS_M		= 6;	// Multiply value for CLKHS to USER_CLOCK. value - M - (2-256)

//ddr2 ports width
localparam  C3_P0_MASK_SIZE          = 8;
localparam C3_P0_DATA_PORT_SIZE      = 64;
localparam C3_P1_MASK_SIZE           = 8;
localparam C3_P1_DATA_PORT_SIZE      = 64;

	// Clock
wire sys_clk;
 
IBUFGDS osc_clk(
	.O(sys_clk),
	.I(sys_clkp),
	.IB(sys_clkn)
);
 
//FP wires	
wire okClk;
wire [112:0] okHE;
wire [64:0] okEH;
wire [6*65-1:0] okEHx;
// Adjust size of okEHx to fit the number of outgoing endpoints in your design (n*65-1:0)

// Circuit wires
wire rst;				// FIFO reset
wire wr_en;				// FIFO write enable
wire rd_en;				// FIFO read enable
wire [31:0] dout; //changed from 23:0		// FIFO output data
wire [23:0] dout_buf;	// 2nd FIFO output 
wire [31:0] din_pipe;	// 2nd FIFO output 
wire [31:0] wireout;
wire [31:0] wireExp;
wire [31:0] wirePat;
wire [31:0] wireMaskChng;
wire [31:0] wireMaskChngSubc;
wire [31:0] wirePatterns;
wire [31:0] trig6Aout;
wire [31:0] trig53in;
wire full;
wire full_2;
wire empty;
wire almost_empty;
wire empty_2;
wire flag_2frames;
wire flag_1frame;
wire d_buf_valid;
wire fifo1_rd_en;
wire [7:0] STATUS;
wire FSMstop;
wire [7:0] fsm_stat;
wire RstPat;
wire [9:0] Pat_to_FIFO;
wire [9:0] Pat_in;
wire [9:0] PatGen_start;
wire [9:0] PatGen_stop;
wire PatFIFO_wr;
wire PatFIFO_empty;
wire CLKMPRE_EN;
wire [31:0] CntSubc;
wire [31:0] MIN_FRAME_TIME;

wire im_data_val_test;
reg [7:0] ADC_TESTDATA1;
reg [7:0] ADC_TESTDATA2;
reg [7:0] ADC_TESTDATA3;
wire [23:0] din;
wire [5:0] dout_test;

//undeclared wires 
wire CLK_HS;
wire full_pat;	
wire empty_pat;
wire valid_pat;
wire prog_full;
wire CLKMPRE_int;
wire CLK0;
wire CLK180;
wire CLK270;
wire CLK2X_2;
wire CLK2X180;
wire CLK90;
wire sys_clkDV;
wire CLK_HS180;
wire LOCKED_HS;
wire PSDONE;
wire CLK0_MPRE;
wire CLK180_MPRE;
wire CLK270_MPRE;
wire CLK2X_MPRE;
wire CLK2X180_MPRE;
wire CLK90_MPRE;
wire CLKDV;
wire CLKMPRE_int180;
wire LOCKED_MPRE;
wire PSDONE_MPRE;
wire [7:0]STATUS_MPRE;



wire pipe80in_high;
wire [31:0] pipe80in_data;
wire pattern_stored;
wire read_done;

//ddr2 wires
//note that p0 read and p1 write wires are not used
wire c3_calib_done;
wire 		c3_clk0;
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
//wire trigger_proj;
//wire exposure_trig;
wire [31:0] proj_delay;
	 
// TB sims values
// assign wireExp = 32'h000A;
// assign wirePat = 32'h0014;
// assign wireMaskChng = 32'h0003;
// assign wireMaskChngSubc = 32'h0003;
// assign wireout = 32'h0000;

// Circuit assignements
wire [2:0] write_happens;
wire wait_mem;
//reg check_trig;
//initial check_trig = 0;
//always @(posedge c3_clk0) begin
//	if (trig53in[0]) check_trig <= 1;
//end
//assign led[7] = check_trig;
//assign led[6] = trig53in[0];
//assign led[7:4] = 4'b1111;
//assign led[3:1] = write_happens;
//assign led[0] = pattern_stored;

assign led = fsm_stat;

//reg fifo_full_checker;
//initial fifo_full_checker <= 0;
//always @(posedge flag_2frames) fifo_full_checker<= 1;
//assign led[7] = fifo_full_checker;


assign FSMstop = rst;// | flag_2frames; //| pattern_stored;
// assign FSMstop = rst;
assign RstPat = FSMstop | FSMIND1;
assign FPGA_rst_n = ~FSMstop;
assign rst = wireout[0];
assign trig6Aout[0] = full_2;
assign trig6Aout[1] = flag_2frames;
assign trig6Aout[2] = ~flag_1frame;
assign trig6Aout[31:3] = 29'b0;
assign din_pipe[23:0]=dout_buf;
assign din_pipe[31:24]=8'b0;
assign Pat_in[9:0] = wirePatterns[9:0];
assign PatGen_start[9:0] = wirePatterns[19:10];
assign PatGen_stop[9:0] = wirePatterns[29:20];//wirePatterns[30:21];


/* // Generating test data instead of ADCs data
	initial begin
		ADC_TESTDATA1 <= 8'b10001000;
		ADC_TESTDATA2 <= 8'b00100000;
		ADC_TESTDATA3 <= 8'b10000000;
	end

	always@( posedge im_data_clk ) begin
		ADC_TESTDATA1 <= ADC_TESTDATA1 + 1;
		ADC_TESTDATA2 <= ADC_TESTDATA2 + 5;
		ADC_TESTDATA3 <= ADC_TESTDATA3 + 10;
	end
// end of ADC test data generation	

assign din[7:0] = ADC_TESTDATA1;
assign din[15:8] = ADC_TESTDATA2;
assign din[23:16] = ADC_TESTDATA3;

// FIFO for changing the test data width from 24 to 6
fifo_24to6_testData fifo_testdata (
  .wr_clk(im_data_clk), // input wr_clk
  .rd_clk(okClk), // input rd_clk
  .din(din), // input [23 : 0] din
  .wr_en(im_data_val), // input wr_en
  .rd_en(1'b1), // input rd_en
  .dout(dout_test), // output [5 : 0] dout
  .full(full_test), // output full
  .empty(empty_test), // output empty
  .valid(im_data_val_test) // output valid
);
 */
 

//DDR2 SDRAM MCB

mem_if u_mem_if (

  .c3_sys_clk_p           (sys_clkp),
  .c3_sys_clk_n           (sys_clkn),
	.c3_sys_clk(sys_clk),

  .c3_sys_rst_i           (rst),                        

  .mcb3_dram_dq           (mcb3_dram_dq),  
  .mcb3_dram_a            (mcb3_dram_a),  
  .mcb3_dram_ba           (mcb3_dram_ba),
  .mcb3_dram_ras_n        (mcb3_dram_ras_n),                        
  .mcb3_dram_cas_n        (mcb3_dram_cas_n),                        
  .mcb3_dram_we_n         (mcb3_dram_we_n),                          
  .mcb3_dram_odt          (mcb3_dram_odt),
  .mcb3_dram_cke          (mcb3_dram_cke),                          
  .mcb3_dram_ck           (mcb3_dram_ck),                          
  .mcb3_dram_ck_n         (mcb3_dram_ck_n),       
  .mcb3_dram_dqs          (mcb3_dram_dqs),                          
  .mcb3_dram_dqs_n        (mcb3_dram_dqs_n),
  .mcb3_dram_udqs         (mcb3_dram_udqs),    // for X16 parts                        
  .mcb3_dram_udqs_n       (mcb3_dram_udqs_n),  // for X16 parts
  .mcb3_dram_udm          (mcb3_dram_udm),     // for X16 parts
  .mcb3_dram_dm           (mcb3_dram_dm),
  .c3_clk0		        (c3_clk0),
  .c3_rst0		        (c3_rst0),
	.c3_calib_done          (c3_calib_done),
	.mcb3_rzq               (mcb3_rzq),
   .mcb3_zio               (mcb3_zio),
               
   .c3_p0_cmd_clk                          (c3_clk0),
   .c3_p0_cmd_en                           (c3_p0_cmd_en),
   .c3_p0_cmd_instr                        (c3_p0_cmd_instr),
   .c3_p0_cmd_bl                           (c3_p0_cmd_bl),
   .c3_p0_cmd_byte_addr                    (c3_p0_cmd_byte_addr),
   .c3_p0_cmd_empty                        (c3_p0_cmd_empty),
   .c3_p0_cmd_full                         (c3_p0_cmd_full),
   .c3_p0_wr_clk                           (c3_clk0),
   .c3_p0_wr_en                            (c3_p0_wr_en),
   .c3_p0_wr_mask                          (c3_p0_wr_mask),
   .c3_p0_wr_data                          (c3_p0_wr_data),
   .c3_p0_wr_full                          (c3_p0_wr_full),
   .c3_p0_wr_empty                         (c3_p0_wr_empty),
   .c3_p0_wr_count                         (c3_p0_wr_count),
   .c3_p0_wr_underrun                      (c3_p0_wr_underrun),
   .c3_p0_wr_error                         (c3_p0_wr_error),
   .c3_p0_rd_clk                           (c3_clk0),
   .c3_p0_rd_en                            (c3_p0_rd_en),
   .c3_p0_rd_data                          (c3_p0_rd_data),
   .c3_p0_rd_full                          (c3_p0_rd_full),
   .c3_p0_rd_empty                         (c3_p0_rd_empty),
   .c3_p0_rd_count                         (c3_p0_rd_count),
   .c3_p0_rd_overflow                      (c3_p0_rd_overflow),
   .c3_p0_rd_error                         (c3_p0_rd_error),
   .c3_p1_cmd_clk                          (c3_clk0),
   .c3_p1_cmd_en                           (c3_p1_cmd_en),
   .c3_p1_cmd_instr                        (c3_p1_cmd_instr),
   .c3_p1_cmd_bl                           (c3_p1_cmd_bl),
   .c3_p1_cmd_byte_addr                    (c3_p1_cmd_byte_addr),
   .c3_p1_cmd_empty                        (c3_p1_cmd_empty),
   .c3_p1_cmd_full                         (c3_p1_cmd_full),
   .c3_p1_wr_clk                           (c3_clk0),
   .c3_p1_wr_en                            (c3_p1_wr_en),
   .c3_p1_wr_mask                          (c3_p1_wr_mask),
   .c3_p1_wr_data                          (c3_p1_wr_data),
   .c3_p1_wr_full                          (c3_p1_wr_full),
   .c3_p1_wr_empty                         (c3_p1_wr_empty),
   .c3_p1_wr_count                         (c3_p1_wr_count),
   .c3_p1_wr_underrun                      (c3_p1_wr_underrun),
   .c3_p1_wr_error                         (c3_p1_wr_error),
   .c3_p1_rd_clk                           (c3_clk0),
   .c3_p1_rd_en                            (c3_p1_rd_en),
   .c3_p1_rd_data                          (c3_p1_rd_data),
   .c3_p1_rd_full                          (c3_p1_rd_full),
   .c3_p1_rd_empty                         (c3_p1_rd_empty),
   .c3_p1_rd_count                         (c3_p1_rd_count),
   .c3_p1_rd_overflow                      (c3_p1_rd_overflow),
   .c3_p1_rd_error                         (c3_p1_rd_error)
);
 


//wire tempfifo_valid; 
//wire tempfifo_empty;
//wire tempfifo_full;
//wire [7:0] tempfifo_dout;
//fifo_8to8 temp_fifo(
//  .clk(im_data_clk), // input clk
//  .rst(rst), // input rst
//  .din(im_data), // input [7 : 0] din
//  .wr_en(im_data_val), // input wr_en
//  .rd_en(!tempfifo_empty), // input rd_en
//  .dout(tempfifo_dout), // output [7 : 0] dout
//  .full(tempfifo_full), // output full
//  .empty(tempfifo_empty), // output empty
//  .valid(tempfifo_valid) // output valid
//);
//
// wire [23:0] temp_data;
// assign temp_data = dout[23:0];//24'hf0f0f0; 
// // FIFO for changing the data width from 6 to 24
//fifo_6to24 fifo_databuf (
//  .rst(rst), // input rst
//  .wr_clk(im_data_clk), // input wr_clk
//  .rd_clk(okClk), // input rd_clk
//  .din(tempfifo_dout), // input [5 : 0] din
//  .wr_en(tempfifo_valid), // input wr_en
//  .rd_en(1'b1), // input rd_en
//  .dout(dout), // output [23 : 0] dout
//  .full(full), // output full
//  .empty(empty), // output empty
//  .almost_empty(almost_empty), // output almost_empty
//  .valid(d_buf_valid) // output valid
//); 
 
 wire [23:0] temp_data;
 assign temp_data = dout[23:0];//24'hf0f0f0; 
 // FIFO for changing the data width from 6 to 24
 
// wire [7:0]switched_data;
// assign switched_data = {im_data[7],im_data[3],im_data[5:4],im_data[6],im_data[2:0]};
 
fifo_6to24 fifo_databuf (
  .rst(rst), // input rst
  .wr_clk(im_data_clk), // input wr_clk
  .rd_clk(okClk), // input rd_clk
  .din(im_data), // input [7 : 0] din changed from 5:0
  .wr_en(im_data_val), // input wr_en
  .rd_en(1'b1), // input rd_en
  .dout(dout), // output [23 : 0] dout
  .full(full), // output full
  .empty(empty), // output empty
  .almost_empty(almost_empty), // output almost_empty
  .valid(d_buf_valid) // output valid
);

// 256kB FIFO for sending the data to OK host
fifo_usbout fifo256kB_out (
  .clk(okClk), // input clk
  .rst(rst), // input rst
//  .din(dout), // input [23 : 0] din
  .din(temp_data), // input [23 : 0] din
  .wr_en(d_buf_valid), // input wr_en
  .rd_en(rd_en), // input rd_en
  .dout(dout_buf), // output [23 : 0] dout
  .full(full_2), // output full
  .empty(empty_2), // output empty
  .prog_full(flag_2frames), // output prog_full
  .prog_empty(flag_1frame)
);


fifo_patterns FIFO_Patterns_cam (
  .clk(CLK_HS), // input clk
  .rst(RstPat), // input rst
  .din(Pat_to_FIFO), // input [9 : 0] din
  .wr_en(PatFIFO_wr), // input wr_en
  .rd_en(STREAM), // input rd_en
  .dout(MSTREAM), // output [9 : 0] dout
  .full(full_pat), // output full
  .empty(empty_pat), // output empty
  .valid(valid_pat), // output valid
  .prog_full(prog_full), // output prog_full
  .prog_empty(PatFIFO_empty) // output prog_empty
);

wire pat_fifo_wr_en;
wire pat_fifo_rd_en;
wire outfifo_full;
wire outfifo_empty;
wire [15:0] MSTREAM16;

wire fifo_mem_rst;
//assign fifo_mem_rst = RstPat && (c3_p1_rd_empty);

reg fifo_rst_cnt;
always @ (posedge CLK_HS) begin
	if (RstPat) fifo_rst_cnt <= 0;
	else fifo_rst_cnt <= 1;
end
assign fifo_mem_rst = RstPat && fifo_rst_cnt;

fifo_memout fifo_mem_pats (
  .rst(fifo_mem_rst), // input rst
  .wr_clk(c3_clk0), // input wr_clk
  .rd_clk(CLK_HS), // input rd_clk
  .din(c3_p1_rd_data), // input [63 : 0] din
  .wr_en(pat_fifo_wr_en), // input wr_en
  .rd_en(pat_fifo_rd_en), // input rd_en
  .dout(MSTREAM16), // output [15 : 0] dout
  //.full(outfifo_full), // output full
  .empty(outfifo_empty), // output empty
  .prog_full(outfifo_full)
);


ROImager_exp_PatSeperate ROImager_inst (
    .RESET(FSMstop), 
    .OK_PIXRES_GLOB(OK_PIXRES_GLOB), 
    .CLKMPRE(CLKMPRE_int), 
    .CLKMPRE_EN(CLKMPRE_EN), 		// Connction to CLKMPRE_ODDR2!
    .STREAM(STREAM), 
    .OK_DRAIN_B(OK_DRAIN_B), 
    .fsm_stat(fsm_stat), 
    .Exp_subc(wireExp), 
    .Num_Pat(wirePat), 
    .CntSubc(CntSubc), 
    .FSMIND0(FSMIND0), 
    .FSMIND1(FSMIND1), 
    .FSMIND0ACK(FSMIND0ACK), 
    .FSMIND1ACK(FSMIND1ACK),
	 .MIN_FRAME_TIME(MIN_FRAME_TIME),
	 
	 .CLK_HS(CLK_HS),						  // Fast clock for projector trigger
    .TRIGGER_PROJ(trigger_proj),				  // Output to projector trigger  
    .PROJ_DELAY(proj_delay),
	 .exposure_trig(exposure_trig),
	 .cam_start(trig55in[0])
	
    );

//pattern_gen pat_gen (
//    .rst(RstPat), 
//    .clk(CLK_HS), 
//    .Pat_in(Pat_in), 
//    .PatGen_start(PatGen_start), 
//    .PatGen_stop(PatGen_stop), 
//    .Num_Pat(wirePat), 
//    .CntSubc(CntSubc), 
//    // .FSMIND0(FSMIND0), 
//    .FIFO_empty(PatFIFO_empty), 
//    .Mask_change_subc(wireMaskChngSubc), 
//	.Mask_change_no(wireMaskChng),
//    .FIFO_wr(PatFIFO_wr), 
//    .Pat_out(Pat_to_FIFO)
//    );
	 
	 
load_pattern pat_gen (
    .rst(fifo_mem_rst), //changed from rst_pat
    .clk(CLK_HS), 
	 .pat_fifo_rd_en(pat_fifo_rd_en),
	 .pat_in(MSTREAM16[15:6]),
	 
    .Num_Pat(wirePat), 
    .CntSubc(CntSubc), 
    .FIFO_empty(PatFIFO_empty), 
	 .camfifo_empty(empty_pat),
	 .camfifo_full(full_pat),
	 
    .FIFO_wr(PatFIFO_wr), 
    .Pat_out(Pat_to_FIFO)
);

mem_fsm mem_controller(
//	.fsm_rst(rst),
	.fsm_rst(FSMstop),
		
	.okClk(okClk),
	.pipein_high(pipe80in_high),
	.pipein_data(pipe80in_data),
		
	.write_start(trig53in[0]),
	.Num_Pat(wirePat),
		
	.mem_calib_done(c3_calib_done),
	.mem_clk(c3_clk0),
	.c3_p0_cmd_en(c3_p0_cmd_en),
	.c3_p0_cmd_instr(c3_p0_cmd_instr),
	.c3_p0_cmd_bl(c3_p0_cmd_bl),
	.c3_p0_cmd_byte_addr(c3_p0_cmd_byte_addr),
	.c3_p0_cmd_empty(c3_p0_cmd_empty),
	.c3_p0_cmd_full(c3_p0_cmd_full),
	.c3_p0_wr_en(c3_p0_wr_en),
	.c3_p0_wr_data(c3_p0_wr_data),
	.c3_p0_wr_mask(c3_p0_wr_mask),
	.c3_p0_wr_full(c3_p0_wr_full),
	.c3_p0_wr_empty(c3_p0_wr_empty),
   .c3_p0_wr_count(c3_p0_wr_count),
   .c3_p0_wr_underrun(c3_p0_wr_underrun),
   .c3_p0_wr_error(c3_p0_wr_error),
	
	.c3_p1_cmd_en                           (c3_p1_cmd_en),
   .c3_p1_cmd_instr                        (c3_p1_cmd_instr),
   .c3_p1_cmd_bl                           (c3_p1_cmd_bl),
   .c3_p1_cmd_byte_addr                    (c3_p1_cmd_byte_addr),
   .c3_p1_cmd_empty                        (c3_p1_cmd_empty),
   .c3_p1_cmd_full                         (c3_p1_cmd_full),
	.c3_p1_rd_en                            (c3_p1_rd_en),
   .c3_p1_rd_full                          (c3_p1_rd_full),
   .c3_p1_rd_empty                         (c3_p1_rd_empty),
   .c3_p1_rd_count                         (c3_p1_rd_count),
   .c3_p1_rd_overflow                      (c3_p1_rd_overflow),
   .c3_p1_rd_error                         (c3_p1_rd_error),
	.c3_p1_rd_data(c3_p1_rd_data),
	
	.read_start(FSMIND1),
	.outfifo_full(outfifo_full),
	.outfifo_empty(outfifo_empty),
	.outfifo_wr_en(pat_fifo_wr_en),
	.read_done(read_done),
	
	.write_happens(write_happens),
	
	.write_done(pattern_stored)
);	 


//generating c3_sys_clk
//wire c3_sys_clk;
//CLK_DDR ddr_clk(
//	.CLK_IN1(sys_clk),
//	.CLK_OUT1(c3_sys_clk)
//);


// Generating the CLK_HS
// DCM_CLKGEN: Frequency Aligned Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
// DCM_SP: Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
DCM_SP #(
	.CLKDV_DIVIDE(3.0), // CLKDV divide value
	// (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
	.CLKFX_DIVIDE(C_CLKHS_D), // Divide value on CLKFX outputs - D - (1-32)
	.CLKFX_MULTIPLY(C_CLKHS_M), // Multiply value on CLKFX outputs - M - (2-32)
	.CLKIN_DIVIDE_BY_2("FALSE"), // CLKIN divide by two (TRUE/FALSE)
	.CLKIN_PERIOD(10.0), // Input clock period specified in nS
	.CLKOUT_PHASE_SHIFT("NONE"), // Output phase shift (NONE, FIXED, VARIABLE)
	.CLK_FEEDBACK("1X"), // Feedback source (NONE, 1X, 2X)
	.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SYSTEM_SYNCHRNOUS or SOURCE_SYNCHRONOUS
	.DFS_FREQUENCY_MODE("LOW"), // Unsupported - Do not change value
	.DLL_FREQUENCY_MODE("LOW"), // Unsupported - Do not change value
	.DSS_MODE("NONE"), // Unsupported - Do not change value
	.DUTY_CYCLE_CORRECTION("TRUE"), // Unsupported - Do not change value
	.FACTORY_JF(16'hc080), // Unsupported - Do not change value
	.PHASE_SHIFT(0), // Amount of fixed phase shift (-255 to 255)
	.STARTUP_WAIT("FALSE") // Delay config DONE until DCM_SP LOCKED (TRUE/FALSE)
)
DCM_SP_CLKHS (
	.CLK0(CLK0), // 1-bit output: 0 degree clock output
	.CLK180(CLK180), // 1-bit output: 180 degree clock output
	.CLK270(CLK270), // 1-bit output: 270 degree clock output
	.CLK2X(CLK2X_2), // 1-bit output: 2X clock frequency clock output
	.CLK2X180(CLK2X180), // 1-bit output: 2X clock frequency, 180 degree clock output
	.CLK90(CLK90), // 1-bit output: 90 degree clock output
	.CLKDV(sys_clkDV), // 1-bit output: Divided clock output
	.CLKFX(CLK_HS), // 1-bit output: Digital Frequency Synthesizer output (DFS)
	.CLKFX180(CLK_HS180), // 1-bit output: 180 degree CLKFX output
	.LOCKED(LOCKED_HS), // 1-bit output: DCM_SP Lock Output
	.PSDONE(PSDONE), // 1-bit output: Phase shift done output
	.STATUS(STATUS), // 8-bit output: DCM_SP status output
	.CLKFB(CLK0), // 1-bit input: Clock feedback input
	.CLKIN(sys_clk), // 1-bit input: Clock input
	.DSSEN(1'b0), // 1-bit input: Unsupported, specify to GND.
	.PSCLK(1'b0), // 1-bit input: Phase shift clock input
	.PSEN(1'b0), // 1-bit input: Phase shift enable
	.PSINCDEC(1'b0), // 1-bit input: Phase shift increment/decrement input
	.RST(1'b0) // 1-bit input: Active high reset input
);
// End of DCM_SP_inst instantiation

// DCM_SP: Digital Clock Manager
//         Spartan-6
// Xilinx HDL Language Template, version 14.7

DCM_SP #(
	.CLKDV_DIVIDE(2.0),                   // CLKDV divide value
										// (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
	.CLKFX_DIVIDE(6*C_CLKHS_D),           // Divide value on CLKFX outputs - D - (1-32)
	.CLKFX_MULTIPLY(C_CLKHS_M),           // Multiply value on CLKFX outputs - M - (2-32)
	.CLKIN_DIVIDE_BY_2("FALSE"),          // CLKIN divide by two (TRUE/FALSE)
	.CLKIN_PERIOD(10.0),                  // Input clock period specified in nS
	.CLKOUT_PHASE_SHIFT("NONE"),          // Output phase shift (NONE, FIXED, VARIABLE)
	.CLK_FEEDBACK("1X"),                  // Feedback source (NONE, 1X, 2X)
	.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SYSTEM_SYNCHRNOUS or SOURCE_SYNCHRONOUS
	.DFS_FREQUENCY_MODE("LOW"),           // Unsupported - Do not change value
	.DLL_FREQUENCY_MODE("LOW"),           // Unsupported - Do not change value
	.DSS_MODE("NONE"),                    // Unsupported - Do not change value
	.DUTY_CYCLE_CORRECTION("TRUE"),       // Unsupported - Do not change value
	.FACTORY_JF(16'hc080),                // Unsupported - Do not change value
	.PHASE_SHIFT(0),                      // Amount of fixed phase shift (-255 to 255)
	.STARTUP_WAIT("FALSE")                // Delay config DONE until DCM_SP LOCKED (TRUE/FALSE)
)
DCM_SP_inst (
	.CLK0(CLK0_MPRE),         // 1-bit output: 0 degree clock output
	.CLK180(CLK180_MPRE),     // 1-bit output: 180 degree clock output
	.CLK270(CLK270_MPRE),     // 1-bit output: 270 degree clock output
	.CLK2X(CLK2X_MPRE),       // 1-bit output: 2X clock frequency clock output
	.CLK2X180(CLK2X180_MPRE), // 1-bit output: 2X clock frequency, 180 degree clock output
	.CLK90(CLK90_MPRE),       // 1-bit output: 90 degree clock output
	.CLKDV(CLKDV),       // 1-bit output: Divided clock output
	.CLKFX(CLKMPRE_int),       // 1-bit output: Digital Frequency Synthesizer output (DFS)
	.CLKFX180(CLKMPRE_int180), // 1-bit output: 180 degree CLKFX output
	.LOCKED(LOCKED_MPRE),     // 1-bit output: DCM_SP Lock Output
	.PSDONE(PSDONE_MPRE),     // 1-bit output: Phase shift done output
	.STATUS(STATUS_MPRE),     // 8-bit output: DCM_SP status output
	.CLKFB(CLK0_MPRE),       // 1-bit input: Clock feedback input
	.CLKIN(sys_clkDV),       // 1-bit input: Clock input
	.DSSEN(1'b0),       // 1-bit input: Unsupported, specify to GND.
	.PSCLK(1'b0),       // 1-bit input: Phase shift clock input
	.PSEN(1'b0),         // 1-bit input: Phase shift enable
	.PSINCDEC(1'b0), // 1-bit input: Phase shift increment/decrement input
	.RST(1'b0)            // 1-bit input: Active high reset input
);

// End of DCM_SP_inst instantiation

// Xilinx HDL Libraries Guide, version 13.4
ODDR2 #(
	.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
	.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
	.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
	) ODDR2_inst_1 (
	.Q(CLKM), // 1-bit DDR output data
	.C0(CLK_HS), // 1-bit clock input
	.C1(CLK_HS180), // 1-bit clock input
	.CE(1'b1), // 1-bit clock enable input
	.D0(1'b0), // 1-bit data input (associated with C0)
	.D1(1'b1), // 1-bit data input (associated with C1)
	.R(1'b0), // 1-bit reset input
	.S(1'b0) // 1-bit set input
);
// End of ODDR2_inst instantiatio

// Xilinx HDL Libraries Guide, version 13.4
ODDR2 #(
	.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
	.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
	.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
	) ODDR2_CLKMPRE_IO	(
	.Q(CLKMPRE), // 1-bit DDR output data
	.C0(CLKMPRE_int180), // 1-bit clock input
	.C1(CLKMPRE_int), // 1-bit clock input
	.CE(1'b1), // 1-bit clock enable input
	.D0(1'b0), // 1-bit data input (associated with C0)
	.D1(1'b1), // 1-bit data input (associated with C1)
	.R(1'b0), // 1-bit reset input
	.S(1'b0) // 1-bit set input
);
// End of ODDR2_inst instantiatio

	
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
okWireIn	wire10		(.okHE(okHE),								.ep_addr(8'h10),							.ep_dataout(wireout) );
okWireIn	wire11		(.okHE(okHE),								.ep_addr(8'h11),							.ep_dataout(wireExp) );
okWireIn	wire12		(.okHE(okHE),								.ep_addr(8'h12),							.ep_dataout(wirePat) );
okWireIn	wire13		(.okHE(okHE),								.ep_addr(8'h13),							.ep_dataout(wireMaskChng) );
okWireIn	wire14		(.okHE(okHE),								.ep_addr(8'h14),							.ep_dataout(wireMaskChngSubc) );
okWireIn	wire15		(.okHE(okHE),								.ep_addr(8'h15),							.ep_dataout(wirePatterns) );
okWireIn framewire   (.okHE(okHE),								.ep_addr(8'h18),							.ep_dataout(MIN_FRAME_TIME) );
okWireIn wire19   (.okHE(okHE),								.ep_addr(8'h19),							.ep_dataout(proj_delay) );
//okWireIn okPHASE_SEL (.okHE(okHE),								.ep_addr(8'h16),							.ep_dataout(PHASE_SEL)	); //testmodimp


// comment the top okWireIn modules for simulations!
okWireOut 	wire22		(.okHE(okHE),	.okEH(okEHx[0*65 +: 65]),	.ep_addr(8'h22),							.ep_datain(wireExp) );
okWireOut 	wire23		(.okHE(okHE),	.okEH(okEHx[3*65 +: 65]),	.ep_addr(8'h23),							.ep_datain(wirePat) );
okWireOut 	wire24		(.okHE(okHE),	.okEH(okEHx[4*65 +: 65]),	.ep_addr(8'h24),							.ep_datain(wireMaskChng) );
okTriggerIn trigIn53 	(.okHE(okHE),								.ep_addr(8'h53), 	.ep_clk(c3_clk0), 		.ep_trigger(trig53in));
okTriggerOut trigOut6A	(.okHE(okHE), 	.okEH(okEHx[1*65 +: 65]),	.ep_addr(8'h6a), 	.ep_clk(sys_clk), 		.ep_trigger(trig6Aout));
okPipeOut	pipeA0		(.okHE(okHE),	.okEH(okEHx[2*65 +: 65]),	.ep_addr(8'hA0),	.ep_read(rd_en),		.ep_datain(din_pipe) );
okPipeIn 	pipe80		(.okHE(okHE),	.okEH(okEHx[5*65 +: 65]),	.ep_addr(8'h80),	.ep_write(pipe80in_high),	.ep_dataout(pipe80in_data));

wire [31:0] trig55in;
okTriggerIn trigIn55 	(.okHE(okHE),								.ep_addr(8'h55), 	.ep_clk(CLKMPRE_int), 		.ep_trigger(trig55in));

endmodule