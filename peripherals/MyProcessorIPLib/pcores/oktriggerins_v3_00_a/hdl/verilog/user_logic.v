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
// Version:           3.00.a
// Description:       User logic module.
// Date:              Fri Jun 02 10:01:17 2017 (by Create and Import Peripheral Wizard)
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
  okHE,
  INTR,
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
parameter C_NUM_REG                      = 32;
parameter C_SLV_DWIDTH                   = 32;
// -- DO NOT EDIT ABOVE THIS LINE --------------------

// -- ADD USER PORTS BELOW THIS LINE -----------------
// --USER ports added here 
input		[112:0]						okHE;
output									INTR;
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
  reg 	[C_SLV_DWIDTH*C_NUM_REG - 1 : 0]	triggers;   //all the possible triggers
  reg 	[C_SLV_DWIDTH*C_NUM_REG - 1 : 0]	masks;		//masks to determine whether interrupts are sent 
  initial masks = 0;									//set bit -> corresponding trigger sends interrupt
  
  // Nets for user logic slave model s/w accessible register example
  /*reg        [C_SLV_DWIDTH-1 : 0]           slv_reg0;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg1;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg2;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg3;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg4;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg5;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg6;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg7;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg8;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg9;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg10;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg11;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg12;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg13;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg14;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg15;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg16;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg17;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg18;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg19;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg20;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg21;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg22;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg23;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg24;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg25;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg26;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg27;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg28;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg29;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg30;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_reg31;*/
  wire       [31 : 0]                       slv_reg_write_sel;
  wire       [31 : 0]                       slv_reg_read_sel;
  reg        [C_SLV_DWIDTH-1 : 0]           slv_ip2bus_data;
  wire                                      slv_read_ack;
  wire                                      slv_write_ack;
  integer                                   byte_index, bit_index;

  // USER logic implementation added here

  genvar i;
  generate
	for (i = 0; i < C_NUM_REG; i = i + 1) begin
		wire [C_SLV_DWIDTH - 1 : 0] trigger;
		okTriggerIn triggerin (.okHE(okHE), .ep_addr(8'h40 + i), .ep_clk(Bus2IP_Clk), .ep_trigger(trigger));
		always @(posedge Bus2IP_Clk) begin
			if (Bus2IP_Resetn == 1'b0) begin
				//triggers <= 0; //for some reason ise thinks this reset code is a separate driver and complains, so its commented out
				//masks <= 0;
			end else begin
				if (slv_reg_write_sel == 1 << (C_SLV_DWIDTH - i - 1)) begin
					triggers [C_SLV_DWIDTH*i +: C_SLV_DWIDTH] <= 0; //clear trigger whenever ublaze writes to masks
					for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
						if ( Bus2IP_BE[byte_index] == 1 )
							masks[(C_SLV_DWIDTH*i) + (byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
				end else begin //triggers persist until ublaze clears them by writing to mask
					triggers [C_SLV_DWIDTH*i +: C_SLV_DWIDTH] <= triggers[C_SLV_DWIDTH*i +: C_SLV_DWIDTH] | trigger;
				end
			end
		end
	end
  endgenerate
  
  assign INTR = |(triggers & masks);
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
    slv_reg_write_sel = Bus2IP_WrCE[31:0],
    slv_reg_read_sel  = Bus2IP_RdCE[31:0],
    slv_write_ack     = Bus2IP_WrCE[0] || Bus2IP_WrCE[1] || Bus2IP_WrCE[2] || Bus2IP_WrCE[3] || Bus2IP_WrCE[4] || Bus2IP_WrCE[5] || Bus2IP_WrCE[6] || Bus2IP_WrCE[7] || Bus2IP_WrCE[8] || Bus2IP_WrCE[9] || Bus2IP_WrCE[10] || Bus2IP_WrCE[11] || Bus2IP_WrCE[12] || Bus2IP_WrCE[13] || Bus2IP_WrCE[14] || Bus2IP_WrCE[15] || Bus2IP_WrCE[16] || Bus2IP_WrCE[17] || Bus2IP_WrCE[18] || Bus2IP_WrCE[19] || Bus2IP_WrCE[20] || Bus2IP_WrCE[21] || Bus2IP_WrCE[22] || Bus2IP_WrCE[23] || Bus2IP_WrCE[24] || Bus2IP_WrCE[25] || Bus2IP_WrCE[26] || Bus2IP_WrCE[27] || Bus2IP_WrCE[28] || Bus2IP_WrCE[29] || Bus2IP_WrCE[30] || Bus2IP_WrCE[31],
    slv_read_ack      = Bus2IP_RdCE[0] || Bus2IP_RdCE[1] || Bus2IP_RdCE[2] || Bus2IP_RdCE[3] || Bus2IP_RdCE[4] || Bus2IP_RdCE[5] || Bus2IP_RdCE[6] || Bus2IP_RdCE[7] || Bus2IP_RdCE[8] || Bus2IP_RdCE[9] || Bus2IP_RdCE[10] || Bus2IP_RdCE[11] || Bus2IP_RdCE[12] || Bus2IP_RdCE[13] || Bus2IP_RdCE[14] || Bus2IP_RdCE[15] || Bus2IP_RdCE[16] || Bus2IP_RdCE[17] || Bus2IP_RdCE[18] || Bus2IP_RdCE[19] || Bus2IP_RdCE[20] || Bus2IP_RdCE[21] || Bus2IP_RdCE[22] || Bus2IP_RdCE[23] || Bus2IP_RdCE[24] || Bus2IP_RdCE[25] || Bus2IP_RdCE[26] || Bus2IP_RdCE[27] || Bus2IP_RdCE[28] || Bus2IP_RdCE[29] || Bus2IP_RdCE[30] || Bus2IP_RdCE[31];

  // implement slave model register(s)
  always @( posedge Bus2IP_Clk )
    begin

      /*if ( Bus2IP_Resetn == 1'b0 )
        begin
          slv_reg0 <= 0;
          slv_reg1 <= 0;
          slv_reg2 <= 0;
          slv_reg3 <= 0;
          slv_reg4 <= 0;
          slv_reg5 <= 0;
          slv_reg6 <= 0;
          slv_reg7 <= 0;
          slv_reg8 <= 0;
          slv_reg9 <= 0;
          slv_reg10 <= 0;
          slv_reg11 <= 0;
          slv_reg12 <= 0;
          slv_reg13 <= 0;
          slv_reg14 <= 0;
          slv_reg15 <= 0;
          slv_reg16 <= 0;
          slv_reg17 <= 0;
          slv_reg18 <= 0;
          slv_reg19 <= 0;
          slv_reg20 <= 0;
          slv_reg21 <= 0;
          slv_reg22 <= 0;
          slv_reg23 <= 0;
          slv_reg24 <= 0;
          slv_reg25 <= 0;
          slv_reg26 <= 0;
          slv_reg27 <= 0;
          slv_reg28 <= 0;
          slv_reg29 <= 0;
          slv_reg30 <= 0;
          slv_reg31 <= 0;
        end
      else
        case ( slv_reg_write_sel )
          32'b10000000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg0[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b01000000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg1[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00100000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg2[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00010000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg3[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00001000000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg4[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000100000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg5[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000010000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg6[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000001000000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg7[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000100000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg8[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000010000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg9[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000001000000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg10[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000100000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg11[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000010000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg12[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000001000000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg13[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000100000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg14[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000010000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg15[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000001000000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg16[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000100000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg17[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000010000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg18[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000001000000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg19[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000100000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg20[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000010000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg21[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000001000000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg22[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000100000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg23[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000010000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg24[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000001000000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg25[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000000100000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg26[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000000010000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg27[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000000001000 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg28[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000000000100 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg29[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000000000010 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg30[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          32'b00000000000000000000000000000001 :
            for ( byte_index = 0; byte_index <= (C_SLV_DWIDTH/8)-1; byte_index = byte_index+1 )
              if ( Bus2IP_BE[byte_index] == 1 )
                slv_reg31[(byte_index*8) +: 8] <= Bus2IP_Data[(byte_index*8) +: 8];
          default : begin
            slv_reg0 <= slv_reg0;
            slv_reg1 <= slv_reg1;
            slv_reg2 <= slv_reg2;
            slv_reg3 <= slv_reg3;
            slv_reg4 <= slv_reg4;
            slv_reg5 <= slv_reg5;
            slv_reg6 <= slv_reg6;
            slv_reg7 <= slv_reg7;
            slv_reg8 <= slv_reg8;
            slv_reg9 <= slv_reg9;
            slv_reg10 <= slv_reg10;
            slv_reg11 <= slv_reg11;
            slv_reg12 <= slv_reg12;
            slv_reg13 <= slv_reg13;
            slv_reg14 <= slv_reg14;
            slv_reg15 <= slv_reg15;
            slv_reg16 <= slv_reg16;
            slv_reg17 <= slv_reg17;
            slv_reg18 <= slv_reg18;
            slv_reg19 <= slv_reg19;
            slv_reg20 <= slv_reg20;
            slv_reg21 <= slv_reg21;
            slv_reg22 <= slv_reg22;
            slv_reg23 <= slv_reg23;
            slv_reg24 <= slv_reg24;
            slv_reg25 <= slv_reg25;
            slv_reg26 <= slv_reg26;
            slv_reg27 <= slv_reg27;
            slv_reg28 <= slv_reg28;
            slv_reg29 <= slv_reg29;
            slv_reg30 <= slv_reg30;
            slv_reg31 <= slv_reg31;
                    end
        endcase*/

    end // SLAVE_REG_WRITE_PROC

  // implement slave model register read mux
  always @( slv_reg_read_sel or triggers)
    begin 

      case ( slv_reg_read_sel )
        32'b10000000000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*0 +: C_SLV_DWIDTH];
        32'b01000000000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*1 +: C_SLV_DWIDTH];
        32'b00100000000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*2 +: C_SLV_DWIDTH];
        32'b00010000000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*3 +: C_SLV_DWIDTH];
        32'b00001000000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*4 +: C_SLV_DWIDTH];
        32'b00000100000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*5 +: C_SLV_DWIDTH];
        32'b00000010000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*6 +: C_SLV_DWIDTH];
        32'b00000001000000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*7 +: C_SLV_DWIDTH];
        32'b00000000100000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*8 +: C_SLV_DWIDTH];
        32'b00000000010000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*9 +: C_SLV_DWIDTH];
        32'b00000000001000000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*10 +: C_SLV_DWIDTH];
        32'b00000000000100000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*11 +: C_SLV_DWIDTH];
        32'b00000000000010000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*12 +: C_SLV_DWIDTH];
        32'b00000000000001000000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*13 +: C_SLV_DWIDTH];
        32'b00000000000000100000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*14 +: C_SLV_DWIDTH];
        32'b00000000000000010000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*15 +: C_SLV_DWIDTH];
        32'b00000000000000001000000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*16 +: C_SLV_DWIDTH];
        32'b00000000000000000100000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*17 +: C_SLV_DWIDTH];
        32'b00000000000000000010000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*18 +: C_SLV_DWIDTH];
        32'b00000000000000000001000000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*19 +: C_SLV_DWIDTH];
        32'b00000000000000000000100000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*20 +: C_SLV_DWIDTH];
        32'b00000000000000000000010000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*21 +: C_SLV_DWIDTH];
        32'b00000000000000000000001000000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*22 +: C_SLV_DWIDTH];
        32'b00000000000000000000000100000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*23 +: C_SLV_DWIDTH];
        32'b00000000000000000000000010000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*24 +: C_SLV_DWIDTH];
        32'b00000000000000000000000001000000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*25 +: C_SLV_DWIDTH];
        32'b00000000000000000000000000100000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*26 +: C_SLV_DWIDTH];
        32'b00000000000000000000000000010000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*27 +: C_SLV_DWIDTH];
        32'b00000000000000000000000000001000 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*28 +: C_SLV_DWIDTH];
        32'b00000000000000000000000000000100 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*29 +: C_SLV_DWIDTH];
        32'b00000000000000000000000000000010 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*30 +: C_SLV_DWIDTH];
        32'b00000000000000000000000000000001 : slv_ip2bus_data <= triggers[C_SLV_DWIDTH*31 +: C_SLV_DWIDTH];
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
