`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:09 08/03/2017 
// Design Name: 
// Module Name:    readoutSM 
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
module readoutSM(
    output wire [7:0] ROWADD,  //see timing diagram for signal definitions
    output wire COL_L_EN,
    output wire PIXRES_L,
    output wire PIXRES_R,
    output wire STDBY,
    output wire PRECH_COL,
    output wire PGA_RES,
    output wire CK_PH1,
    output wire SAMP_S,
    output wire SAMP_R,
    output wire READ_R,
    output wire READ_S,
    output wire MUX_START,
    output wire CP_COLMUX_IN,
	 output wire DRAIN,
	 output wire PIXGLOB_RES,
    input wire CLK100MHz,
    input wire trigger,
	 output wire trigger_ack,
    input wire [6:0] T1, //times in units of clk100mhz periods (10ns), using ports instead of parameters so no need to resynthesize for optimization 
    input wire [9:0] T2,
    input wire [5:0] T3,
    input wire [9:0] T4,
    input wire [7:0] T5L,
	 input wire [7:0] T5R,
    input wire [4:0] T6,
    input wire [4:0] T7,
    input wire [5:0] T8,
    input wire [6:0] T9,
    input wire [3:0] T10,
	 input wire RESET,
	 input wire ADC_CLKOUT, //3x faster than ADC_PIXCLK, data read clock generated by ADC
	 output wire ADC_DATA_VALID, //ADC producing valid data, true Tlat3 ADC_CLKOUT cycles after data is collected
	 output wire ADC_PIXCLK //20MHz PIXCLK to ADCs, trigger synchronized to PIXCLK
    );
	
	parameter Tpix = 10; //time to read 1 pixel, in CLK100MHz periods
	parameter NCOL = 48; //number of columns
	parameter NROW = 5;//176; //number of rows
	parameter Tlat3 = 24;  //number of ADC_CLKOUT cycles before data from a read is output
	
	parameter SM_idle = 1;
	parameter SM_error = 0;
	parameter SM_starting = 2;
	parameter SM_first_signal = 4;
	parameter SM_first_reset = 8;
	parameter SM_left_signal = 16;
	parameter SM_left_reset = 32;
	parameter SM_right_signal = 64;
	parameter SM_right_reset = 128;
	parameter SM_last = 256;
	parameter SM_pixReset = 512;
	
	reg [7:0] ROWADD_i;  //see timing diagram for signal definitions
   reg COL_L_EN_i;
   reg PIXRES_L_i;
   reg PIXRES_R_i;
   reg STDBY_i;
   reg PRECH_COL_i;
   reg PGA_RES_i;
   reg CK_PH1_i;
   reg SAMP_S_i;
   reg SAMP_R_i;
   reg READ_R_i;
   reg READ_S_i;
   reg MUX_START_i;
   reg CP_COLMUX_IN_i;
	reg DRAIN_i;
	reg PIXGLOB_RES_i;
   reg trigger_ack_i;
	
	reg [9:0] timing_SM;
	reg [14:0] counter;
	
	initial timing_SM = SM_idle;
	
	// DCM_SP: Digital Clock Manager
   //         Spartan-6
   // Xilinx HDL Language Template, version 14.7
	wire CLK0;

   DCM_SP #(
      .CLKDV_DIVIDE(Tpix/2),                   // CLKDV divide value
                                            // (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
      .CLKFX_DIVIDE(Tpix/2),                     // Divide value on CLKFX outputs - D - (1-32)
      .CLKFX_MULTIPLY(3),                   // Multiply value on CLKFX outputs - M - (2-32)
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
   DCM_SP_ADC(
      .CLK0(CLK0),         // 1-bit output: 0 degree clock output
      //.CLK180(CLK180),     // 1-bit output: 180 degree clock output
      //.CLK270(CLK270),     // 1-bit output: 270 degree clock output
      //.CLK2X(CLK2X),       // 1-bit output: 2X clock frequency clock output
      //.CLK2X180(CLK2X180), // 1-bit output: 2X clock frequency, 180 degree clock output
      //.CLK90(CLK90),       // 1-bit output: 90 degree clock output
      .CLKDV(ADC_PIXCLK),       // 1-bit output: Divided clock output
      //.CLKFX(ADC_INCLK),       // 1-bit output: Digital Frequency Synthesizer output (DFS)
      //.CLKFX180(CLKFX180), // 1-bit output: 180 degree CLKFX output
      //.LOCKED(LOCKED),     // 1-bit output: DCM_SP Lock Output
      //.PSDONE(PSDONE),     // 1-bit output: Phase shift done output
      //.STATUS(STATUS),     // 8-bit output: DCM_SP status output
      .CLKFB(CLK0),       // 1-bit input wire: Clock feedback input wire
      .CLKIN(CLK100MHz),       // 1-bit input wire: Clock input wire
      .DSSEN(1'b0),       // 1-bit input wire: Unsupported, specify to GND.
      //.PSCLK(PSCLK),       // 1-bit input wire: Phase shift clock input wire
      //.PSEN(PSEN),         // 1-bit input wire: Phase shift enable
      //.PSINCDEC(PSINCDEC), // 1-bit input wire: Phase shift increment/decrement input wire
      .RST(1'b0)            // 1-bit input wire: Active high reset input wire
   );

   // End of DCM_SP_inst instantiation
	
	reg ADC_read;
	reg [Tlat3:0] ADC_delay;
	initial ADC_delay <= 0;
	reg trigger_sync; //trigger synchronized with ADC_PIXCLK used to signal FSM to start
	initial trigger_sync = 0;
	always@(posedge ADC_CLKOUT)	ADC_delay <= { ADC_read, ADC_delay[Tlat3:1]}; 
	assign ADC_DATA_VALID = ADC_delay[0];
	always@(posedge ADC_PIXCLK) trigger_sync <= trigger;
	
	always @(negedge CLK100MHz) begin
		if (RESET) begin
			timing_SM <= SM_idle;
			ROWADD_i <= 0;
			COL_L_EN_i <= 1;
			PIXRES_L_i <= 1;
			PIXRES_R_i <= 1;
			STDBY_i <= 0;
			PRECH_COL_i <= 0;
			PGA_RES_i <= 1;
			CK_PH1_i <= 0;
			SAMP_S_i <= 0;
			SAMP_R_i <= 0;
			READ_R_i <= 0;
			READ_S_i <= 0;
			MUX_START_i <= 1;
			CP_COLMUX_IN_i <= 1;
			DRAIN_i <= 0;
			PIXGLOB_RES_i <= 1;
			counter <= 0;
			trigger_ack_i <= 0;
			ADC_read <= 0;
		end else begin
			case (timing_SM)  //see timing diagram for state waveforms, this just makes them.
				SM_idle: begin
					ROWADD_i <= 0;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= 1;
					PRECH_COL_i <= 0;
					PGA_RES_i <= 0;
					CK_PH1_i <= 0;
					SAMP_S_i <= 0;
					SAMP_R_i <= 0;
					READ_R_i <= 1;
					READ_S_i <= 0;
					MUX_START_i <= 1;
					CP_COLMUX_IN_i <= 1;
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 1;
					trigger_ack_i <= 0;
					ADC_read <= 0;
					if (trigger_sync) begin 
						timing_SM <= SM_starting;
						counter <= T2 + Tpix - 2 - (T2 % (Tpix/2)); //the extra time is to make ADC_PIXCLK properly match the read cycle
					end
				end
				SM_starting: begin
					ROWADD_i <= 0;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= (T2 - 1) < counter;
					PRECH_COL_i <= 0;
					PGA_RES_i <= 0;
					CK_PH1_i <= 0;
					SAMP_S_i <= 0;
					SAMP_R_i <= 0;
					READ_R_i <= 1;
					READ_S_i <= 0;
					MUX_START_i <= 1;
					CP_COLMUX_IN_i <= 1;
					DRAIN_i <= 0;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 0;
					if (counter == 0) timing_SM <= SM_first_signal;
					else counter <= counter - 1;
				end
				SM_first_signal: begin
					ROWADD_i <= 0;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= 0;
					PRECH_COL_i <= counter <= T3;
					PGA_RES_i <= counter <= T4;
					CK_PH1_i <= (T4 < counter) & ((Tpix*NCOL/2 - counter + ((counter - T4) % T5L)) >= T5L) & (((counter - T4) % T5L) < (T5L/2));
					SAMP_S_i <= T6 <= counter;
					SAMP_R_i <= 0;
					READ_R_i <= 1;
					READ_S_i <= 0;
					MUX_START_i <= 1;
					CP_COLMUX_IN_i <= 1;
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 0;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= SM_first_reset;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_first_reset: begin
					ROWADD_i <= 0;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= counter <= T1;
					PIXRES_R_i <= 0;
					STDBY_i <= 0;
					PRECH_COL_i <= 0;
					PGA_RES_i <= counter <= T4;
					CK_PH1_i <= (T4 < counter) & ((Tpix*NCOL/2 - counter + ((counter - T4) % T5L)) >= T5L) & (((counter - T4) % T5L) < (T5L/2));
					SAMP_S_i <= 0;
					SAMP_R_i <= T6 <= counter;
					READ_R_i <= 1;
					READ_S_i <= 0;
					MUX_START_i <= 1;
					CP_COLMUX_IN_i <= 1;
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 0;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= SM_right_signal;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_right_signal: begin
					ROWADD_i <= ROWADD_i;
					COL_L_EN_i <= 0;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= 0;
					PRECH_COL_i <= counter <= T3;
					PGA_RES_i <= counter <= T4;
					CK_PH1_i <= (T4 < counter) & ((Tpix*NCOL/2 - counter + ((counter - T4) % T5R)) >= T5R) & (((counter - T4) % T5R) < (T5R/2));
					SAMP_S_i <= T6 <= counter;
					SAMP_R_i <= 0;
					READ_R_i <= (counter % Tpix) < T8;
					READ_S_i <= ((T7 + T8) <= (counter % Tpix)) & ((counter % Tpix) < (T8 + T7 + T8));
					MUX_START_i <= counter <= T9;
					CP_COLMUX_IN_i <= (((T7 + T8 + T8 + T10) % Tpix) <= (counter % Tpix)) & ((counter % Tpix) < ((T7 + T8 + T8 + T10 + 4) % Tpix));
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 1;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= SM_right_reset;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_right_reset: begin
					ROWADD_i <= ROWADD_i;
					COL_L_EN_i <= 0;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= counter <= T1;
					STDBY_i <= 0;
					PRECH_COL_i <= 0;
					PGA_RES_i <= counter <= T4;
					CK_PH1_i <= (T4 < counter) & ((Tpix*NCOL/2 - counter + ((counter - T4) % T5R)) >= T5R) & (((counter - T4) % T5R) < (T5R/2));
					SAMP_S_i <= 0;
					SAMP_R_i <= T6 < counter;
					READ_R_i <= (counter % Tpix) < T8;
					READ_S_i <= ((T7 + T8) <= (counter % Tpix)) & ((counter % Tpix) < (T8 + T7 + T8));
					MUX_START_i <= 0;
					CP_COLMUX_IN_i <= (((T7 + T8 + T8 + T10) % Tpix) <= (counter % Tpix)) & ((counter % Tpix) < ((T7 + T8 + T8 + T10 + 4) % Tpix));
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 1;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= (ROWADD_i == NROW - 1)?SM_last:SM_left_signal;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_left_signal: begin
					if (counter == 1) ROWADD_i <= ROWADD_i + 1;
					else ROWADD_i <= ROWADD_i;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= 0;
					PRECH_COL_i <= counter <= T3;
					PGA_RES_i <= counter <= T4;
					CK_PH1_i <= (T4 < counter) & ((Tpix*NCOL/2 - counter + ((counter - T4) % T5L)) >= T5L) & (((counter - T4) % T5L) < (T5L/2));
					SAMP_S_i <= T6 < counter;
					SAMP_R_i <= 0;
					READ_R_i <= (counter % Tpix) < T8;
					READ_S_i <= ((T7 + T8) <= (counter % Tpix)) & ((counter % Tpix) < (T8 + T7 + T8));
					MUX_START_i <= counter <= T9;
					CP_COLMUX_IN_i <= (((T7 + T8 + T8 + T10) % Tpix) <= (counter % Tpix)) & ((counter % Tpix) < ((T7 + T8 + T8 + T10 + 4) % Tpix));
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 1;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= SM_left_reset;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_left_reset: begin
					ROWADD_i <= ROWADD_i;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= counter <= T1;
					PIXRES_R_i <= 0;
					STDBY_i <= 0;
					PRECH_COL_i <= 0;
					PGA_RES_i <= counter <= T4;
					CK_PH1_i <= (T4 < counter) & ((Tpix*NCOL/2 - counter + ((counter - T4) % T5L)) >= T5L) & (((counter - T4) % T5L) < (T5L/2));
					SAMP_S_i <= 0;
					SAMP_R_i <= T6 < counter;
					READ_R_i <= (counter % Tpix) < T8;
					READ_S_i <= ((T7 + T8) <= (counter % Tpix)) & ((counter % Tpix) < (T8 + T7 + T8));
					MUX_START_i <= 0;
					CP_COLMUX_IN_i <= (((T7 + T8 + T8 + T10) % Tpix) <= (counter % Tpix)) & ((counter % Tpix) < ((T7 + T8 + T8 + T10 + 4) % Tpix));
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 1;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= SM_right_signal;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_last: begin
					ROWADD_i <= NROW;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= 0;
					PRECH_COL_i <= 0;
					PGA_RES_i <= 0;
					CK_PH1_i <= 0;
					SAMP_S_i <= 0;
					SAMP_R_i <= 0;
					READ_R_i <= (counter % Tpix) < T8;
					READ_S_i <= ((T7 + T8) < (counter % Tpix)) & ((counter % Tpix) < (T8 + T7 + T8));
					MUX_START_i <= counter <= T9;
					CP_COLMUX_IN_i <= (((T7 + T8 + T8 + T10) % Tpix) < (counter % Tpix)) & ((counter % Tpix) < ((T7 + T8 + T8 + T10 + 4) % Tpix));
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 0;
					trigger_ack_i <= 1;
					ADC_read <= 1;
					if (counter >= Tpix*NCOL/2) begin
						timing_SM <= SM_pixReset;
						counter <= 1;
					end else counter <= counter + 1;
				end
				SM_pixReset: begin
					ROWADD_i <= NROW;
					COL_L_EN_i <= 1;
					PIXRES_L_i <= 0;
					PIXRES_R_i <= 0;
					STDBY_i <= 1;
					PRECH_COL_i <= 0;
					PGA_RES_i <= 0;
					CK_PH1_i <= 0;
					SAMP_S_i <= 0;
					SAMP_R_i <= 0;
					READ_R_i <= 1;
					READ_S_i <= 0;
					MUX_START_i <= 1;
					CP_COLMUX_IN_i <= 1;
					DRAIN_i <= 1;
					PIXGLOB_RES_i <= 1;
					trigger_ack_i <= 1;
					ADC_read <= 0;
					if (counter == Tpix*NCOL/2) begin
						timing_SM <= SM_idle;
						counter <= 0;
					end else counter <= counter + 1;
				end
			endcase
		end
	end
	
	assign ROWADD = ROWADD_i;  //see timing diagram for signal definitions
   assign COL_L_EN = COL_L_EN_i;
   assign PIXRES_L = PIXRES_L_i;
   assign PIXRES_R = PIXRES_R_i;
   assign STDBY = STDBY_i;
   assign PRECH_COL = PRECH_COL_i;
   assign PGA_RES = PGA_RES_i;
   assign CK_PH1 = CK_PH1_i;
   assign SAMP_S = SAMP_S_i;
   assign SAMP_R = SAMP_R_i;
   assign READ_R = READ_R_i;
   assign READ_S = READ_S_i;
   assign MUX_START = MUX_START_i;
   assign CP_COLMUX_IN = CP_COLMUX_IN_i;
	assign DRAIN = DRAIN_i;
	assign PIXGLOB_RES = PIXGLOB_RES_i;
	assign trigger_ack = trigger_ack_i;
endmodule