`timescale 1ns/1ps
`default_nettype none

module reveal_tf;

	//FrontPanel Host
	wire [4:0]   okUH;
	wire [2:0]   okHU;
	wire [31:0]  okUHU;
	wire         okAA;
	
	wire [7:0] led;
	
	//ok_imager
	wire [5:0] im_data;
	wire im_data_val;
	wire im_data_clk;
	wire [18:1] MSTREAM;
	
	wire CLKM;
	wire CLKMPRE;
	wire STREAM;
	wire OK_DRAIN_B;
	wire OK_PIXRES_GLOB;
	wire FPGA_rst_n;	
	
	// Design-Top Port Map   
	wire [12:0]    mcb3_dram_a;
	wire [2:0]  mcb3_dram_ba;  
	wire                             mcb3_dram_ck;  
	wire                             mcb3_dram_ck_n;
	wire [15:0]        mcb3_dram_dq;   
	wire                             mcb3_dram_dqs;  
	wire                             mcb3_dram_dqs_n;
	wire                             mcb3_dram_dm; 
	wire                             mcb3_dram_ras_n; 
	wire                             mcb3_dram_cas_n; 
	wire                             mcb3_dram_we_n;  
	wire                             mcb3_dram_cke; 
	wire                             mcb3_dram_odt;

	wire                             mcb3_dram_udqs;    // for X16 parts
	wire                             mcb3_dram_udqs_n;  // for X16 parts
	wire                             mcb3_dram_udm;     // for X16 parts

	// Error & Calib Signals
	wire                             calib_done;
	wire				    rzq3;
	wire				    zio3;
	
	
// ========================================================================== //
// Clocks Generation                                                          //
// ========================================================================== //
 // Clocks
	reg								c3_sys_clk;
	wire               				c3_sys_clk_p;
	wire                             c3_sys_clk_n;
	reg								sys_clk;
	wire               				sys_clk_p;
	wire                            sys_clk_n;
	
	parameter C3_MEMCLK_PERIOD     = 3.2;
   initial
      c3_sys_clk = 1'b0;
   always
      #(C3_MEMCLK_PERIOD/2) c3_sys_clk = ~c3_sys_clk;

   assign                c3_sys_clk_p = c3_sys_clk;
   assign                c3_sys_clk_n = ~c3_sys_clk;
   
   parameter SYS_CLK_PERIOD     = 10;//100MHZ;
   initial
      sys_clk = 1'b0;
   always
      #(SYS_CLK_PERIOD/2) sys_clk = ~sys_clk;

   assign                sys_clk_p = sys_clk;
   assign                sys_clk_n = ~sys_clk;
   
   
// The PULLDOWN component is connected to the ZIO signal primarily to avoid the
// unknown state in simulation. In real hardware, ZIO should be a no connect(NC) pin.
   PULLDOWN zio_pulldown3 (.O(zio3));   PULLDOWN rzq_pulldown3 (.O(rzq3));

    wire EN_STREAM;			//Enable pattern upload (active high)
	 wire DRAIN;					//
	 wire PIXGLOB_RES;			//
	 wire [7:0] ROWADD;		//Row address for readout
	 wire COL_L_EN;				//When high, read from left bucket, when low read from right bucket
	 wire PIXRES_L;				//Reset left bucket
	 wire PIXRES_R;				//Reset right bucket
	 wire STDBY;					//Standby signal high when no readout is occuring
	 wire PRECH_COL;			//Signal to start readout
	 wire PGA_RES;				//Reset Programmable Gain Amplifier circuit
	 wire CK_PH1;				//Clock signal to PGA (more like a pump imo)
	 wire SAMP_S;				//Sample signal
	 wire SAMP_R;				//Sampe Reset
	 wire READ_R;				//Read Reset from ADC
	 wire READ_S;				//Read Signal from ADC
	 wire MUX_START;			//Signal to start imager multiplexer
	 wire CP_COLMUX_IN;			//Signal to multiplexer to select next level
	 reg ADC_CLKOUT;			//data clock generated by ADCs
	 wire ADC_PIXCLK;			//pixel read clock to ADCs
	 reg [7:0] ADC_DIN1;
	 reg [7:0] ADC_DIN2;
	 
	 initial ADC_CLKOUT = 0;
	 initial ADC_DIN1 = 0;
	 initial ADC_DIN2 = 0;
	
	wire CLK100MHz;

	// Instantiate the Unit Under Test (UUT)
	Reveal_top uut (
		.EN_STREAM(EN_STREAM),			//Enable pattern upload (active high)
	 .DRAIN(DRAIN),					//
	 .PIXGLOB_RES(PIXGLOB_RES),			//
	 .ROWADD(ROWADD),		//Row address for readout
	 .COL_L_EN(COL_L_EN),				//When high, read from left bucket, when low read from right bucket
	 .PIXRES_L(PIXRES_L),				//Reset left bucket
	 .PIXRES_R(PIXRES_R),				//Reset right bucket
	 .STDBY(STDBY),					//Standby signal high when no readout is occuring
	 .PRECH_COL(PRECH_COL),			//Signal to start readout
	 .PGA_RES(PGA_RES),				//Reset Programmable Gain Amplifier circuit
	 .CK_PH1(CK_PH1),				//Clock signal to PGA (more like a pump imo)
	 .SAMP_S(SAMP_S),				//Sample signal
	 .SAMP_R(SAMP_R),				//Sampe Reset
	 .READ_R(READ_R),				//Read Reset from ADC
	 .READ_S(READ_S),				//Read Signal from ADC
	 .MUX_START(MUX_START),			//Signal to start imager multiplexer
	 .CP_COLMUX_IN(CP_COLMUX_IN),			//Signal to multiplexer to select next level
	 .ADC_CLKOUT(ADC_CLKOUT),			//data clock generated by ADCs
	 .ADC_PIXCLK(ADC_PIXCLK),			//pixel read clock to ADCs
	 .ADC_DIN1(ADC_DIN1),
	 .ADC_DIN2(ADC_DIN2),
	
	.CLK100MHz(CLK100MHz),
	
		.okUH(okUH), 
		.okHU(okHU), 
		.okUHU(okUHU), 
		.okAA(okAA), 
		.sys_clkn(sys_clk_n), 
		.sys_clkp(sys_clk_p), 
		.led(led), 
//		.im_data(im_data), 
//		.im_data_val(im_data_val), 
//		.im_data_clk(im_data_clk), 
		.FPGA_rst_n(FPGA_rst_n), 
		.CLKM(CLKM), 
		.CLKMPRE(CLKMPRE), 
		.STREAM(STREAM), 
		.mStream(MSTREAM), 
		.OK_DRAIN_B(OK_DRAIN_B), 
		.OK_PIXRES_GLOB(OK_PIXRES_GLOB), 
		
		//MCB signals
		//.c3_sys_clk_n(c3_sys_clk_n),
		//.c3_sys_clk_p(c3_sys_clk_p),

		.mcb3_dram_dq           (mcb3_dram_dq),  
		.mcb3_dram_a            (mcb3_dram_a),  
		.mcb3_dram_ba           (mcb3_dram_ba),
		.mcb3_dram_ras_n        (mcb3_dram_ras_n),                        
		.mcb3_dram_cas_n        (mcb3_dram_cas_n),                        
		.mcb3_dram_we_n         (mcb3_dram_we_n),                          
		.mcb3_dram_odt          (mcb3_dram_odt),
		.mcb3_dram_cke          (mcb3_dram_cke),                          
		.mcb3_dram_ck           (mcb3_dram_ck),                          
		.mcb3_dram_ck_n         (mcb3_dram_ck_n),
		.mcb3_dram_dqs          (mcb3_dram_dqs),
		.mcb3_dram_dqs_n        (mcb3_dram_dqs_n),
		.mcb3_dram_udqs         (mcb3_dram_udqs),    // for X16 parts                        
		.mcb3_dram_udqs_n       (mcb3_dram_udqs_n),  // for X16 parts
		.mcb3_dram_udm          (mcb3_dram_udm),     // for X16 parts
		.mcb3_dram_dm           (mcb3_dram_dm),
		.mcb3_rzq               (rzq3),
		.mcb3_zio               (zio3),
		.c3_calib_done				(calib_done)
	);
	
// ========================================================================== //
// Memory model instances                                                     // 
// ========================================================================== //
	parameter C3_NUM_DQ_PINS			= 16;
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
	
	
	
	//------------------------------------------------------------------------
	// Begin okHostInterface simulation user configurable  global data
	//------------------------------------------------------------------------
	parameter BlockDelayStates = 5;   // REQUIRED: # of clocks between blocks of pipe data
	parameter ReadyCheckDelay = 5;    // REQUIRED: # of clocks before block transfer before
												 //           host interface checks for ready (0-255)
	parameter PostReadyDelay = 5;     // REQUIRED: # of clocks after ready is asserted and
												 //           check that the block transfer begins (0-255)
	parameter pipeInSize = 176*16*4*5;      // REQUIRED: byte (must be even) length of default
												 //           PipeIn; Integer 0-2^32
	parameter pipeOutSize = 128;     // REQUIRED: byte (must be even) length of default
												 //           PipeOut; Integer 0-2^32
	parameter registerSetSize = 16;  // Size of array for register set commands.
	
	integer k;
	reg  [7:0]  pipeIn [0:(pipeInSize-1)];
	//initial for (k=0; k<pipeInSize; k=k+1) pipeIn[k] = k;
	initial begin
		for (k=0; k<pipeInSize; k=k+1) begin
			if (k < 176*16*4)
				pipeIn[k] = 8'h00;	
			else if(k >= 176*16*4*4)
				pipeIn[k] = 8'h00;
			else
				pipeIn[k] = k-176*16*4;
		end
	end

	reg  [7:0]  pipeOut [0:(pipeOutSize-1)];
	initial for (k=0; k<pipeOutSize; k=k+1) pipeOut[k] = k;
	
	
		
	//Registers
	reg [31:0] u32Address  [0:(registerSetSize-1)];
	reg [31:0] u32Data     [0:(registerSetSize-1)];
	reg [31:0] u32Count;	
	
	
	initial begin
		$display("1 %d", $time);
		FrontPanelReset();
		$display("2 %d", $time);				// Start routine with FrontPanelReset;
		SetWireInValue(8'h10, 32'hffff, 32'h000f);     // rst
		SetWireInValue(8'h12, 32'd3, 32'hffffffff);     //wire num_pat
		SetWireInValue(8'h11, 32'd20, 32'hffffffff);  	//wireexp 
		SetWireInValue(8'h19, 32'd20, 32'hffffffff);  	//proj trig
		
		//SetWireInValue(8'h15, 32'b00000000000000000000001010101010, 32'hffffffff);  	//pattern
		SetWireInValue(8'h18, 32'h0, 32'hffffffff);
		$display("6 %d", $time);
		UpdateWireIns();
		$display("Reset at:                             %dns", $time);
		#1000;
		
		SetWireInValue(8'h10, 32'h0000, 32'hffff);     // FRONTPANEL API
		UpdateWireIns();       
		$display("start at:                             %dns", $time);
		
		wait(calib_done);
		//#35000;
		$display("Calibration Done");
		
		ActivateTriggerIn(8'h53, 0);
		$display("Write Pattern at:                             %dns", $time);
		#10;
		
		WriteToPipeIn(8'h80, pipeInSize);
		$display("write to pipe at:                             %dns", $time);
	
		/* #200000;
		SetWireInValue(8'h10, 32'hffff, 32'h000f);     // rst
		UpdateWireIns;
		#5000;
		SetWireInValue(8'h10, 32'h0000, 32'hffff);     // FRONTPANEL API
		UpdateWireIns;       
		
		#35000; 
		wait(calib_done);
		$display("Calibration Done");
		
		ActivateTriggerIn(8'h53, 0);
		$display("Write Pattern at:                             %dns", $time);
		#10;
		
		WriteToPipeIn(8'h80, pipeInSize);
		$display("write to pipe at:                             %dns", $time);
		 */
	end
	
	/*always @* begin
		if (FSMIND1)
			 #20000 FSMIND0 = 1;
		else
			FSMIND0 = 0;
	end
			
	always @* begin
		if(FSMIND1)
			#10000 FSMIND1ACK = 1;
		else
			FSMIND1ACK = 0;
	end*/
	
`include "okHostCalls.v"   	

endmodule