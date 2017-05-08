//----------------------------------------------------------------------------
// ROimager.v - module
//----------------------------------------------------------------------------
//
//----------------------------------------------------------------------------
// Filename:          ROimager.v
// Version:           1.01.a
// Description:       Generating the timing for imager #1, and the TI-ADCs.
//----------------------------------------------------------------------------

module ROImager
(
  RESET,						  // Reset signal to restart the module
  PHI1,							  // PHASE 1 CLK FOR THE CDS STAGE ON CHIP
  ROW_ADD,						  // Pixel array row address
  PIXRES,						  // Pixel row reset
  PRECHN_AMP,					  // Precharge of the input of the output drivers. Active low.
  MUX_ADD,						  // Output driver mux address
  ADC_PIXCLK,					  // Pixel CLK of TI_ADCs
  ADC_CLK,						  // ADC CLK of the TI_ADCs, 3x the ADC_PIXCLK
  CLK_MOD,						  // Modulation clk for the ToF pixel
  CLKN_MOD,						  // Modulation clk for the ToF pixel
//  CLKL_MOD,						  // Modulation clk for light source
  DRAIN_B,						  // Activation signal for ToF pixel clk
  PRECH_COL,					  // Column precharge signal (used during readout)
  ADC_DATA_VALID,				  // It determines when the ADC data is valid
  DDR_DATA_VALID,				  // Determining the validity of the DDR output
  FSMIND0,						  // If high, the Exposure FSM (on OK) is active
  FSMIND1,						  // If high, the ADC FSM (on MOBO) is active
  FSMIND0ACK,					  // Acknowledge for FSMIND0
  FSMIND1ACK					  // Acknowledge for FSMIND1
);

// -- Parameters
parameter phi1_cnt						 = 9;
parameter phi2_cnt						 = 9;
parameter C_NUM_MUX						 = 46;
parameter C_PRECH_cnt					 = 1;
parameter C_NUM_ROWS					 = 160;			// Number of pixel rows in the sensor
parameter tlat3						 	 = 24;			// Number of pix period delays for ADC conversion

// -- Ports 
input									  RESET;
output									  PHI1;
output		[7 : 0]						  ROW_ADD;
output									  PIXRES;
output									  PRECHN_AMP;
output		[5 : 0]						  MUX_ADD;
input									  ADC_PIXCLK;
input									  ADC_CLK;
output									  CLK_MOD;
output									  CLKN_MOD;
//output										CLKL_MOD;
input 									DRAIN_B;
output									  PRECH_COL;
output									  ADC_DATA_VALID;
output									  DDR_DATA_VALID;
output									  FSMIND0;
input									  FSMIND1;
input									  FSMIND0ACK;
output									  FSMIND1ACK;

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  reg				PHI1_i;
  reg				PIXRES_i;
  integer			countpix;
  integer			STATADC;	//FSM state (ADC clk)
  integer			rowadd;
  reg				PRECHN_AMP_i;
  integer			MUX_ADD_i;
  reg				PRECH_COL_i;
  reg				FSMIND0_i;	
  reg				FSMIND1ACK_i;
  reg [29 : 0]		shiftreg;
  reg				DDR_DATA_VALID_int;
  wire				ADC_DATA_Vint;

genvar i;
genvar byte_index;

  initial
    begin
		FSMIND0_i <= 1;
		FSMIND1ACK_i <= 0;
		countpix <= 0;
		PHI1_i <= 0;
		PRECHN_AMP_i <= 0;
		PIXRES_i <= 0;
		rowadd <= C_NUM_ROWS;
		STATADC <= 19;
		MUX_ADD_i <= C_NUM_MUX; 
		PRECH_COL_i <= 0;
		shiftreg <= 0;
   end

	
	always @( posedge ADC_CLK )	begin
		if(RESET) begin
			shiftreg <= 0;
		end else begin
			shiftreg <= {shiftreg[tlat3-1:0],PRECHN_AMP_i};
		end
	end
	
	always @(negedge ADC_CLK) begin
		if(shiftreg[tlat3-1])
			DDR_DATA_VALID_int <= 1;
		else
			DDR_DATA_VALID_int <= 0;
	end

	always @( posedge ADC_PIXCLK )	begin
	if(RESET) begin
		FSMIND1ACK_i <= 0;
		FSMIND0_i <= 1;
		countpix <= 0;
		PHI1_i <= 0;
		PRECHN_AMP_i <= 0;
		PIXRES_i <= 0;
		rowadd <= C_NUM_ROWS;
		STATADC <= 19;
		MUX_ADD_i <= C_NUM_MUX; 
		PRECH_COL_i <= 0;
	end else begin
		case(STATADC)
		// Readout phase
		// RO-PH1 state		
			10: begin
				if(countpix == 0 && rowadd == C_NUM_ROWS) begin
					rowadd <= 0;
					PRECH_COL_i <= 1;
					PHI1_i <= 1;
					countpix <= countpix + 1;
				end else if(countpix==0) begin
					rowadd <= rowadd + 1;
					PRECH_COL_i <= 1;
					PHI1_i <= 1;
					countpix <= countpix + 1;
				end else if(countpix >= C_PRECH_cnt && countpix < phi1_cnt) begin
					PRECH_COL_i <= 0;
					countpix <= countpix + 1;
				end else if(countpix >= phi1_cnt) begin
					PHI1_i <= 0;
					PRECH_COL_i <= 0;
					STATADC <= 11;
					countpix <= 0;
				end else begin	
					countpix <= countpix + 1;
				end
			end
		
		// RO-PH2 state
			11: begin
				if(countpix == 0) begin
					PIXRES_i <= 1;
					countpix <= countpix + 1;
				end else if (countpix >= phi2_cnt) begin
					PIXRES_i <= 0;			// The pixel reset can stay high for the complete muxing period as well.
					countpix <= 0;
					STATADC <= 12;
				end else begin	
					countpix <= countpix + 1;
				end
			end
			
		// RO_MUX_OUT state
			12: begin
				MUX_ADD_i <= countpix;
				if(countpix < C_NUM_MUX && rowadd <= C_NUM_ROWS - 1) begin
					PRECHN_AMP_i <= 1;
					countpix <= countpix + 1;
				end else if(rowadd < C_NUM_ROWS - 1) begin
					countpix <= 0;
					STATADC <= 10;
					PRECHN_AMP_i <= 0;
				end else begin
					rowadd <= C_NUM_ROWS;
					countpix <= 0;
					STATADC <= 18;
					PRECHN_AMP_i <= 0;
				end
			end
		
			18: begin
				FSMIND0_i <= 1;
				FSMIND1ACK_i <= 0;
				if(FSMIND0ACK)
					STATADC <= 19;
			end

		// Activate the other state machine
			19: begin
				FSMIND1ACK_i <= 0;
				if(FSMIND1) begin
					countpix <= 0;
					STATADC <= 20;
					FSMIND0_i <= 0;
				end
					
			end

			20: begin
				FSMIND1ACK_i <= 1;
				PIXRES_i <= 0;
				STATADC <= 10;
			end
		
		// default case
			default: begin
				STATADC <= 10;
				FSMIND0_i <= 1;
				FSMIND1ACK_i <= 0;
				countpix <= 0;
			end

		endcase end
	end
	  
	assign	ADC_DATA_Vint = shiftreg[tlat3-1];
	
//SYNC CLOCK IMPLEMENTATION
  wire			W_CLK_MOD;
  wire			W_FREQ_CHNG;
  wire [3:0]	W_PHASE;
  wire [1:0]	W_PHASE_SEL;
  wire			W_TPNO_IN;
	

//  assign CLK_MOD = DRAIN_B & W_CLK_MOD;
//  DCM_CLKGEN #(
//		.CLKFXDV_DIVIDE(2),
//		.CLKFX_DIVIDE(1),
//		.CLKFX_MD_MAX(5.0),
//		.CLKFX_MULTIPLY(1),
//		.CLK_IN_PERIOD("10.0"),
//		.STARTUP_WAIT("FALSE")
//  )
//  DCM_freqchng (
//		.CLKFX(W_FREQ_CHNG),
//		.CLKIN(ADC_CLK)
//  );
//  
//  DCM_SP #(
//		.CLKDV_DIVIDE(2.0),
//		.CLKFX_DIVIDE(1),
//		.CLKFX_MULTIPLY(4),
//		.CLK_IN_DIVIDE_BY_2("FALSE"),
//		.CLKIN_PERIOD(0.0),
//		.CLKOUT_PHASE_SHIFT("NONE"),
//		.CLK_FEEDBACK("1X"),
//		.DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"),
//		.DLL_FREQUENCY_MODE("LOW"),
//		.DUTY_CYCLE_CORRECTION("TRUE"),
//		.PHASE_SHIFT(0),
//		.STARTUP_WAIT("FALSE")
//	)
//	DCM_phaseselect (
//		.CLK0(W_PHASE[0]),
//		.CLK90(W_PHASE[1],
//		.CLK180(W_PHASE[2]),
//		.CLK270(W_PHASE[3]),
//		.CLKIN(W_FREQ_CHNG)
//	);
//	
// assign CLKL_MOD = W_PHASE[0];
//	assign W_TPNO_IN = W_PHASE[W_PHASESEL);
//	
//	twophase_nonoverlap tpno (
//		.CLK_IN(W_PHASE_SEL),
//		.CLK_OUT(CLK_MOD),
//		.CLK_OUT_N(CLKN_MOD)
//	);
	
	twophase_nonoverlap tpno (
		.CLK_IN(ADC_PIXCLK),
		.CLK_OUT(CLK_MOD),
		.CLK_OUT_N(CLKN_MOD)
	);
	
// END SYNC IMPLEMENTATION
  
  assign		PHI1 = PHI1_i;
  assign		ROW_ADD = rowadd;
  assign		PIXRES = PIXRES_i;
  assign		PRECHN_AMP = PRECHN_AMP_i;
  assign		MUX_ADD = MUX_ADD_i;
//  assign		CLK_MOD = 1;
//  assign		CLKN_MOD = 0;
  assign		PRECH_COL = PRECH_COL_i;
  assign		ADC_DATA_VALID = ADC_DATA_Vint;
  assign		DDR_DATA_VALID = DDR_DATA_VALID_int;
  assign		FSMIND0 = FSMIND0_i;
  assign		FSMIND1ACK = FSMIND1ACK_i;

endmodule
