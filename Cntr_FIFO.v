`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:08:10 10/27/2016 
// Design Name: 
// Module Name:    cntr_fifo 
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
module Cntr_FIFO(
	input wire [4:0] okUH,
	output wire[2:0] okHU,
	inout wire[31:0] okUHU,
	inout wire okAA,
	input wire sys_clkn,
	input wire sys_clkp,
	output wire[7:0] led
    );

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
wire [7*65-1:0] okEHx;
// Adjust size of okEHx to fit the number of outgoing endpoints in your design (n*65-1:0)

// Circuit wires
wire rst;				// FIFO reset
wire wr_en;				// FIFO write enable
wire rd_en;				// FIFO read enable
wire [7:0] din;			// FIFO input data
wire [31:0] dout;		// FIFO output data
wire [31:0] patternout;
wire [31:0] dout_buf;	// FIFO output re-arranged for pipe connection
wire [31:0] patternPipeout;
wire [31:0] wireout;
wire [31:0] wireoutExposure;
wire [31:0] wireoutNumPatterns;
wire [31:0] wirein;
wire [31:0] PipeInPattern;
wire [31:0] dinpattern;
wire [31:0] readExposure;
wire [31:0] readNumPatterns;
wire [31:0] trig6Aout;
wire [31:0] trig53in;
wire full;
wire almost_full;
wire empty;
wire [16:0] wr_data_count;
wire flag1kB;

//Circuit registers
reg	[7:0] cnt;
reg cnt_en;
reg cnt_act;
reg rst_full;

//Circuit assignements
assign led[0] = cnt_en;
assign led[1] = rd_en;
assign led[2] = cnt_act;
assign led[3] = flag1kB;
assign led[4] = rst;
assign led[7:5] = 3'b000;
//assign led[7:0] = 8'hA2;
assign rst = wireout[0] | rst_full;
assign rstpattern = wireout[1];
assign wr_en = cnt_en;
assign wirein[0] = full;
assign wirein[1] = almost_full;
assign wirein[2] = empty;
assign wirein[20] = fullPattern;
assign wirein[21] = emptyPattern;
assign wirein[19:3] = wr_data_count;
assign wirein[31:22] = 12'b0;
assign trig6Aout[0] = full;
assign trig6Aout[1] = almost_full;
assign trig6Aout[2] = flag1kB;
assign trig6Aout[31:3] = 29'b0;
assign dout_buf[7:0]=dout[31:24];
assign dout_buf[15:8]=dout[23:16];
assign dout_buf[23:16]=dout[15:8];
assign dout_buf[31:24]=dout[7:0];
assign patternPipeout[7:0]=patternout[31:24];
assign patternPipeout[15:8]=patternout[23:16];
assign patternPipeout[23:16]=patternout[15:8];
assign patternPipeout[31:24]=patternout[7:0];
assign dinpattern[7:0]=PipeInPattern[31:24];
assign dinpattern[15:8]=PipeInPattern[23:16];
assign dinpattern[23:16]=PipeInPattern[15:8];
assign dinpattern[31:24]=PipeInPattern[7:0];
assign readExposure = wireoutExposure;
assign readNumPatterns = wireoutNumPatterns;
 
// 128kB FIFO instantiation
fifo_128kB fifi_1 (
  .rst(rst), // input rst
  .wr_clk(CLKDV), // input wr_clk
  .rd_clk(okClk), // input rd_clk
  .din(cnt), // input [7 : 0] din
  .wr_en(wr_en), // input wr_en
  .rd_en(rd_en), // input rd_en
  .dout(dout), // output [31 : 0] dout
  .full(full), // output full
  .almost_full(almost_full), // output almost_full
  .empty(empty), // output empty
  .wr_data_count(wr_data_count), // output [16 : 0] wr_data_count
  .prog_full(flag1kB) // output prog_full
);



FIFOpattern mypattern (
  .clk(okClk), // input clk
  .rst(rstpattern), // input rst
  .din(dinpattern), // input [31 : 0] din
  .wr_en(fifowrite), // input wr_en
  .rd_en(fiforead), // input rd_en
  .dout(patternout), // output [31 : 0] dout
  .full(fullPattern), // output full
  .empty(emptyPattern) // output empty
);

// initial conditions
initial begin
	cnt <= 8'h10;
	cnt_en <= 0;
	cnt_act <= 0;
	rst_full <= 0;
	end

// Counter loop
always @(posedge CLKDV) begin
	if(trig53in[0]) begin
		cnt_act <= 1;
		cnt_en <= 1;
		rst_full <= 0;
	end else if(trig53in[1]) begin
		rst_full <= 1;
		cnt_en <= 0;
		cnt <= 8'h10;
	end else if(rst == 1) begin
		cnt_en <= 0;
		rst_full <= 0;
		cnt <= 8'h10;
	end else if(wr_en && full!=1 && cnt != 8'hFF) begin
		rst_full <= 0;
		cnt <= cnt + 1;
	end else if(wr_en && full!=1 && cnt == 8'hFF) begin
		cnt <= 8'h10;
	end else if(full == 1) begin
		cnt_en <= 0;
		rst_full <= 0;
	end else if(!wr_en)
		cnt_en <= 1;
	end

// DCM_SP: Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.3
DCM_SP #(
.CLKDV_DIVIDE(10.0), // CLKDV divide value
// (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
.CLKFX_DIVIDE(4), // Divide value on CLKFX outputs - D - (1-32)
.CLKFX_MULTIPLY(4), // Multiply value on CLKFX outputs - M - (2-32)
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
DCM_SP_inst (
.CLK0(CLK0), // 1-bit output: 0 degree clock output
.CLK180(CLK180), // 1-bit output: 180 degree clock output
.CLK270(CLK270), // 1-bit output: 270 degree clock output
.CLK2X(CLK2X), // 1-bit output: 2X clock frequency clock output
.CLK2X180(CLK2X180), // 1-bit output: 2X clock frequency, 180 degree clock output
.CLK90(CLK90), // 1-bit output: 90 degree clock output
.CLKDV(CLKDV), // 1-bit output: Divided clock output
.CLKFX(CLKFX), // 1-bit output: Digital Frequency Synthesizer output (DFS)
.CLKFX180(CLKFX180), // 1-bit output: 180 degree CLKFX output
.LOCKED(LOCKED), // 1-bit output: DCM_SP Lock Output
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
okWireOR # (.N(7)) wireOR (okEH, okEHx);

// FrontPanel module instantiations
okWireIn	wire10		(.okHE(okHE),								.ep_addr(8'h10),							.ep_dataout(wireout) );
okWireIn	wire11		(.okHE(okHE),								.ep_addr(8'h11),							.ep_dataout(wireoutExposure) );
okWireIn	wire12		(.okHE(okHE),								.ep_addr(8'h12),							.ep_dataout(wireoutNumPatterns) );
okWireOut 	wire21		(.okHE(okHE),	.okEH(okEHx[0*65 +: 65]),	.ep_addr(8'h21),							.ep_datain(wirein) );
okTriggerIn trigIn53 	(.okHE(okHokHEE),								.ep_addr(8'h53), 	.ep_clk(CLKDV), 		.ep_trigger(trig53in));
okTriggerOut trigOut6A	(.okHE(okHE), 	.okEH(okEHx[1*65 +: 65]),	.ep_addr(8'h6a), 	.ep_clk(sys_clk), 		.ep_trigger(trig6Aout));
okPipeOut	pipeA0		(.okHE(okHE),	.okEH(okEHx[2*65 +: 65]),	.ep_addr(8'hA0),	.ep_read(rd_en),		.ep_datain(dout_buf) );
okPipeOut	pipeB0		(.okHE(okHE),	.okEH(okEHx[3*65 +: 65]),	.ep_addr(8'hB0),	.ep_read(fiforead),		.ep_datain(patternPipeout) );
okPipeIn 	pipe80		(.okHE(okHE),	.okEH(okEHx[4*65 +: 65]),	.ep_addr(8'h80),	.ep_write(fifowrite),	.ep_dataout(PipeInPattern)	);
okWireOut 	wire22		(.okHE(okHE),	.okEH(okEHx[5*65 +: 65]),	.ep_addr(8'h22),							.ep_datain(readExposure) );
okWireOut 	wire23		(.okHE(okHE),	.okEH(okEHx[6*65 +: 65]),	.ep_addr(8'h23),							.ep_datain(readNumPatterns) );

endmodule
