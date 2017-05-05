`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:47 02/22/2017 
// Design Name: 
// Module Name:    memc_p0_cmd_path 
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
/* Module descriptions:
If the write address reaches the end_wr_addr_i, the FSM doesn't go to 
WRITE_DP state unless it first goes to ADDR_UP state once.

Write to memory happens only if there is data in the inFIFO and the 
data_wr_req is asserted.

Read from memory happens if the data_rd_req is asserted and the outFIFO
(FIFO in the read path) has enough space. The outFIFO has to be reset with
deasserting the data_rd_req.
*/

module mcb_instr_ctrl #
(
	parameter TCQ						= 100,
	parameter C3_P0_MASK_SIZE			= 8,
	parameter C3_P0_DATA_PORT_SIZE		= 64,
	parameter C3_P1_MASK_SIZE			= 8,
	parameter C3_P1_DATA_PORT_SIZE		= 64,
	parameter DWIDTH					= 64
)
(
	input wire clk_i,				// clk for inFIFO and command path
	input wire rst_i,				// reset signal
	input wire new_wraddr_req,			// signal to request an address update for write
	input wire data_wr_req,			// from a OkWireIn, request of data being transferred from computer to mem
	input wire [29:0] start_wr_addr_i,	// from a OkWireIn, define the start of write address
	input wire [29:0] end_wr_addr_i,	// from a OkWireIn, define upper limit write address boundary
    input wire [9:0] FIFOwr_data_count,	// from the inFIFO in wr-path, determining how much data is available
    input wire [6:0] wr_count,		// from the FIFO in memc, determining how much data is in the wr buffer
	input wire data_rd_req,			// level sensitive: from a OkWireIn, request of data being transferred from mem to computer
	input wire [29:0] start_rd_addr_i,	// from a OkWireIn, define the start of read address
	input wire [29:0] rd_len,		// from a OkWireIn, define read length
	input wire outFIFO_flag,			// prog-full flag from the read path FIFO. low --> enough space in FIFO for another read cmd
	output rdFIFO_rd_en,		// Enable signal to send data from rd buffer in memc to outFIFO
	input wire [6:0] rd_count,		// Amount of available data in rd buffer in memc
	output inFIFO_rd_en,		// enable read from the FIFO in the rd-path
	output cmd_en,				// Command enable sent to MCB
	output [29:0] cmd_addr,		// address sent to MCB
	output [5:0] cmd_bl,		// Burst length sent to MCB
	output [2:0] cmd_instr,		// Command instruction sent to MCB
	output [7:0] wr_mask		// write mask to the memc. all zeros.
);

parameter fixed_wr_bl = 48;
parameter fixed_rd_bl = 64;

reg [29:0] addr_wr_int;
reg [29:0] addr_rd_int;
reg [29:0] cmd_addr_int;
reg [31:0] end_wr_addr_range;
reg [31:0] end_rd_addr_range;
reg [29:0] addr_wr_int_next;
reg [29:0] addr_rd_int_next;
reg [29:0] rd_count_bl;
reg [29:0] rd_count_bl_next;
reg [5:0] bl_out_reg;
reg [5:0] bl_wr_reg;
reg [5:0] bl_rd_reg;
reg [2:0] cmd_instr_int;
reg inFIFO_rd_en_int;
reg rdFIFO_rd_en_int;
reg cmd_en_int;
integer rd_count_fix;
integer INC_COUNTS_wr;
integer INC_COUNTS_rd;


parameter READY_WR = 9'b000000001;
parameter WRITE = 9'b000000010;
parameter WRITE_DP = 9'b000000100;
parameter READY_RD = 9'b000001000;
parameter READ = 9'b000010000;
parameter READ_CMD = 9'b000100000;
parameter READ_CMD_LAST = 9'b001000000;
parameter ADDR_UP = 9'b010000000;
parameter READ_DP = 9'b100000000;

always @ (*) begin
    end_wr_addr_range <= #TCQ    end_wr_addr_i - (DWIDTH/8 * fixed_wr_bl) + 1   ;
    end_rd_addr_range <= #TCQ    start_rd_addr_i + rd_len + 1   ;
end
	
always @ (posedge clk_i) begin
    INC_COUNTS_wr <= #TCQ  (DWIDTH/8)*(bl_wr_reg);
    INC_COUNTS_rd <= #TCQ  (DWIDTH/8)*(bl_rd_reg);
end

integer bl_count;
integer bl_rd_count;
always @ (posedge clk_i) begin
	if(state == WRITE_DP)
		bl_count <= bl_count + 1;
	else if (state == READ_DP)
		bl_rd_count <= bl_rd_count + 1;
	else begin
		bl_count <= 0;
		bl_rd_count <= 0;
	end
end


    (* FSM_ENCODING="ONE-HOT", SAFE_IMPLEMENTATION="NO" *) reg [8:0] state = READY_WR;
   always@(posedge clk_i)
      if (rst_i) begin
		 cmd_en_int <= #TCQ 1'b0;
	     cmd_instr_int <= #TCQ 3'b0;
		 state <= #TCQ READY_WR;
		 bl_out_reg <= #TCQ 1;
		 inFIFO_rd_en_int <= #TCQ 0;
		 addr_wr_int_next <= #TCQ    start_wr_addr_i;
		 addr_rd_int_next <= #TCQ    start_rd_addr_i;
		 rd_count_bl <= 0;
      end
      else
         (* FULL_CASE, PARALLEL_CASE *) case (state)
            READY_WR : begin
			   cmd_en_int <= #TCQ 1'b0;
               if (data_wr_req && wr_count < 16)
                  state <= #TCQ WRITE;
               else if (new_wraddr_req)
                  state <= #TCQ ADDR_UP;
               else
                  state <= #TCQ READY_RD;
            end
            WRITE : begin
			addr_wr_int <= #TCQ addr_wr_int_next;
			cmd_instr_int <= #TCQ 3'b0;
			cmd_addr_int <= #TCQ addr_wr_int_next;
               if (end_wr_addr_range <= addr_wr_int_next) begin
				  state <= #TCQ READY_RD;
			   end if (FIFOwr_data_count >= fixed_wr_bl) begin
				  bl_out_reg <= #TCQ fixed_wr_bl;
                  state <= #TCQ WRITE_DP;
               end else begin
                  bl_out_reg <= #TCQ FIFOwr_data_count[5:0];
				  state <= #TCQ WRITE_DP;
			   end
            end
            WRITE_DP : begin
            addr_wr_int_next <= #TCQ    addr_wr_int + (DWIDTH/8)*(bl_out_reg);
			   if (bl_count <= bl_out_reg) begin
                  inFIFO_rd_en_int <= #TCQ 1'b1;
				  state <= #TCQ WRITE_DP;
               end else begin
                  inFIFO_rd_en_int <= #TCQ 1'b0;
				  state <= #TCQ READY_RD;
				  cmd_en_int <= #TCQ 1'b1;
			   end
            end
            READY_RD : begin
			   cmd_en_int <= #TCQ 1'b0;
			   if (rd_count != 0) begin
				  rd_count_fix <= #TCQ rd_count;
				  state <= #TCQ READ_DP;
               end else if (data_rd_req && !outFIFO_flag && rd_count_bl < rd_len)
                  state <= #TCQ READ;
               else
                  state <= #TCQ READY_WR;
            end
            READ_DP : begin
			   if (bl_rd_count <= rd_count_fix) begin
                  rdFIFO_rd_en_int <= #TCQ 1'b1;
				  state <= #TCQ READ_DP;
               end else begin
                  rdFIFO_rd_en_int <= #TCQ 1'b0;
				  state <= #TCQ READY_RD;
			   end
            end
			READ : begin
               addr_rd_int <= #TCQ addr_rd_int_next;
			   cmd_instr_int <= #TCQ 3'b001;
			   cmd_addr_int <= #TCQ addr_rd_int_next;
			   if (rd_count_bl_next <= rd_len) begin
                  rd_count_bl <= rd_count_bl_next;
				  bl_out_reg <= fixed_rd_bl;
				  state <= READ_CMD;
               end else begin
				  bl_out_reg <= rd_len - rd_count_bl;
				  state <= READ_CMD_LAST;
			   end
            end
			READ_CMD : begin
			   rd_count_bl_next <= #TCQ    rd_count_bl + fixed_rd_bl;
               addr_rd_int_next <= #TCQ    addr_rd_int + (DWIDTH/8)*(bl_out_reg);
			   cmd_en_int <= #TCQ    1'b1;
			   state <= #TCQ READY_WR;
            end
            READ_CMD_LAST : begin
			   rd_count_bl <= 0;
               addr_rd_int_next <= #TCQ    start_rd_addr_i;
			   cmd_en_int <= #TCQ    1'b1;
			   state <= #TCQ    READY_WR;
            end
            ADDR_UP : begin
			   addr_wr_int_next <= #TCQ    start_wr_addr_i;
			   state <= #TCQ READY_WR;
            end
        endcase
							



assign cmd_addr = cmd_addr_int;
assign cmd_bl = bl_out_reg - 1;
assign cmd_instr = cmd_instr_int;
assign inFIFO_rd_en = inFIFO_rd_en_int;
assign rdFIFO_rd_en = rdFIFO_rd_en_int;
assign cmd_en = cmd_en_int;
assign wr_mask = 8'h00;


endmodule
