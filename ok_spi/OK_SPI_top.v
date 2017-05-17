`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:29 05/16/2017 
// Design Name: 
// Module Name:    OK_SPI_top 
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
module OK_SPI_top(
	input spi_dq1,
	output spi_dq0,
	output spi_s,
	output spi_c,
	input  [4:0] okUH,
	output [2:0] okHU,
	inout  [31:0] okUHU,
	inout  okAA,
	input  sys_clkp,
	input  sys_clkn,
	output spi_hold_dq3,
	output spi_w_dq2,
	output [7:0] led
    );

wire sys_clk;
IBUFGDS osc_clk(.O(sys_clk), .I(sys_clkp), .IB(sys_clkn));

wire [112:0] okHE;
wire [64:0] okEH;
reg slow_clk;
reg [31:0] slow_clk_cntr;

wire [63:0] d_in;
wire [63:0] d_out;
wire [15:0] trigger;
wire [63:0] shift_debug_wire;
wire clk;
wire [31:0] control;
wire [31:0] clk_ratio;

reg en;
reg ss_i;
reg [31:0] cntr;

assign spi_s = ss_i;
assign spi_hold_dq3 = 1'b1;
assign spi_w_dq2 = 1'b1;
assign spi_c = clk;
assign led = d_in[63:56];
assign clk = slow_clk;

shift_in in(.CLK(clk),
	.d_in(spi_dq1),
	.d_out(d_out),
	.en(en),
	.rst(trigger[0]));
	
shift_out out(.CLK(~clk),
	.d_out(spi_dq0),
	.d_in(d_in),
	.en(en),
	.rst(trigger[0]),
	.debugContents(shift_debug_wire));
	
initial begin
	ss_i <= 1'b1;
	en <= 1'b0;
end
	
always @ (posedge sys_clk)begin
	if (slow_clk_cntr == 0) begin
		slow_clk_cntr <= clk_ratio;
		slow_clk = ~slow_clk;
	end else begin
		slow_clk_cntr <= slow_clk_cntr - 1;
	end
end

always @ (posedge slow_clk) begin
	if (trigger[0]) begin
		ss_i <= 1'b0;
		cntr <= control;
	end else if (cntr == 0) begin
		en <= 1'b0;
		ss_i <= 1'b1;
	end else begin
		cntr <= cntr - 1;
		if (ss_i == 1'b0)
			en <= 1'b1;
	end
end

wire [4*65 - 1:0] okEHx;
okWireOR # (.N(4)) wireOR (okEH, okEHx);
	
okHost host (.okUH(okUH),
	.okHU(okHU),
	.okUHU(okUHU),
	.okHE(okHE),
	.okEH(okEH));
	
okWireIn data_in (.okHE(okHE), .ep_addr(8'h00), .ep_dataout(d_in[31:0]));
okWireIn data_in2 (.okHE(okHE), .ep_addr(8'h01), .ep_dataout(d_in[63:32]));
okWireIn control_in (.okHE(okHE), .ep_addr(8'h02), .ep_dataout(control));
okWireIn clk_control (.okHE(okHE), .ep_addr(8'h03), .ep_dataout(clk_ratio));

okWireOut data_out (.okHE(okHE), .okEH(okEHx[64:0]), .ep_addr(8'h20), .ep_datain(d_out[31:0]));
okWireOut data_out2 (.okHE(okHE), .okEH(okEHx[2*65-1:1*65]), .ep_addr(8'h21), .ep_datain(d_out[63:32]));
okWireOut debug (.okHE(okHE), .okEH(okEHx[3*65 - 1:2*65]), .ep_addr(8'h22), .ep_datain({spi_dq1, en, ss_i, slow_clk, spi_dq0}));
okWireOut shift_debug (.okHE(okHE), .okEH(okEHx[4*65-1:3*65]), .ep_addr(8'h23), .ep_datain(shift_debug_wire));

okTriggerIn start (.okHE(okHE), .ep_addr(8'h40), .ep_clk(clk), .ep_trigger(trigger));
	
endmodule
