//-----------------------------------------------------------------------------
// MB_SPI_tb.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver

// START USER CODE (Do not remove this line)

// User: Put your directives here. Code in this
//       section will not be overwritten.

// END USER CODE (Do not remove this line)

module MB_SPI_tb
  (
  );

  // START USER CODE (Do not remove this line)

  // User: Put your signals here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)


  // Internal signals

  reg EXT_RESET_N;
  reg SPI_FLASH_MISO;
  wire SPI_FLASH_MOSI;
  wire SPI_FLASH_SCLK;
  wire [9:0] SPI_FLASH_SS;
  reg USER_CLOCK;
  wire [31:0] hdl_control_0_OUT3_pin;
  reg [31:0] hdl_receive_0_IN4_pin;
  reg [112:0] okHE;
  wire [64:0] oktriggerouts_0_okEH_pin;
  wire [64:0] okwireouts_0_okEH_pin;

  MB_SPI
    dut (
      .EXT_RESET_N ( EXT_RESET_N ),
      .USER_CLOCK ( USER_CLOCK ),
      .SPI_FLASH_SS ( SPI_FLASH_SS ),
      .SPI_FLASH_MOSI ( SPI_FLASH_MOSI ),
      .SPI_FLASH_SCLK ( SPI_FLASH_SCLK ),
      .SPI_FLASH_MISO ( SPI_FLASH_MISO ),
      .okHE ( okHE ),
      .hdl_control_0_OUT3_pin ( hdl_control_0_OUT3_pin ),
      .hdl_receive_0_IN4_pin ( hdl_receive_0_IN4_pin ),
      .oktriggerouts_0_okEH_pin ( oktriggerouts_0_okEH_pin ),
      .okwireouts_0_okEH_pin ( okwireouts_0_okEH_pin )
    );

  // START USER CODE (Do not remove this line)

  // User: Put your stimulus here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)

endmodule

