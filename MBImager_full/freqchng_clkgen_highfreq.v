//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:56 06/01/2017 
// Design Name: 
// Module Name:    freqchng_clkgen_highfreq 
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
`timescale 1ps/1ps

(* CORE_GENERATION_INFO = "freqchng_clkgen,clk_wiz_v3_6,{component_name=freqchng_clkgen,use_phase_alignment=false,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_ONCHIP,primtype_sel=PLL_BASE,num_out_clk=3,clkin1_period=10.000,clkin2_period=10.000,use_power_down=false,use_reset=true,use_locked=true,use_inclk_stopped=false,use_status=false,use_freeze=false,use_clk_valid=false,feedback_type=SINGLE,clock_mgr_type=MANUAL,manual_override=false}" *)
module freqchng_clkgen_highfreq
 (// Clock in ports
  input         CLK_IN,
  // Clock out ports
  output        CLK_OUT_10MHz,
  output        CLK_OUT_25MHz,
  output        CLK_OUT_50MHz,
  // Status and control signals
  input         RESET,
  output        LOCKED
 );

  // Input buffering
  //------------------------------------
  BUFG clkin1_buf
   (.O (clkin1),
    .I (CLK_IN));


  // Clocking primitive
  //------------------------------------
  // Instantiation of the PLL primitive
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        clkfbout;
  wire        clkout3_unused;
  wire        clkout4_unused;
  wire        clkout5_unused;

  PLL_BASE
  #(.BANDWIDTH              ("OPTIMIZED"),
    .CLK_FEEDBACK           ("CLKFBOUT"),
    .COMPENSATION           ("INTERNAL"),
    .DIVCLK_DIVIDE          (1),
    .CLKFBOUT_MULT          (8),
    .CLKFBOUT_PHASE         (0.000),
    .CLKOUT0_DIVIDE         (5),
    .CLKOUT0_PHASE          (0.000),
    .CLKOUT0_DUTY_CYCLE     (0.500),
    .CLKOUT1_DIVIDE         (2),
    .CLKOUT1_PHASE          (0.000),
    .CLKOUT1_DUTY_CYCLE     (0.500),
    .CLKOUT2_DIVIDE         (2),
    .CLKOUT2_PHASE          (0.000),
    .CLKOUT2_DUTY_CYCLE     (0.500),
    .CLKIN_PERIOD           (10.000),
    .REF_JITTER             (0.010))
  pll_base_inst
    // Output clocks
   (.CLKFBOUT              (clkfbout),
    .CLKOUT0               (clkout0),
    .CLKOUT1               (clkout1),
    .CLKOUT2               (clkout2),
    .CLKOUT3               (clkout3_unused),
    .CLKOUT4               (clkout4_unused),
    .CLKOUT5               (clkout5_unused),
    // Status and control signals
    .LOCKED                (LOCKED),
    .RST                   (RESET),
     // Input clock control
    .CLKFBIN               (clkfbout),
    .CLKIN                 (clkin1));


  // Output buffering
  //-----------------------------------

  assign CLK_OUT_10MHz = clkout0;

  assign CLK_OUT_25MHz = clkout1;

  assign CLK_OUT_50MHz = clkout2;



endmodule
