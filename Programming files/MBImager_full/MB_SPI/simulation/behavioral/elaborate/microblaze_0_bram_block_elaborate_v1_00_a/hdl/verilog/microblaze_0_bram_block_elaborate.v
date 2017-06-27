//-----------------------------------------------------------------------------
// microblaze_0_bram_block_elaborate.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver

module microblaze_0_bram_block_elaborate
  (
    BRAM_Rst_A,
    BRAM_Clk_A,
    BRAM_EN_A,
    BRAM_WEN_A,
    BRAM_Addr_A,
    BRAM_Din_A,
    BRAM_Dout_A,
    BRAM_Rst_B,
    BRAM_Clk_B,
    BRAM_EN_B,
    BRAM_WEN_B,
    BRAM_Addr_B,
    BRAM_Din_B,
    BRAM_Dout_B
  );
  parameter
    C_MEMSIZE = 'h8000,
    C_PORT_DWIDTH = 32,
    C_PORT_AWIDTH = 32,
    C_NUM_WE = 4,
    C_FAMILY = "spartan6";
  input BRAM_Rst_A;
  input BRAM_Clk_A;
  input BRAM_EN_A;
  input [0:C_NUM_WE-1] BRAM_WEN_A;
  input [0:C_PORT_AWIDTH-1] BRAM_Addr_A;
  output [0:C_PORT_DWIDTH-1] BRAM_Din_A;
  input [0:C_PORT_DWIDTH-1] BRAM_Dout_A;
  input BRAM_Rst_B;
  input BRAM_Clk_B;
  input BRAM_EN_B;
  input [0:C_NUM_WE-1] BRAM_WEN_B;
  input [0:C_PORT_AWIDTH-1] BRAM_Addr_B;
  output [0:C_PORT_DWIDTH-1] BRAM_Din_B;
  input [0:C_PORT_DWIDTH-1] BRAM_Dout_B;

  // Internal signals

  wire net_gnd0;
  wire [3:0] net_gnd4;
  wire [0:0] pgassign1;
  wire [0:29] pgassign2;
  wire [13:0] pgassign3;
  wire [31:0] pgassign4;
  wire [31:0] pgassign5;
  wire [3:0] pgassign6;
  wire [13:0] pgassign7;
  wire [31:0] pgassign8;
  wire [31:0] pgassign9;
  wire [3:0] pgassign10;
  wire [13:0] pgassign11;
  wire [31:0] pgassign12;
  wire [31:0] pgassign13;
  wire [3:0] pgassign14;
  wire [13:0] pgassign15;
  wire [31:0] pgassign16;
  wire [31:0] pgassign17;
  wire [3:0] pgassign18;
  wire [13:0] pgassign19;
  wire [31:0] pgassign20;
  wire [31:0] pgassign21;
  wire [3:0] pgassign22;
  wire [13:0] pgassign23;
  wire [31:0] pgassign24;
  wire [31:0] pgassign25;
  wire [3:0] pgassign26;
  wire [13:0] pgassign27;
  wire [31:0] pgassign28;
  wire [31:0] pgassign29;
  wire [3:0] pgassign30;
  wire [13:0] pgassign31;
  wire [31:0] pgassign32;
  wire [31:0] pgassign33;
  wire [3:0] pgassign34;
  wire [13:0] pgassign35;
  wire [31:0] pgassign36;
  wire [31:0] pgassign37;
  wire [3:0] pgassign38;
  wire [13:0] pgassign39;
  wire [31:0] pgassign40;
  wire [31:0] pgassign41;
  wire [3:0] pgassign42;
  wire [13:0] pgassign43;
  wire [31:0] pgassign44;
  wire [31:0] pgassign45;
  wire [3:0] pgassign46;
  wire [13:0] pgassign47;
  wire [31:0] pgassign48;
  wire [31:0] pgassign49;
  wire [3:0] pgassign50;
  wire [13:0] pgassign51;
  wire [31:0] pgassign52;
  wire [31:0] pgassign53;
  wire [3:0] pgassign54;
  wire [13:0] pgassign55;
  wire [31:0] pgassign56;
  wire [31:0] pgassign57;
  wire [3:0] pgassign58;
  wire [13:0] pgassign59;
  wire [31:0] pgassign60;
  wire [31:0] pgassign61;
  wire [3:0] pgassign62;
  wire [13:0] pgassign63;
  wire [31:0] pgassign64;
  wire [31:0] pgassign65;
  wire [3:0] pgassign66;
  wire [13:0] pgassign67;
  wire [31:0] pgassign68;
  wire [31:0] pgassign69;
  wire [3:0] pgassign70;
  wire [13:0] pgassign71;
  wire [31:0] pgassign72;
  wire [31:0] pgassign73;
  wire [3:0] pgassign74;
  wire [13:0] pgassign75;
  wire [31:0] pgassign76;
  wire [31:0] pgassign77;
  wire [3:0] pgassign78;
  wire [13:0] pgassign79;
  wire [31:0] pgassign80;
  wire [31:0] pgassign81;
  wire [3:0] pgassign82;
  wire [13:0] pgassign83;
  wire [31:0] pgassign84;
  wire [31:0] pgassign85;
  wire [3:0] pgassign86;
  wire [13:0] pgassign87;
  wire [31:0] pgassign88;
  wire [31:0] pgassign89;
  wire [3:0] pgassign90;
  wire [13:0] pgassign91;
  wire [31:0] pgassign92;
  wire [31:0] pgassign93;
  wire [3:0] pgassign94;
  wire [13:0] pgassign95;
  wire [31:0] pgassign96;
  wire [31:0] pgassign97;
  wire [3:0] pgassign98;
  wire [13:0] pgassign99;
  wire [31:0] pgassign100;
  wire [31:0] pgassign101;
  wire [3:0] pgassign102;
  wire [13:0] pgassign103;
  wire [31:0] pgassign104;
  wire [31:0] pgassign105;
  wire [3:0] pgassign106;
  wire [13:0] pgassign107;
  wire [31:0] pgassign108;
  wire [31:0] pgassign109;
  wire [3:0] pgassign110;
  wire [13:0] pgassign111;
  wire [31:0] pgassign112;
  wire [31:0] pgassign113;
  wire [3:0] pgassign114;
  wire [13:0] pgassign115;
  wire [31:0] pgassign116;
  wire [31:0] pgassign117;
  wire [3:0] pgassign118;
  wire [13:0] pgassign119;
  wire [31:0] pgassign120;
  wire [31:0] pgassign121;
  wire [3:0] pgassign122;
  wire [13:0] pgassign123;
  wire [31:0] pgassign124;
  wire [31:0] pgassign125;
  wire [3:0] pgassign126;
  wire [13:0] pgassign127;
  wire [31:0] pgassign128;
  wire [31:0] pgassign129;
  wire [3:0] pgassign130;

  // Internal assignments

  assign pgassign1[0:0] = 1'b0;
  assign pgassign2[0:29] = 30'b000000000000000000000000000000;
  assign pgassign3[13:1] = BRAM_Addr_A[17:29];
  assign pgassign3[0:0] = 1'b0;
  assign pgassign4[31:2] = 30'b000000000000000000000000000000;
  assign pgassign4[1:0] = BRAM_Dout_A[0:1];
  assign BRAM_Din_A[0:1] = pgassign5[1:0];
  assign pgassign6[3:3] = BRAM_WEN_A[0:0];
  assign pgassign6[2:2] = BRAM_WEN_A[0:0];
  assign pgassign6[1:1] = BRAM_WEN_A[0:0];
  assign pgassign6[0:0] = BRAM_WEN_A[0:0];
  assign pgassign7[13:1] = BRAM_Addr_B[17:29];
  assign pgassign7[0:0] = 1'b0;
  assign pgassign8[31:2] = 30'b000000000000000000000000000000;
  assign pgassign8[1:0] = BRAM_Dout_B[0:1];
  assign BRAM_Din_B[0:1] = pgassign9[1:0];
  assign pgassign10[3:3] = BRAM_WEN_B[0:0];
  assign pgassign10[2:2] = BRAM_WEN_B[0:0];
  assign pgassign10[1:1] = BRAM_WEN_B[0:0];
  assign pgassign10[0:0] = BRAM_WEN_B[0:0];
  assign pgassign11[13:1] = BRAM_Addr_A[17:29];
  assign pgassign11[0:0] = 1'b0;
  assign pgassign12[31:2] = 30'b000000000000000000000000000000;
  assign pgassign12[1:0] = BRAM_Dout_A[2:3];
  assign BRAM_Din_A[2:3] = pgassign13[1:0];
  assign pgassign14[3:3] = BRAM_WEN_A[0:0];
  assign pgassign14[2:2] = BRAM_WEN_A[0:0];
  assign pgassign14[1:1] = BRAM_WEN_A[0:0];
  assign pgassign14[0:0] = BRAM_WEN_A[0:0];
  assign pgassign15[13:1] = BRAM_Addr_B[17:29];
  assign pgassign15[0:0] = 1'b0;
  assign pgassign16[31:2] = 30'b000000000000000000000000000000;
  assign pgassign16[1:0] = BRAM_Dout_B[2:3];
  assign BRAM_Din_B[2:3] = pgassign17[1:0];
  assign pgassign18[3:3] = BRAM_WEN_B[0:0];
  assign pgassign18[2:2] = BRAM_WEN_B[0:0];
  assign pgassign18[1:1] = BRAM_WEN_B[0:0];
  assign pgassign18[0:0] = BRAM_WEN_B[0:0];
  assign pgassign19[13:1] = BRAM_Addr_A[17:29];
  assign pgassign19[0:0] = 1'b0;
  assign pgassign20[31:2] = 30'b000000000000000000000000000000;
  assign pgassign20[1:0] = BRAM_Dout_A[4:5];
  assign BRAM_Din_A[4:5] = pgassign21[1:0];
  assign pgassign22[3:3] = BRAM_WEN_A[0:0];
  assign pgassign22[2:2] = BRAM_WEN_A[0:0];
  assign pgassign22[1:1] = BRAM_WEN_A[0:0];
  assign pgassign22[0:0] = BRAM_WEN_A[0:0];
  assign pgassign23[13:1] = BRAM_Addr_B[17:29];
  assign pgassign23[0:0] = 1'b0;
  assign pgassign24[31:2] = 30'b000000000000000000000000000000;
  assign pgassign24[1:0] = BRAM_Dout_B[4:5];
  assign BRAM_Din_B[4:5] = pgassign25[1:0];
  assign pgassign26[3:3] = BRAM_WEN_B[0:0];
  assign pgassign26[2:2] = BRAM_WEN_B[0:0];
  assign pgassign26[1:1] = BRAM_WEN_B[0:0];
  assign pgassign26[0:0] = BRAM_WEN_B[0:0];
  assign pgassign27[13:1] = BRAM_Addr_A[17:29];
  assign pgassign27[0:0] = 1'b0;
  assign pgassign28[31:2] = 30'b000000000000000000000000000000;
  assign pgassign28[1:0] = BRAM_Dout_A[6:7];
  assign BRAM_Din_A[6:7] = pgassign29[1:0];
  assign pgassign30[3:3] = BRAM_WEN_A[0:0];
  assign pgassign30[2:2] = BRAM_WEN_A[0:0];
  assign pgassign30[1:1] = BRAM_WEN_A[0:0];
  assign pgassign30[0:0] = BRAM_WEN_A[0:0];
  assign pgassign31[13:1] = BRAM_Addr_B[17:29];
  assign pgassign31[0:0] = 1'b0;
  assign pgassign32[31:2] = 30'b000000000000000000000000000000;
  assign pgassign32[1:0] = BRAM_Dout_B[6:7];
  assign BRAM_Din_B[6:7] = pgassign33[1:0];
  assign pgassign34[3:3] = BRAM_WEN_B[0:0];
  assign pgassign34[2:2] = BRAM_WEN_B[0:0];
  assign pgassign34[1:1] = BRAM_WEN_B[0:0];
  assign pgassign34[0:0] = BRAM_WEN_B[0:0];
  assign pgassign35[13:1] = BRAM_Addr_A[17:29];
  assign pgassign35[0:0] = 1'b0;
  assign pgassign36[31:2] = 30'b000000000000000000000000000000;
  assign pgassign36[1:0] = BRAM_Dout_A[8:9];
  assign BRAM_Din_A[8:9] = pgassign37[1:0];
  assign pgassign38[3:3] = BRAM_WEN_A[1:1];
  assign pgassign38[2:2] = BRAM_WEN_A[1:1];
  assign pgassign38[1:1] = BRAM_WEN_A[1:1];
  assign pgassign38[0:0] = BRAM_WEN_A[1:1];
  assign pgassign39[13:1] = BRAM_Addr_B[17:29];
  assign pgassign39[0:0] = 1'b0;
  assign pgassign40[31:2] = 30'b000000000000000000000000000000;
  assign pgassign40[1:0] = BRAM_Dout_B[8:9];
  assign BRAM_Din_B[8:9] = pgassign41[1:0];
  assign pgassign42[3:3] = BRAM_WEN_B[1:1];
  assign pgassign42[2:2] = BRAM_WEN_B[1:1];
  assign pgassign42[1:1] = BRAM_WEN_B[1:1];
  assign pgassign42[0:0] = BRAM_WEN_B[1:1];
  assign pgassign43[13:1] = BRAM_Addr_A[17:29];
  assign pgassign43[0:0] = 1'b0;
  assign pgassign44[31:2] = 30'b000000000000000000000000000000;
  assign pgassign44[1:0] = BRAM_Dout_A[10:11];
  assign BRAM_Din_A[10:11] = pgassign45[1:0];
  assign pgassign46[3:3] = BRAM_WEN_A[1:1];
  assign pgassign46[2:2] = BRAM_WEN_A[1:1];
  assign pgassign46[1:1] = BRAM_WEN_A[1:1];
  assign pgassign46[0:0] = BRAM_WEN_A[1:1];
  assign pgassign47[13:1] = BRAM_Addr_B[17:29];
  assign pgassign47[0:0] = 1'b0;
  assign pgassign48[31:2] = 30'b000000000000000000000000000000;
  assign pgassign48[1:0] = BRAM_Dout_B[10:11];
  assign BRAM_Din_B[10:11] = pgassign49[1:0];
  assign pgassign50[3:3] = BRAM_WEN_B[1:1];
  assign pgassign50[2:2] = BRAM_WEN_B[1:1];
  assign pgassign50[1:1] = BRAM_WEN_B[1:1];
  assign pgassign50[0:0] = BRAM_WEN_B[1:1];
  assign pgassign51[13:1] = BRAM_Addr_A[17:29];
  assign pgassign51[0:0] = 1'b0;
  assign pgassign52[31:2] = 30'b000000000000000000000000000000;
  assign pgassign52[1:0] = BRAM_Dout_A[12:13];
  assign BRAM_Din_A[12:13] = pgassign53[1:0];
  assign pgassign54[3:3] = BRAM_WEN_A[1:1];
  assign pgassign54[2:2] = BRAM_WEN_A[1:1];
  assign pgassign54[1:1] = BRAM_WEN_A[1:1];
  assign pgassign54[0:0] = BRAM_WEN_A[1:1];
  assign pgassign55[13:1] = BRAM_Addr_B[17:29];
  assign pgassign55[0:0] = 1'b0;
  assign pgassign56[31:2] = 30'b000000000000000000000000000000;
  assign pgassign56[1:0] = BRAM_Dout_B[12:13];
  assign BRAM_Din_B[12:13] = pgassign57[1:0];
  assign pgassign58[3:3] = BRAM_WEN_B[1:1];
  assign pgassign58[2:2] = BRAM_WEN_B[1:1];
  assign pgassign58[1:1] = BRAM_WEN_B[1:1];
  assign pgassign58[0:0] = BRAM_WEN_B[1:1];
  assign pgassign59[13:1] = BRAM_Addr_A[17:29];
  assign pgassign59[0:0] = 1'b0;
  assign pgassign60[31:2] = 30'b000000000000000000000000000000;
  assign pgassign60[1:0] = BRAM_Dout_A[14:15];
  assign BRAM_Din_A[14:15] = pgassign61[1:0];
  assign pgassign62[3:3] = BRAM_WEN_A[1:1];
  assign pgassign62[2:2] = BRAM_WEN_A[1:1];
  assign pgassign62[1:1] = BRAM_WEN_A[1:1];
  assign pgassign62[0:0] = BRAM_WEN_A[1:1];
  assign pgassign63[13:1] = BRAM_Addr_B[17:29];
  assign pgassign63[0:0] = 1'b0;
  assign pgassign64[31:2] = 30'b000000000000000000000000000000;
  assign pgassign64[1:0] = BRAM_Dout_B[14:15];
  assign BRAM_Din_B[14:15] = pgassign65[1:0];
  assign pgassign66[3:3] = BRAM_WEN_B[1:1];
  assign pgassign66[2:2] = BRAM_WEN_B[1:1];
  assign pgassign66[1:1] = BRAM_WEN_B[1:1];
  assign pgassign66[0:0] = BRAM_WEN_B[1:1];
  assign pgassign67[13:1] = BRAM_Addr_A[17:29];
  assign pgassign67[0:0] = 1'b0;
  assign pgassign68[31:2] = 30'b000000000000000000000000000000;
  assign pgassign68[1:0] = BRAM_Dout_A[16:17];
  assign BRAM_Din_A[16:17] = pgassign69[1:0];
  assign pgassign70[3:3] = BRAM_WEN_A[2:2];
  assign pgassign70[2:2] = BRAM_WEN_A[2:2];
  assign pgassign70[1:1] = BRAM_WEN_A[2:2];
  assign pgassign70[0:0] = BRAM_WEN_A[2:2];
  assign pgassign71[13:1] = BRAM_Addr_B[17:29];
  assign pgassign71[0:0] = 1'b0;
  assign pgassign72[31:2] = 30'b000000000000000000000000000000;
  assign pgassign72[1:0] = BRAM_Dout_B[16:17];
  assign BRAM_Din_B[16:17] = pgassign73[1:0];
  assign pgassign74[3:3] = BRAM_WEN_B[2:2];
  assign pgassign74[2:2] = BRAM_WEN_B[2:2];
  assign pgassign74[1:1] = BRAM_WEN_B[2:2];
  assign pgassign74[0:0] = BRAM_WEN_B[2:2];
  assign pgassign75[13:1] = BRAM_Addr_A[17:29];
  assign pgassign75[0:0] = 1'b0;
  assign pgassign76[31:2] = 30'b000000000000000000000000000000;
  assign pgassign76[1:0] = BRAM_Dout_A[18:19];
  assign BRAM_Din_A[18:19] = pgassign77[1:0];
  assign pgassign78[3:3] = BRAM_WEN_A[2:2];
  assign pgassign78[2:2] = BRAM_WEN_A[2:2];
  assign pgassign78[1:1] = BRAM_WEN_A[2:2];
  assign pgassign78[0:0] = BRAM_WEN_A[2:2];
  assign pgassign79[13:1] = BRAM_Addr_B[17:29];
  assign pgassign79[0:0] = 1'b0;
  assign pgassign80[31:2] = 30'b000000000000000000000000000000;
  assign pgassign80[1:0] = BRAM_Dout_B[18:19];
  assign BRAM_Din_B[18:19] = pgassign81[1:0];
  assign pgassign82[3:3] = BRAM_WEN_B[2:2];
  assign pgassign82[2:2] = BRAM_WEN_B[2:2];
  assign pgassign82[1:1] = BRAM_WEN_B[2:2];
  assign pgassign82[0:0] = BRAM_WEN_B[2:2];
  assign pgassign83[13:1] = BRAM_Addr_A[17:29];
  assign pgassign83[0:0] = 1'b0;
  assign pgassign84[31:2] = 30'b000000000000000000000000000000;
  assign pgassign84[1:0] = BRAM_Dout_A[20:21];
  assign BRAM_Din_A[20:21] = pgassign85[1:0];
  assign pgassign86[3:3] = BRAM_WEN_A[2:2];
  assign pgassign86[2:2] = BRAM_WEN_A[2:2];
  assign pgassign86[1:1] = BRAM_WEN_A[2:2];
  assign pgassign86[0:0] = BRAM_WEN_A[2:2];
  assign pgassign87[13:1] = BRAM_Addr_B[17:29];
  assign pgassign87[0:0] = 1'b0;
  assign pgassign88[31:2] = 30'b000000000000000000000000000000;
  assign pgassign88[1:0] = BRAM_Dout_B[20:21];
  assign BRAM_Din_B[20:21] = pgassign89[1:0];
  assign pgassign90[3:3] = BRAM_WEN_B[2:2];
  assign pgassign90[2:2] = BRAM_WEN_B[2:2];
  assign pgassign90[1:1] = BRAM_WEN_B[2:2];
  assign pgassign90[0:0] = BRAM_WEN_B[2:2];
  assign pgassign91[13:1] = BRAM_Addr_A[17:29];
  assign pgassign91[0:0] = 1'b0;
  assign pgassign92[31:2] = 30'b000000000000000000000000000000;
  assign pgassign92[1:0] = BRAM_Dout_A[22:23];
  assign BRAM_Din_A[22:23] = pgassign93[1:0];
  assign pgassign94[3:3] = BRAM_WEN_A[2:2];
  assign pgassign94[2:2] = BRAM_WEN_A[2:2];
  assign pgassign94[1:1] = BRAM_WEN_A[2:2];
  assign pgassign94[0:0] = BRAM_WEN_A[2:2];
  assign pgassign95[13:1] = BRAM_Addr_B[17:29];
  assign pgassign95[0:0] = 1'b0;
  assign pgassign96[31:2] = 30'b000000000000000000000000000000;
  assign pgassign96[1:0] = BRAM_Dout_B[22:23];
  assign BRAM_Din_B[22:23] = pgassign97[1:0];
  assign pgassign98[3:3] = BRAM_WEN_B[2:2];
  assign pgassign98[2:2] = BRAM_WEN_B[2:2];
  assign pgassign98[1:1] = BRAM_WEN_B[2:2];
  assign pgassign98[0:0] = BRAM_WEN_B[2:2];
  assign pgassign99[13:1] = BRAM_Addr_A[17:29];
  assign pgassign99[0:0] = 1'b0;
  assign pgassign100[31:2] = 30'b000000000000000000000000000000;
  assign pgassign100[1:0] = BRAM_Dout_A[24:25];
  assign BRAM_Din_A[24:25] = pgassign101[1:0];
  assign pgassign102[3:3] = BRAM_WEN_A[3:3];
  assign pgassign102[2:2] = BRAM_WEN_A[3:3];
  assign pgassign102[1:1] = BRAM_WEN_A[3:3];
  assign pgassign102[0:0] = BRAM_WEN_A[3:3];
  assign pgassign103[13:1] = BRAM_Addr_B[17:29];
  assign pgassign103[0:0] = 1'b0;
  assign pgassign104[31:2] = 30'b000000000000000000000000000000;
  assign pgassign104[1:0] = BRAM_Dout_B[24:25];
  assign BRAM_Din_B[24:25] = pgassign105[1:0];
  assign pgassign106[3:3] = BRAM_WEN_B[3:3];
  assign pgassign106[2:2] = BRAM_WEN_B[3:3];
  assign pgassign106[1:1] = BRAM_WEN_B[3:3];
  assign pgassign106[0:0] = BRAM_WEN_B[3:3];
  assign pgassign107[13:1] = BRAM_Addr_A[17:29];
  assign pgassign107[0:0] = 1'b0;
  assign pgassign108[31:2] = 30'b000000000000000000000000000000;
  assign pgassign108[1:0] = BRAM_Dout_A[26:27];
  assign BRAM_Din_A[26:27] = pgassign109[1:0];
  assign pgassign110[3:3] = BRAM_WEN_A[3:3];
  assign pgassign110[2:2] = BRAM_WEN_A[3:3];
  assign pgassign110[1:1] = BRAM_WEN_A[3:3];
  assign pgassign110[0:0] = BRAM_WEN_A[3:3];
  assign pgassign111[13:1] = BRAM_Addr_B[17:29];
  assign pgassign111[0:0] = 1'b0;
  assign pgassign112[31:2] = 30'b000000000000000000000000000000;
  assign pgassign112[1:0] = BRAM_Dout_B[26:27];
  assign BRAM_Din_B[26:27] = pgassign113[1:0];
  assign pgassign114[3:3] = BRAM_WEN_B[3:3];
  assign pgassign114[2:2] = BRAM_WEN_B[3:3];
  assign pgassign114[1:1] = BRAM_WEN_B[3:3];
  assign pgassign114[0:0] = BRAM_WEN_B[3:3];
  assign pgassign115[13:1] = BRAM_Addr_A[17:29];
  assign pgassign115[0:0] = 1'b0;
  assign pgassign116[31:2] = 30'b000000000000000000000000000000;
  assign pgassign116[1:0] = BRAM_Dout_A[28:29];
  assign BRAM_Din_A[28:29] = pgassign117[1:0];
  assign pgassign118[3:3] = BRAM_WEN_A[3:3];
  assign pgassign118[2:2] = BRAM_WEN_A[3:3];
  assign pgassign118[1:1] = BRAM_WEN_A[3:3];
  assign pgassign118[0:0] = BRAM_WEN_A[3:3];
  assign pgassign119[13:1] = BRAM_Addr_B[17:29];
  assign pgassign119[0:0] = 1'b0;
  assign pgassign120[31:2] = 30'b000000000000000000000000000000;
  assign pgassign120[1:0] = BRAM_Dout_B[28:29];
  assign BRAM_Din_B[28:29] = pgassign121[1:0];
  assign pgassign122[3:3] = BRAM_WEN_B[3:3];
  assign pgassign122[2:2] = BRAM_WEN_B[3:3];
  assign pgassign122[1:1] = BRAM_WEN_B[3:3];
  assign pgassign122[0:0] = BRAM_WEN_B[3:3];
  assign pgassign123[13:1] = BRAM_Addr_A[17:29];
  assign pgassign123[0:0] = 1'b0;
  assign pgassign124[31:2] = 30'b000000000000000000000000000000;
  assign pgassign124[1:0] = BRAM_Dout_A[30:31];
  assign BRAM_Din_A[30:31] = pgassign125[1:0];
  assign pgassign126[3:3] = BRAM_WEN_A[3:3];
  assign pgassign126[2:2] = BRAM_WEN_A[3:3];
  assign pgassign126[1:1] = BRAM_WEN_A[3:3];
  assign pgassign126[0:0] = BRAM_WEN_A[3:3];
  assign pgassign127[13:1] = BRAM_Addr_B[17:29];
  assign pgassign127[0:0] = 1'b0;
  assign pgassign128[31:2] = 30'b000000000000000000000000000000;
  assign pgassign128[1:0] = BRAM_Dout_B[30:31];
  assign BRAM_Din_B[30:31] = pgassign129[1:0];
  assign pgassign130[3:3] = BRAM_WEN_B[3:3];
  assign pgassign130[2:2] = BRAM_WEN_B[3:3];
  assign pgassign130[1:1] = BRAM_WEN_B[3:3];
  assign pgassign130[0:0] = BRAM_WEN_B[3:3];
  assign net_gnd0 = 1'b0;
  assign net_gnd4[3:0] = 4'b0000;

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_0.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_0 (
      .ADDRA ( pgassign3 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign4 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign5 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign6 ),
      .ADDRB ( pgassign7 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign8 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign9 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign10 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_1.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_1 (
      .ADDRA ( pgassign11 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign12 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign13 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign14 ),
      .ADDRB ( pgassign15 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign16 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign17 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign18 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_2.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_2 (
      .ADDRA ( pgassign19 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign20 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign21 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign22 ),
      .ADDRB ( pgassign23 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign24 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign25 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign26 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_3.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_3 (
      .ADDRA ( pgassign27 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign28 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign29 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign30 ),
      .ADDRB ( pgassign31 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign32 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign33 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign34 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_4.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_4 (
      .ADDRA ( pgassign35 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign36 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign37 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign38 ),
      .ADDRB ( pgassign39 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign40 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign41 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign42 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_5.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_5 (
      .ADDRA ( pgassign43 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign44 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign45 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign46 ),
      .ADDRB ( pgassign47 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign48 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign49 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign50 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_6.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_6 (
      .ADDRA ( pgassign51 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign52 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign53 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign54 ),
      .ADDRB ( pgassign55 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign56 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign57 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign58 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_7.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_7 (
      .ADDRA ( pgassign59 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign60 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign61 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign62 ),
      .ADDRB ( pgassign63 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign64 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign65 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign66 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_8.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_8 (
      .ADDRA ( pgassign67 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign68 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign69 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign70 ),
      .ADDRB ( pgassign71 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign72 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign73 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign74 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_9.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_9 (
      .ADDRA ( pgassign75 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign76 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign77 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign78 ),
      .ADDRB ( pgassign79 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign80 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign81 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign82 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_10.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_10 (
      .ADDRA ( pgassign83 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign84 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign85 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign86 ),
      .ADDRB ( pgassign87 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign88 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign89 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign90 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_11.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_11 (
      .ADDRA ( pgassign91 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign92 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign93 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign94 ),
      .ADDRB ( pgassign95 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign96 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign97 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign98 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_12.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_12 (
      .ADDRA ( pgassign99 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign100 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign101 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign102 ),
      .ADDRB ( pgassign103 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign104 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign105 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign106 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_13.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_13 (
      .ADDRA ( pgassign107 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign108 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign109 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign110 ),
      .ADDRB ( pgassign111 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign112 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign113 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign114 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_14.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_14 (
      .ADDRA ( pgassign115 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign116 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign117 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign118 ),
      .ADDRB ( pgassign119 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign120 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign121 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign122 )
    );

  RAMB16BWER
    #(
      .INIT_FILE ( "microblaze_0_bram_block_combined_15.mem" ),
      .DATA_WIDTH_A ( 2 ),
      .DATA_WIDTH_B ( 2 )
    )
    ramb16bwer_15 (
      .ADDRA ( pgassign123 ),
      .CLKA ( BRAM_Clk_A ),
      .DIA ( pgassign124 ),
      .DIPA ( net_gnd4 ),
      .DOA ( pgassign125 ),
      .DOPA (  ),
      .ENA ( BRAM_EN_A ),
      .REGCEA ( net_gnd0 ),
      .RSTA ( BRAM_Rst_A ),
      .WEA ( pgassign126 ),
      .ADDRB ( pgassign127 ),
      .CLKB ( BRAM_Clk_B ),
      .DIB ( pgassign128 ),
      .DIPB ( net_gnd4 ),
      .DOB ( pgassign129 ),
      .DOPB (  ),
      .ENB ( BRAM_EN_B ),
      .REGCEB ( net_gnd0 ),
      .RSTB ( BRAM_Rst_B ),
      .WEB ( pgassign130 )
    );

endmodule

