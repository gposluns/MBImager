//----------------------------------------------------------------------------
// ROimager.v - module
//----------------------------------------------------------------------------
//
//----------------------------------------------------------------------------
// Filename:          ROimager_exp_diagonal.v
// Version:           1.01.a
// Description:       Generating the timing for imager #1, and the TI-ADCs.
//					The masking is not static, it's a running pattern!
//----------------------------------------------------------------------------

module ROImager_exp_diagonal
(
  RESET,						  // Reset signal to restart the module
  CLK_HS,						  // Input CLK for generating the timings
  OK_PIXRES_GLOB,				  // Global reset signal for the pixel array
  CLKMPRE,						  // CLK for pre-loading the masks in every row
  STREAM,						  // Signal determining the stream of mask patterns
  OK_DRAIN_B,					  // Drain signal in the pixel array
  MSTREAM,						  // Stream of data (10 channels)
  fsm_stat,						  // FSM state
  Exp_subc,						  // Subscene exposure value (x100 CLK_HS period)
  Num_Pat,						  // Number of patterns applied to the imager.
  Num_Mask_change,				  // Number of Pattern change at each frame
  Mask_change_subc,				  // Pattern change after Mask_change_subc subscenes
  FSMIND0,						  // If high, the Exposure FSM (on OK) is active
  FSMIND1,						  // If high, the ADC FSM (on MOBO) is active
  FSMIND0ACK,					  // Acknowledge for FSMIND0
  FSMIND1ACK					  // Acknowledge for FSMIND1
);

// -- Parameters
parameter C_EXP_SUBSC					 = 10;			// Exposure per subscene. Defined by 100x CLK_HS increments
parameter C_NUM_PATT					 = 100;			// Number of patterns per frame
parameter C_MASK_DES_L					 = 18;			// Deserialization factor in the chip
parameter C_NUM_ROWS					 = 160;			// Number of pixel rows in the sensor

// -- Ports
input									  RESET;
input									  CLK_HS;
input									  FSMIND0;
output									  FSMIND1;
output									  FSMIND0ACK;
input									  FSMIND1ACK;
output									  OK_PIXRES_GLOB;
output									  CLKMPRE;
output									  STREAM;
output									  OK_DRAIN_B;
output		[10 : 1]					  MSTREAM;
output		[8:1]						  fsm_stat;
input		[31:0]						  Exp_subc;
input		[31:0]						  Num_Pat;
input		[31:0]						  Num_Mask_change;
input		[31:0]						  Mask_change_subc;

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  integer			count;
  integer			cnt_MskCng;
  reg				FSMIND1_i;	
  reg				FSMIND0ACK_i;
  reg				PIXRES_GLOB_i;
  integer			STAT;			//FSM state (100MHz clk) 
  reg [10:1]		MSTREAM_i;
  integer			count_mpre;
  integer			count_subsc;
  reg				STREAM_i;
  reg				CLKMPRE_i;
  reg				DRAIN_B_i;
  reg [8:1]			fsm_stat_i;
  reg [10:1]		MSTREAM_init = 10'b1010101010;
  reg [10:1]		MSTREAM_Int_init1;

  
  initial
    begin
		FSMIND0ACK_i <= 0;
		FSMIND1_i <= 0;
		count <= 0;
		cnt_MskCng <= 1;
		PIXRES_GLOB_i <= 1;
		STAT <= 9;
		MSTREAM_i <= MSTREAM_init;
		MSTREAM_Int_init1 <= MSTREAM_init;
		count_mpre <= 1;
		count_subsc <= 1;
		STREAM_i <= 0;
		DRAIN_B_i <= 0;
		CLKMPRE_i <= 0;
		fsm_stat_i <= 8'b11110000;
  end

  always @( posedge CLK_HS )	begin
	
	if(RESET) begin
		FSMIND1_i <= 0;
		FSMIND0ACK_i <= 0;
		count <= 0;
		cnt_MskCng <= 1;
		PIXRES_GLOB_i <= 1;
		STAT <= 9;
		MSTREAM_i <= MSTREAM_init;
		count_mpre <= 1;
		count_subsc <= 1;
		STREAM_i <= 0;
		DRAIN_B_i <= 0;
		CLKMPRE_i <= 0;
		fsm_stat_i <= 8'b10101010;
	end else begin
		case(STAT)
		// Exposure phase
			// Stream of patterns for subscene 1 - No exposure -> DRAIN_B=0 and PIXRES_GLOB=1
			0:begin
				fsm_stat_i <= 8'b11111111;
				PIXRES_GLOB_i <= 1;
				DRAIN_B_i <= 0;
				count <= count + 1;
				if(count == C_MASK_DES_L/2 && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					CLKMPRE_i <= 0;
				end	else if(count == C_MASK_DES_L/2 && (((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0))) begin
					CLKMPRE_i <= 0;
					MSTREAM_i <= ~MSTREAM_i;
				end	else if(count != C_MASK_DES_L && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					MSTREAM_i <= ~MSTREAM_i;
				end	else if(count == C_MASK_DES_L && count_mpre != C_NUM_ROWS && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					MSTREAM_i <= ~MSTREAM_i;
					count <= 1;
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
				end	else if(count == C_MASK_DES_L && count_mpre != C_NUM_ROWS && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					count <= 1;
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
				end else if(count == C_MASK_DES_L && count_mpre == C_NUM_ROWS) begin
					count <= 1;
					CLKMPRE_i <= 1;
					STREAM_i <= 0;
					STAT <= 2;
					count_mpre <= 1;
				end
			end
		
			// Stream for subscenes 2 to n
			1: begin
				fsm_stat_i <= 8'b11111110;
				count <= count + 1;
				if(count == C_MASK_DES_L/2 && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					CLKMPRE_i <= 0;
				end	else if(count == C_MASK_DES_L/2 && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					CLKMPRE_i <= 0;
					MSTREAM_i <= ~MSTREAM_i;
				end	else if(count != C_MASK_DES_L && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					MSTREAM_i <= ~MSTREAM_i;
				end	else if(count == C_MASK_DES_L && count_mpre != C_NUM_ROWS && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					MSTREAM_i <= ~MSTREAM_i;
					count <= 1;
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
				end	else if(count == C_MASK_DES_L && count_mpre != C_NUM_ROWS && ((count + count_mpre)%18!=0 || (count + count_mpre)%19!=0)) begin
					count <= 1;
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
				end else if(count == C_MASK_DES_L && count_mpre == C_NUM_ROWS) begin
					count <= 1;
					count_mpre <= 1;
					CLKMPRE_i <= 1;
					STREAM_i <= 0;
					STAT <= 2;
				end
			end
		
			// Last line pre-load + Global load (generated on imager-chip)
			2: begin
				fsm_stat_i <= 8'b11111101;
				count <= count + 1;
				if(count == C_MASK_DES_L/2) begin
					CLKMPRE_i <= 0;
				end else if(count == C_MASK_DES_L && count_mpre != 2 && count_subsc <= Num_Pat) begin
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
					count <= 1;
					PIXRES_GLOB_i <= 0;
					DRAIN_B_i <= 1;
				end else if(count == C_MASK_DES_L && count_mpre != 2 && count_subsc > Num_Pat) begin
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
					count <= 1;
					DRAIN_B_i <= 0;
				end else if(count == C_MASK_DES_L && count_mpre == 2) begin
					MSTREAM_i <= MSTREAM_Int_init1;
					count_mpre <= 1;
					count <= 1;
					STAT <= 3;
				end
			end
			
		// Exposure after each frame pattern load	
			3: begin
				fsm_stat_i <= 8'b11111100;
				count <= count + 1;
				if(count_subsc <= Num_Pat && (count_subsc % Mask_change_subc) == 0 && cnt_MskCng <= Num_Mask_change && count == Exp_subc*100) begin
					MSTREAM_Int_init1 <= ~MSTREAM_Int_init1;
					count <= 1;
					CLKMPRE_i <= 1;
					STREAM_i <= 1;
					STAT <= 1;
					cnt_MskCng <= cnt_MskCng + 1;
					count_subsc <= count_subsc + 1;
				end else if(count_subsc <= Num_Pat && count == Exp_subc*100) begin
					count <= 1;
					CLKMPRE_i <= 1;
					STREAM_i <= 1;
					STAT <= 1;
					count_subsc <= count_subsc + 1;
				end else if(count_subsc > Num_Pat && count == Exp_subc*100) begin
					CLKMPRE_i <= 1;
					count <= 1;
					STAT <= 4;
					STREAM_i <= 1;
					cnt_MskCng <= 1;
					count_subsc <= 1;
				end
			end
			
		// Last mask upload for gain reasons
			4: begin
				fsm_stat_i <= 8'b11111011;
				DRAIN_B_i <= 0;
				count <= count + 1;
				MSTREAM_i <= MSTREAM_init;
				if(count == C_MASK_DES_L/2) begin
					CLKMPRE_i <= 0;
				end	else if(count == C_MASK_DES_L && count_mpre != C_NUM_ROWS) begin
					count <= 1;
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
				end else if(count == C_MASK_DES_L && count_mpre == C_NUM_ROWS) begin
					count <= 1;
					CLKMPRE_i <= 1;
					STREAM_i <= 0;
					STAT <= 5;
					count_mpre <= 1;
				end
			end
			
		// Last mask's global upload for gain reasons
			5: begin
				fsm_stat_i <= 8'b11111010;
				count <= count + 1;
				if(count == C_MASK_DES_L/2) begin
					CLKMPRE_i <= 0;
				end else if(count == C_MASK_DES_L && count_mpre != 2) begin
					CLKMPRE_i <= 1;
					count_mpre <= count_mpre + 1;
					count <= 1;
				end else if(count == C_MASK_DES_L && count_mpre == 2) begin
					count_mpre <= 1;
					count <= 1;
					STAT <= 7;
				end
			end
			
		// activate the other state machine
			7: begin
				fsm_stat_i <= 8'b11111000;
				FSMIND1_i <= 1;
				FSMIND0ACK_i <= 0;
				MSTREAM_i <= MSTREAM_init;
				if (FSMIND1ACK) begin
					STAT <= 8;
				end
			end

			8: begin
				fsm_stat_i <= 8'b11110111;
				if (FSMIND0) begin
					STAT <= 9;
					FSMIND1_i <= 0;
					FSMIND0ACK_i <= 1;
				end
			end
			
			9: begin
				fsm_stat_i <= 8'b11110110;
				CLKMPRE_i <= 1;
				STREAM_i <= 1;
				STAT <= 0;
				count <= 1;
			end
			
		// default case
			default: begin
				fsm_stat_i <= 8'b10100101;
				STAT <= 0;
				MSTREAM_i <= MSTREAM_init;
				FSMIND1_i <= 0;
				FSMIND0ACK_i <= 0;
				count <= 1;
			end
			
		endcase end
	end

	
	assign		FSMIND1 = FSMIND1_i;
	assign		FSMIND0ACK = FSMIND0ACK_i;
	assign		OK_PIXRES_GLOB = PIXRES_GLOB_i;
	assign		MSTREAM = MSTREAM_i;
	assign		OK_DRAIN_B = DRAIN_B_i;
	assign		STREAM = STREAM_i;
	assign		CLKMPRE = CLKMPRE_i;
	assign		fsm_stat = fsm_stat_i;
 
endmodule