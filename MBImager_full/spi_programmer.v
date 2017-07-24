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
    output [15:0] command,
    input ready,
    output [9:0] ss,
    input clock,
	 output trigger,
	 output CPOL,
	 output CPHA
    );

	parameter NUM_COMMANDS = 64;

	reg [16*NUM_COMMANDS - 1:0] commands;
	reg [10*NUM_COMMANDS - 1:0] targets;
	reg trigger_i;
	reg load_next;
	reg [31:0] countdown;
	reg [NUM_COMMANDS - 1:0] CPOLs;
	reg [NUM_COMMANDS - 1:0] CPHAs;
	
	initial countdown = 1000;
	initial trigger_i = 0;
	initial load_next = 0;
	
	initial CPOLs = 0;
	initial CPHAs = 0;
	
	initial commands[0*16 +: 16] = 16'b0110010000000000;
	initial targets [0*10 +: 10] = 10'b10;
	
	initial commands[1*16 +: 16] = 16'b0011101100000001;
	initial targets [1*10 +: 10] = 10'b10;
	
	initial commands[2*16 +: 16] = 16'b0111100000000010;
	initial targets [2*10 +: 10] = 10'b10;
	
	initial commands[3*16 +: 16] = 16'b0100010000000011;
	initial targets [3*10 +: 10] = 10'b10;
	
	initial commands[4*16 +: 16] = 16'b0000000000011111;
	initial targets [4*10 +: 10] = 10'b0010000000;	
	initial commands[5*16 +: 16] = 16'b0000000000011111;
	initial targets [5*10 +: 10] = 10'b0100000000;	
	initial commands[6*16 +: 16] = 16'b0000000000011111;
	initial targets [6*10 +: 10] = 10'b1000000000;
	
	initial commands[7*16 +: 16] = 16'b0010001000000000;
	initial targets [7*10 +: 10] = 10'b0010000000;	
	initial commands[8*16 +: 16] = 16'b0010001000000000;
	initial targets [8*10 +: 10] = 10'b0100000000;	
	initial commands[9*16 +: 16] = 16'b0010001000000000;
	initial targets [9*10 +: 10] = 10'b1000000000;
	
	initial commands[10*16 +: 16] = 16'b1100010000000010;
	initial targets [10*10 +: 10] = 10'b0010000000;	
	initial commands[11*16 +: 16] = 16'b1100010000000010;
	initial targets [11*10 +: 10] = 10'b0100000000;
	initial commands[12*16 +: 16] = 16'b1100010000000010;
	initial targets [12*10 +: 10] = 10'b1000000000;
	
	initial commands[13*16 +: 16] = 16'b0000001000000011;
	initial targets [13*10 +: 10] = 10'b0010000000;	
	initial commands[14*16 +: 16] = 16'b0000001000000011;
	initial targets [14*10 +: 10] = 10'b0100000000;
	initial commands[15*16 +: 16] = 16'b0000001000000011;
	initial targets [15*10 +: 10] = 10'b1000000000;
	
	initial commands[16*16 +: 16] = 16'b0100001000000100;
	initial targets [16*10 +: 10] = 10'b0010000000;	
	initial commands[17*16 +: 16] = 16'b0100001000000100;
	initial targets [17*10 +: 10] = 10'b0100000000;
	initial commands[18*16 +: 16] = 16'b0100001000000100;
	initial targets [18*10 +: 10] = 10'b1000000000;
	
	initial commands[19*16 +: 16] = 16'b1100000000000101;
	initial targets [19*10 +: 10] = 10'b0010000000;	
	initial commands[20*16 +: 16] = 16'b1100000000000101;
	initial targets [20*10 +: 10] = 10'b0100000000;
	initial commands[21*16 +: 16] = 16'b1100000000000101;
	initial targets [21*10 +: 10] = 10'b1000000000;
	
	initial commands[22*16 +: 16] = 16'b0000000000000110;
	initial targets [22*10 +: 10] = 10'b0010000000;	
	initial commands[23*16 +: 16] = 16'b0000000000000110;
	initial targets [23*10 +: 10] = 10'b0100000000;
	initial commands[24*16 +: 16] = 16'b0000000000000110;
	initial targets [24*10 +: 10] = 10'b1000000000;
	
	initial commands[25*16 +: 16] = 16'b0000101000001000;
	initial targets [25*10 +: 10] = 10'b0010000000;	
	initial commands[26*16 +: 16] = 16'b0000101000001000;
	initial targets [26*10 +: 10] = 10'b0100000000;
	initial commands[27*16 +: 16] = 16'b0000101000001000;
	initial targets [27*10 +: 10] = 10'b1000000000;
	
	initial commands[28*16 +: 16] = 16'b0000101000001000;
	initial targets [28*10 +: 10] = 10'b0010000000;	
	initial commands[29*16 +: 16] = 16'b0000101000001000;
	initial targets [29*10 +: 10] = 10'b0100000000;
	initial commands[30*16 +: 16] = 16'b0000101000001000;
	initial targets [30*10 +: 10] = 10'b1000000000;
	
	initial commands[31*16 +: 16] = 16'b0000101000001100;
	initial targets [31*10 +: 10] = 10'b0010000000;	
	initial commands[32*16 +: 16] = 16'b0000101000001100;
	initial targets [32*10 +: 10] = 10'b0100000000;
	initial commands[33*16 +: 16] = 16'b0000101000001100;
	initial targets [33*10 +: 10] = 10'b1000000000;
	
	initial commands[34*16 +: 16] = 16'b0010011000001001;
	initial targets [34*10 +: 10] = 10'b0010000000;	
	initial commands[35*16 +: 16] = 16'b0010011000001001;
	initial targets [35*10 +: 10] = 10'b0100000000;
	initial commands[36*16 +: 16] = 16'b0010011000001001;
	initial targets [36*10 +: 10] = 10'b1000000000;
	
	initial commands[37*16 +: 16] = 16'b0010011000001011;
	initial targets [37*10 +: 10] = 10'b0010000000;	
	initial commands[38*16 +: 16] = 16'b0010011000001011;
	initial targets [38*10 +: 10] = 10'b0100000000;
	initial commands[39*16 +: 16] = 16'b0010011000001011;
	initial targets [39*10 +: 10] = 10'b1000000000;
	
	initial commands[40*16 +: 16] = 16'b0000101000001110;
	initial targets [40*10 +: 10] = 10'b0010000000;	
	initial commands[41*16 +: 16] = 16'b0000101000001110;
	initial targets [41*10 +: 10] = 10'b0100000000;
	initial commands[42*16 +: 16] = 16'b0000101000001110;
	initial targets [42*10 +: 10] = 10'b1000000000;
	
	initial commands[43*16 +: 16] = 16'b0000101000010000;
	initial targets [43*10 +: 10] = 10'b0010000000;	
	initial commands[44*16 +: 16] = 16'b0000101000010000;
	initial targets [44*10 +: 10] = 10'b0100000000;
	initial commands[45*16 +: 16] = 16'b0000101000010000;
	initial targets [45*10 +: 10] = 10'b1000000000;
	
	initial commands[46*16 +: 16] = 16'b0000101000010010;
	initial targets [46*10 +: 10] = 10'b0010000000;	
	initial commands[47*16 +: 16] = 16'b0000101000010010;
	initial targets [47*10 +: 10] = 10'b0100000000;
	initial commands[48*16 +: 16] = 16'b0000101000010010;
	initial targets [48*10 +: 10] = 10'b1000000000;
	
	initial commands[49*16 +: 16] = 16'b0010011000001111;
	initial targets [49*10 +: 10] = 10'b0010000000;	
	initial commands[50*16 +: 16] = 16'b0010011000001111;
	initial targets [50*10 +: 10] = 10'b0100000000;
	initial commands[51*16 +: 16] = 16'b0010011000001111;
	initial targets [51*10 +: 10] = 10'b1000000000;
	
	initial commands[52*16 +: 16] = 16'b0010011000010001;
	initial targets [52*10 +: 10] = 10'b0010000000;	
	initial commands[53*16 +: 16] = 16'b0010011000010001;
	initial targets [53*10 +: 10] = 10'b0100000000;
	initial commands[54*16 +: 16] = 16'b0010011000010001;
	initial targets [54*10 +: 10] = 10'b1000000000;
	
	initial commands[55*16 +: 16] = 16'b0010011000010011;
	initial targets [55*10 +: 10] = 10'b0010000000;	
	initial commands[56*16 +: 16] = 16'b0010011000010011;
	initial targets [56*10 +: 10] = 10'b0100000000;
	initial commands[57*16 +: 16] = 16'b0010011000010011;
	initial targets [57*10 +: 10] = 10'b1000000000;
	
	initial commands[58*16 +: 16] = 16'b0000000000011111;
	initial targets [58*10 +: 10] = 10'b0010000000;	
	initial commands[59*16 +: 16] = 16'b0000000000011111;
	initial targets [59*10 +: 10] = 10'b0100000000;
	initial commands[60*16 +: 16] = 16'b0000000000011111;
	initial targets [60*10 +: 10] = 10'b1000000000;
	
	initial commands[61*16 +: 16] = 16'b0010001100000000;
	initial targets [61*10 +: 10] = 10'b0010000000;	
	initial commands[62*16 +: 16] = 16'b0010001100000000;
	initial targets [62*10 +: 10] = 10'b0100000000;
	initial commands[63*16 +: 16] = 16'b0010001100000000;
	initial targets [63*10 +: 10] = 10'b1000000000;
	
	always @(posedge clock) begin
		if (countdown > 0) countdown <= countdown - 1;
		else if (ready) begin
			CPOLs <= {1'b0, CPOLs[NUM_COMMANDS - 1:1]};
			CPHAs <= {1'b0, CPHAs[NUM_COMMANDS - 1:1]};
			trigger_i <= 1;
			load_next <= 1;
			countdown <= 10;
		end else if (load_next == 1) begin
			commands <= {16'h0, commands[16*NUM_COMMANDS - 1: 16]};
			targets <= {10'h0, targets[10*NUM_COMMANDS - 1: 10]};
			load_next <= 0;
		end else begin
			trigger_i <= 0;
		end
	end
	
	assign command = {commands[8], commands[9], commands[10], commands[11], commands[12], commands[13], commands[14], commands[15], commands[0], commands[1], commands[2], commands[3], commands[4], commands[5], commands[6], commands[7]};
	assign ss = targets [9:0];
	assign trigger = trigger_i;
	assign CPOL = CPOLs[0];
	assign CPHA = CPHAs[0];

endmodule
