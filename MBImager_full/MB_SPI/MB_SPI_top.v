//-----------------------------------------------------------------------------
// MB_SPI_top.v
//-----------------------------------------------------------------------------

module MB_SPI_top
  (
    EXT_RESET_N,
    USER_CLOCK,
    SPI_FLASH_SS,
    SPI_FLASH_MOSI,
    SPI_FLASH_SCLK,
    SPI_FLASH_MISO,
    okHE,
    hdl_control_0_OUT3_pin,
    hdl_receive_0_IN4_pin,
    oktriggerouts_0_okEH_pin,
    okwireouts_0_okEH_pin
  );
  input EXT_RESET_N;
  input USER_CLOCK;
  output [9:0] SPI_FLASH_SS;
  output SPI_FLASH_MOSI;
  output SPI_FLASH_SCLK;
  input SPI_FLASH_MISO;
  input [112:0] okHE;
  output [31:0] hdl_control_0_OUT3_pin;
  input [31:0] hdl_receive_0_IN4_pin;
  output [64:0] oktriggerouts_0_okEH_pin;
  output [64:0] okwireouts_0_okEH_pin;

  (* BOX_TYPE = "user_black_box" *)
  MB_SPI
    MB_SPI_i (
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

endmodule

