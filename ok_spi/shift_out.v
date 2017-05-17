`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:55 05/16/2017 
// Design Name: 
// Module Name:    shift_out 
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
module shift_out(
    input CLK,
    input [63:0] d_in,
    output d_out,
    input rst,
	 input en,
	 output [63:0] debugContents
    );

reg [63:0] contents;
assign d_out = contents[63];
assign debugContents = contents;

always@ (posedge CLK) begin
	if (rst == 1'b1) begin
		contents <= d_in;
	end else if (en == 1'b1) begin
		contents[63:0] <= {contents[62:0], 1'b0};
	end
end

endmodule
