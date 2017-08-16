`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:38 08/02/2017 
// Design Name: 
// Module Name:    Reveal_top 
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
module Reveal_top(
    /*output [17:0] MSTREAM,    //Pattern upload signal
    output CLKM,					//100MHz clock to imager
    output EN_STREAM,			//Enable pattern upload (active high)
    output CLKMPRE,				//6.25MHz clock to imager (period = 1 mask upload)
	 output DRAIN,					//
	 output PIXGLOB_RES,			//
	 output [7:0] ROW_ADD,		//Row address for readout
	 output COL_L_EN,				//When high, read from left bucket, when low read from right bucket
	 output PIXRES_L,				//Reset left bucket
	 output PIXRES_R,				//Reset right bucket
	 output STDBY,					//Standby signal high when no readout is occuring
	 output PRECH_COL,			//Signal to start readout
	 output PGA_RES,				//Reset Programmable Gain Amplifier circuit
	 output CK_PH1,				//Clock signal to PGA (more like a pump imo)
	 output SAMP_S,				//Sample signal
	 output SAMP_R,				//Sampe Reset
	 output READ_R,				//Read Reset from ADC
	 output READ_S,				//Read Signal from ADC
	 output MUX_START,			//Signal to start imager multiplexer
	 output CP_COLMUX_IN			//Signal to multiplexer to select next level*/
	input wire sys_clkp,
	input wire sys_clkn,
	
	input wire [4:0] okUH,
	output wire[2:0] okHU,
	inout wire[31:0] okUHU,
	inout wire okAA,
	
	output wire[7:0] led,
	output wire FPGA_rst_n,
	output wire OK_PIXRES_GLOB,
	output wire STREAM,
	output wire [18:1] mStream,
	output wire CLKMPRE,
	output wire CLKM,
	output wire OK_DRAIN_B,
	input wire FSMIND0,				// If high, the Exposure FSM (on OK) is active
	output wire FSMIND1,
	output wire FSMIND0ACK,
	input wire FSMIND1ACK,
	output wire trigger_proj,
	
	//ddr2 output wires
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
	output wire c3_calib_done
   );
	
	parameter	C_CLKHS_D		= 3;	// Devide value for CLKHS to USER_CLOCK. value - D - (1-256)
	parameter	C_CLKHS_M		= 3;	// Multiply value for CLKHS to USER_CLOCK. value - M - (2-256)


	// Clock
	wire sys_clk;
	 
	IBUFGDS osc_clk(
		.O(sys_clk),
		.I(sys_clkp),
		.IB(sys_clkn)
	);
	
	
	
	wire rst;
	wire FSMstop;
	wire RstPat;
	wire [31:0] trig6Aout;
	
	assign rst = wirerst[0];
	assign FSMstop = rst;// | flag_2frames; //| pattern_stored;
	assign RstPat = FSMstop | FSMIND1;
	assign FPGA_rst_n = ~FSMstop;
//	assign trig6Aout[0] = full_2;
//	assign trig6Aout[1] = flag_2frames;
//	assign trig6Aout[2] = ~flag_1frame;
//	assign trig6Aout[31:3] = 29'b0;
//	assign din_pipe[23:0]=dout_buf;
//	assign din_pipe[31:24]=8'b0;

	assign led = fsm_stat;
	
	wire [7:0] fsm_stat;
	wire [31:0] CntSubc;
	wire CLKMPRE_EN;
	
	exposure_fsm exposurefsm_inst (
		.RESET(FSMstop), 
		.OK_PIXRES_GLOB(OK_PIXRES_GLOB), 
		.CLKMPRE(CLKMPRE_int), 
		.CLKMPRE_EN(CLKMPRE_EN), 		// Connction to CLKMPRE_ODDR2!
		.STREAM(STREAM), 
		.OK_DRAIN_B(OK_DRAIN_B), 
		.fsm_stat(fsm_stat), 
		.Exp_subc(wireExp), 
		.Num_Pat(wireNumPat), 
		.CntSubc(CntSubc), 
		.FSMIND0(FSMIND0), 
		.FSMIND1(FSMIND1), 
		.FSMIND0ACK(FSMIND0ACK), 
		.FSMIND1ACK(FSMIND1ACK),
		.MIN_FRAME_TIME(wireMinFrameTime),

		.CLK_HS(CLK_HS),						  // Fast clock for projector trigger
		.TRIGGER_PROJ(trigger_proj),				  // Output to projector trigger  
		.PROJ_DELAY(wireProjDelay)

	);
	
	
	
	wire [17:0] Pat_to_FIFO;
	wire PatFIFO_wr;
	wire full_pat;
	wire empty_pat;
	wire valid_pat;
	wire prog_full;
	wire PatFIFO_empty;
	
	fifo_pat_tocam u_pat_tocam (
	  .clk(CLK_HS), // input clk
	  .rst(RstPat), // input rst
	  .din(Pat_to_FIFO), // input [17 : 0] din
	  .wr_en(PatFIFO_wr), // input wr_en
	  .rd_en(STREAM), // input rd_en
	  .dout(mStream), // output [17 : 0] dout
	  .full(full_pat), // output full
	  .empty(empty_pat), // output empty
	  .valid(valid_pat), // output valid
	  .prog_full(prog_full), // output prog_full
	  .prog_empty(PatFIFO_empty) // output prog_empty
	);
	
	
	
	wire pat_fifo_wr_en;
	wire pat_fifo_rd_en;
	wire [31:0] MSTREAM32;
	wire outfifo_empty;
	wire outfifo_full;
	
	fifo_pat_memout u_pat_mem(
		.rst(fifo_mem_rst), // input rst
		.wr_clk(c3_clk0), // input wr_clk
		.rd_clk(CLK_HS), // input rd_clk
		.din(c3_p1_rd_data), // input [63 : 0] din
		.wr_en(pat_fifo_wr_en), // input wr_en
		.rd_en(pat_fifo_rd_en), // input rd_en
		.dout(MSTREAM32), // output [15 : 0] dout
		//.full(outfifo_full), // output full
		.empty(outfifo_empty), // output empty
		.prog_full(outfifo_full)
	);
	
	
	wire fifo_mem_rst;
	reg fifo_rst_cnt;
	always @ (posedge CLK_HS) begin
		if (RstPat) fifo_rst_cnt <= 0;
		else fifo_rst_cnt <= 1;
	end
	assign fifo_mem_rst = RstPat && fifo_rst_cnt;
	
	load_pattern pat_gen (
		.rst(fifo_mem_rst), //changed from rst_pat
		.clk(CLK_HS), 
		.pat_fifo_rd_en(pat_fifo_rd_en),
		.pat_in(MSTREAM32[31:14]),

		.Num_Pat(wireNumPat), 
		.CntSubc(CntSubc), 
		.FIFO_empty(PatFIFO_empty), 
		.camfifo_empty(empty_pat),
		.camfifo_full(full_pat),

		.FIFO_wr(PatFIFO_wr), 
		.Pat_out(Pat_to_FIFO)
	);



	wire read_done;
	wire pat_written;
	wire pattern_stored;
	
	mem_fsm mem_controller(
		.fsm_rst(FSMstop),
			
		.okClk(okClk),
		.pipein_high(pipe80in_high),
		.pipein_data(pipe80in_data),
			
		.write_start(trig53in[0]),
		.Num_Pat(wireNumPat),
			
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
		.write_done(pattern_stored)
	);	 

	
	
	
	
	//ddr2 ports width
	localparam  C3_P0_MASK_SIZE          = 8;
	localparam C3_P0_DATA_PORT_SIZE      = 64;
	localparam C3_P1_MASK_SIZE           = 8;
	localparam C3_P1_DATA_PORT_SIZE      = 64;
	//ddr2 wires
	//note that p0 read and p1 write wires are not used
//	wire c3_calib_done;
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

	ddr2_memif #(
		.C3_SIMULATION("TRUE")   
	)
	u_mem_if(
		.c3_sys_clk	(sys_clk),
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
		
	
	
	
	wire CLK0;
	wire CLK180;
	wire sys_clkDV;
	wire CLK_HS;
	wire CLK_HS180;
	
	DCM_SP #(
		.CLKDV_DIVIDE(4.0), // CLKDV divide value
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
		//.CLK270(CLK270), // 1-bit output: 270 degree clock output
		//.CLK2X(CLK2X_2), // 1-bit output: 2X clock frequency clock output
		//.CLK2X180(CLK2X180), // 1-bit output: 2X clock frequency, 180 degree clock output
		//.CLK90(CLK90), // 1-bit output: 90 degree clock output
		.CLKDV(sys_clkDV), // 1-bit output: Divided clock output
		.CLKFX(CLK_HS), // 1-bit output: Digital Frequency Synthesizer output (DFS)
		.CLKFX180(CLK_HS180), // 1-bit output: 180 degree CLKFX output
		//.LOCKED(LOCKED_HS), // 1-bit output: DCM_SP Lock Output
		//.PSDONE(PSDONE), // 1-bit output: Phase shift done output
		//.STATUS(STATUS), // 8-bit output: DCM_SP status output
		.CLKFB(CLK0), // 1-bit input: Clock feedback input
		.CLKIN(sys_clk), // 1-bit input: Clock input
		.DSSEN(1'b0), // 1-bit input: Unsupported, specify to GND.
		.PSCLK(1'b0), // 1-bit input: Phase shift clock input
		.PSEN(1'b0), // 1-bit input: Phase shift enable
		.PSINCDEC(1'b0), // 1-bit input: Phase shift increment/decrement input
		.RST(1'b0) // 1-bit input: Active high reset input
	);


	wire CLK0_MPRE;
	wire CLKMPRE_int;
	wire CLKMPRE_int180;
	
	DCM_SP #(
		.CLKDV_DIVIDE(2.0),                   // CLKDV divide value
											// (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
		.CLKFX_DIVIDE(4*C_CLKHS_D),           // Divide value on CLKFX outputs - D - (1-32)
		.CLKFX_MULTIPLY(C_CLKHS_M),           // Multiply value on CLKFX outputs - M - (2-32)
		.CLKIN_DIVIDE_BY_2("FALSE"),          // CLKIN divide by two (TRUE/FALSE)
		.CLKIN_PERIOD(2.5),                  // Input clock period specified in nS
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
		//.CLK180(CLK180_MPRE),     // 1-bit output: 180 degree clock output
		//.CLK270(CLK270_MPRE),     // 1-bit output: 270 degree clock output
		//.CLK2X(CLK2X_MPRE),       // 1-bit output: 2X clock frequency clock output
		//.CLK2X180(CLK2X180_MPRE), // 1-bit output: 2X clock frequency, 180 degree clock output
		//.CLK90(CLK90_MPRE),       // 1-bit output: 90 degree clock output
		//.CLKDV(CLKDV),       // 1-bit output: Divided clock output
		.CLKFX(CLKMPRE_int),       // 1-bit output: Digital Frequency Synthesizer output (DFS)
		.CLKFX180(CLKMPRE_int180), // 1-bit output: 180 degree CLKFX output
		//.LOCKED(LOCKED_MPRE),     // 1-bit output: DCM_SP Lock Output
		//.PSDONE(PSDONE_MPRE),     // 1-bit output: Phase shift done output
		//.STATUS(STATUS_MPRE),     // 8-bit output: DCM_SP status output
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
	
	
	wire okClk;
	wire [112:0] okHE;
	wire [64:0] okEH;
	wire [5*65-1:0] okEHx; //n*65-1, n is number of outgoing endpoints
	
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

	wire [31:0] wirerst;
	wire [31:0] wireExp;
	wire [31:0] wireNumPat;
	wire [31:0] wireMinFrameTime;
	wire [31:0] wireProjDelay;
	wire [31:0] wirePhaseSel;
	wire [31:0] trig53in;
	wire pipe80in_high;
	wire [31:0] pipe80in_data;
	
	// FrontPanel module instantiations
	okWireIn	wire10		(.okHE(okHE),								.ep_addr(8'h10),							.ep_dataout(wirerst) );
	okWireIn	wire11		(.okHE(okHE),								.ep_addr(8'h11),							.ep_dataout(wireExp) );
	okWireIn	wire12		(.okHE(okHE),								.ep_addr(8'h12),							.ep_dataout(wireNumPat) );
//	okWireIn	wire13		(.okHE(okHE),								.ep_addr(8'h13),							.ep_dataout(wireMaskChng) );
//	okWireIn	wire14		(.okHE(okHE),								.ep_addr(8'h14),							.ep_dataout(wireMaskChngSubc) );
//	okWireIn	wire15		(.okHE(okHE),								.ep_addr(8'h15),							.ep_dataout(wirePatterns) );
	okWireIn okPHASE_SEL (.okHE(okHE),								.ep_addr(8'h16),							.ep_dataout(wirePhaseSel)	); //testmodimp
	okWireIn framewire   (.okHE(okHE),								.ep_addr(8'h18),							.ep_dataout(wireMinFrameTime) );
	okWireIn wire19   (.okHE(okHE),								.ep_addr(8'h19),							.ep_dataout(wireProjDelay) );

	// comment the top okWireIn modules for simulations!
	okWireOut 	wire22		(.okHE(okHE),	.okEH(okEHx[0*65 +: 65]),	.ep_addr(8'h22),							.ep_datain(wireExp) );
	okWireOut 	wire23		(.okHE(okHE),	.okEH(okEHx[3*65 +: 65]),	.ep_addr(8'h23),							.ep_datain(wireNumPat) );
//	okWireOut 	wire24		(.okHE(okHE),	.okEH(okEHx[4*65 +: 65]),	.ep_addr(8'h24),							.ep_datain(wireMaskChng) );
	okTriggerIn trigIn53 	(.okHE(okHE),								.ep_addr(8'h53), 	.ep_clk(c3_clk0), 		.ep_trigger(trig53in));
	okTriggerOut trigOut6A	(.okHE(okHE), 	.okEH(okEHx[1*65 +: 65]),	.ep_addr(8'h6a), 	.ep_clk(sys_clk), 		.ep_trigger(trig6Aout));
	okPipeOut	pipeA0		(.okHE(okHE),	.okEH(okEHx[2*65 +: 65]),	.ep_addr(8'hA0),	.ep_read(rd_en),		.ep_datain(din_pipe) );
	okPipeIn 	pipe80		(.okHE(okHE),	.okEH(okEHx[4*65 +: 65]),	.ep_addr(8'h80),	.ep_write(pipe80in_high),	.ep_dataout(pipe80in_data));

	//temp, to be deleted
	wire rd_en;
	wire [31:0] din_pipe;
	
endmodule
