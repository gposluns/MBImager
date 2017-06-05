`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:00:44 04/14/2016 
// Design Name: 
// Module Name:    MB_top 
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
module MB_top(
    input EXT_RESET_N,
	input EXT_RESET_N_spi,
	input EXT_RESET_N_Glob,
    input USER_CLOCK,
    input SPI_FLASH_MISO,
    output SPI_FLASH_MOSI,
    output [9:0] SPI_FLASH_SS,
    output SPI_FLASH_SCLK,
	output ADC_READ_ACLK,		// The Linear ADC clk
	output SPI_5V_EN,				// Enable the level shifters for the 5V devices SPI connection
	output RS_POT,					// Reset potentiometers
	input [7:0] ADC_DATA3,		// Data coming from the TIADC3
	input [7:0] ADC_DATA2,		// Data coming from the TIADC2
	input [7:0] ADC_DATA1,		// Data coming from the TIADC1
	output ADC_INCLK,				// CLOCK sent to the TI ADCs (buffered ADC_PIXCLK)
	output MBI_CLK_CDS,			// Imager signal
	output [7:0] MBI_ROW_ADD,	// Imager signal
	output MBI_PIXRES,			// Imager signal
	output MBI_PRECHN_AMP,		// Imager signal
	output [5:0] MBI_MUX_ADD,	// Imager signal
	output MBI_PIXRES_GLOB,		// Imager signal
	output MBI_CLKL_MOD,			// Light source signal
	output MBI_CLKN_MOD,			// Imager signal
	output MBI_CLK_MOD,			// Imager signal
	output MBI_PRECH_COL,		// Imager signal
	output MBI_RESETN_GLOB,		// Imager signal
	output MBI_DRAIN_B,			// Imager signal
	input OK_DRAIN_B,				// Drain_b generated in OK_FSM
	output ISPI_DATA,				// Imager SPI signal
	output ISPI_REGCLK,			// Imager SPI signal
	output ISPI_UPLOAD,			// Imager SPI signal
	output [5:0] dout,			// FIFO data sent to OpalKelly
	output fifo_dout_valid,		// FIFO data valid sent to OK
	output fifo_clk,				// FIFO clk sent to OK
	output FSMIND0,				// If high, the Exposure FSM (on OK) is active
	input FSMIND1,					// If high, the ADC FSM (on MOBO) is active
	input FSMIND0ACK,				// Acknowledge for FSMIND0
	output FSMIND1ACK,			// Acknowledge for FSMIND1
	input OK_PIXRES_GLOB			// PIXRES_GLOB provided by OK board. Has to be forwarded to the imager
   );

// -- Parameters
parameter	C_ADCCLK_R		= 12;	// USER_CLOCK to ADC_INCLK freq ratio. Default = 8. Accepted value (2, 4, 8, 16, 32)
parameter	C_CLKHS_D		= 10;	// Devide value for CLKHS to USER_CLOCK. value - D - (1-256)
parameter	C_CLKHS_M		= 5;	// Multiply value for CLKHS to USER_CLOCK. value - M - (2-256)
parameter	C_FIFOREAD_R	= 4;	// Divide value for C_FIFOREAD_R to USER_CLOCK.
   
   
wire MBI_ADC_DATA_VALID;
wire [15:0] DATA_IN_TO_DEVICE1;
wire [15:0] DATA_IN_TO_DEVICE2;
wire [15:0] DATA_IN_TO_DEVICE3;
wire ADC_CLK;
wire CLKFIFO;
wire [23:0] din;
wire EXT_RESET;
wire MBI_DDR_DATA_VALID;
wire [1:0] STATUS_0;
wire [1:0] STATUS_1;
wire [7:0] STATUS_2;
wire ADC_READ_ACLK_int;
wire ISPI_REGCLK_int;
wire ADC_CLK_n;
// reg [7:0] ADC_TESTDATA1;
// reg [7:0] ADC_TESTDATA2;
// reg [7:0] ADC_TESTDATA3;

/* Do not reset the Imager SPI regs */
//	assign ISPI_RESETB = 1'b1;
assign EXT_RESET = ~EXT_RESET_N;

/* Always Pull enable to 1 */
assign SPI_5V_EN = 1'b1;

/* Dont Reset Potentiometer */
assign RS_POT = 1'b1;

wire [9:0] spi_cs;
assign SPI_FLASH_SS[0] = spi_cs[0];		/* ~CS_PLL */
assign SPI_FLASH_SS[1] = spi_cs[1];		/* ~CS_POT1 */
assign SPI_FLASH_SS[2] = spi_cs[2];		/* ~CS_POT2 */
assign SPI_FLASH_SS[3] = spi_cs[3];		/* ~CS_READ_ADC */
assign SPI_FLASH_SS[4] = spi_cs[4];		/* ~CS_PHASE_ADJ */
assign SPI_FLASH_SS[5] = ~spi_cs[5];	/* CS_TEMP_DAU */
assign SPI_FLASH_SS[6] = ~spi_cs[6];	/* CS_TEMP_MOTHER */
assign SPI_FLASH_SS[7] = spi_cs[7];		/* ~CS_ADC1 */
assign SPI_FLASH_SS[8] = spi_cs[8];		/* ~CS_ADC2 */
assign SPI_FLASH_SS[9] = spi_cs[9];		/* ~CS_ADC3 */
assign din[7:0] = DATA_IN_TO_DEVICE3[15:8];
assign din[15:8] = DATA_IN_TO_DEVICE2[15:8];
assign din[23:16] = DATA_IN_TO_DEVICE1[15:8];
// assign din[7:0] = DATA_IN_TO_DEVICE1[7:0];
// assign din[15:8] = DATA_IN_TO_DEVICE2[7:0];
// assign din[23:16] = DATA_IN_TO_DEVICE3[7:0];
// assign din[7:0] = ADC_TESTDATA1;
// assign din[15:8] = ADC_TESTDATA2;
// assign din[23:16] = ADC_TESTDATA3;

//mod_signal_gen mod_signal_gen_inst (
//	.USER_CLOCK(USER_CLOCK),
//	.W_FREQ_SEL(W_FREQ_SEL),
//	.W_PHASE_SEL(W_PHASE_SEL),
//	.W_DUTY_SEL(W_DUTY_SEL),
//	.MBI_CLK_MOD(MBI_CLK_MOD),
//	.MBI_CLKN_MOD(MBI_CLKN_MOD),
//	.MBI_CLKL_MOD(MBI_CLKL_MOD)
//);

MB_SPI_top uBlaze_SPI (
    .EXT_RESET_N(EXT_RESET_N), 
    .USER_CLOCK(USER_CLOCK), 
    .SPI_FLASH_SS(spi_cs), 
    .SPI_FLASH_MOSI(SPI_FLASH_MOSI), 
    .SPI_FLASH_SCLK(SPI_FLASH_SCLK), 
    .SPI_FLASH_MISO(SPI_FLASH_MISO)
    );

ROImager imager_time (
	.RESET(EXT_RESET),
    .PHI1(MBI_CLK_CDS), 
    .ROW_ADD(MBI_ROW_ADD), 
    .PIXRES(MBI_PIXRES), 
    .PRECHN_AMP(MBI_PRECHN_AMP), 
    .MUX_ADD(MBI_MUX_ADD), 
    .ADC_PIXCLK(ADC_PIXCLK), 
	.ADC_CLK(ADC_CLK),
//    .CLK_MOD(MBI_CLK_MOD), 	//testmodimp
//    .CLKN_MOD(MBI_CLKN_MOD), 
    .PRECH_COL(MBI_PRECH_COL), 
    .ADC_DATA_VALID(MBI_ADC_DATA_VALID),
	.DDR_DATA_VALID(MBI_DDR_DATA_VALID),
	.FSMIND0(FSMIND0),
	.FSMIND1(FSMIND1),
	.FSMIND0ACK(FSMIND0ACK),
	.FSMIND1ACK(FSMIND1ACK)
);

assign MBI_PIXRES_GLOB = OK_PIXRES_GLOB;
assign MBI_DRAIN_B = OK_DRAIN_B;
assign MBI_RESETN_GLOB = EXT_RESET_N_Glob;

ACLK_GENERATOR clk_gen(.CLOCK_IN(USER_CLOCK), .CLOCK_OUT(ADC_READ_ACLK_int));

// BUFG: Global Clock Buffer
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
BUFG BUFG_DDRCLK (
.O(ADC_CLK90_n), // 1-bit output: Clock buffer output
.I(~ADC_CLK90) // 1-bit input: Clock buffer input
);
// End of BUFG_inst instantiation

/* // Generating test data instead of ADCs data
	initial begin
		ADC_TESTDATA1 <= 8'b10001000;
		ADC_TESTDATA2 <= 8'b00100000;
		ADC_TESTDATA3 <= 8'b10000000;
	end

	always@( negedge ADC_CLK ) begin
		if(EXT_RESET)begin
			ADC_TESTDATA1 <= 8'b10101010;
			ADC_TESTDATA2 <= 8'b11110000;
			ADC_TESTDATA3 <= 8'b10001100;
		// end else begin		
			// ADC_TESTDATA1 <= ADC_TESTDATA1 + 1;
			// ADC_TESTDATA2 <= ADC_TESTDATA2 + 5;
			// ADC_TESTDATA3 <= ADC_TESTDATA3 + 10;
		end
	end
// end of ADC test data generation	
 */
TI_ADC_RO adc_sample(
	.DATA_IN_FROM_PINS1(ADC_DATA1), .DATA_IN_TO_DEVICE1(DATA_IN_TO_DEVICE1),
	.DATA_IN_FROM_PINS2(ADC_DATA2), .DATA_IN_TO_DEVICE2(DATA_IN_TO_DEVICE2),
	.DATA_IN_FROM_PINS3(ADC_DATA3), .DATA_IN_TO_DEVICE3(DATA_IN_TO_DEVICE3),
	.CLK_IN(ADC_CLK90), .CLK_EN(MBI_ADC_DATA_VALID)
);

fifo_4kB fifo_inst_4kB (
  .rst(EXT_RESET), // input rst
  .wr_clk(ADC_CLK), // input wr_clk
  .rd_clk(CLKFIFO), // input rd_clk
  .din(din), // input [23 : 0] din
  .wr_en(MBI_DDR_DATA_VALID), // input wr_en
  .rd_en(1'b1), // input rd_en
  .dout(dout), // output [5 : 0] dout
  .full(full), // output full
  .empty(empty), // output empty
  .almost_empty(almost_empty), // output almost_empty
  .valid(fifo_dout_valid), // output valid
  .prog_full(flag_138cols) // output prog_full
);	

// Generating the FIFOREAD and CLK_HS
// DCM_CLKGEN: Frequency Aligned Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
// DCM_SP: Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
DCM_SP #(
.CLKDV_DIVIDE(C_FIFOREAD_R), // CLKDV divide value
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
DCM_SP_inst_1 (
.CLK0(CLK0_2), // 1-bit output: 0 degree clock output
.CLK180(CLK180_2), // 1-bit output: 180 degree clock output
.CLK270(CLK270_2), // 1-bit output: 270 degree clock output
.CLK2X(CLK2X_2), // 1-bit output: 2X clock frequency clock output
.CLK2X180(CLK2X180_2), // 1-bit output: 2X clock frequency, 180 degree clock output
.CLK90(CLK90_2), // 1-bit output: 90 degree clock output
.CLKDV(CLKFIFO), // 1-bit output: Divided clock output
.CLKFX(CLK_HS), // 1-bit output: Digital Frequency Synthesizer output (DFS)
.CLKFX180(CLK_HS180), // 1-bit output: 180 degree CLKFX output
.LOCKED(LOCKED_2), // 1-bit output: DCM_SP Lock Output
.PSDONE(PSDONE_2), // 1-bit output: Phase shift done output
.STATUS(STATUS_2), // 8-bit output: DCM_SP status output
.CLKFB(CLK0_2), // 1-bit input: Clock feedback input
.CLKIN(USER_CLOCK), // 1-bit input: Clock input
.DSSEN(1'b0), // 1-bit input: Unsupported, specify to GND.
.PSCLK(1'b0), // 1-bit input: Phase shift clock input
.PSEN(1'b0), // 1-bit input: Phase shift enable
.PSINCDEC(1'b0), // 1-bit input: Phase shift increment/decrement input
.RST(1'b0) // 1-bit input: Active high reset input
);
// End of DCM_SP_inst instantiation

// Generating the ADC_CLK
// DCM_CLKGEN: Frequency Aligned Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
DCM_CLKGEN #(
.CLKFXDV_DIVIDE(2.0), // CLKFXDV divide value (2, 4, 8, 16, 32)
.CLKFX_DIVIDE(4.0*C_ADCCLK_R), // Divide value - D - (1-256)
.CLKFX_MD_MAX(1.0), // Specify maximum M/D ratio for timing anlysis
.CLKFX_MULTIPLY(4.0), // Multiply value - M - (2-256)
.CLKIN_PERIOD(10.0), // Input clock period specified in nS
.SPREAD_SPECTRUM("NONE"), // Spread Spectrum mode "NONE", "CENTER_LOW_SPREAD", "CENTER_HIGH_SPREAD",
// "VIDEO_LINK_M0", "VIDEO_LINK_M1" or "VIDEO_LINK_M2"
.STARTUP_WAIT("FALSE") // Delay config DONE until DCM_CLKGEN LOCKED (TRUE/FALSE)
)
DCM_CLKGEN_1 (
.CLKFX(ADC_CLK), // 1-bit output: Generated clock output
.CLKFX180(ADC_CLK180), // 1-bit output: Generated clock output 180 degree out of phase from CLKFX.
.CLKFXDV(CLKFXDV_1), // 1-bit output: Divided clock output
.LOCKED(LOCKED_1), // 1-bit output: Locked output
.PROGDONE(PROGDONE_1), // 1-bit output: Active high output to indicate the successful re-programming
.STATUS(STATUS_1), // 2-bit output: DCM_CLKGEN status
.CLKIN(USER_CLOCK), // 1-bit input: Input clock
.FREEZEDCM(1'b0), // 1-bit input: Prevents frequency adjustments to input clock
.PROGCLK(1'b0), // 1-bit input: Clock input for M/D reconfiguration
.PROGDATA(1'b0), // 1-bit input: Serial data input for M/D reconfiguration
.PROGEN(1'b0), // 1-bit input: Active high program enable
.RST(1'b0) // 1-bit input: Reset input pin
);
// End of DCM_CLKGEN_inst instantiation

assign ADC_CLK_n = ~ADC_CLK;

// Generating the ADC_CLK
// DCM_SP: Digital Clock Manager
// Spartan-6
// Xilinx HDL Libraries Guide, version 14.7
DCM_SP #(
.CLKDV_DIVIDE(3), // CLKDV divide value
// (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
.CLKFX_DIVIDE(4), // Divide value on CLKFX outputs - D - (1-32)
.CLKFX_MULTIPLY(2), // Multiply value on CLKFX outputs - M - (2-32)
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
.CLK270(ADC_CLK270), // 1-bit output: 270 degree clock output
.CLK2X(CLK2X), // 1-bit output: 2X clock frequency clock output
.CLK2X180(CLK2X180), // 1-bit output: 2X clock frequency, 180 degree clock output
.CLK90(ADC_CLK90), // 1-bit output: 90 degree clock output
.CLKDV(ADC_PIXCLK), // 1-bit output: Divided clock output
.CLKFX(CLKFX), // 1-bit output: Digital Frequency Synthesizer output (DFS)
.CLKFX180(CLKFX180), // 1-bit output: 180 degree CLKFX output
.LOCKED(LOCKED), // 1-bit output: DCM_SP Lock Output
.PSDONE(PSDONE), // 1-bit output: Phase shift done output
.STATUS(STATUS), // 8-bit output: DCM_SP status output
.CLKFB(CLK0), // 1-bit input: Clock feedback input
.CLKIN(ADC_CLK), // 1-bit input: Clock input
.DSSEN(1'b0), // 1-bit input: Unsupported, specify to GND.
.PSCLK(1'b0), // 1-bit input: Phase shift clock input
.PSEN(1'b0), // 1-bit input: Phase shift enable
.PSINCDEC(1'b0), // 1-bit input: Phase shift increment/decrement input
.RST(1'b0) // 1-bit input: Active high reset input
);
// End of DCM_SP_inst instantiation

// In order to address ERROR:Place:1205, a clock forwarding technique for a
// reliable and repeatable low skew solution is used (ODDR2 instanitation)
// ODDR2: Output Double Data Rate Output Register with Set, Reset
// and Clock Enable.
// Spartan-6
// Xilinx HDL Libraries Guide, version 13.4
ODDR2 #(
	.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
	.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
	.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
	) ODDR2_inst_0 (
	.Q(ADC_INCLK), // 1-bit DDR output data
	.C0(ADC_PIXCLK), // 1-bit clock input
	.C1(~ADC_PIXCLK), // 1-bit clock input
	.CE(1'b1), // 1-bit clock enable input
	.D0(1'b1), // 1-bit data input (associated with C0)
	.D1(1'b0), // 1-bit data input (associated with C1)
	.R(1'b0), // 1-bit reset input
	.S(1'b0) // 1-bit set input
);
// End of ODDR2_inst instantiatio


// Xilinx HDL Libraries Guide, version 13.4
ODDR2 #(
	.DDR_ALIGNMENT("NONE"), // Sets output alignment to "NONE", "C0" or "C1"
	.INIT(1'b0), // Sets initial state of the Q output to 1'b0 or 1'b1
	.SRTYPE("SYNC") // Specifies "SYNC" or "ASYNC" set/reset
	) ODDR2_fifoclk_buf (
	.Q(fifo_clk), // 1-bit DDR output data
	.C0(CLKFIFO), // 1-bit clock input
	.C1(~CLKFIFO), // 1-bit clock input
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
	) ODDR2_ADC_READ_ACLK_buf (
	.Q(ADC_READ_ACLK), // 1-bit DDR output data
	.C0(ADC_READ_ACLK_int), // 1-bit clock input
	.C1(~ADC_READ_ACLK_int), // 1-bit clock input
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
	) ODDR2_ISPI_REGCLK_buf (
	.Q(ISPI_REGCLK), // 1-bit DDR output data
	.C0(~ISPI_REGCLK_int), // 1-bit clock input
	.C1(ISPI_REGCLK_int), // 1-bit clock input
	.CE(1'b1), // 1-bit clock enable input
	.D0(1'b0), // 1-bit data input (associated with C0)
	.D1(1'b1), // 1-bit data input (associated with C1)
	.R(1'b0), // 1-bit reset input
	.S(1'b0) // 1-bit set input
);
// End of ODDR2_inst instantiatio

// Imager SPI upload
Imager_SPI MBI_regs (
    .SPI_CLK(ADC_READ_ACLK_int), 
    .RESETN_spi(EXT_RESET_N_spi), 
    .DATA(ISPI_DATA), 
    .REGCLK(ISPI_REGCLK_int), 
    .UPLOAD(ISPI_UPLOAD)
    );

endmodule

module ACLK_GENERATOR(
    input CLOCK_IN,
    output reg CLOCK_OUT
    );

    reg [15:0]counter = 0;
  
    
    /* States and Param definitions */
	 localparam CLK_RATIO = 32;
	 localparam LVL_LENGTH = CLK_RATIO/2 - 2;
    
    
    always @(negedge CLOCK_IN)
		if (counter > LVL_LENGTH) 
		begin
			counter <= 0;
			CLOCK_OUT <= ~CLOCK_OUT;
		end
		else
		begin
			counter <= counter + 1;
			CLOCK_OUT <= CLOCK_OUT;
		end

    
endmodule
