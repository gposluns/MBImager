`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:22 06/06/2017 
// Design Name: 
// Module Name:    load_pattern 
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

module load_pattern(
	input wire rst,
	input wire clk,
	
	input wire [17:0] pat_in,
	output reg pat_fifo_rd_en,
	
	input wire [31:0] Num_Pat,			// Number of patterns applied to the imager.
	input wire [31:0] CntSubc,
	// input FSMIND0,					// If high, the Exposure FSM (on OK) is active
	input wire FIFO_empty,
	input wire camfifo_empty,
	input wire camfifo_full,
	
	output reg FIFO_wr,
	output wire [17:0] Pat_out
	);
	
// -- Parameters
	integer state;
	localparam 	S_init 				= 1,
					S_RESET_ALL0 		= 2,	
					S_subc_pats 		= 3,	
					S_subc_last 		= 4,
					S_RESET_ALL1 		= 5;
	
	
	parameter C_NUM_ROWS = 176;			// Number of pixel rows in the sensor
	parameter C_MASK_DES_L = 16;
	parameter Pat_all1 = 10'b1111111111;
	parameter Pat_Blank = 10'b0;
	parameter CHIP_MODE = "CEI";
//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

	reg	[17:0] Pat_i;
	integer cntPat;

	initial	begin
		FIFO_wr <= 0;
		pat_fifo_rd_en <= 0;
		cntPat <= 0;
	end


   //(* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="S_subc_first" *) reg [4:0] state = S_init;

   always@(negedge clk)
      if (rst) begin
         state <= S_init;
			FIFO_wr <= 0;
			cntPat <= 0;
			pat_fifo_rd_en <= 0;
      end
		
      else begin
			pat_fifo_rd_en <= 0;
			FIFO_wr <= 0;
			
         case (state)
            
				S_init : begin
//					state <= S_subc_first;
					cntPat <= 0;
					if (camfifo_empty && (!camfifo_full))
						state <= S_RESET_ALL0;
            end
				
				
				//no pattern upload is needed
				//upload is done by the last pattern in previous frame
            S_RESET_ALL0: begin
				
					if(cntPat < C_NUM_ROWS*C_MASK_DES_L) begin
						FIFO_wr <= 0;
						cntPat <= cntPat + 1;
					end 
					
					else begin
						cntPat <= 0;
						state <= S_RESET_ALL1;
					end
				end
				
				
				//not needed for TOF
				S_RESET_ALL1: begin
					
					if(cntPat < C_NUM_ROWS*C_MASK_DES_L) begin
						if (CHIP_MODE == "CEI") begin
							FIFO_wr <= 1;
							Pat_i <= 18'hfffff;
						end
						else if (CHIP_MODE == "TOF") begin
							FIFO_wr <= 0;
						end
						
						cntPat <= cntPat + 1;
					end 
					
					else begin
						cntPat <= 0;
						state <= S_subc_pats;
					end
				end
				
				
            S_subc_pats : begin
					
					if ((~FIFO_empty) && (~FIFO_wr))
						FIFO_wr <= 0;
					
					else if (cntPat < C_NUM_ROWS*C_MASK_DES_L) begin
						cntPat <= cntPat + 1;
						FIFO_wr <= 1;
						pat_fifo_rd_en <= 1;
						Pat_i <= pat_in;
					end 
					
					else if (CntSubc >= Num_Pat) begin
						cntPat <= 0;
						state <= S_subc_last;
					end
					
					else
						cntPat <= 0;
            end
				
				//applying all 0 mask
            S_subc_last : begin
					if (cntPat < C_NUM_ROWS*C_MASK_DES_L) begin
						FIFO_wr <= 1;
						cntPat <= cntPat + 1;
						Pat_i <= 18'd0;
					end else begin
						cntPat <= 0;
						state <= S_init;
					end
            end
				
            default : begin  // Fault Recovery
               state <= S_init;
            end   
         endcase
		end
	
	assign Pat_out = Pat_i;
//	genvar i;
//	generate
//	for (i=0; i<15; i=i+1) begin
//		assign Pat_out[i] = Pat_i[15-i];// && 10'h000;
//	end
//	endgenerate
	
endmodule

