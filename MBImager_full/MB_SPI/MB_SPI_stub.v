//-----------------------------------------------------------------------------
// MB_SPI_stub.v
//-----------------------------------------------------------------------------

module MB_SPI_stub
  (
    EXT_RESET_N,
    USER_CLOCK,
    SPI_FLASH_SS,
    SPI_FLASH_MOSI,
    SPI_FLASH_SCLK,
    SPI_FLASH_MISO
  );
  input EXT_RESET_N;
  input USER_CLOCK;
  output [9:0] SPI_FLASH_SS;
  output SPI_FLASH_MOSI;
  output SPI_FLASH_SCLK;
  input SPI_FLASH_MISO;

  (* BOX_TYPE = "user_black_box" *)
  MB_SPI
    MB_SPI_i (
      .EXT_RESET_N ( EXT_RESET_N ),
      .USER_CLOCK ( USER_CLOCK ),
      .SPI_FLASH_SS ( SPI_FLASH_SS ),
      .SPI_FLASH_MOSI ( SPI_FLASH_MOSI ),
      .SPI_FLASH_SCLK ( SPI_FLASH_SCLK ),
      .SPI_FLASH_MISO ( SPI_FLASH_MISO )
    );

endmodule

