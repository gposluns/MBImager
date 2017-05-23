`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:51 01/25/2017 
// Design Name: 
// Module Name:    pattern_gen 
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
module pattern_gen(
	input rst,
	input clk,
	input [9:0] Pat_in,
	input [9:0] PatGen_start,
	input [9:0] PatGen_stop,
	input [31:0] Num_Pat,			// Number of patterns applied to the imager.
	input [31:0] CntSubc,
	// input FSMIND0,					// If high, the Exposure FSM (on OK) is active
	input FIFO_empty,
	input [31:0] Mask_change_subc,	// Pattern change after Mask_change_subc subscenes
	input [31:0] Mask_change_no,	// Number of Pattern chages
	output reg FIFO_wr,
	output [9:0] Pat_out
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

	reg [9:0] Pat_i;
	reg [9:0] Pat_cur;
	integer cntPat;
	wire subc_inv;

	initial	begin
		Pat_i <= Pat_all1;
		FIFO_wr <= 0;
	end


   (* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="S_subc_first" *) reg [4:0] state = S_init;

   always@(negedge clk)
      if (rst) begin
         state <= S_subc_first;
		 FIFO_wr <= 0;
		 cntPat <= 0;
		 Pat_i <= PatGen_start;
      end
      else
         (* PARALLEL_CASE *) case (state)
            S_init : begin
				Pat_i <= PatGen_start;
				state <= S_subc_first;
				cntPat <= 0;
            end
            S_subc_first : begin
				if(cntPat < C_NUM_ROWS*18) begin
					FIFO_wr <= 1;
					cntPat <= cntPat + 1;
				end else begin
					FIFO_wr <= 0;
					cntPat <= 0;
					Pat_i <= Pat_in;
					state <= S_subc_pats;
				end
			end
            S_subc_pats : begin
				if (FIFO_empty && ~FIFO_wr) begin
					FIFO_wr <= 1;
					cntPat <= cntPat + 1;
				end else if (FIFO_wr && cntPat < C_NUM_ROWS*18) begin
					cntPat <= cntPat + 1;
				end else if (FIFO_wr && subc_inv && CntSubc < Num_Pat) begin
					Pat_i <= ~Pat_in;
					FIFO_wr <= 0;
					cntPat <= 0;
				end else if (FIFO_wr && ~subc_inv && CntSubc < Num_Pat) begin
					Pat_i <= Pat_in;
					FIFO_wr <= 0;
					cntPat <= 0;
				end else if (FIFO_wr) begin
					FIFO_wr <= 0;
					cntPat <= 0;
					Pat_i <= PatGen_stop;
					state <= S_subc_last;
				end
            end
            S_subc_last : begin
				if (cntPat < C_NUM_ROWS*18) begin
					FIFO_wr <= 1;
					cntPat <= cntPat + 1;
				end else begin
					FIFO_wr <= 0;
					cntPat <= 0;
					Pat_i <= PatGen_start;
					state <= S_subc_first;
				end
            end
            default : begin  // Fault Recovery
               state <= S_init;
            end   
         endcase

	assign Pat_out = Pat_i;
	
	assign subc_inv = (((CntSubc/Mask_change_subc)%2==1) && (CntSubc <= Mask_change_no*Mask_change_subc))||((CntSubc > Mask_change_no*Mask_change_subc)&&(Mask_change_no%2==1));

endmodule
