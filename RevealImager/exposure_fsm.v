`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:36 08/03/2017 
// Design Name: 
// Module Name:    exposure_fsm 
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
module exposure_fsm(
  RESET,						  // Reset signal to restart the module
  OK_PIXRES_GLOB,				  // Global reset signal for the pixel array
  CLKMPRE,						  // CLK for pre-loading the masks in every row
  CLKMPRE_EN,					  // Enable for CLKMPRE. Connected to the enable of the IO.
  STREAM,						  // Signal determining the stream of mask patterns
  OK_DRAIN_B,					  // Drain signal in the pixel array
  fsm_stat,						  // FSM state
  Exp_subc,						  // Subscene exposure value (x100 CLK_HS period)
  Num_Pat,						  // Number of patterns applied to the imager.
  CntSubc,						  // Subscene count in the FSM
  FSMIND0,						  // If high, the Exposure FSM (on OK) is active
  FSMIND1,						  // If high, the ADC FSM (on MOBO) is active
  FSMIND0ACK,					  // Acknowledge for FSMIND0
  FSMIND1ACK,					  // Acknowledge for FSMIND1
  
  MIN_FRAME_TIME,
  
  CLK_HS,						  // Fast clock for projector trigger
  TRIGGER_PROJ,				  // Output to projector trigger  
  PROJ_DELAY,					  // Time between projector trigger and STREAM going low, in CLK_HS periods
  exposure_trig
);

// -- Parameters
parameter C_EXP_SUBSC					 = 10;			// Exposure per subscene. Defined by 100x CLK_HS increments
parameter C_NUM_PATT					 = 100;			// Number of patterns per frame
parameter C_MASK_DES_L					 = 16;			// Deserialization factor in the chip
parameter C_NUM_ROWS					 = 176;			// Number of pixel rows in the sensor
parameter C_projwait 					 = 15;//06;

parameter S_subc_first = 8'b00000001;
parameter S_subc_n = 8'b00000010;
parameter S_subc_exp = 8'b00000100;
parameter S_subc_last = 8'b00001000;
parameter S_FSM1 = 8'b00010000;
parameter S_FSM1_ACK = 8'b00100000; 
parameter S_subc_projwait = 8'b10000000;

// -- Ports
input									  RESET;
input									  FSMIND0;
output									  FSMIND1;
output									  FSMIND0ACK;
input									  FSMIND1ACK;
output reg								  OK_PIXRES_GLOB;
input									  CLKMPRE;
output reg								  CLKMPRE_EN;
output reg 								  STREAM;
output reg								  OK_DRAIN_B;
output		[31:0]						  CntSubc;
output		[8:1]						  fsm_stat;
input		[31:0]						  Exp_subc;
input		[31:0]						  Num_Pat;

input [31:0] MIN_FRAME_TIME;

input CLK_HS;
output TRIGGER_PROJ;
input [31:0]			PROJ_DELAY;
output exposure_trig;

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  reg				FSMIND1_i;	
  reg				FSMIND0ACK_i;
  integer			count_mpre;
  integer			count_subsc;
  reg [8:1]			fsm_stat_i;
  integer 	fst_cntr;
    reg [31:0]		timer;
	 reg TRIGGER_PROJ_i;
	 reg exposure_trig_i;

  
  initial
    begin
		FSMIND0ACK_i <= 0;
		FSMIND1_i <= 0;
		OK_PIXRES_GLOB <= 1;
		count_mpre <= 0;
		count_subsc <= 0; 
		OK_DRAIN_B <= 0;
		CLKMPRE_EN = 0;
		STREAM <= 0;
		fsm_stat_i <= 8'b11110000;
		state <= S_subc_first;
		fst_cntr <= C_NUM_ROWS*C_MASK_DES_L - PROJ_DELAY;
		timer <= MIN_FRAME_TIME;
		TRIGGER_PROJ_i <= 0;
		exposure_trig_i<= 0;
  end
  
  always@(posedge CLK_HS) begin
		if (RESET) begin
			fst_cntr <= C_NUM_ROWS*C_MASK_DES_L - PROJ_DELAY;
			TRIGGER_PROJ_i <= 0;
		end
		
		
		else begin
  
			if (STREAM == 1 && fst_cntr > 0) begin
				fst_cntr <= fst_cntr - 1;
				TRIGGER_PROJ_i <= 0;
			end else if (STREAM == 1 && fst_cntr == 0 && state == S_subc_n) begin
				TRIGGER_PROJ_i <= 1;
			end else begin
				fst_cntr <= C_NUM_ROWS*C_MASK_DES_L - PROJ_DELAY;
				TRIGGER_PROJ_i <= 0;
			end
		end
  end

	assign TRIGGER_PROJ = TRIGGER_PROJ_i;
	assign exposure_trig = exposure_trig_i;
	
   (* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="<recovery_state_value>" *) reg [7:0] state = S_subc_first;
	always@(posedge CLKMPRE) begin
		if (RESET) begin
			FSMIND1_i <= 0;
			FSMIND0ACK_i <= 0;
			OK_PIXRES_GLOB <= 1;
			count_mpre <= 0;
			count_subsc <= 0;
			OK_DRAIN_B <= 0;
			CLKMPRE_EN = 0;
			STREAM <= 0;
			fsm_stat_i <= 8'b10101010;
			state <= S_subc_first;
			timer <= MIN_FRAME_TIME;
			exposure_trig_i<= 0;
		end 
		else begin
			if (timer == 0) timer <= 0;
			else timer <= timer - 1;
		
			(* PARALLEL_CASE *) case (state)
            S_subc_first : begin
				fsm_stat_i <= 8'b11111110;
				OK_PIXRES_GLOB <= 1;
				OK_DRAIN_B <= 0;
				count_subsc <= 0;
				if (count_mpre < C_NUM_ROWS) begin
					STREAM <= 1;
					count_mpre <= count_mpre + 1;
					CLKMPRE_EN = 1;
				end else if(count_mpre < C_NUM_ROWS + 2) begin
					STREAM <= 0;
					count_mpre <= count_mpre + 1;
				end else begin
					CLKMPRE_EN = 0;
					count_mpre <= 0;
					//count_subsc <= count_subsc + 1;
					state <= S_subc_projwait;
				end
				end
				
				S_subc_projwait: begin
					fsm_stat_i <= 8'b00111100;
					if (count_mpre < C_projwait) begin
						count_mpre <= count_mpre + 1;
					end
					else begin
						if (count_subsc < Num_Pat) begin
							count_mpre <= 0;
							state <= S_subc_n;
						end else begin
							count_mpre <= 0;
							state <= S_subc_last;
						end
					end
				end
				
            S_subc_n : begin
				fsm_stat_i <= 8'b11111101;
				if (count_mpre < C_NUM_ROWS) begin
					STREAM <= 1;
					count_mpre <= count_mpre + 1;
					CLKMPRE_EN = 1;
				end else if(count_mpre < C_NUM_ROWS + 2) begin //1667-160-1 = 1506
					STREAM <= 0;
					count_mpre <= count_mpre + 1;
					exposure_trig_i<= 0;
				end else begin
					CLKMPRE_EN = 0;
					count_mpre <= 0;
					count_subsc <= count_subsc + 1;
					state <= S_subc_exp;
				end
            end
            S_subc_exp : begin
				exposure_trig_i<= 1;
				fsm_stat_i <= 8'b11111100;
				OK_PIXRES_GLOB <= 0;
				OK_DRAIN_B <= 1;
				//wait for exp_susc micro sec
				if (count_mpre*C_MASK_DES_L <= Exp_subc*C_NUM_PATT) begin
					count_mpre <= count_mpre + 1;
				end else begin
						count_mpre <= 0;
						state <= S_subc_projwait;
				end
            end
				
            S_subc_last : begin
				fsm_stat_i <= 8'b11111011;
				if (count_mpre < C_NUM_ROWS) begin
					STREAM <= 1;
					count_mpre <= count_mpre + 1;
					CLKMPRE_EN = 1;
				end else if(count_mpre < C_NUM_ROWS + 2) begin
					STREAM <= 0;
					count_mpre <= count_mpre + 1;
				end else begin
					CLKMPRE_EN = 0;
					count_mpre <= 0;
					OK_DRAIN_B <= 0;
					exposure_trig_i<= 0;
					state <= S_FSM1;
				end
            end
            S_FSM1 : begin
				fsm_stat_i <= 8'b11111010;
				FSMIND1_i <= 1;
				FSMIND0ACK_i <= 0;
				if (FSMIND1ACK) begin
					state <= S_FSM1_ACK;
				end
            end
            S_FSM1_ACK : begin
				fsm_stat_i <= 8'b11111000;
				if (FSMIND0 && (timer == 0)) begin
					state <= S_subc_first;
					timer <= MIN_FRAME_TIME;
					FSMIND1_i <= 0;
					FSMIND0ACK_i <= 1;
				end
            end
            default : begin  // Fault Recovery
               state <= S_subc_first;
					timer <= MIN_FRAME_TIME;
            end   
         endcase
		end
	end

	
	assign		FSMIND1 = FSMIND1_i;
	assign		FSMIND0ACK = FSMIND0ACK_i;
	assign		fsm_stat = fsm_stat_i;
	assign		CntSubc = count_subsc;
 
endmodule