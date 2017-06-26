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
	
	input wire [9:0] pat_in,
	output reg pat_fifo_rd_en,
	
	input wire [31:0] Num_Pat,			// Number of patterns applied to the imager.
	input wire [31:0] CntSubc,
	// input FSMIND0,					// If high, the Exposure FSM (on OK) is active
	input wire FIFO_empty,
	input wire camfifo_empty,
	input wire camfifo_full,
	
	output reg FIFO_wr,
	output wire [9:0] Pat_out
	);
	
// -- Parameters
	parameter S_init = 5'b00001;
	parameter S_subc_first = 5'b00010;	// state of the pattern generation of the first scence (unexposed)
	parameter S_subc_pats = 5'b00100;	// state of the exposed pattern generations
	parameter S_subc_last = 5'b01000;	// state of the pattern generation of the last scene (unexposed)
	parameter C_NUM_ROWS = 160;			// Number of pixel rows in the sensor
	parameter Pat_all1 = 10'b1111111111;
	parameter Pat_Blank = 10'b0;

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

	reg	[9:0] Pat_i;
	integer cntPat;

	initial	begin
		FIFO_wr <= 0;
		pat_fifo_rd_en <= 0;
		cntPat <= 0;
	end


   (* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="S_subc_first" *) reg [4:0] state = S_init;

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
			
         (* PARALLEL_CASE *) case (state)
            
				S_init : begin
//					state <= S_subc_first;
					cntPat <= 0;
					if (camfifo_empty && (!camfifo_full))
						state <= S_subc_first;
            end
				
            S_subc_first : begin
				
					if(cntPat < C_NUM_ROWS*18) begin
						FIFO_wr <= 1;
						cntPat <= cntPat + 1;
						pat_fifo_rd_en <= 1;
						Pat_i <= pat_in;
					end 
					
					else begin
						cntPat <= 0;
						state <= S_subc_pats;
					end
				end
				
            S_subc_pats : begin
					
					if ((~FIFO_empty) && (~FIFO_wr))
						FIFO_wr <= 0;
					
					else if (cntPat < C_NUM_ROWS*18) begin
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
				
            S_subc_last : begin
					if (cntPat < C_NUM_ROWS*18) begin
						FIFO_wr <= 1;
						cntPat <= cntPat + 1;
						pat_fifo_rd_en <= 1;
						Pat_i <= pat_in;
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
	
	//assign Pat_out = Pat_i;
	genvar i;
	generate
	for (i=0; i<10; i=i+1) assign Pat_out[i] = Pat_i[9-i];// && 10'h000;
	endgenerate
	
endmodule

