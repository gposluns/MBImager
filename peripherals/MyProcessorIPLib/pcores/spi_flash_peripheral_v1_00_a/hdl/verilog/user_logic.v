//----------------------------------------------------------------------------
// user_logic.v - module
//----------------------------------------------------------------------------
//
// ***************************************************************************
// ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
// **                                                                       **
// ** Xilinx, Inc.                                                          **
// ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
// ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
// ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
// ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
// ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
// ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
// ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
// ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
// ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
// ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
// ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
// ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
// ** FOR A PARTICULAR PURPOSE.                                             **
// **                                                                       **
// ***************************************************************************
//
//----------------------------------------------------------------------------
// Filename:          user_logic.v
// Version:           1.00.a
// Description:       User logic module.
// Date:              Tue May 09 14:44:07 2017 (by Create and Import Peripheral Wizard)
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

`uselib lib=unisims_ver
`uselib lib=proc_common_v3_00_a

module user_logic
(
  // -- ADD USER PORTS BELOW THIS LINE ---------------
  // --USER ports added here 
  SPI_CLK,
  SPI_MISO,
  SPI_MOSI,
  SPI_SS,
  SPI_DQ2,
  SPI_DQ3,
  // -- ADD USER PORTS ABOVE THIS LINE ---------------

  // -- DO NOT EDIT BELOW THIS LINE ------------------
  // -- Bus protocol ports, do not add to or delete 
  Bus2IP_Clk,                     // Bus to IP clock
  Bus2IP_Resetn,                  // Bus to IP reset
  Bus2IP_Data,                    // Bus to IP data bus
  Bus2IP_BE,                      // Bus to IP byte enables
  Bus2IP_RdCE,                    // Bus to IP read chip enable
  Bus2IP_WrCE,                    // Bus to IP write chip enable
  IP2Bus_Data,                    // IP to Bus data bus
  IP2Bus_RdAck,                   // IP to Bus read transfer acknowledgement
  IP2Bus_WrAck,                   // IP to Bus write transfer acknowledgement
  IP2Bus_Error                    // IP to Bus error response
  // -- DO NOT EDIT ABOVE THIS LINE ------------------
); // user_logic

// -- ADD USER PARAMETERS BELOW THIS LINE ------------
// --USER parameters added here 
// -- ADD USER PARAMETERS ABOVE THIS LINE ------------

// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol parameters, do not add to or delete
parameter C_NUM_REG                      = 4;
parameter C_SLV_DWIDTH                   = 32;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

// -- ADD USER PORTS BELOW THIS LINE -----------------
// --USER ports added here 
output SPI_CLK;
input SPI_MISO;
output SPI_MOSI;
output SPI_SS;
output SPI_DQ2;
output SPI_DQ3;
// -- ADD USER PORTS ABOVE THIS LINE -----------------

// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol ports, do not add to or delete
input                                     Bus2IP_Clk;
input                                     Bus2IP_Resetn;
input      [C_SLV_DWIDTH-1 : 0]           Bus2IP_Data;
input      [C_SLV_DWIDTH/8-1 : 0]         Bus2IP_BE;
input      [C_NUM_REG-1 : 0]              Bus2IP_RdCE;
input      [C_NUM_REG-1 : 0]              Bus2IP_WrCE;
output     [C_SLV_DWIDTH-1 : 0]           IP2Bus_Data;
output                                    IP2Bus_RdAck;
output                                    IP2Bus_WrAck;
output                                    IP2Bus_Error;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------

  // --USER nets declarations added here, as needed for user logic
	reg MISO_i;
	reg MOSI_i;
	reg SS_i;
	wire rst;
	wire transmit;
	wire valid;
	wire read_en;
	wire [7:0] mosi_din;
	wire mosi_dout;
	wire miso_din;
	wire [7:0] miso_dout;
	wire miso_empty;
	wire mosi_empty;
	wire mosi_full;
	wire wr_ack;
	wire mosi_wr_en;
	wire load_input;
	wire unload_output;

  // Nets for user logic slave model s/w accessible register example
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg0; //status register [mosi empty|miso empty|miso valid|mosi full|mosi_wr_ack|clock|unused[26:0]]
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg1; //control register [reset|transmit|read|ss|mosi_wr_en|unused[10:0]]
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg2; //input register [unused[31:8]|input[7:0]]
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg3; //output register [unused[31:8]|input[7:0]]
  wire       [3 : 0]                        slv_reg_write_sel;
  wire       [3 : 0]                        slv_reg_read_sel;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_ip2bus_data;
  wire                                      slv_read_ack;
  wire                                      slv_write_ack;
  integer                                   byte_index, bit_index;

  // USER logic implementation added here

	always @(posedge BUS2IP_CLK)
	begin
		//read from flash (flash shifts out on falling edge)
		MISO_i <= SPI_MISO;
	end
	
	always @(negedge BUS2IP_CLK)
	begin
		MOSI_i <= mosi_dout;
		//output to flash (flash reads on rising edge)
	end
	
	spi_fifo_8_to_1 mosi_fifo (
  .rst(rst), // input rst
  .wr_clk(BUS2IP_CLK), // input wr_clk
  .rd_clk(BUS2IP_CLK), // input rd_clk
  .din(mosi_din), // input [7 : 0] din
  .wr_en(mosi_wr_en), // input wr_en
  .rd_en(transmit), // input rd_en
  .dout(mosi_dout), // output [0 : 0] dout
  .full(mosi_full), // output full
  .wr_ack(wr_ack), // output wr_ack
  .empty(mosi_empty) // output empty
);
	
	spi_fifo_1_to_8 miso_fifo (
  .rst(rst), // input rst
  .wr_clk(BUS2IP_CLK), // input wr_clk
  .rd_clk(BUS2IP_CLK), // input rd_clk
  .din(miso_din), // input [0 : 0] din
  .wr_en(transmit), // input wr_en
  .rd_en(read_en), // input rd_en
  .dout(miso_dout), // output [7 : 0] dout
  .empty(miso_empty), // output empty
  .valid(valid) // output valid
);

	assign SPI_CLK = BUS2IP_CLK;
	assign SPI_DQ2 = 1'b1;
	assign SPI_DQ3 = 1'b1;
	assign SPI_SS = SS_i;
	assign SPI_MOSI = MOSI_i;
	assign mosi_din = slv_reg2[7:0];
	assign slv_reg3[7:0] = miso_dout;
	assign read_en = slv_reg1[29];
	assign transmit = slv_reg1[30];
	assign rst = slv_reg1[31];
	assign slv_reg0[29] = valid;
	assign slv_reg0[31] = mosi_empty;
	assign slv_reg0[30] = miso_empty;
	assign slv_reg0[28] = mosi_full;
	assign slv_reg0[27] = wr_ack;
	assign SS_i = slv_reg1[28];
	assign mosi_wr_en = slv_reg1[27];
  // ------------------------------------------------------
  // Example code to read/write user logic slave model s/w accessible registers
  // 
  // Note:
  // The example code presented here is to show you one way of reading/writing
  // software accessible registers implemented in the user logic slave model.
  // Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  // to one software accessible register by the top level template. For example,
  // if you have four 32 bit software accessible registers in the user logic,
  // you are basically operating on the following memory mapped registers:
  // 
  //    Bus2IP_WrCE/Bus2IP_RdCE   Memory Mapped Register
  //                     "1000"   C_BASEADDR + 0x0
  //                     "0100"   C_BASEADDR + 0x4
  //                     "0010"   C_BASEADDR + 0x8
  //                     "0001"   C_BASEADDR + 0xC
  // 
  // ------------------------------------------------------

  assign
    slv_reg_write_sel = Bus2IP_WrCE[3:0],
    slv_reg_read_sel  = Bus2IP_RdCE[3:0],
    slv_write_ack     = Bus2IP_WrCE[0] || Bus2IP_WrCE[1] || Bus2IP_WrCE[2] || Bus2IP_WrCE[3],
    slv_read_ack      = Bus2IP_RdCE[0] || Bus2IP_RdCE[1] || Bus2IP_RdCE[2] || Bus2IP_RdCE[3];

  // implement slave model register(s)
  always @( posedge Bus2IP_Clk )
    begin

      if ( Bus2IP_Resetn == 1'b0 )
        begin
          slv_reg0 <= 0;
          slv_reg1 <= 0;
          slv_reg2 <= 0;
          slv_reg3 <= 0;
        end
      else
        case ( slv_reg_write_sel )
          4'b1000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg0[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          4'b0100 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg1[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          4'b0010 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg2[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          4'b0001 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg3[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          default : begin
            slv_reg0 <= slv_reg0;
            slv_reg1 <= slv_reg1;
            slv_reg2 <= slv_reg2;
            slv_reg3 <= slv_reg3;
                    end
        endcase

    end // SLAVE_REG_WRITE_PROC

  // implement slave model register read mux
  always @( slv_reg_read_sel or slv_reg0 or slv_reg1 or slv_reg2 or slv_reg3 )
    begin 

      case ( slv_reg_read_sel )
        4'b1000 : slv_ip2bus_data <= slv_reg0;
        4'b0100 : slv_ip2bus_data <= slv_reg1;
        4'b0010 : slv_ip2bus_data <= slv_reg2;
        4'b0001 : slv_ip2bus_data <= slv_reg3;
        default : slv_ip2bus_data <= 0;
      endcase

    end // SLAVE_REG_READ_PROC

  // ------------------------------------------------------------
  // Example code to drive IP to Bus signals
  // ------------------------------------------------------------

assign IP2Bus_Data = (slv_read_ack == 1'b1) ? slv_ip2bus_data :  0 ;
  assign IP2Bus_WrAck = slv_write_ack;
  assign IP2Bus_RdAck = slv_read_ack;
  assign IP2Bus_Error = 0;

endmodule

