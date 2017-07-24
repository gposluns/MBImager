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

  MB_SPI
    dut (
      .EXT_RESET_N ( EXT_RESET_N ),
      .USER_CLOCK ( USER_CLOCK ),
      .SPI_FLASH_SS ( SPI_FLASH_SS ),
      .SPI_FLASH_MOSI ( SPI_FLASH_MOSI ),
      .SPI_FLASH_SCLK ( SPI_FLASH_SCLK ),
      .SPI_FLASH_MISO ( SPI_FLASH_MISO )
    );

  // START USER CODE (Do not remove this line)

  // User: Put your stimulus here. Code in this
  //       section will not be overwritten.

  // END USER CODE (Do not remove this line)

endmodule

