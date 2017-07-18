`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:44 07/18/2017 
// Design Name: 
// Module Name:    spi_programmer 
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
module spi_programmer(
    output [31:0] command,
    input ready,
    output [15:0] ss,
    input clock,
	 output trigger
    );

	parameter NUM_COMMANDS = 28;

	reg [32*NUM_COMMANDS - 1:0] commands;
	reg [16*NUM_COMMANDS - 1:0] targets;
	reg programming;
	reg trigger_i;
	reg [31:0] countdown;
	
	initial countdown = 100000;
	initial trigger_i = 0;
	initial programming = 0;
	
	initial commands[0*32 +: 32] = 32'h00002600;
	initial targets [0*16 +: 16] = 16'b10;
	
	initial commands[1*32 +: 32] = 32'h00002600;
	initial targets [1*16 +: 16] = 16'b10;
	
	initial commands[2*32 +: 32] = 32'h00002600;
	initial targets [2*16 +: 16] = 16'b10;
	
	initial commands[3*32 +: 32] = 32'h00002600;
	initial targets [3*16 +: 16] = 16'b10;
	
	initial commands[4*32 +: 32] = 32'h00002600;
	initial targets [4*16 +: 16] = 16'b10;
	
	initial commands[5*32 +: 32] = 32'h00002600;
	initial targets [5*16 +: 16] = 16'b10;

	always @(posedge clock) begin
		if (countdown > 0) countdown <= countdown - 1;
		else if (~programming) begin
			programming <= 1;
			trigger_i <= 1;
		end else if (programming & ready) begin
			commands <= {32'h0, commands[32*NUM_COMMANDS - 1: 32]};
			targets <= {16'h0, targets[16*NUM_COMMANDS - 1: 16]};
			trigger_i <= 1;
			countdown <= 10;
		end else begin
			trigger_i <= 0;
		end
	end
	
	assign command = commands [31:0];
	assign ss = targets [15:0];
	assign trigger = trigger_i;

endmodule
