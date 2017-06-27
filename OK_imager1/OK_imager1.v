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
	input wire[5:0] im_data,
	input wire im_data_val,
	input wire im_data_clk,
	output wire FPGA_rst_n,
	output wire CLKM,
	output wire CLKMPRE,
	output wire STREAM,
	output wire [10:1] MSTREAM,
	output wire OK_DRAIN_B,
	output wire OK_PIXRES_GLOB,
	output	[31:0] PHASE_SEL, //testmodimp
	input wire FSMIND0,				// If high, the Exposure FSM (on OK) is active
	output wire FSMIND1,
	output wire FSMIND0ACK,
	input wire FSMIND1ACK
    );

// -- Parameters
parameter	C_CLKHS_D		= 3;	// Devide value for CLKHS to USER_CLOCK. value - D - (1-256)
parameter	C_CLKHS_M		= 3;	// Multiply value for CLKHS to USER_CLOCK. value - M - (2-256)

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
wire [5*65-1:0] okEHx;
// Adjust size of okEHx to fit the number of outgoing endpoints in your design (n*65-1:0)

// Circuit wires
wire rst;				// FIFO reset
wire wr_en;				// FIFO write enable
wire rd_en;				// FIFO read enable
wire [23:0] dout;		// FIFO output data
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

// TB sims values
// assign wireExp = 32'h000A;
// assign wirePat = 32'h0014;
// assign wireMaskChng = 32'h0003;
// assign wireMaskChngSubc = 32'h0003;
// assign wireout = 32'h0000;

// Circuit assignements
assign led = fsm_stat;
assign FSMstop = rst | flag_2frames;
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
 
 // FIFO for changing the data width from 6 to 24
fifo_6to24 fifo_databuf (
  .rst(rst), // input rst
  .wr_clk(im_data_clk), // input wr_clk
  .rd_clk(okClk), // input rd_clk
  .din(im_data), // input [5 : 0] din
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
  .din(dout), // input [23 : 0] din
  .wr_en(d_buf_valid), // input wr_en
  .rd_en(rd_en), // input rd_en
  .dout(dout_buf), // output [23 : 0] dout
  .full(full_2), // output full
  .empty(empty_2), // output empty
  .prog_full(flag_2frames), // output prog_full
  .prog_empty(flag_1frame)
);

fifo_patterns FIFO_Patterns (
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
	 .MIN_FRAME_TIME(MIN_FRAME_TIME)
    );

pattern_gen pat_gen (
    .rst(RstPat), 
    .clk(CLK_HS), 
    .Pat_in(Pat_in), 
    .PatGen_start(PatGen_start), 
    .PatGen_stop(PatGen_stop), 
    .Num_Pat(wirePat), 
    .CntSubc(CntSubc), 
    // .FSMIND0(FSMIND0), 
    .FIFO_empty(PatFIFO_empty), 
    .Mask_change_subc(wireMaskChngSubc), 
	.Mask_change_no(wireMaskChng),
    .FIFO_wr(PatFIFO_wr), 
    .Pat_out(Pat_to_FIFO)
    );

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
okWireOR # (.N(5)) wireOR (okEH, okEHx);

// FrontPanel module instantiations
okWireIn	wire10		(.okHE(okHE),								.ep_addr(8'h10),							.ep_dataout(wireout) );
okWireIn	wire11		(.okHE(okHE),								.ep_addr(8'h11),							.ep_dataout(wireExp) );
okWireIn	wire12		(.okHE(okHE),								.ep_addr(8'h12),							.ep_dataout(wirePat) );
okWireIn	wire13		(.okHE(okHE),								.ep_addr(8'h13),							.ep_dataout(wireMaskChng) );
okWireIn	wire14		(.okHE(okHE),								.ep_addr(8'h14),							.ep_dataout(wireMaskChngSubc) );
okWireIn	wire15		(.okHE(okHE),								.ep_addr(8'h15),							.ep_dataout(wirePatterns) );
okWireIn okPHASE_SEL (.okHE(okHE),								.ep_addr(8'h16),							.ep_dataout(PHASE_SEL)	); //testmodimp
okWireIn framewire   (.okHE(okHE),								.ep_addr(8'h18),							.ep_dataout(MIN_FRAME_TIME));
// comment the top okWireIn modules for simulations!
okWireOut 	wire22		(.okHE(okHE),	.okEH(okEHx[0*65 +: 65]),	.ep_addr(8'h22),							.ep_datain(wireExp) );
okWireOut 	wire23		(.okHE(okHE),	.okEH(okEHx[3*65 +: 65]),	.ep_addr(8'h23),							.ep_datain(wirePat) );
okWireOut 	wire24		(.okHE(okHE),	.okEH(okEHx[4*65 +: 65]),	.ep_addr(8'h24),							.ep_datain(wireMaskChng) );
okTriggerIn trigIn53 	(.okHE(okHE),								.ep_addr(8'h53), 	.ep_clk(CLKDV), 		.ep_trigger(trig53in));
okTriggerOut trigOut6A	(.okHE(okHE), 	.okEH(okEHx[1*65 +: 65]),	.ep_addr(8'h6a), 	.ep_clk(sys_clk), 		.ep_trigger(trig6Aout));
okPipeOut	pipeA0		(.okHE(okHE),	.okEH(okEHx[2*65 +: 65]),	.ep_addr(8'hA0),	.ep_read(rd_en),		.ep_datain(din_pipe) );

endmodule