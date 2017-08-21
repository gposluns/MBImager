//----------------------------------------------------------------------------
// user_logic.v - module
//----------------------------------------------------------------------------
//
//----------------------------------------------------------------------------
// Filename:          TI_ADC_RO.v
// Version:           1.00.a
// Description:       Sampling the TI ADCs outputs in the FPGA.
// Date:              2016-07-08
// Verilog Standard:  Verilog-2001
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------


module TI_ADC_RO
(
  DATA_IN_FROM_PINS1,
  DATA_IN_TO_DEVICE1,
  DATA_IN_FROM_PINS2,
  DATA_IN_TO_DEVICE2,
  CLK_IN,
  CLK_EN
 ); // TI_ADC_RO

// --USER ports
input		[7:0] 						  DATA_IN_FROM_PINS1;
output		[15:0] 						  DATA_IN_TO_DEVICE1;
input		[7:0] 						  DATA_IN_FROM_PINS2;
output		[15:0] 						  DATA_IN_TO_DEVICE2;
input 									  CLK_IN;
input 									  CLK_EN;

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  // --nets declarations added here

  // Signal declarations
  ////------------------------------
  // After the buffer
  wire   [7:0] data_in_from_pins_int1;
  wire   [7:0] data_in_from_pins_int2;
  // Between the delay and serdes
  wire [7:0]  data_in_from_pins_delay1;
  wire [7:0]  data_in_from_pins_delay2;
  // Tri-state output of the delay stages -- Not used.
  wire [7:0]	TOUT_1;
  wire [7:0]	TOUT_2;

integer i;
integer byte_index;

  // --implementation added here

	// Create the clock logic
	assign clk_in_inv = ~CLK_IN;

	// We have multiple bits- step over every bit, instantiating the required elements
  genvar pin_count;
  generate for (pin_count = 0; pin_count < 8; pin_count = pin_count + 1) begin: pins
    // Instantiate the buffers
    ////------------------------------
    // Instantiate a buffer for every bit of the data bus
    IBUF
      #(.IOSTANDARD ("LVCMOS33"))
     ibuf_inst1
       (.I          (DATA_IN_FROM_PINS1    [pin_count]),
        .O          (data_in_from_pins_int1[pin_count]));
    IBUF
      #(.IOSTANDARD ("LVCMOS33"))
     ibuf_inst2
       (.I          (DATA_IN_FROM_PINS2    [pin_count]),
        .O          (data_in_from_pins_int2[pin_count]));
 
	// Instantiate the delay primitive
    ////-------------------------------
	assign data_in_from_pins_delay1[pin_count] = data_in_from_pins_int1[pin_count];
	assign data_in_from_pins_delay2[pin_count] = data_in_from_pins_int2[pin_count];

	// IODELAY2
   // #(
     // .DATA_RATE                  ("DDR"),
     // .IDELAY_VALUE               (0),
     // .IDELAY_TYPE                ("FIXED"),
     // .COUNTER_WRAPAROUND         ("STAY_AT_LIMIT"),
     // .DELAY_SRC                  ("IDATAIN"),
     // .SERDES_MODE                ("NONE"),
     // .SIM_TAPDELAY_VALUE         (75))
   // iodelay2_inst1
    // (
     // // required datapath
     // .IDATAIN                (data_in_from_pins_int1[pin_count]),
     // .DATAOUT                (data_in_from_pins_delay1[pin_count]),
     // .T                      (1'b1),
     // // inactive data connections
     // .DATAOUT2               (),
     // .DOUT                   (),
     // .ODATAIN                (1'b0),
     // .TOUT                   (),
     // // tie off the clocks
     // .IOCLK0                 (1'b0),                 // No calibration needed
     // .IOCLK1                 (1'b0),                 // No calibration needed
     // // Tie of the variable delay programming
     // .CLK                    (1'b0),
     // .CAL                    (1'b0),
     // .INC                    (1'b0),
     // .CE                     (1'b0),
     // .BUSY                   (),
     // .RST                    (1'b0));

	// IODELAY2
   // #(
     // .DATA_RATE                  ("DDR"),
     // .IDELAY_VALUE               (0),
     // .IDELAY_TYPE                ("FIXED"),
     // .COUNTER_WRAPAROUND         ("STAY_AT_LIMIT"),
     // .DELAY_SRC                  ("IDATAIN"),
     // .SERDES_MODE                ("NONE"),
     // .SIM_TAPDELAY_VALUE         (75))
   // iodelay2_inst2
    // (
     // // required datapath
     // .IDATAIN                (data_in_from_pins_int2[pin_count]),
     // .DATAOUT                (data_in_from_pins_delay2[pin_count]),
     // .T                      (1'b1),
     // // inactive data connections
     // .DATAOUT2               (),
     // .DOUT                   (),
     // .ODATAIN                (1'b0),
     // .TOUT                   (),
     // // tie off the clocks
     // .IOCLK0                 (1'b0),                 // No calibration needed
     // .IOCLK1                 (1'b0),                 // No calibration needed
     // // Tie of the variable delay programming
     // .CLK                    (1'b0),
     // .CAL                    (1'b0),
     // .INC                    (1'b0),
     // .CE                     (1'b0),
     // .BUSY                   (),
     // .RST                    (1'b0));

	// IODELAY2
   // #(
     // .DATA_RATE                  ("DDR"),
     // .IDELAY_VALUE               (0),
     // .IDELAY_TYPE                ("FIXED"),
     // .COUNTER_WRAPAROUND         ("STAY_AT_LIMIT"),
     // .DELAY_SRC                  ("IDATAIN"),
     // .SERDES_MODE                ("NONE"),
     // .SIM_TAPDELAY_VALUE         (75))
   // iodelay2_inst3
    // (
     // // required datapath
     // .IDATAIN                (data_in_from_pins_int3[pin_count]),
     // .DATAOUT                (data_in_from_pins_delay3[pin_count]),
     // .T                      (1'b1),
     // // inactive data connections
     // .DATAOUT2               (),
     // .DOUT                   (),
     // .ODATAIN                (1'b0),
     // .TOUT                   (),
     // // tie off the clocks
     // .IOCLK0                 (1'b0),                 // No calibration needed
     // .IOCLK1                 (1'b0),                 // No calibration needed
     // // Tie of the variable delay programming
     // .CLK                    (1'b0),
     // .CAL                    (1'b0),
     // .INC                    (1'b0),
     // .CE                     (1'b0),
     // .BUSY                   (),
     // .RST                    (1'b0));

	
	// Connect the delayed data to the fabric
	////--------------------------------------
	// DDR register instantation
    IDDR2
     #(.DDR_ALIGNMENT  ("C0"),
       .INIT_Q0        (1'b0),
       .INIT_Q1        (1'b0),
       .SRTYPE         ("ASYNC"))
     iddr2_inst1
      (.Q0             (DATA_IN_TO_DEVICE1[pin_count]),
       .Q1             (DATA_IN_TO_DEVICE1[8 + pin_count]),
       .C0             (clk_in_inv),
       .C1             (CLK_IN),
       .CE             (CLK_EN),
       .D              (data_in_from_pins_delay1[pin_count]),
       .R              (1'b0),
       .S              (1'b0));

    IDDR2
     #(.DDR_ALIGNMENT  ("C0"),
       .INIT_Q0        (1'b0),
       .INIT_Q1        (1'b0),
       .SRTYPE         ("ASYNC"))
     iddr2_inst2
      (.Q0             (DATA_IN_TO_DEVICE2[pin_count]),
       .Q1             (DATA_IN_TO_DEVICE2[8 + pin_count]),
       .C0             (clk_in_inv),
       .C1             (CLK_IN),
       .CE             (CLK_EN),
       .D              (data_in_from_pins_delay2[pin_count]),
       .R              (1'b0),
       .S              (1'b0));

  end
  endgenerate

endmodule
