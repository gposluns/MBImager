`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:19 11/04/2016 
// Design Name: 
// Module Name:    fifo_timing 
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
module fifo_buf_timing(
	input fifo_rd_clk,
    input flag,
	input empty,
    output fifo_rd_en
    );

reg fifo_rd_en_i;

assign fifo_rd_en = fifo_rd_en_i;

initial begin
	fifo_rd_en_i <= 0;
end

always @(posedge fifo_rd_clk) begin
	if(flag && !fifo_rd_en_i) begin
		fifo_rd_en_i <= 1;
	end else if(!empty) begin
		fifo_rd_en_i <= 0;
	end
end

endmodule
