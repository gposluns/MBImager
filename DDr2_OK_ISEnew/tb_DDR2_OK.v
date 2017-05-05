`timescale 1ns / 1ps
`default_nettype none

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:06 03/03/2017
// Design Name:   MBImager_DDR
// Module Name:   C:/Users/MBImager/Documents/Navid_ISE/DDR2_design/DDR2_OK_ISE/tb_DDR2_OK.v
// Project Name:  DDR2_OK_ISE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MBImager_DDR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_DDR2_OK;

   parameter C3_NUM_DQ_PINS        = 16;

//------------------------------------------------------------------------
// Begin okHostInterface simulation user configurable global data
//------------------------------------------------------------------------
parameter BlockDelayStates = 5;   // REQUIRED: # of clocks between blocks of pipe data
parameter ReadyCheckDelay = 5;    // REQUIRED: # of clocks before block transfer before
                                  //  host interface checks for ready (0-255)
parameter PostReadyDelay = 5;     // REQUIRED: # of clocks after ready is asserted and
                                  //  check that the block transfer begins (0-255)
parameter pipeInSize = 64;        // REQUIRED: byte (must be even) length of default
                                  //  PipeIn; Integer 0-2^32
parameter pipeOutSize = 64;       // REQUIRED: byte (must be even) length of default
                                  // PipeOut; Integer 0-2^32
                                  
parameter registerSetSize = 32;  // Size of array for register set commands.

parameter Tsys_clk = 5;          // 100Mhz
//-------------------------------------------------------------------------

//FrontPanel Host
wire [4:0]   okUH;
wire [2:0]   okHU;
wire [31:0]  okUHU;
wire         okAA;
wire [112:0] okHE;
wire [64:0]  okEH;

reg          sys_clkp;
reg          sys_clkn;

wire  [7:0]   led;

wire [15:0] mcb3_dram_dq;
wire mcb3_dram_udqs;
wire mcb3_dram_udqs_n;
wire mcb3_rzq;
wire mcb3_zio;
wire mcb3_dram_dqs;
wire mcb3_dram_dqs_n;
wire [12:0] mcb3_dram_a;
wire [2:0] mcb3_dram_ba;
wire mcb3_dram_ras_n;
wire mcb3_dram_cas_n;
wire mcb3_dram_we_n;
wire mcb3_dram_odt;
wire mcb3_dram_cke;
wire mcb3_dram_dm;
wire mcb3_dram_udm;
wire mcb3_dram_ck;
wire mcb3_dram_ck_n;


	// Instantiate the Unit Under Test (UUT)
	MBImager_DDR uut (
		.okUH(okUH), 
		.okHU(okHU), 
		.okUHU(okUHU), 
		.okAA(okAA), 
		.c3_sys_clk_n(sys_clkn), 
		.c3_sys_clk_p(sys_clkp), 
		.led(led), 
		.mcb3_dram_dq(mcb3_dram_dq), 
		.mcb3_dram_a(mcb3_dram_a), 
		.mcb3_dram_ba(mcb3_dram_ba), 
		.mcb3_dram_ras_n(mcb3_dram_ras_n), 
		.mcb3_dram_cas_n(mcb3_dram_cas_n), 
		.mcb3_dram_we_n(mcb3_dram_we_n), 
		.mcb3_dram_odt(mcb3_dram_odt), 
		.mcb3_dram_cke(mcb3_dram_cke), 
		.mcb3_dram_dm(mcb3_dram_dm), 
		.mcb3_dram_udqs(mcb3_dram_udqs), 
		.mcb3_dram_udqs_n(mcb3_dram_udqs_n), 
		.mcb3_rzq(mcb3_rzq), 
		.mcb3_zio(mcb3_zio), 
		.mcb3_dram_udm(mcb3_dram_udm), 
		.mcb3_dram_dqs(mcb3_dram_dqs), 
		.mcb3_dram_dqs_n(mcb3_dram_dqs_n), 
		.mcb3_dram_ck(mcb3_dram_ck), 
		.mcb3_dram_ck_n(mcb3_dram_ck_n)
	);

// ========================================================================== //
// Memory model instances                                                     // 
// ========================================================================== //

   generate
      if(C3_NUM_DQ_PINS == 16) begin : MEM_INST3
     ddr2_model_c3 u_mem_c3(
        .ck         (mcb3_dram_ck),
        .ck_n       (mcb3_dram_ck_n),
        .cke        (mcb3_dram_cke),
        .cs_n       (1'b0),
        .ras_n      (mcb3_dram_ras_n),
        .cas_n      (mcb3_dram_cas_n),
        .we_n       (mcb3_dram_we_n),
        .dm_rdqs    ({mcb3_dram_udm,mcb3_dram_dm}),
        .ba         (mcb3_dram_ba),
        .addr       (mcb3_dram_a),
        .dq         (mcb3_dram_dq),
        .dqs        ({mcb3_dram_udqs,mcb3_dram_dqs}),
        .dqs_n      ({mcb3_dram_udqs_n,mcb3_dram_dqs_n}),
        .rdqs_n     (),
        .odt        (mcb3_dram_odt)
      );
      end else begin
     ddr2_model_c3 u_mem_c3(
        .ck         (mcb3_dram_ck),
        .ck_n       (mcb3_dram_ck_n),
        .cke        (mcb3_dram_cke),
        .cs_n       (1'b0),
        .ras_n      (mcb3_dram_ras_n),
        .cas_n      (mcb3_dram_cas_n),
        .we_n       (mcb3_dram_we_n),
        .dm_rdqs    (mcb3_dram_dm),
        .ba         (mcb3_dram_ba),
        .addr       (mcb3_dram_a),
        .dq         (mcb3_dram_dq),
        .dqs        (mcb3_dram_dqs),
        .dqs_n      (mcb3_dram_dqs_n),
        .rdqs_n     (),
        .odt        (mcb3_dram_odt)
      );
     end
   endgenerate

//Clocks
initial sys_clkp = 0;
initial sys_clkn = 1;
always #Tsys_clk sys_clkp = ~sys_clkp;
always #Tsys_clk sys_clkn = ~sys_clkn;

//FrontPanel Data Structures for Pipes and Registers
reg [7:0] pipeIn [0:(pipeInSize-1)];
initial for (k=0; k<pipeInSize; k=k+1) pipeIn[k] = $random; // Random words for DES encrypting
reg [7:0] pipeOut [0:(pipeOutSize-1)];
initial for (k=0; k<pipeOutSize; k=k+1) pipeOut[k] = 8'h00;
//Registers
reg [31:0] u32Address  [0:(registerSetSize-1)];
reg [31:0] u32Data     [0:(registerSetSize-1)];
reg [31:0] u32Count;
// wireouts
reg [31:0] wire30out;

// Process
integer k, e;
reg des_done;
reg rd_done;
reg wr_done;

// Start/Stop addresses; Set to whatever the user wishes
reg	[15:0]	memc_var [0:3];
initial begin
	memc_var[0] = 16'h002a;
	memc_var[1] = 16'h0010;
	memc_var[2] = 16'h0010;
	memc_var[3] = 16'h0050;
end


//------------------------------------------------------------------------
//  Available User Task and Function Calls:
//    FrontPanelReset;                 // Always start routine with FrontPanelReset;
//    SetWireInValue(ep, val, mask);
//    UpdateWireIns;
//    UpdateWireOuts;
//    GetWireOutValue(ep);
//    ActivateTriggerIn(ep, bit);      // bit is an integer 0-15
//    UpdateTriggerOuts;
//    IsTriggered(ep, mask);           // Returns a 1 or 0
//    WriteToPipeIn(ep, length);       // passes pipeIn array data
//    ReadFromPipeOut(ep, length);     // passes data to pipeOut array
//    WriteToBlockPipeIn(ep, blockSize, length);   // pass pipeIn array data; blockSize and length are integers
//    ReadFromBlockPipeOut(ep, blockSize, length); // pass data to pipeOut array; blockSize and length are integers
//    WriteRegister(addr, data);  
//    ReadRegister(addr, data);
//    WriteRegisterSet();  
//    ReadRegisterSet();
//
//    *Pipes operate by passing arrays of data back and forth to the user's
//    design.  If you need multiple arrays, you can create a new procedure
//    above and connect it to a differnet array.  More information is
//    available in Opal Kelly documentation and online support tutorial.
//------------------------------------------------------------------------

// User configurable block of called FrontPanel operations.
initial begin
	des_done = 0;
	FrontPanelReset;              // Start routine with FrontPanelReset;

	// Assert then deassert RESET
	SetWireInValue(8'h00, 32'hffff, 32'h0001);
	UpdateWireIns;
	SetWireInValue(8'h00, 32'h0000, 32'h0001);
	UpdateWireIns;
	$display("Reset at:                             %dns", $time);

	// Set the DES key value (WireIns)
	// for (k=0; k<4; k=k+1) SetWireInValue((8'h0b - k), key[k], 32'hffff);
	// $display("Set DES key at:                       %dns", $time);
	// Set memc_var, memory variables, rd/wr start/stop addr
	for (k=0; k<4; k=k+1) SetWireInValue((8'h01 + k), memc_var[k], 32'hffff);
	UpdateWireIns;
	$display("Set memc_var at:                       %dns", $time);
	
	// Set the write request bit
	SetWireInValue(8'h00, 32'h0008, 32'h0008);
	UpdateWireIns;
	$display("Encrypt bit set at:                   %dns", $time);
	
	// Reset the RAM address pointer
	ActivateTriggerIn(8'h41, 0);
    $display("Reset the RAM address pointer at:     %dns", $time);
  
	// Write a block of data
	WriteToPipeIn(8'h80, pipeInSize);
	$display("Write data block to encrypt at:       %dns", $time);
	
	// Perform DES encrypting on the block
	ActivateTriggerIn(8'h40, 0);
	$display("Begin DES encrypting at:              %dns", $time);
	
	// Wait for a trigger indicating that the DES is done
	wr_done=0;
	
	while (wr_done==0) begin
		UpdateTriggerOuts;
		wr_done = IsTriggered(8'h60, 32'h0001);
	end
	$display("Write to memory complete at:           %dns", $time);
	
	// Deassert the write request and assert read request
	SetWireInValue(8'h00, 32'h0004, 32'h0004);
	UpdateWireIns;
	$display("Encrypt bit set at:                   %dns", $time);
	
	rd_done=0;
	while (rd_done==0) begin
		UpdateWireOuts;
		wire30out = GetWireOutValue(8'h30);
		if (wire30out[18:11] == pipeOutSize)
			rd_done = 1;
	end
	
	// Pull out memory data into pipeOut array
	ReadFromPipeOut(8'ha0, pipeOutSize);
	$display("Read memory data block at:         %dns", $time);

	// We compare the sent data to the memory with the received data
	// If all match, the control signals are working
	e=0;
	for (k=0; k<pipeInSize; k=k+1) begin
		if (pipeOut[k] != pipeIn[k]) begin
			e=e+1;	// Keep track of the number of errors
			$display(" ");
			$display("Error! %d value not transfered properly!", k);
		end
	end
	
	if (e == 0) begin
		$display(" ");
		$display("Success! All data write and read operations have been properly done.");
		for (k=0; k<pipeInSize; k=k+2)
		$display("%d 0x%02h%02h encoded as 0x%02h%02h", k, pipeOut[k+1], pipeOut[k], pipeIn[k+1], pipeIn[k]);
	end

	$display("Simulation done at: %dns", $time);
	
end

`include "./oksim/okHostCalls.v"   // Do not remove!  The tasks, functions, and data stored
                                   // in okHostCalls.v must be included here.

endmodule

