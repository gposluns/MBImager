`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:19 05/26/2017 
// Design Name: 
// Module Name:    mem_fsm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: controls mem_if signals to store patterns in DDR2 SDRAM
//								from pipeIn, and sends patterns to camera once requested
//
//////////////////////////////////////////////////////////////////////////////////
module mem_fsm(
		input wire fsm_rst,
		
		input wire okClk,
		input wire pipein_high,
		input wire [31:0] pipein_data,
		
		input wire write_start,
		input wire [31:0] Num_Pat,
		
		input wire mem_calib_done,
		input wire 		mem_clk,
		output reg		c3_p0_cmd_en,
		output reg [2:0]	c3_p0_cmd_instr,
		output reg [5:0]	c3_p0_cmd_bl,
		output reg [29:0] c3_p0_cmd_byte_addr,
		input wire		c3_p0_cmd_empty,
		input wire		c3_p0_cmd_full,
		output reg		c3_p0_wr_en,
		output wire [63:0]	c3_p0_wr_data,
		output wire [7:0] c3_p0_wr_mask,
		input wire		c3_p0_wr_full,
		input wire		c3_p0_wr_empty,
		input wire [6:0]	c3_p0_wr_count,
		input wire		c3_p0_wr_underrun,
		input wire		c3_p0_wr_error,
		
		output reg		c3_p1_cmd_en,
		output reg [2:0]	c3_p1_cmd_instr,
		output reg [5:0]	c3_p1_cmd_bl,
		output reg [29:0] c3_p1_cmd_byte_addr,
		input wire		c3_p1_cmd_empty,
		input wire		c3_p1_cmd_full,
		output reg		c3_p1_rd_en,
		input wire		c3_p1_rd_full,
		input wire		c3_p1_rd_empty,
		input wire [6:0]	c3_p1_rd_count,
		input wire		c3_p1_rd_overflow,
		input wire		c3_p1_rd_error,
		input wire [63:0] c3_p1_rd_data,
		
		input wire read_start,
		input wire outfifo_full,
		input wire outfifo_empty,
		output reg outfifo_wr_en,
		output reg read_done,
		output reg write_done
	);
	
	localparam WR_BURST_LEN       = 1'd1;     // Number of 64bit user words per command
	localparam WR_BURST_LEN_BYTES = 4'd8;    // Number of bytes per command (for increasing cmd_addr)
	
	localparam RD_BURST_LEN       = 6'd32;     // Number of 64bit user words per command
	localparam RD_BURST_LEN_BYTES = 9'd256;    // Number of bytes per command (for increasing cmd_addr)

	
	
	//counter for # of 64-bit data written into the memory
	reg [31:0] wr_counter;
	reg [6:0] bl_cnt;
	wire [32:0] num_pat_bytes;
	reg p0_cmd_full_flag; //used to reduce counter only once
	reg p1_rd_full_flag; 
	
	//FIFO wires
	reg infifo_rd_en;
	wire infifo_full;
	wire infifo_empty;
	wire [31:0] infifo_datain;
	
	//due to fifos w/ different width
	//assign infifo_datain[31:16] = {pipein_data[11:8] ,pipein_data[15:12], pipein_data[3:0], pipein_data[7:4]};
	//assign infifo_datain[15:0] = {pipeiein_data[11:8] ,pipein_data[15:12], pipein_data[3:0], pipein_data[7:4]};
	assign infifo_datain[31:16] = {pipein_data[7:0], pipein_data[15:8]};
	assign infifo_datain[15:0] = { pipein_data[23:16], pipein_data[31:24]};
	
	assign c3_p0_wr_mask = 8'h00;
	//num pat + start + last
	//one pat is 2 bytes (16 channels) * 18*160
	assign num_pat_bytes = (Num_Pat + 2'd2) *4 *16*176;
	
	integer state;
	localparam 	s_idle 	= 0,
					s_write	= 1,
					s_write2 = 3,
					s_write3 = 4,
					s_read 	= 2,
					s_read2 	= 5,
					s_read3 	= 6;


	initial begin
		state <= s_idle;
		write_done <= 0;
		wr_counter <= 0;
		infifo_rd_en <= 0;
		outfifo_wr_en <= 0;
		read_done <= 0;
		bl_cnt <= 0;//4'd8;
		
		c3_p0_cmd_en <= 0;
		c3_p0_cmd_instr <= 0;
		c3_p0_cmd_bl <= 0;
		c3_p0_cmd_byte_addr <= 30'h08;
		c3_p0_wr_en <= 0;
		c3_p1_cmd_en <= 0;
		c3_p1_cmd_instr <= 0;
		c3_p1_cmd_bl <= 0;
		c3_p1_cmd_byte_addr <= 30'h08;
		c3_p1_rd_en <= 0;
	end

	
	
	always @ (posedge mem_clk or posedge fsm_rst) begin
		
	if (fsm_rst) begin
		state <= s_idle;
		//write_done <= 0;
		wr_counter <= 0;
		infifo_rd_en <= 0;
		outfifo_wr_en <= 0;
		read_done <= 0;
		bl_cnt <= 0;//4'd8;
		
		c3_p0_cmd_en <= 0;
		c3_p0_cmd_instr <= 0;
		c3_p0_cmd_bl <= 0;
		c3_p0_cmd_byte_addr <= 30'h08;
		c3_p0_wr_en <= 0;
		c3_p1_cmd_en <= 0;
		c3_p1_cmd_instr <= 0;
		c3_p1_cmd_bl <= 0;
		c3_p1_cmd_byte_addr <= 30'h08;
		c3_p1_rd_en <= 0;
	end
		
	else begin	
		//write_done <= 0; reset when first read transfer finishes
		infifo_rd_en <= 0;
		outfifo_wr_en <= 0;
		read_done <= 0;
		
		c3_p0_cmd_en <= 0;
		c3_p0_cmd_instr <= 0;
		c3_p0_cmd_bl <= 0;
		//c3_p0_cmd_byte_addr <= 0;
		c3_p0_wr_en <= 0;
		c3_p1_cmd_en <= 0;
		c3_p1_cmd_instr <= 0;
		c3_p1_cmd_bl <= 0;
		//c3_p1_cmd_byte_addr <= 0;
		c3_p1_rd_en <= 0;
		
		case (state)
			s_idle: begin
				
				if (write_start) begin
					state <= s_write;
				end
				
				else if (!c3_p1_rd_empty)
					c3_p1_rd_en <= 1; 
					
				else if (write_done && read_start && outfifo_empty)
					state <= s_read;
					
				
			end
			
			s_write: begin
			
				if (wr_counter == num_pat_bytes | bl_cnt == RD_BURST_LEN) begin
					state <= s_write2;
				end
				
				else begin
					//when there is data available to be written
					//into the MCB write FIFO
					if (almost_empty == 0) begin //wr_full is delayed, shudnt trust
						infifo_rd_en <= 1;
						
						//at cnt 31 and previous rd_en = 1, dont read again
						if (bl_cnt == (RD_BURST_LEN - 1'd1) && infifo_rd_en == 1)
							infifo_rd_en <= 0;
					end
					
					else if (wr_counter == (num_pat_bytes - WR_BURST_LEN_BYTES) && (!infifo_empty)) begin
						infifo_rd_en <= 1;
					end
					
					if (infifo_rd_en == 1/* && infifo_empty == 0*/) begin	//FIFO empty signal has slight delay,
						c3_p0_wr_en <= 1;									//avoids writing one extra
						bl_cnt <= bl_cnt + 1;
						wr_counter <= wr_counter + WR_BURST_LEN_BYTES;
						//mask signals are assigned before
					end
				end
			end
			
			s_write2: begin
				c3_p0_cmd_en <= 1;
				c3_p0_cmd_instr <= 3'b000;
				c3_p0_cmd_bl <= bl_cnt - 1'b1;//c3_p0_wr_count - 1'b1; //wr_count limit: 0-64
				
				state <= s_write3;
				
			end
			
			s_write3: begin
				if (c3_p0_wr_empty) begin
					
					if (wr_counter == num_pat_bytes ) begin
						write_done <= 1;
						state <= s_idle;
						wr_counter <= 0;
						bl_cnt <= 4'd8;
						c3_p0_cmd_byte_addr <= 30'h08;
					end
					
					else begin
						state <= s_write;
						bl_cnt <= 0;
						c3_p0_cmd_byte_addr <= c3_p0_cmd_byte_addr + RD_BURST_LEN_BYTES;
					end
				end
			end
			
//			s_read: begin
//			
//				//keep refilling read FIFO
//				if (!c3_p1_cmd_full && bl_cnt == 4'd8 && wr_counter < num_pat_bytes) begin
//					c3_p1_cmd_en <= 1;
//					c3_p1_cmd_instr <= 3'b001;
//					c3_p1_cmd_bl <= RD_BURST_LEN - 1'b1;
//					
//					
//					
//					if (c3_p1_rd_empty)
//						bl_cnt <= RD_BURST_LEN;
//					else begin
//						bl_cnt <= RD_BURST_LEN + 4'd8;
//						c3_p1_cmd_byte_addr <= c3_p1_cmd_byte_addr + RD_BURST_LEN_BYTES;
//					end
//				end
//				
//				//move the data from read FIFO if available
//				//to the outfifo if it has space
//				else if (!outfifo_full && c3_p1_rd_count > 2'd2 && wr_counter < num_pat_bytes) begin
//					outfifo_wr_en <= 1;
//					c3_p1_rd_en <= 1;
//					
//					wr_counter <= wr_counter + WR_BURST_LEN_BYTES;
//					
//					bl_cnt <= bl_cnt - 1'b1;
//				end
//				
//				
//				if (wr_counter == num_pat_bytes && !outfifo_empty) begin
//					state <= s_idle;
//					read_done <= 1;
//					wr_counter <= 0;
//					c3_p1_cmd_byte_addr <= 30'h08;
//					bl_cnt <= 4'd8;
//					
//				end
//				
//			end

			s_read: begin
			
				c3_p1_cmd_en <= 1;
				c3_p1_cmd_instr <= 3'b001;
				c3_p1_cmd_bl <= RD_BURST_LEN - 1'b1;
					
				bl_cnt <= RD_BURST_LEN;
				state <= s_read2;
			end
			
			s_read2: begin
				if (c3_p1_rd_count == RD_BURST_LEN)
					state <= s_read3;
			end
			
			s_read3: begin
				if (wr_counter == num_pat_bytes) begin
					state <= s_idle;
					wr_counter <= 0;
					c3_p1_cmd_byte_addr <= 30'h08;
				end
				
				else if (bl_cnt == 0) begin
					state <= s_read;
					c3_p1_cmd_byte_addr <= c3_p1_cmd_byte_addr + RD_BURST_LEN_BYTES;
				end
						
				else if (c3_p1_rd_empty != 1 && outfifo_full != 1) begin
					c3_p1_rd_en <= 1;
					outfifo_wr_en <= 1;
					bl_cnt <= bl_cnt - 1'b1;
					wr_counter <= wr_counter + WR_BURST_LEN_BYTES;
				end
				
			end
				
		
		default: state <= s_idle;
		endcase
	end
	end
	
	wire almost_empty;
	wire infifo_cnt;
	fifo_pat_pipein infifo(
		.rst(fsm_rst), // input rst
		.wr_clk(okClk), // input wr_clk
		.rd_clk(mem_clk), // input rd_clk
		.din(infifo_datain), // input [31 : 0] din
		.wr_en(pipein_high), // input wr_en
		.rd_en(infifo_rd_en), // input rd_en
		.dout(c3_p0_wr_data), // output [63 : 0] dout
		.full(infifo_full), // output full
		.empty(infifo_empty), // output empty
		.prog_empty(almost_empty)
	);
	
	 
endmodule
