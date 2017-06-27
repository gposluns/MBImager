`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:15 05/16/2017 
// Design Name: 
// Module Name:    shift_in 
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
module shift_in(
    input CLK,
    input d_in,
    output [63:0] d_out,
    input rst,
	 input en
    );

reg [63:0] contents;
assign d_out = contents;

always@ (posedge CLK) begin
	if (rst == 1'b1) 
		contents <= 64'b0;
	else if (en == 1'b1)
		contents <= {contents[63:0], d_in};
end
endmodule
