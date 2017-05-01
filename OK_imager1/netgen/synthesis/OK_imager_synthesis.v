////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: OK_imager_synthesis.v
// /___/   /\     Timestamp: Thu Feb 02 17:12:24 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim OK_imager.ngc OK_imager_synthesis.v 
// Device	: xc6slx45-2-fgg484
// Input file	: OK_imager.ngc
// Output file	: C:\Users\MBImager\Documents\MBImager_ams\ISE_projects\OKelly\OK_imager1\netgen\synthesis\OK_imager_synthesis.v
// # of Modules	: 1
// Design Name	: OK_imager
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module OK_imager (
  sys_clkn, sys_clkp, im_data_val, im_data_clk, FSMIND0, FSMIND1ACK, okAA, FPGA_rst_n, CLKM, CLKMPRE, STREAM, OK_DRAIN_B, OK_PIXRES_GLOB, FSMIND1, 
FSMIND0ACK, okUH, im_data, okHU, okUHU, led, MSTREAM
)/* synthesis syn_black_box syn_noprune=1 */;
  input sys_clkn;
  input sys_clkp;
  input im_data_val;
  input im_data_clk;
  input FSMIND0;
  input FSMIND1ACK;
  inout okAA;
  output FPGA_rst_n;
  output CLKM;
  output CLKMPRE;
  output STREAM;
  output OK_DRAIN_B;
  output OK_PIXRES_GLOB;
  output FSMIND1;
  output FSMIND0ACK;
  input [4 : 0] okUH;
  input [5 : 0] im_data;
  output [2 : 0] okHU;
  inout [31 : 0] okUHU;
  output [7 : 0] led;
  output [10 : 1] MSTREAM;
  
  // synthesis translate_off
  
  wire okUH_4_IBUF_0;
  wire okUH_3_IBUF_1;
  wire okUH_2_IBUF_2;
  wire okUH_1_IBUF_3;
  wire im_data_5_IBUF_5;
  wire im_data_4_IBUF_6;
  wire im_data_3_IBUF_7;
  wire im_data_2_IBUF_8;
  wire im_data_1_IBUF_9;
  wire im_data_0_IBUF_10;
  wire im_data_val_IBUF_13;
  wire im_data_clk_IBUF_14;
  wire FSMIND0_IBUF_15;
  wire FSMIND1ACK_IBUF_16;
  wire okHU_2_OBUF_17;
  wire okHU_1_OBUF_18;
  wire okHU_0_OBUF_19;
  wire okClk;
  wire d_buf_valid;
  wire sys_clk_BUFG_194;
  wire RstPat;
  wire \ROImager_inst/OK_PIXRES_GLOB_202 ;
  wire \ROImager_inst/STREAM_203 ;
  wire \ROImager_inst/OK_DRAIN_B_204 ;
  wire \ROImager_inst/FSMIND1_i_206 ;
  wire \ROImager_inst/FSMIND0ACK_i_207 ;
  wire \pat_gen/Pat_i[10] ;
  wire \pat_gen/Pat_i[5] ;
  wire \pat_gen/FIFO_wr_210 ;
  wire rd_en;
  wire full_2;
  wire FSMstop;
  wire CLK0_BUFG_563;
  wire CLKDV_BUFG_564;
  wire CLK_HS_BUFG_565;
  wire CLK_HS180_BUFG_566;
  wire MSTREAM_10_OBUF_567;
  wire MSTREAM_9_OBUF_568;
  wire MSTREAM_8_OBUF_569;
  wire MSTREAM_7_OBUF_570;
  wire MSTREAM_6_OBUF_571;
  wire MSTREAM_5_OBUF_572;
  wire MSTREAM_4_OBUF_573;
  wire MSTREAM_3_OBUF_574;
  wire MSTREAM_2_OBUF_575;
  wire MSTREAM_1_OBUF_576;
  wire PatFIFO_empty;
  wire FPGA_rst_n_OBUF_578;
  wire CLKMPRE_int_BUFG_579;
  wire CLKMPRE_int180_BUFG_580;
  wire CLKM_OBUF_581;
  wire CLKMPRE_OBUF_647;
  wire \hostIF/okCH[36]_INV_86_o ;
  wire \hostIF/dcm0_locked ;
  wire \hostIF/dcm0_clk0 ;
  wire \hostIF/okUH0_ibufg ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ;
  wire \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>2 ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>1_731 ;
  wire \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ;
  wire \ROImager_inst/Mcompar_n0023_lutdi2_743 ;
  wire \ROImager_inst/Mcompar_n0023_lutdi1_746 ;
  wire \ROImager_inst/Mcompar_n0023_lutdi_749 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<6> ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<5>_752 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<5>_753 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi5_754 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<4>_755 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<4>_756 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi4_757 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<3>_758 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<3>_759 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi3_760 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<2>_761 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<2>_762 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi2_763 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<1>_764 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<1>_765 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi1_766 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<0>_767 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<0>_768 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi_769 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<4>_771 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<4>_772 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi4_773 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<3>_774 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<3>_775 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi3_776 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<2>_777 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<2>_778 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi2_779 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<1>_780 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<1>_781 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi1_782 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<0>_783 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<0>_784 ;
  wire \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi_785 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<6>_786 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<5>_787 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<5>_788 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi4_789 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<4>_790 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<4>_791 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi3_792 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<3>_793 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<3>_794 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi2_795 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<2>_796 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<2>_797 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi1_798 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<1>_799 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<1>_800 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi_801 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<0>_802 ;
  wire \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<0>_803 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_804 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_805 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_806 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_807 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_808 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_809 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_810 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_811 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_812 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_813 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_814 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_815 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_816 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_817 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_818 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_819 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_820 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_821 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_822 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_823 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_824 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_825 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_826 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_827 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_828 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_829 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_830 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_831 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_832 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_833 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<0>_834 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_lut<0> ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_836 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_837 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_838 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_839 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_840 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_841 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_842 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_843 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_844 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_845 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_846 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_847 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_848 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_849 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_850 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_851 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_852 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_853 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_854 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_855 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_856 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_857 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_858 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_859 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_860 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_861 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_862 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_863 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_864 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_865 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<0>_866 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_lut<0> ;
  wire \ROImager_inst/state_FSM_FFd1_868 ;
  wire \ROImager_inst/state_FSM_FFd2_869 ;
  wire \ROImager_inst/state_FSM_FFd3_870 ;
  wire \ROImager_inst/state_FSM_FFd4_871 ;
  wire \ROImager_inst/state_FSM_FFd5_872 ;
  wire \ROImager_inst/state_FSM_FFd6_873 ;
  wire \ROImager_inst/state_FSM_FFd1-In ;
  wire \ROImager_inst/state_FSM_FFd2-In_875 ;
  wire \ROImager_inst/state_FSM_FFd3-In_876 ;
  wire \ROImager_inst/state_FSM_FFd4-In ;
  wire \ROImager_inst/state_FSM_FFd6-In ;
  wire \ROImager_inst/state_FSM_FFd6-In4_879 ;
  wire \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P46_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P45_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P44_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P43_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P42_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P41_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P40_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P39_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P38_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P37_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P36_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P35_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P34_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P33_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P32_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P31_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P30_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P29_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P28_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P27_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P26_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P25_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P24_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P23_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P22_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P21_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P20_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P19_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P18_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_P17_to_Mmult_n01011 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_17 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_16 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_15 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_14 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_13 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_12 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_11 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_10 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_9 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_8 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_7 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_6 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_5 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_4 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_3 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_2 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_1 ;
  wire \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_0 ;
  wire \ROImager_inst/_n0143_inv ;
  wire \ROImager_inst/state[7]_PWR_6_o_select_49_OUT<0> ;
  wire \ROImager_inst/state[7]_PWR_6_o_select_49_OUT<3> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<1> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<2> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<3> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<4> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<5> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<6> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<7> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<8> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<9> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<10> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<11> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<12> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<13> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<14> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<15> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<16> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<17> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<18> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<19> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<20> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<21> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<22> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<23> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<24> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<25> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<26> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<27> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<28> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<29> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<30> ;
  wire \ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<31> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<0> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<1> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<2> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<3> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<4> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<5> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<6> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<7> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<8> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<9> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<10> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<11> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<12> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<13> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<14> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<15> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<16> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<17> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<18> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<19> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<20> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<21> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<22> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<23> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<24> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<25> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<26> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<27> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<28> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<29> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<30> ;
  wire \ROImager_inst/state[7]_GND_6_o_select_57_OUT<31> ;
  wire \ROImager_inst/state[7]_FSMIND0ACK_i_Select_64_o ;
  wire \ROImager_inst/state[7]_FSMIND1_i_Select_62_o ;
  wire \ROImager_inst/state[7]_GND_6_o_Select_53_o ;
  wire \ROImager_inst/state[7]_PWR_6_o_Select_51_o ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<0> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<1> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<2> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<3> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<4> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<5> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<6> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<7> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<8> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<9> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<10> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<11> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<12> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<13> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<14> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<15> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<16> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<17> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<18> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<19> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<20> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<21> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<22> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<23> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<24> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<25> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<26> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<27> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<28> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<29> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<30> ;
  wire \ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<31> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<0> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<1> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<2> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<3> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<4> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<5> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<6> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<7> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<8> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<9> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<10> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<11> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<12> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<13> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<14> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<15> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<16> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<17> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<18> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<19> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<20> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<21> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<22> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<23> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<24> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<25> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<26> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<27> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<28> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<29> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<30> ;
  wire \ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<31> ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<5> ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<4>_1160 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<4>_1161 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi4_1162 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<3>_1163 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<3>_1164 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi3_1165 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<2>_1166 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<2>_1167 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi2_1168 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<1>_1169 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<1>_1170 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi1_1171 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<0>_1172 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<0>_1173 ;
  wire \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi_1174 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_1175 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_1176 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_1177 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_1178 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_1179 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_1180 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_1181 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_1182 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_1183 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_1184 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_1185 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_1186 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_1187 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_1188 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_1189 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_1190 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_1191 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_1192 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_1193 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_1194 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_1195 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_1196 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_1197 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_1198 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_1199 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_1200 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_1201 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_1202 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_1203 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_1204 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<0>_1205 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_lut<0> ;
  wire \pat_gen/state_FSM_FFd1_1207 ;
  wire \pat_gen/state_FSM_FFd2_1208 ;
  wire \pat_gen/state_FSM_FFd3_1209 ;
  wire \pat_gen/rst_inv ;
  wire \pat_gen/state[4]_FIFO_wr_Select_35_o ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<0> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<1> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<2> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<3> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<4> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<5> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<6> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<7> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<8> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<9> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<10> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<11> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<12> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<13> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<14> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<15> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<16> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<17> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<18> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<19> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<20> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<21> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<22> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<23> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<24> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<25> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<26> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<27> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<28> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<29> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<30> ;
  wire \pat_gen/state[4]_GND_9_o_select_34_OUT<31> ;
  wire \pat_gen/state[4]_PatGen_start[9]_select_32_OUT<4> ;
  wire \pat_gen/state[4]_PatGen_start[9]_select_32_OUT<9> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<0> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<1> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<2> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<3> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<4> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<5> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<6> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<7> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<8> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<9> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<10> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<11> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<12> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<13> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<14> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<15> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<16> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<17> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<18> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<19> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<20> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<21> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<22> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<23> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<24> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<25> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<26> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<27> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<28> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<29> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<30> ;
  wire \pat_gen/cntPat[31]_GND_9_o_add_2_OUT<31> ;
  wire \ROImager_inst/state_FSM_FFd4-In1_1310 ;
  wire \ROImager_inst/state_FSM_FFd4-In2_1311 ;
  wire N4;
  wire N6;
  wire \ROImager_inst/state_FSM_FFd6-In2_1314 ;
  wire N8;
  wire N10;
  wire CLK_HS;
  wire CLK0;
  wire CLK_HS180;
  wire CLKDV;
  wire CLKMPRE_int180;
  wire CLKMPRE_int;
  wire \ROImager_inst/STREAM_glue_set_1366 ;
  wire \ROImager_inst/fsm_stat_i_5_glue_rst_1367 ;
  wire \ROImager_inst/fsm_stat_i_4_glue_set_1368 ;
  wire \ROImager_inst/fsm_stat_i_2_glue_set_1369 ;
  wire \ROImager_inst/count_subsc_0_glue_rst_1370 ;
  wire \pat_gen/state_FSM_FFd2_glue_rst_1371 ;
  wire \pat_gen/state_FSM_FFd3_glue_set_1372 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_rt_1373 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_rt_1374 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_rt_1375 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_rt_1376 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_rt_1377 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_rt_1378 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_rt_1379 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_rt_1380 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_rt_1381 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_rt_1382 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_rt_1383 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_rt_1384 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_rt_1385 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_rt_1386 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_rt_1387 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_rt_1388 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_rt_1389 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_rt_1390 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_rt_1391 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_rt_1392 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_rt_1393 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_rt_1394 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_rt_1395 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_rt_1396 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_rt_1397 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_rt_1398 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_rt_1399 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_rt_1400 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_rt_1401 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_rt_1402 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_rt_1403 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_rt_1404 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_rt_1405 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_rt_1406 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_rt_1407 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_rt_1408 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_rt_1409 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_rt_1410 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_rt_1411 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_rt_1412 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_rt_1413 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_rt_1414 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_rt_1415 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_rt_1416 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_rt_1417 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_rt_1418 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_rt_1419 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_rt_1420 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_rt_1421 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_rt_1422 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_rt_1423 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_rt_1424 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_rt_1425 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_rt_1426 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_rt_1427 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_rt_1428 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_rt_1429 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_rt_1430 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_rt_1431 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_rt_1432 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_rt_1433 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_rt_1434 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_rt_1435 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_rt_1436 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_rt_1437 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_rt_1438 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_rt_1439 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_rt_1440 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_rt_1441 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_rt_1442 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_rt_1443 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_rt_1444 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_rt_1445 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_rt_1446 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_rt_1447 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_rt_1448 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_rt_1449 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_rt_1450 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_rt_1451 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_rt_1452 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_rt_1453 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_rt_1454 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_rt_1455 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_rt_1456 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_rt_1457 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_rt_1458 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_rt_1459 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_rt_1460 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_rt_1461 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_rt_1462 ;
  wire \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<31>_rt_1463 ;
  wire \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<31>_rt_1464 ;
  wire \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<31>_rt_1465 ;
  wire \pat_gen/state_FSM_FFd1_rstpot_1466 ;
  wire \ROImager_inst/state_FSM_FFd5_rstpot_1467 ;
  wire N45;
  wire \ROImager_inst/Mcompar_n0023_cy<6>_l1 ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_lut_1470 ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3_l1 ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_lut_1472 ;
  wire N47;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_cy_rt_1474 ;
  wire \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_cy_rt_1475 ;
  wire sys_clk;
  wire NLW_DCM_SP_CLKHS_CLK2X180_UNCONNECTED;
  wire NLW_DCM_SP_CLKHS_CLK2X_UNCONNECTED;
  wire NLW_DCM_SP_CLKHS_CLK180_UNCONNECTED;
  wire NLW_DCM_SP_CLKHS_CLK270_UNCONNECTED;
  wire NLW_DCM_SP_CLKHS_PSDONE_UNCONNECTED;
  wire NLW_DCM_SP_CLKHS_CLK90_UNCONNECTED;
  wire NLW_DCM_SP_CLKHS_LOCKED_UNCONNECTED;
  wire \NLW_DCM_SP_CLKHS_STATUS<7>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<6>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<5>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<4>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<3>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<2>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<1>_UNCONNECTED ;
  wire \NLW_DCM_SP_CLKHS_STATUS<0>_UNCONNECTED ;
  wire NLW_DCM_CLKGEN_CLKMPRE_PROGDONE_UNCONNECTED;
  wire NLW_DCM_CLKGEN_CLKMPRE_CLKFXDV_UNCONNECTED;
  wire NLW_DCM_CLKGEN_CLKMPRE_LOCKED_UNCONNECTED;
  wire \NLW_DCM_CLKGEN_CLKMPRE_STATUS<2>_UNCONNECTED ;
  wire \NLW_DCM_CLKGEN_CLKMPRE_STATUS<1>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLK2X180_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_PSCLK_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLK2X_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLKFX_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLK180_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLK270_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_PSINCDEC_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLKFX180_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLKDV_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_PSDONE_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_CLK90_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_DSSEN_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<7>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<6>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<5>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<4>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<3>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<2>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<1>_UNCONNECTED ;
  wire \NLW_hostIF/dcm0_STATUS<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_CARRYOUTF_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_CARRYOUT_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_BCOUT<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<47>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<46>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<45>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<44>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<43>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<42>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<41>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<40>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<39>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<38>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<37>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<36>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCIN<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<47>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<46>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<45>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<44>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<43>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<42>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<41>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<40>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<39>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<38>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<37>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<36>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_P<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<47>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<46>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<45>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<44>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<43>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<42>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<41>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<40>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<39>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<38>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<37>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<36>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_PCOUT<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n01011_M<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_CARRYOUTF_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_CARRYOUT_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<47>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<46>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<45>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<44>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<43>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<42>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<41>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<40>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<39>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<38>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<37>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<36>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCIN<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<47>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<46>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<45>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<44>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<43>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<42>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<41>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<40>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<39>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<38>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<37>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<36>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_PCOUT<0>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<35>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<34>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<33>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<32>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<31>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<30>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<29>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<28>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<27>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<26>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<25>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<24>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<23>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<22>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<21>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<20>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<19>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<18>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<17>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<16>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<15>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<14>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<13>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<12>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<11>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<10>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<9>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<8>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<7>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<6>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<5>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<4>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<3>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<2>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<1>_UNCONNECTED ;
  wire \NLW_ROImager_inst/Mmult_n0101_M<0>_UNCONNECTED ;
  wire NLW_fifo_databuf_full_UNCONNECTED;
  wire NLW_fifo_databuf_empty_UNCONNECTED;
  wire NLW_fifo_databuf_almost_empty_UNCONNECTED;
  wire \NLW_trigIn53_ep_trigger<31>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<30>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<29>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<28>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<27>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<26>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<25>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<24>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<23>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<22>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<21>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<20>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<19>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<18>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<17>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<16>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<15>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<14>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<13>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<12>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<11>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<10>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<9>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<8>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<7>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<6>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<5>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<4>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<3>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<2>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<1>_UNCONNECTED ;
  wire \NLW_trigIn53_ep_trigger<0>_UNCONNECTED ;
  wire NLW_fifo256kB_out_empty_UNCONNECTED;
  wire NLW_FIFO_Patterns_full_UNCONNECTED;
  wire NLW_FIFO_Patterns_empty_UNCONNECTED;
  wire NLW_FIFO_Patterns_valid_UNCONNECTED;
  wire NLW_FIFO_Patterns_prog_full_UNCONNECTED;
  wire [0 : 0] wireout;
  wire [29 : 29] wireExp;
  wire [112 : 0] okHE;
  wire [23 : 0] dout;
  wire [6 : 1] \ROImager_inst/fsm_stat_i ;
  wire [31 : 0] \ROImager_inst/count_subsc ;
  wire [324 : 0] okEHx;
  wire [23 : 0] dout_buf;
  wire [64 : 0] okEH;
  wire [38 : 1] \hostIF/okHC ;
  wire [37 : 0] \hostIF/okCH ;
  wire [6 : 0] \ROImager_inst/Mcompar_n0023_cy ;
  wire [6 : 0] \ROImager_inst/Mcompar_n0023_lut ;
  wire [31 : 0] \ROImager_inst/n0101 ;
  wire [31 : 0] \ROImager_inst/count_mpre ;
  wire [31 : 0] \pat_gen/cntPat ;
  wire [31 : 0] \hostIF/iobf0_o ;
  wire [31 : 0] \hostIF/regvalid_q ;
  wire [31 : 0] \hostIF/regout0_q ;
  GND   XST_GND (
    .G(wireout[0])
  );
  VCC   XST_VCC (
    .P(wireExp[29])
  );
  IBUFGDS #(
    .CAPACITANCE ( "DONT_CARE" ),
    .DIFF_TERM ( "FALSE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IOSTANDARD ( "DEFAULT" ))
  osc_clk (
    .I(sys_clkp),
    .IB(sys_clkn),
    .O(sys_clk)
  );
  DCM_SP #(
    .CLKIN_DIVIDE_BY_2 ( "FALSE" ),
    .CLKOUT_PHASE_SHIFT ( "NONE" ),
    .CLK_FEEDBACK ( "1X" ),
    .DESKEW_ADJUST ( "SYSTEM_SYNCHRONOUS" ),
    .DFS_FREQUENCY_MODE ( "LOW" ),
    .DLL_FREQUENCY_MODE ( "LOW" ),
    .DSS_MODE ( "NONE" ),
    .DUTY_CYCLE_CORRECTION ( "TRUE" ),
    .FACTORY_JF ( 16'h0000 ),
    .STARTUP_WAIT ( "FALSE" ),
    .CLKFX_DIVIDE ( 10 ),
    .CLKFX_MULTIPLY ( 10 ),
    .PHASE_SHIFT ( 0 ),
    .CLKDV_DIVIDE ( 2.000000 ),
    .CLKIN_PERIOD ( 10.000000 ))
  DCM_SP_CLKHS (
    .CLK2X180(NLW_DCM_SP_CLKHS_CLK2X180_UNCONNECTED),
    .PSCLK(wireout[0]),
    .CLK2X(NLW_DCM_SP_CLKHS_CLK2X_UNCONNECTED),
    .CLKFX(CLK_HS),
    .CLK180(NLW_DCM_SP_CLKHS_CLK180_UNCONNECTED),
    .CLK270(NLW_DCM_SP_CLKHS_CLK270_UNCONNECTED),
    .RST(wireout[0]),
    .PSINCDEC(wireout[0]),
    .CLKIN(sys_clk),
    .CLKFB(CLK0_BUFG_563),
    .PSEN(wireout[0]),
    .CLK0(CLK0),
    .CLKFX180(CLK_HS180),
    .CLKDV(CLKDV),
    .PSDONE(NLW_DCM_SP_CLKHS_PSDONE_UNCONNECTED),
    .CLK90(NLW_DCM_SP_CLKHS_CLK90_UNCONNECTED),
    .LOCKED(NLW_DCM_SP_CLKHS_LOCKED_UNCONNECTED),
    .DSSEN(wireout[0]),
    .STATUS({\NLW_DCM_SP_CLKHS_STATUS<7>_UNCONNECTED , \NLW_DCM_SP_CLKHS_STATUS<6>_UNCONNECTED , \NLW_DCM_SP_CLKHS_STATUS<5>_UNCONNECTED , 
\NLW_DCM_SP_CLKHS_STATUS<4>_UNCONNECTED , \NLW_DCM_SP_CLKHS_STATUS<3>_UNCONNECTED , \NLW_DCM_SP_CLKHS_STATUS<2>_UNCONNECTED , 
\NLW_DCM_SP_CLKHS_STATUS<1>_UNCONNECTED , \NLW_DCM_SP_CLKHS_STATUS<0>_UNCONNECTED })
  );
  DCM_CLKGEN #(
    .SPREAD_SPECTRUM ( "NONE" ),
    .STARTUP_WAIT ( "FALSE" ),
    .CLKFXDV_DIVIDE ( 2 ),
    .CLKFX_DIVIDE ( 72 ),
    .CLKFX_MULTIPLY ( 4 ),
    .CLKFX_MD_MAX ( 2.000000 ),
    .CLKIN_PERIOD ( 10.000000 ))
  DCM_CLKGEN_CLKMPRE (
    .CLKFX180(CLKMPRE_int180),
    .CLKIN(CLK_HS_BUFG_565),
    .PROGDATA(wireout[0]),
    .CLKFX(CLKMPRE_int),
    .PROGEN(wireout[0]),
    .PROGDONE(NLW_DCM_CLKGEN_CLKMPRE_PROGDONE_UNCONNECTED),
    .CLKFXDV(NLW_DCM_CLKGEN_CLKMPRE_CLKFXDV_UNCONNECTED),
    .FREEZEDCM(wireout[0]),
    .PROGCLK(wireout[0]),
    .RST(wireout[0]),
    .LOCKED(NLW_DCM_CLKGEN_CLKMPRE_LOCKED_UNCONNECTED),
    .STATUS({\NLW_DCM_CLKGEN_CLKMPRE_STATUS<2>_UNCONNECTED , \NLW_DCM_CLKGEN_CLKMPRE_STATUS<1>_UNCONNECTED })
  );
  ODDR2 #(
    .DDR_ALIGNMENT ( "NONE" ),
    .SRTYPE ( "SYNC" ),
    .INIT ( 1'b0 ))
  ODDR2_inst_1 (
    .D0(wireout[0]),
    .D1(wireExp[29]),
    .C0(CLK_HS180_BUFG_566),
    .C1(CLK_HS_BUFG_565),
    .CE(wireExp[29]),
    .R(wireout[0]),
    .S(wireout[0]),
    .Q(CLKM_OBUF_581)
  );
  ODDR2 #(
    .DDR_ALIGNMENT ( "NONE" ),
    .SRTYPE ( "SYNC" ),
    .INIT ( 1'b0 ))
  ODDR2_CLKMPRE_IO (
    .D0(wireout[0]),
    .D1(wireExp[29]),
    .C0(CLKMPRE_int180_BUFG_580),
    .C1(CLKMPRE_int_BUFG_579),
    .CE(wireExp[29]),
    .R(wireout[0]),
    .S(wireout[0]),
    .Q(CLKMPRE_OBUF_647)
  );
  BUFG   \hostIF/dcm0_bufg  (
    .O(okClk),
    .I(\hostIF/dcm0_clk0 )
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/tbuf  (
    .I(\hostIF/okCH [35]),
    .T(\hostIF/okCH [37]),
    .O(\hostIF/okHC [37]),
    .IO(okAA)
  );
  DCM_SP #(
    .CLKIN_DIVIDE_BY_2 ( "FALSE" ),
    .CLKOUT_PHASE_SHIFT ( "FIXED" ),
    .CLK_FEEDBACK ( "1X" ),
    .DESKEW_ADJUST ( "SOURCE_SYNCHRONOUS" ),
    .DFS_FREQUENCY_MODE ( "LOW" ),
    .DLL_FREQUENCY_MODE ( "LOW" ),
    .DSS_MODE ( "NONE" ),
    .DUTY_CYCLE_CORRECTION ( "TRUE" ),
    .FACTORY_JF ( 16'h0000 ),
    .STARTUP_WAIT ( "FALSE" ),
    .CLKFX_DIVIDE ( 1 ),
    .CLKFX_MULTIPLY ( 4 ),
    .PHASE_SHIFT ( -24 ),
    .CLKDV_DIVIDE ( 2.000000 ),
    .CLKIN_PERIOD ( 9.920000 ))
  \hostIF/dcm0  (
    .CLK2X180(\NLW_hostIF/dcm0_CLK2X180_UNCONNECTED ),
    .PSCLK(\NLW_hostIF/dcm0_PSCLK_UNCONNECTED ),
    .CLK2X(\NLW_hostIF/dcm0_CLK2X_UNCONNECTED ),
    .CLKFX(\NLW_hostIF/dcm0_CLKFX_UNCONNECTED ),
    .CLK180(\NLW_hostIF/dcm0_CLK180_UNCONNECTED ),
    .CLK270(\NLW_hostIF/dcm0_CLK270_UNCONNECTED ),
    .RST(wireout[0]),
    .PSINCDEC(\NLW_hostIF/dcm0_PSINCDEC_UNCONNECTED ),
    .CLKIN(\hostIF/okUH0_ibufg ),
    .CLKFB(okClk),
    .PSEN(wireout[0]),
    .CLK0(\hostIF/dcm0_clk0 ),
    .CLKFX180(\NLW_hostIF/dcm0_CLKFX180_UNCONNECTED ),
    .CLKDV(\NLW_hostIF/dcm0_CLKDV_UNCONNECTED ),
    .PSDONE(\NLW_hostIF/dcm0_PSDONE_UNCONNECTED ),
    .CLK90(\NLW_hostIF/dcm0_CLK90_UNCONNECTED ),
    .LOCKED(\hostIF/dcm0_locked ),
    .DSSEN(\NLW_hostIF/dcm0_DSSEN_UNCONNECTED ),
    .STATUS({\NLW_hostIF/dcm0_STATUS<7>_UNCONNECTED , \NLW_hostIF/dcm0_STATUS<6>_UNCONNECTED , \NLW_hostIF/dcm0_STATUS<5>_UNCONNECTED , 
\NLW_hostIF/dcm0_STATUS<4>_UNCONNECTED , \NLW_hostIF/dcm0_STATUS<3>_UNCONNECTED , \NLW_hostIF/dcm0_STATUS<2>_UNCONNECTED , 
\NLW_hostIF/dcm0_STATUS<1>_UNCONNECTED , \NLW_hostIF/dcm0_STATUS<0>_UNCONNECTED })
  );
  IBUFG #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IOSTANDARD ( "DEFAULT" ))
  \hostIF/hi_clk_bufg  (
    .I(okUH[0]),
    .O(\hostIF/okUH0_ibufg )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlout2  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [1]),
    .R(wireout[0]),
    .Q(okHU_1_OBUF_18)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlout1  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [0]),
    .R(wireout[0]),
    .Q(okHU_0_OBUF_19)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [2]),
    .R(wireout[0]),
    .Q(okHU_2_OBUF_17)
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlin3a  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(okUH_4_IBUF_0),
    .R(wireout[0]),
    .Q(\hostIF/okHC [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlin2a  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(okUH_3_IBUF_1),
    .R(wireout[0]),
    .Q(\hostIF/okHC [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlin1a  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(okUH_2_IBUF_2),
    .R(wireout[0]),
    .Q(\hostIF/okHC [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/regctrlin0a  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(okUH_1_IBUF_3),
    .R(wireout[0]),
    .Q(\hostIF/okHC [1])
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<6>  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [5]),
    .DI(wireout[0]),
    .S(\ROImager_inst/Mcompar_n0023_lut [6]),
    .O(\ROImager_inst/Mcompar_n0023_cy [6])
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \ROImager_inst/Mcompar_n0023_lut<6>  (
    .I0(\ROImager_inst/n0101 [30]),
    .I1(\ROImager_inst/n0101 [31]),
    .O(\ROImager_inst/Mcompar_n0023_lut [6])
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<5>  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [4]),
    .DI(wireout[0]),
    .S(\ROImager_inst/Mcompar_n0023_lut [5]),
    .O(\ROImager_inst/Mcompar_n0023_cy [5])
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_n0023_lut<5>  (
    .I0(\ROImager_inst/n0101 [25]),
    .I1(\ROImager_inst/n0101 [26]),
    .I2(\ROImager_inst/n0101 [27]),
    .I3(\ROImager_inst/n0101 [28]),
    .I4(\ROImager_inst/n0101 [29]),
    .O(\ROImager_inst/Mcompar_n0023_lut [5])
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<4>  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [3]),
    .DI(wireout[0]),
    .S(\ROImager_inst/Mcompar_n0023_lut [4]),
    .O(\ROImager_inst/Mcompar_n0023_cy [4])
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_n0023_lut<4>  (
    .I0(\ROImager_inst/n0101 [20]),
    .I1(\ROImager_inst/n0101 [21]),
    .I2(\ROImager_inst/n0101 [22]),
    .I3(\ROImager_inst/n0101 [23]),
    .I4(\ROImager_inst/n0101 [24]),
    .O(\ROImager_inst/Mcompar_n0023_lut [4])
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<3>  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [2]),
    .DI(wireout[0]),
    .S(\ROImager_inst/Mcompar_n0023_lut [3]),
    .O(\ROImager_inst/Mcompar_n0023_cy [3])
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_n0023_lut<3>  (
    .I0(\ROImager_inst/n0101 [15]),
    .I1(\ROImager_inst/n0101 [16]),
    .I2(\ROImager_inst/n0101 [17]),
    .I3(\ROImager_inst/n0101 [18]),
    .I4(\ROImager_inst/n0101 [19]),
    .O(\ROImager_inst/Mcompar_n0023_lut [3])
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<2>  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [1]),
    .DI(\ROImager_inst/Mcompar_n0023_lutdi2_743 ),
    .S(\ROImager_inst/Mcompar_n0023_lut [2]),
    .O(\ROImager_inst/Mcompar_n0023_cy [2])
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \ROImager_inst/Mcompar_n0023_lut<2>  (
    .I0(\ROImager_inst/n0101 [11]),
    .I1(\ROImager_inst/n0101 [12]),
    .I2(\ROImager_inst/n0101 [13]),
    .I3(\ROImager_inst/n0101 [10]),
    .I4(\ROImager_inst/n0101 [14]),
    .O(\ROImager_inst/Mcompar_n0023_lut [2])
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_n0023_lutdi2  (
    .I0(\ROImager_inst/n0101 [10]),
    .I1(\ROImager_inst/n0101 [11]),
    .I2(\ROImager_inst/n0101 [12]),
    .I3(\ROImager_inst/n0101 [13]),
    .I4(\ROImager_inst/n0101 [14]),
    .O(\ROImager_inst/Mcompar_n0023_lutdi2_743 )
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<1>  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [0]),
    .DI(\ROImager_inst/Mcompar_n0023_lutdi1_746 ),
    .S(\ROImager_inst/Mcompar_n0023_lut [1]),
    .O(\ROImager_inst/Mcompar_n0023_cy [1])
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \ROImager_inst/Mcompar_n0023_lut<1>  (
    .I0(\ROImager_inst/n0101 [8]),
    .I1(\ROImager_inst/n0101 [6]),
    .I2(\ROImager_inst/n0101 [7]),
    .I3(\ROImager_inst/n0101 [5]),
    .I4(\ROImager_inst/n0101 [9]),
    .O(\ROImager_inst/Mcompar_n0023_lut [1])
  );
  LUT4 #(
    .INIT ( 16'h1555 ))
  \ROImager_inst/Mcompar_n0023_lutdi1  (
    .I0(\ROImager_inst/n0101 [9]),
    .I1(\ROImager_inst/n0101 [7]),
    .I2(\ROImager_inst/n0101 [6]),
    .I3(\ROImager_inst/n0101 [8]),
    .O(\ROImager_inst/Mcompar_n0023_lutdi1_746 )
  );
  MUXCY   \ROImager_inst/Mcompar_n0023_cy<0>  (
    .CI(wireExp[29]),
    .DI(\ROImager_inst/Mcompar_n0023_lutdi_749 ),
    .S(\ROImager_inst/Mcompar_n0023_lut [0]),
    .O(\ROImager_inst/Mcompar_n0023_cy [0])
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \ROImager_inst/Mcompar_n0023_lut<0>  (
    .I0(\ROImager_inst/n0101 [3]),
    .I1(\ROImager_inst/n0101 [4]),
    .I2(\ROImager_inst/n0101 [2]),
    .I3(\ROImager_inst/n0101 [0]),
    .I4(\ROImager_inst/n0101 [1]),
    .O(\ROImager_inst/Mcompar_n0023_lut [0])
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  \ROImager_inst/Mcompar_n0023_lutdi  (
    .I0(\ROImager_inst/n0101 [4]),
    .I1(\ROImager_inst/n0101 [3]),
    .I2(\ROImager_inst/n0101 [2]),
    .O(\ROImager_inst/Mcompar_n0023_lutdi_749 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<5>_752 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<6> ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<5>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<4>_755 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi5_754 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<5>_753 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<5>_752 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<5>  (
    .I0(\ROImager_inst/count_mpre [26]),
    .I1(\ROImager_inst/count_mpre [27]),
    .I2(\ROImager_inst/count_mpre [28]),
    .I3(\ROImager_inst/count_mpre [29]),
    .I4(\ROImager_inst/count_mpre [30]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<5>_753 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi5  (
    .I0(\ROImager_inst/count_mpre [30]),
    .I1(\ROImager_inst/count_mpre [29]),
    .I2(\ROImager_inst/count_mpre [28]),
    .I3(\ROImager_inst/count_mpre [27]),
    .I4(\ROImager_inst/count_mpre [26]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi5_754 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<4>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<3>_758 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi4_757 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<4>_756 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<4>_755 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<4>  (
    .I0(\ROImager_inst/count_mpre [21]),
    .I1(\ROImager_inst/count_mpre [22]),
    .I2(\ROImager_inst/count_mpre [23]),
    .I3(\ROImager_inst/count_mpre [24]),
    .I4(\ROImager_inst/count_mpre [25]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<4>_756 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi4  (
    .I0(\ROImager_inst/count_mpre [25]),
    .I1(\ROImager_inst/count_mpre [24]),
    .I2(\ROImager_inst/count_mpre [23]),
    .I3(\ROImager_inst/count_mpre [22]),
    .I4(\ROImager_inst/count_mpre [21]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi4_757 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<3>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<2>_761 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi3_760 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<3>_759 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<3>_758 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<3>  (
    .I0(\ROImager_inst/count_mpre [16]),
    .I1(\ROImager_inst/count_mpre [17]),
    .I2(\ROImager_inst/count_mpre [18]),
    .I3(\ROImager_inst/count_mpre [19]),
    .I4(\ROImager_inst/count_mpre [20]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<3>_759 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi3  (
    .I0(\ROImager_inst/count_mpre [20]),
    .I1(\ROImager_inst/count_mpre [19]),
    .I2(\ROImager_inst/count_mpre [18]),
    .I3(\ROImager_inst/count_mpre [17]),
    .I4(\ROImager_inst/count_mpre [16]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi3_760 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<2>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<1>_764 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi2_763 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<2>_762 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<2>_761 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<2>  (
    .I0(\ROImager_inst/count_mpre [11]),
    .I1(\ROImager_inst/count_mpre [12]),
    .I2(\ROImager_inst/count_mpre [13]),
    .I3(\ROImager_inst/count_mpre [14]),
    .I4(\ROImager_inst/count_mpre [15]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<2>_762 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi2  (
    .I0(\ROImager_inst/count_mpre [15]),
    .I1(\ROImager_inst/count_mpre [14]),
    .I2(\ROImager_inst/count_mpre [13]),
    .I3(\ROImager_inst/count_mpre [12]),
    .I4(\ROImager_inst/count_mpre [11]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi2_763 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<1>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<0>_767 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi1_766 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<1>_765 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<1>_764 )
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<1>  (
    .I0(\ROImager_inst/count_mpre [6]),
    .I1(\ROImager_inst/count_mpre [8]),
    .I2(\ROImager_inst/count_mpre [9]),
    .I3(\ROImager_inst/count_mpre [7]),
    .I4(\ROImager_inst/count_mpre [10]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<1>_765 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFEEE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi1  (
    .I0(\ROImager_inst/count_mpre [8]),
    .I1(\ROImager_inst/count_mpre [10]),
    .I2(\ROImager_inst/count_mpre [7]),
    .I3(\ROImager_inst/count_mpre [6]),
    .I4(\ROImager_inst/count_mpre [9]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi1_766 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<0>  (
    .CI(wireExp[29]),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi_769 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<0>_768 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<0>_767 )
  );
  LUT5 #(
    .INIT ( 32'h00001000 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<0>  (
    .I0(\ROImager_inst/count_mpre [2]),
    .I1(\ROImager_inst/count_mpre [3]),
    .I2(\ROImager_inst/count_mpre [5]),
    .I3(\ROImager_inst/count_mpre [1]),
    .I4(\ROImager_inst/count_mpre [4]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<0>_768 )
  );
  LUT4 #(
    .INIT ( 16'hAAA8 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi  (
    .I0(\ROImager_inst/count_mpre [5]),
    .I1(\ROImager_inst/count_mpre [4]),
    .I2(\ROImager_inst/count_mpre [3]),
    .I3(\ROImager_inst/count_mpre [2]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lutdi_769 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<4>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<3>_774 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi4_773 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<4>_772 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<4>_771 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<4>  (
    .I0(\ROImager_inst/count_mpre [25]),
    .I1(\ROImager_inst/count_mpre [26]),
    .I2(\ROImager_inst/count_mpre [27]),
    .I3(\ROImager_inst/count_mpre [28]),
    .I4(\ROImager_inst/count_mpre [29]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<4>_772 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi4  (
    .I0(\ROImager_inst/count_mpre [29]),
    .I1(\ROImager_inst/count_mpre [28]),
    .I2(\ROImager_inst/count_mpre [27]),
    .I3(\ROImager_inst/count_mpre [26]),
    .I4(\ROImager_inst/count_mpre [25]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi4_773 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<3>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<2>_777 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi3_776 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<3>_775 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<3>_774 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<3>  (
    .I0(\ROImager_inst/count_mpre [20]),
    .I1(\ROImager_inst/count_mpre [21]),
    .I2(\ROImager_inst/count_mpre [22]),
    .I3(\ROImager_inst/count_mpre [23]),
    .I4(\ROImager_inst/count_mpre [24]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<3>_775 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi3  (
    .I0(\ROImager_inst/count_mpre [24]),
    .I1(\ROImager_inst/count_mpre [23]),
    .I2(\ROImager_inst/count_mpre [22]),
    .I3(\ROImager_inst/count_mpre [21]),
    .I4(\ROImager_inst/count_mpre [20]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi3_776 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<2>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<1>_780 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi2_779 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<2>_778 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<2>_777 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<2>  (
    .I0(\ROImager_inst/count_mpre [15]),
    .I1(\ROImager_inst/count_mpre [16]),
    .I2(\ROImager_inst/count_mpre [17]),
    .I3(\ROImager_inst/count_mpre [18]),
    .I4(\ROImager_inst/count_mpre [19]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<2>_778 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi2  (
    .I0(\ROImager_inst/count_mpre [19]),
    .I1(\ROImager_inst/count_mpre [18]),
    .I2(\ROImager_inst/count_mpre [17]),
    .I3(\ROImager_inst/count_mpre [16]),
    .I4(\ROImager_inst/count_mpre [15]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi2_779 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<1>  (
    .CI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<0>_783 ),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi1_782 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<1>_781 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<1>_780 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<1>  (
    .I0(\ROImager_inst/count_mpre [10]),
    .I1(\ROImager_inst/count_mpre [11]),
    .I2(\ROImager_inst/count_mpre [12]),
    .I3(\ROImager_inst/count_mpre [13]),
    .I4(\ROImager_inst/count_mpre [14]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<1>_781 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi1  (
    .I0(\ROImager_inst/count_mpre [14]),
    .I1(\ROImager_inst/count_mpre [13]),
    .I2(\ROImager_inst/count_mpre [12]),
    .I3(\ROImager_inst/count_mpre [11]),
    .I4(\ROImager_inst/count_mpre [10]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi1_782 )
  );
  MUXCY   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<0>  (
    .CI(wireExp[29]),
    .DI(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi_785 ),
    .S(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<0>_784 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<0>_783 )
  );
  LUT5 #(
    .INIT ( 32'h00001000 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<0>  (
    .I0(\ROImager_inst/count_mpre [6]),
    .I1(\ROImager_inst/count_mpre [8]),
    .I2(\ROImager_inst/count_mpre [7]),
    .I3(\ROImager_inst/count_mpre [5]),
    .I4(\ROImager_inst/count_mpre [9]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lut<0>_784 )
  );
  LUT4 #(
    .INIT ( 16'hFFEA ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi  (
    .I0(\ROImager_inst/count_mpre [9]),
    .I1(\ROImager_inst/count_mpre [7]),
    .I2(\ROImager_inst/count_mpre [6]),
    .I3(\ROImager_inst/count_mpre [8]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_lutdi_785 )
  );
  MUXCY   \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<5>  (
    .CI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<4>_790 ),
    .DI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi4_789 ),
    .S(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<5>_788 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<5>_787 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<5>  (
    .I0(\ROImager_inst/count_subsc [25]),
    .I1(\ROImager_inst/count_subsc [26]),
    .I2(\ROImager_inst/count_subsc [27]),
    .I3(\ROImager_inst/count_subsc [28]),
    .I4(\ROImager_inst/count_subsc [29]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<5>_788 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi4  (
    .I0(\ROImager_inst/count_subsc [29]),
    .I1(\ROImager_inst/count_subsc [28]),
    .I2(\ROImager_inst/count_subsc [27]),
    .I3(\ROImager_inst/count_subsc [26]),
    .I4(\ROImager_inst/count_subsc [25]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi4_789 )
  );
  MUXCY   \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<4>  (
    .CI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<3>_793 ),
    .DI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi3_792 ),
    .S(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<4>_791 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<4>_790 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<4>  (
    .I0(\ROImager_inst/count_subsc [20]),
    .I1(\ROImager_inst/count_subsc [21]),
    .I2(\ROImager_inst/count_subsc [22]),
    .I3(\ROImager_inst/count_subsc [23]),
    .I4(\ROImager_inst/count_subsc [24]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<4>_791 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi3  (
    .I0(\ROImager_inst/count_subsc [24]),
    .I1(\ROImager_inst/count_subsc [23]),
    .I2(\ROImager_inst/count_subsc [22]),
    .I3(\ROImager_inst/count_subsc [21]),
    .I4(\ROImager_inst/count_subsc [20]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi3_792 )
  );
  MUXCY   \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<3>  (
    .CI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<2>_796 ),
    .DI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi2_795 ),
    .S(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<3>_794 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<3>_793 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<3>  (
    .I0(\ROImager_inst/count_subsc [15]),
    .I1(\ROImager_inst/count_subsc [16]),
    .I2(\ROImager_inst/count_subsc [17]),
    .I3(\ROImager_inst/count_subsc [18]),
    .I4(\ROImager_inst/count_subsc [19]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<3>_794 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi2  (
    .I0(\ROImager_inst/count_subsc [19]),
    .I1(\ROImager_inst/count_subsc [18]),
    .I2(\ROImager_inst/count_subsc [17]),
    .I3(\ROImager_inst/count_subsc [16]),
    .I4(\ROImager_inst/count_subsc [15]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi2_795 )
  );
  MUXCY   \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<2>  (
    .CI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<1>_799 ),
    .DI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi1_798 ),
    .S(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<2>_797 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<2>_796 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<2>  (
    .I0(\ROImager_inst/count_subsc [10]),
    .I1(\ROImager_inst/count_subsc [11]),
    .I2(\ROImager_inst/count_subsc [12]),
    .I3(\ROImager_inst/count_subsc [13]),
    .I4(\ROImager_inst/count_subsc [14]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<2>_797 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi1  (
    .I0(\ROImager_inst/count_subsc [14]),
    .I1(\ROImager_inst/count_subsc [13]),
    .I2(\ROImager_inst/count_subsc [12]),
    .I3(\ROImager_inst/count_subsc [11]),
    .I4(\ROImager_inst/count_subsc [10]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi1_798 )
  );
  MUXCY   \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<1>  (
    .CI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<0>_802 ),
    .DI(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi_801 ),
    .S(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<1>_800 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<1>_799 )
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<1>  (
    .I0(\ROImager_inst/count_subsc [6]),
    .I1(\ROImager_inst/count_subsc [7]),
    .I2(\ROImager_inst/count_subsc [8]),
    .I3(\ROImager_inst/count_subsc [5]),
    .I4(\ROImager_inst/count_subsc [9]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<1>_800 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi  (
    .I0(\ROImager_inst/count_subsc [9]),
    .I1(\ROImager_inst/count_subsc [8]),
    .I2(\ROImager_inst/count_subsc [7]),
    .I3(\ROImager_inst/count_subsc [6]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lutdi_801 )
  );
  MUXCY   \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<0>  (
    .CI(wireExp[29]),
    .DI(\ROImager_inst/count_subsc [4]),
    .S(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<0>_803 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<0>_802 )
  );
  LUT5 #(
    .INIT ( 32'h40000000 ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<0>  (
    .I0(\ROImager_inst/count_subsc [4]),
    .I1(\ROImager_inst/count_subsc [1]),
    .I2(\ROImager_inst/count_subsc [2]),
    .I3(\ROImager_inst/count_subsc [3]),
    .I4(\ROImager_inst/count_subsc [0]),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_lut<0>_803 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<31>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_804 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<31>_rt_1463 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<31> )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<30>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_805 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_rt_1373 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<30> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_805 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_rt_1373 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_804 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<29>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_806 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_rt_1374 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<29> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_806 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_rt_1374 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_805 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<28>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_807 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_rt_1375 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<28> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_807 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_rt_1375 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_806 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<27>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_808 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_rt_1376 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<27> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_808 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_rt_1376 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_807 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<26>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_809 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_rt_1377 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<26> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_809 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_rt_1377 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_808 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<25>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_810 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_rt_1378 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<25> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_810 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_rt_1378 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_809 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<24>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_811 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_rt_1379 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<24> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_811 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_rt_1379 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_810 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<23>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_812 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_rt_1380 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<23> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_812 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_rt_1380 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_811 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<22>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_813 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_rt_1381 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<22> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_813 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_rt_1381 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_812 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<21>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_814 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_rt_1382 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<21> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_814 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_rt_1382 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_813 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<20>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_815 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_rt_1383 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<20> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_815 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_rt_1383 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_814 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<19>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_816 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_rt_1384 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<19> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_816 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_rt_1384 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_815 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<18>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_817 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_rt_1385 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<18> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_817 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_rt_1385 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_816 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<17>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_818 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_rt_1386 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<17> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_818 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_rt_1386 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_817 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<16>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_819 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_rt_1387 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<16> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_819 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_rt_1387 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_818 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<15>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_820 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_rt_1388 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<15> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_820 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_rt_1388 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_819 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<14>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_821 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_rt_1389 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<14> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_821 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_rt_1389 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_820 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<13>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_822 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_rt_1390 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<13> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_822 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_rt_1390 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_821 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<12>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_823 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_rt_1391 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<12> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_823 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_rt_1391 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_822 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<11>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_824 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_rt_1392 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<11> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_824 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_rt_1392 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_823 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<10>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_825 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_rt_1393 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<10> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_825 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_rt_1393 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_824 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<9>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_826 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_rt_1394 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<9> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_826 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_rt_1394 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_825 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<8>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_827 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_rt_1395 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<8> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_827 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_rt_1395 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_826 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<7>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_828 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_rt_1396 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<7> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_828 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_rt_1396 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_827 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<6>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_829 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_rt_1397 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<6> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_829 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_rt_1397 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_828 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<5>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_830 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_rt_1398 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<5> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_830 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_rt_1398 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_829 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<4>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_831 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_rt_1399 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<4> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_831 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_rt_1399 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_830 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<3>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_832 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_rt_1400 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<3> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_832 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_rt_1400 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_831 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<2>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_833 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_rt_1401 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<2> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_833 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_rt_1401 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_832 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<1>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<0>_834 ),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_rt_1402 ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<1> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>  (
    .CI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<0>_834 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_rt_1402 ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_833 )
  );
  XORCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<0>  (
    .CI(wireout[0]),
    .LI(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_lut<0> ),
    .O(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<0> )
  );
  MUXCY   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<0>  (
    .CI(wireout[0]),
    .DI(wireExp[29]),
    .S(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_lut<0> ),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<0>_834 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<31>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_836 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<31>_rt_1464 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<31> )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<30>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_837 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_rt_1403 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<30> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_837 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_rt_1403 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_836 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<29>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_838 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_rt_1404 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<29> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_838 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_rt_1404 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_837 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<28>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_839 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_rt_1405 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<28> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_839 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_rt_1405 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_838 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<27>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_840 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_rt_1406 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<27> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_840 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_rt_1406 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_839 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<26>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_841 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_rt_1407 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<26> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_841 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_rt_1407 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_840 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<25>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_842 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_rt_1408 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<25> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_842 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_rt_1408 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_841 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<24>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_843 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_rt_1409 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<24> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_843 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_rt_1409 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_842 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<23>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_844 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_rt_1410 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<23> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_844 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_rt_1410 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_843 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<22>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_845 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_rt_1411 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<22> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_845 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_rt_1411 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_844 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<21>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_846 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_rt_1412 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<21> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_846 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_rt_1412 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_845 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<20>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_847 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_rt_1413 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<20> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_847 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_rt_1413 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_846 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<19>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_848 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_rt_1414 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<19> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_848 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_rt_1414 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_847 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<18>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_849 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_rt_1415 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<18> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_849 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_rt_1415 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_848 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<17>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_850 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_rt_1416 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<17> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_850 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_rt_1416 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_849 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<16>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_851 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_rt_1417 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<16> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_851 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_rt_1417 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_850 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<15>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_852 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_rt_1418 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<15> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_852 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_rt_1418 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_851 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<14>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_853 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_rt_1419 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<14> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_853 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_rt_1419 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_852 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<13>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_854 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_rt_1420 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<13> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_854 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_rt_1420 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_853 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<12>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_855 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_rt_1421 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<12> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_855 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_rt_1421 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_854 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<11>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_856 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_rt_1422 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<11> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_856 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_rt_1422 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_855 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<10>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_857 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_rt_1423 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<10> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_857 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_rt_1423 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_856 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<9>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_858 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_rt_1424 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<9> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_858 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_rt_1424 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_857 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<8>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_859 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_rt_1425 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<8> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_859 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_rt_1425 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_858 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<7>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_860 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_rt_1426 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<7> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_860 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_rt_1426 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_859 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<6>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_861 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_rt_1427 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<6> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_861 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_rt_1427 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_860 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<5>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_862 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_rt_1428 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<5> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_862 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_rt_1428 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_861 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<4>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_863 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_rt_1429 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<4> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_863 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_rt_1429 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_862 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<3>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_864 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_rt_1430 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<3> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_864 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_rt_1430 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_863 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<2>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_865 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_rt_1431 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<2> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_865 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_rt_1431 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_864 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<1>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<0>_866 ),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_rt_1432 ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<1> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>  (
    .CI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<0>_866 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_rt_1432 ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_865 )
  );
  XORCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<0>  (
    .CI(wireout[0]),
    .LI(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_lut<0> ),
    .O(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<0> )
  );
  MUXCY   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<0>  (
    .CI(wireout[0]),
    .DI(wireExp[29]),
    .S(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_lut<0> ),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<0>_866 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/state_FSM_FFd1  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd1-In ),
    .R(FSMstop),
    .Q(\ROImager_inst/state_FSM_FFd1_868 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/state_FSM_FFd2  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd2-In_875 ),
    .R(FSMstop),
    .Q(\ROImager_inst/state_FSM_FFd2_869 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/state_FSM_FFd4  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd4-In ),
    .R(FSMstop),
    .Q(\ROImager_inst/state_FSM_FFd4_871 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/state_FSM_FFd3  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd3-In_876 ),
    .R(FSMstop),
    .Q(\ROImager_inst/state_FSM_FFd3_870 )
  );
  FDS #(
    .INIT ( 1'b1 ))
  \ROImager_inst/state_FSM_FFd6  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd6-In ),
    .S(FSMstop),
    .Q(\ROImager_inst/state_FSM_FFd6_873 )
  );
  DSP48A1 #(
    .CARRYINSEL ( "OPMODE5" ),
    .A0REG ( 0 ),
    .A1REG ( 1 ),
    .B0REG ( 0 ),
    .B1REG ( 0 ),
    .CREG ( 0 ),
    .MREG ( 0 ),
    .PREG ( 0 ),
    .OPMODEREG ( 0 ),
    .CARRYINREG ( 0 ),
    .CARRYOUTREG ( 0 ),
    .RSTTYPE ( "SYNC" ),
    .DREG ( 0 ))
  \ROImager_inst/Mmult_n01011  (
    .CECARRYIN(wireout[0]),
    .RSTC(wireout[0]),
    .RSTCARRYIN(wireout[0]),
    .CED(wireout[0]),
    .RSTD(wireout[0]),
    .CEOPMODE(wireout[0]),
    .CEC(wireout[0]),
    .CARRYOUTF(\NLW_ROImager_inst/Mmult_n01011_CARRYOUTF_UNCONNECTED ),
    .RSTOPMODE(wireout[0]),
    .RSTM(wireout[0]),
    .CLK(CLKMPRE_int_BUFG_579),
    .RSTB(wireout[0]),
    .CEM(wireout[0]),
    .CEB(wireout[0]),
    .CARRYIN(wireout[0]),
    .CEP(wireout[0]),
    .CEA(wireExp[29]),
    .CARRYOUT(\NLW_ROImager_inst/Mmult_n01011_CARRYOUT_UNCONNECTED ),
    .RSTA(FSMstop),
    .RSTP(wireout[0]),
    .B({\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_17 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_16 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_15 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_14 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_13 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_12 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_11 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_10 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_9 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_8 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_7 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_6 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_5 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_4 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_3 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_2 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_1 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_0 }),
    .BCOUT({\NLW_ROImager_inst/Mmult_n01011_BCOUT<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<10>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<9>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<8>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<6>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<4>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<3>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<2>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_BCOUT<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_BCOUT<0>_UNCONNECTED }),
    .PCIN({\NLW_ROImager_inst/Mmult_n01011_PCIN<47>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<46>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<45>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<44>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<43>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<42>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<41>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<40>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<39>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<38>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<37>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<36>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<10>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<9>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<8>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<6>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<4>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<3>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<2>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCIN<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCIN<0>_UNCONNECTED }),
    .C({\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P46_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P45_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P44_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P43_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P42_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P41_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P40_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P39_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P38_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P37_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P36_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P35_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P34_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P33_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P32_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P31_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P30_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P29_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P28_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P27_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P26_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P25_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P24_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P23_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P22_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P21_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P20_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P19_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P18_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P17_to_Mmult_n01011 }),
    .P({\NLW_ROImager_inst/Mmult_n01011_P<47>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<46>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<45>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<44>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<43>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<42>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<41>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<40>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<39>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<38>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<37>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<36>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_P<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_P<15>_UNCONNECTED , \ROImager_inst/n0101 [31], \ROImager_inst/n0101 [30], \ROImager_inst/n0101 [29], 
\ROImager_inst/n0101 [28], \ROImager_inst/n0101 [27], \ROImager_inst/n0101 [26], \ROImager_inst/n0101 [25], \ROImager_inst/n0101 [24], 
\ROImager_inst/n0101 [23], \ROImager_inst/n0101 [22], \ROImager_inst/n0101 [21], \ROImager_inst/n0101 [20], \ROImager_inst/n0101 [19], 
\ROImager_inst/n0101 [18], \ROImager_inst/n0101 [17]}),
    .OPMODE({wireout[0], wireout[0], wireout[0], wireout[0], wireExp[29], wireExp[29], wireout[0], wireExp[29]}),
    .D({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]
, wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]}),
    .PCOUT({\NLW_ROImager_inst/Mmult_n01011_PCOUT<47>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<46>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<45>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<44>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<43>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<42>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<41>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<40>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<39>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<38>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<37>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<36>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<10>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<9>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<8>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<6>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<4>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<3>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<2>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_PCOUT<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_PCOUT<0>_UNCONNECTED }),
    .A({wireout[0], wireout[0], wireout[0], \ROImager_inst/state[7]_GND_6_o_select_57_OUT<31> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<30> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<29> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<28> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<27> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<26> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<25> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<24> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<23> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<22> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<21> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<20> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<19> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<18> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<17> }),
    .M({\NLW_ROImager_inst/Mmult_n01011_M<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<10>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<9>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<8>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<6>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<4>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<3>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<2>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n01011_M<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n01011_M<0>_UNCONNECTED })
  );
  DSP48A1 #(
    .CARRYINSEL ( "OPMODE5" ),
    .A0REG ( 0 ),
    .A1REG ( 1 ),
    .B0REG ( 0 ),
    .B1REG ( 0 ),
    .CREG ( 0 ),
    .MREG ( 0 ),
    .PREG ( 0 ),
    .OPMODEREG ( 0 ),
    .CARRYINREG ( 0 ),
    .CARRYOUTREG ( 0 ),
    .RSTTYPE ( "SYNC" ),
    .DREG ( 0 ))
  \ROImager_inst/Mmult_n0101  (
    .CECARRYIN(wireout[0]),
    .RSTC(wireout[0]),
    .RSTCARRYIN(wireout[0]),
    .CED(wireout[0]),
    .RSTD(wireout[0]),
    .CEOPMODE(wireout[0]),
    .CEC(wireout[0]),
    .CARRYOUTF(\NLW_ROImager_inst/Mmult_n0101_CARRYOUTF_UNCONNECTED ),
    .RSTOPMODE(wireout[0]),
    .RSTM(wireout[0]),
    .CLK(CLKMPRE_int_BUFG_579),
    .RSTB(wireout[0]),
    .CEM(wireout[0]),
    .CEB(wireout[0]),
    .CARRYIN(wireout[0]),
    .CEP(wireout[0]),
    .CEA(wireExp[29]),
    .CARRYOUT(\NLW_ROImager_inst/Mmult_n0101_CARRYOUT_UNCONNECTED ),
    .RSTA(FSMstop),
    .RSTP(wireout[0]),
    .B({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]
, wireout[0], wireExp[29], wireout[0], wireout[0], wireExp[29], wireout[0]}),
    .BCOUT({\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_17 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_16 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_15 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_14 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_13 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_12 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_11 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_10 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_9 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_8 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_7 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_6 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_5 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_4 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_3 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_2 , 
\ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_1 , \ROImager_inst/Mmult_n0101_BCOUT_to_Mmult_n01011_B_0 }),
    .PCIN({\NLW_ROImager_inst/Mmult_n0101_PCIN<47>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<46>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<45>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<44>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<43>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<42>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<41>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<40>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<39>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<38>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<37>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<36>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<10>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<9>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<8>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<6>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<4>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<3>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<2>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCIN<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCIN<0>_UNCONNECTED }),
    .C({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]
, wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]}),
    .P({\ROImager_inst/Mmult_n0101_P47_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P46_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P45_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P44_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P43_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P42_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P41_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P40_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P39_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P38_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P37_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P36_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P35_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P34_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P33_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P32_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P31_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P30_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P29_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P28_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P27_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P26_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P25_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P24_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P23_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P22_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P21_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P20_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P19_to_Mmult_n01011 , 
\ROImager_inst/Mmult_n0101_P18_to_Mmult_n01011 , \ROImager_inst/Mmult_n0101_P17_to_Mmult_n01011 , \ROImager_inst/n0101 [16], \ROImager_inst/n0101 [15]
, \ROImager_inst/n0101 [14], \ROImager_inst/n0101 [13], \ROImager_inst/n0101 [12], \ROImager_inst/n0101 [11], \ROImager_inst/n0101 [10], 
\ROImager_inst/n0101 [9], \ROImager_inst/n0101 [8], \ROImager_inst/n0101 [7], \ROImager_inst/n0101 [6], \ROImager_inst/n0101 [5], 
\ROImager_inst/n0101 [4], \ROImager_inst/n0101 [3], \ROImager_inst/n0101 [2], \ROImager_inst/n0101 [1], \ROImager_inst/n0101 [0]}),
    .OPMODE({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireExp[29]}),
    .D({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]
, wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]}),
    .PCOUT({\NLW_ROImager_inst/Mmult_n0101_PCOUT<47>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<46>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<45>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<44>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<43>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<42>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<41>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<40>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<39>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<38>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<37>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<36>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<10>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<9>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<8>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<6>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<4>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<3>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<2>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_PCOUT<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_PCOUT<0>_UNCONNECTED }),
    .A({wireout[0], \ROImager_inst/state[7]_GND_6_o_select_57_OUT<16> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<15> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<14> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<13> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<12> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<11> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<10> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<9> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<8> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<7> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<6> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<5> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<4> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<3> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<2> , \ROImager_inst/state[7]_GND_6_o_select_57_OUT<1> , 
\ROImager_inst/state[7]_GND_6_o_select_57_OUT<0> }),
    .M({\NLW_ROImager_inst/Mmult_n0101_M<35>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<34>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<33>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<32>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<31>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<30>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<29>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<28>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<27>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<26>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<25>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<24>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<23>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<22>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<21>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<20>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<19>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<18>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<17>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<16>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<15>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<14>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<13>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<12>_UNCONNECTED , 
\NLW_ROImager_inst/Mmult_n0101_M<11>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<10>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<9>_UNCONNECTED 
, \NLW_ROImager_inst/Mmult_n0101_M<8>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<7>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<6>_UNCONNECTED 
, \NLW_ROImager_inst/Mmult_n0101_M<5>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<4>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<3>_UNCONNECTED 
, \NLW_ROImager_inst/Mmult_n0101_M<2>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<1>_UNCONNECTED , \NLW_ROImager_inst/Mmult_n0101_M<0>_UNCONNECTED 
})
  );
  FDS #(
    .INIT ( 1'b1 ))
  \ROImager_inst/OK_PIXRES_GLOB  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_PWR_6_o_Select_51_o ),
    .S(FSMstop),
    .Q(\ROImager_inst/OK_PIXRES_GLOB_202 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/FSMIND1_i  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_FSMIND1_i_Select_62_o ),
    .R(FSMstop),
    .Q(\ROImager_inst/FSMIND1_i_206 )
  );
  FDS #(
    .INIT ( 1'b1 ))
  \ROImager_inst/fsm_stat_i_6  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_PWR_6_o_select_49_OUT<3> ),
    .S(FSMstop),
    .Q(\ROImager_inst/fsm_stat_i [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/fsm_stat_i_3  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd6-In4_879 ),
    .R(FSMstop),
    .Q(\ROImager_inst/fsm_stat_i [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/fsm_stat_i_1  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_PWR_6_o_select_49_OUT<0> ),
    .R(FSMstop),
    .Q(\ROImager_inst/fsm_stat_i [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/OK_DRAIN_B  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_Select_53_o ),
    .R(FSMstop),
    .Q(\ROImager_inst/OK_DRAIN_B_204 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_31  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<31> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [31])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_30  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<30> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [30])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_29  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<29> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [29])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_28  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<28> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [28])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_27  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<27> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [27])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_26  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<26> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_25  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<25> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_24  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<24> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_23  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<23> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_22  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<22> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_21  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<21> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_20  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<20> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_19  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<19> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_18  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<18> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_17  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<17> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_16  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<16> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_15  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<15> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_14  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<14> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_13  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<13> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_12  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<12> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_11  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<11> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_10  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<10> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_9  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<9> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_8  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<8> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_7  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<7> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_6  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<6> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_5  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<5> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_4  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<4> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_3  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<3> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_2  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<2> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_subsc_1  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<1> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_subsc [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_31  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<31> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [31])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_30  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<30> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [30])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_29  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<29> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [29])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_28  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<28> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [28])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_27  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<27> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [27])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_26  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<26> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [26])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_25  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<25> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [25])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_24  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<24> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [24])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_23  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<23> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [23])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_22  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<22> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [22])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_21  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<21> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [21])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_20  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<20> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [20])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_19  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<19> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [19])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_18  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<18> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [18])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_17  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<17> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [17])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_16  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<16> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [16])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_15  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<15> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [15])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_14  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<14> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [14])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_13  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<13> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [13])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_12  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<12> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [12])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_11  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<11> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [11])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_10  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<10> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [10])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_9  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<9> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [9])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_8  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<8> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [8])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_7  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<7> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [7])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_6  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<6> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [6])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_5  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<5> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [5])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_4  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<4> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [4])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_3  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<3> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [3])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_2  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<2> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [2])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_1  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<1> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/count_mpre_0  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<0> ),
    .R(FSMstop),
    .Q(\ROImager_inst/count_mpre [0])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/FSMIND0ACK_i  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state[7]_FSMIND0ACK_i_Select_64_o ),
    .R(FSMstop),
    .Q(\ROImager_inst/FSMIND0ACK_i_207 )
  );
  MUXCY   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>  (
    .CI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<4>_1160 ),
    .DI(wireout[0]),
    .S(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<5> ),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 )
  );
  MUXCY   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<4>  (
    .CI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<3>_1163 ),
    .DI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi4_1162 ),
    .S(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<4>_1161 ),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<4>_1160 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<4>  (
    .I0(\pat_gen/cntPat [26]),
    .I1(\pat_gen/cntPat [27]),
    .I2(\pat_gen/cntPat [28]),
    .I3(\pat_gen/cntPat [29]),
    .I4(\pat_gen/cntPat [30]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<4>_1161 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi4  (
    .I0(\pat_gen/cntPat [30]),
    .I1(\pat_gen/cntPat [29]),
    .I2(\pat_gen/cntPat [28]),
    .I3(\pat_gen/cntPat [27]),
    .I4(\pat_gen/cntPat [26]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi4_1162 )
  );
  MUXCY   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<3>  (
    .CI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<2>_1166 ),
    .DI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi3_1165 ),
    .S(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<3>_1164 ),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<3>_1163 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<3>  (
    .I0(\pat_gen/cntPat [21]),
    .I1(\pat_gen/cntPat [22]),
    .I2(\pat_gen/cntPat [23]),
    .I3(\pat_gen/cntPat [24]),
    .I4(\pat_gen/cntPat [25]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<3>_1164 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi3  (
    .I0(\pat_gen/cntPat [25]),
    .I1(\pat_gen/cntPat [24]),
    .I2(\pat_gen/cntPat [23]),
    .I3(\pat_gen/cntPat [22]),
    .I4(\pat_gen/cntPat [21]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi3_1165 )
  );
  MUXCY   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<2>  (
    .CI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<1>_1169 ),
    .DI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi2_1168 ),
    .S(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<2>_1167 ),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<2>_1166 )
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<2>  (
    .I0(\pat_gen/cntPat [16]),
    .I1(\pat_gen/cntPat [17]),
    .I2(\pat_gen/cntPat [18]),
    .I3(\pat_gen/cntPat [19]),
    .I4(\pat_gen/cntPat [20]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<2>_1167 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi2  (
    .I0(\pat_gen/cntPat [20]),
    .I1(\pat_gen/cntPat [19]),
    .I2(\pat_gen/cntPat [18]),
    .I3(\pat_gen/cntPat [17]),
    .I4(\pat_gen/cntPat [16]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi2_1168 )
  );
  MUXCY   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<1>  (
    .CI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<0>_1172 ),
    .DI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi1_1171 ),
    .S(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<1>_1170 ),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<1>_1169 )
  );
  LUT5 #(
    .INIT ( 32'h00000100 ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<1>  (
    .I0(\pat_gen/cntPat [12]),
    .I1(\pat_gen/cntPat [13]),
    .I2(\pat_gen/cntPat [14]),
    .I3(\pat_gen/cntPat [11]),
    .I4(\pat_gen/cntPat [15]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<1>_1170 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi1  (
    .I0(\pat_gen/cntPat [15]),
    .I1(\pat_gen/cntPat [14]),
    .I2(\pat_gen/cntPat [13]),
    .I3(\pat_gen/cntPat [12]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi1_1171 )
  );
  MUXCY   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<0>  (
    .CI(wireExp[29]),
    .DI(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi_1174 ),
    .S(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<0>_1173 ),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<0>_1172 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<0>  (
    .I0(\pat_gen/cntPat [9]),
    .I1(\pat_gen/cntPat [6]),
    .I2(\pat_gen/cntPat [8]),
    .I3(\pat_gen/cntPat [7]),
    .I4(\pat_gen/cntPat [10]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<0>_1173 )
  );
  LUT4 #(
    .INIT ( 16'hFF80 ))
  \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi  (
    .I0(\pat_gen/cntPat [9]),
    .I1(\pat_gen/cntPat [8]),
    .I2(\pat_gen/cntPat [7]),
    .I3(\pat_gen/cntPat [10]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lutdi_1174 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<31>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_1175 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<31>_rt_1465 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<31> )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<30>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_1176 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_rt_1433 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<30> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_1176 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_rt_1433 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_1175 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<29>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_1177 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_rt_1434 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<29> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_1177 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_rt_1434 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_1176 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<28>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_1178 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_rt_1435 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<28> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_1178 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_rt_1435 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_1177 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<27>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_1179 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_rt_1436 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<27> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_1179 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_rt_1436 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_1178 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<26>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_1180 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_rt_1437 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<26> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_1180 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_rt_1437 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_1179 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<25>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_1181 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_rt_1438 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<25> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_1181 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_rt_1438 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_1180 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<24>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_1182 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_rt_1439 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<24> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_1182 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_rt_1439 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_1181 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<23>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_1183 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_rt_1440 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<23> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_1183 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_rt_1440 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_1182 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<22>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_1184 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_rt_1441 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<22> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_1184 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_rt_1441 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_1183 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<21>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_1185 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_rt_1442 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<21> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_1185 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_rt_1442 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_1184 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<20>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_1186 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_rt_1443 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<20> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_1186 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_rt_1443 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_1185 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<19>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_1187 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_rt_1444 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<19> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_1187 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_rt_1444 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_1186 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<18>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_1188 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_rt_1445 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<18> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_1188 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_rt_1445 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_1187 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<17>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_1189 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_rt_1446 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<17> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_1189 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_rt_1446 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_1188 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<16>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_1190 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_rt_1447 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<16> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_1190 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_rt_1447 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_1189 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<15>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_1191 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_rt_1448 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<15> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_1191 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_rt_1448 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_1190 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<14>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_1192 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_rt_1449 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<14> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_1192 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_rt_1449 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_1191 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<13>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_1193 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_rt_1450 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<13> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_1193 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_rt_1450 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_1192 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<12>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_1194 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_rt_1451 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<12> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_1194 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_rt_1451 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_1193 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<11>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_1195 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_rt_1452 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<11> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_1195 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_rt_1452 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_1194 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<10>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_1196 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_rt_1453 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<10> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_1196 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_rt_1453 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_1195 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<9>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_1197 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_rt_1454 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<9> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_1197 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_rt_1454 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_1196 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<8>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_1198 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_rt_1455 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<8> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_1198 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_rt_1455 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_1197 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<7>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_1199 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_rt_1456 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<7> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_1199 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_rt_1456 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_1198 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<6>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_1200 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_rt_1457 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<6> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_1200 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_rt_1457 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_1199 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<5>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_1201 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_rt_1458 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<5> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_1201 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_rt_1458 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_1200 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<4>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_1202 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_rt_1459 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<4> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_1202 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_rt_1459 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_1201 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<3>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_1203 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_rt_1460 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<3> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_1203 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_rt_1460 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_1202 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<2>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_1204 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_rt_1461 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<2> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_1204 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_rt_1461 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_1203 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<1>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<0>_1205 ),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_rt_1462 ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<1> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>  (
    .CI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<0>_1205 ),
    .DI(wireout[0]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_rt_1462 ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_1204 )
  );
  XORCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<0>  (
    .CI(wireout[0]),
    .LI(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_lut<0> ),
    .O(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<0> )
  );
  MUXCY   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<0>  (
    .CI(wireout[0]),
    .DI(wireExp[29]),
    .S(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_lut<0> ),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<0>_1205 )
  );
  FDE   \pat_gen/FIFO_wr  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_FIFO_wr_Select_35_o ),
    .Q(\pat_gen/FIFO_wr_210 )
  );
  FDE   \pat_gen/cntPat_31  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<31> ),
    .Q(\pat_gen/cntPat [31])
  );
  FDE   \pat_gen/cntPat_30  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<30> ),
    .Q(\pat_gen/cntPat [30])
  );
  FDE   \pat_gen/cntPat_29  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<29> ),
    .Q(\pat_gen/cntPat [29])
  );
  FDE   \pat_gen/cntPat_28  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<28> ),
    .Q(\pat_gen/cntPat [28])
  );
  FDE   \pat_gen/cntPat_27  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<27> ),
    .Q(\pat_gen/cntPat [27])
  );
  FDE   \pat_gen/cntPat_26  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<26> ),
    .Q(\pat_gen/cntPat [26])
  );
  FDE   \pat_gen/cntPat_25  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<25> ),
    .Q(\pat_gen/cntPat [25])
  );
  FDE   \pat_gen/cntPat_24  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<24> ),
    .Q(\pat_gen/cntPat [24])
  );
  FDE   \pat_gen/cntPat_23  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<23> ),
    .Q(\pat_gen/cntPat [23])
  );
  FDE   \pat_gen/cntPat_22  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<22> ),
    .Q(\pat_gen/cntPat [22])
  );
  FDE   \pat_gen/cntPat_21  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<21> ),
    .Q(\pat_gen/cntPat [21])
  );
  FDE   \pat_gen/cntPat_20  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<20> ),
    .Q(\pat_gen/cntPat [20])
  );
  FDE   \pat_gen/cntPat_19  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<19> ),
    .Q(\pat_gen/cntPat [19])
  );
  FDE   \pat_gen/cntPat_18  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<18> ),
    .Q(\pat_gen/cntPat [18])
  );
  FDE   \pat_gen/cntPat_17  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<17> ),
    .Q(\pat_gen/cntPat [17])
  );
  FDE   \pat_gen/cntPat_16  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<16> ),
    .Q(\pat_gen/cntPat [16])
  );
  FDE   \pat_gen/cntPat_15  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<15> ),
    .Q(\pat_gen/cntPat [15])
  );
  FDE   \pat_gen/cntPat_14  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<14> ),
    .Q(\pat_gen/cntPat [14])
  );
  FDE   \pat_gen/cntPat_13  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<13> ),
    .Q(\pat_gen/cntPat [13])
  );
  FDE   \pat_gen/cntPat_12  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<12> ),
    .Q(\pat_gen/cntPat [12])
  );
  FDE   \pat_gen/cntPat_11  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<11> ),
    .Q(\pat_gen/cntPat [11])
  );
  FDE   \pat_gen/cntPat_10  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<10> ),
    .Q(\pat_gen/cntPat [10])
  );
  FDE   \pat_gen/cntPat_9  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<9> ),
    .Q(\pat_gen/cntPat [9])
  );
  FDE   \pat_gen/cntPat_8  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<8> ),
    .Q(\pat_gen/cntPat [8])
  );
  FDE   \pat_gen/cntPat_7  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<7> ),
    .Q(\pat_gen/cntPat [7])
  );
  FDE   \pat_gen/cntPat_6  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<6> ),
    .Q(\pat_gen/cntPat [6])
  );
  FDE   \pat_gen/cntPat_5  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<5> ),
    .Q(\pat_gen/cntPat [5])
  );
  FDE   \pat_gen/cntPat_4  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<4> ),
    .Q(\pat_gen/cntPat [4])
  );
  FDE   \pat_gen/cntPat_3  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<3> ),
    .Q(\pat_gen/cntPat [3])
  );
  FDE   \pat_gen/cntPat_2  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<2> ),
    .Q(\pat_gen/cntPat [2])
  );
  FDE   \pat_gen/cntPat_1  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<1> ),
    .Q(\pat_gen/cntPat [1])
  );
  FDE   \pat_gen/cntPat_0  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_GND_9_o_select_34_OUT<0> ),
    .Q(\pat_gen/cntPat [0])
  );
  FDE #(
    .INIT ( 1'b1 ))
  \pat_gen/Pat_i_10  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_PatGen_start[9]_select_32_OUT<9> ),
    .Q(\pat_gen/Pat_i[10] )
  );
  FDE #(
    .INIT ( 1'b1 ))
  \pat_gen/Pat_i_5  (
    .C(CLK_HS_BUFG_565),
    .CE(\pat_gen/rst_inv ),
    .D(\pat_gen/state[4]_PatGen_start[9]_select_32_OUT<4> ),
    .Q(\pat_gen/Pat_i[5] )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  RstPat1 (
    .I0(FSMstop),
    .I1(FSMIND0_IBUF_15),
    .O(RstPat)
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<65>1  (
    .I0(okEHx[0]),
    .I1(okEHx[65]),
    .I2(okEHx[130]),
    .I3(okEHx[195]),
    .I4(okEHx[260]),
    .O(okEH[0])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<66>1  (
    .I0(okEHx[1]),
    .I1(okEHx[66]),
    .I2(okEHx[131]),
    .I3(okEHx[196]),
    .I4(okEHx[261]),
    .O(okEH[1])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<67>1  (
    .I0(okEHx[2]),
    .I1(okEHx[67]),
    .I2(okEHx[132]),
    .I3(okEHx[197]),
    .I4(okEHx[262]),
    .O(okEH[2])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<68>1  (
    .I0(okEHx[3]),
    .I1(okEHx[68]),
    .I2(okEHx[133]),
    .I3(okEHx[198]),
    .I4(okEHx[263]),
    .O(okEH[3])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<69>1  (
    .I0(okEHx[4]),
    .I1(okEHx[69]),
    .I2(okEHx[134]),
    .I3(okEHx[199]),
    .I4(okEHx[264]),
    .O(okEH[4])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<70>1  (
    .I0(okEHx[5]),
    .I1(okEHx[70]),
    .I2(okEHx[135]),
    .I3(okEHx[200]),
    .I4(okEHx[265]),
    .O(okEH[5])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<71>1  (
    .I0(okEHx[6]),
    .I1(okEHx[71]),
    .I2(okEHx[136]),
    .I3(okEHx[201]),
    .I4(okEHx[266]),
    .O(okEH[6])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<72>1  (
    .I0(okEHx[7]),
    .I1(okEHx[72]),
    .I2(okEHx[137]),
    .I3(okEHx[202]),
    .I4(okEHx[267]),
    .O(okEH[7])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<73>1  (
    .I0(okEHx[8]),
    .I1(okEHx[73]),
    .I2(okEHx[138]),
    .I3(okEHx[203]),
    .I4(okEHx[268]),
    .O(okEH[8])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<74>1  (
    .I0(okEHx[9]),
    .I1(okEHx[74]),
    .I2(okEHx[139]),
    .I3(okEHx[204]),
    .I4(okEHx[269]),
    .O(okEH[9])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<75>1  (
    .I0(okEHx[10]),
    .I1(okEHx[75]),
    .I2(okEHx[140]),
    .I3(okEHx[205]),
    .I4(okEHx[270]),
    .O(okEH[10])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<76>1  (
    .I0(okEHx[11]),
    .I1(okEHx[76]),
    .I2(okEHx[141]),
    .I3(okEHx[206]),
    .I4(okEHx[271]),
    .O(okEH[11])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<77>1  (
    .I0(okEHx[12]),
    .I1(okEHx[77]),
    .I2(okEHx[142]),
    .I3(okEHx[207]),
    .I4(okEHx[272]),
    .O(okEH[12])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<78>1  (
    .I0(okEHx[13]),
    .I1(okEHx[78]),
    .I2(okEHx[143]),
    .I3(okEHx[208]),
    .I4(okEHx[273]),
    .O(okEH[13])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<79>1  (
    .I0(okEHx[14]),
    .I1(okEHx[79]),
    .I2(okEHx[144]),
    .I3(okEHx[209]),
    .I4(okEHx[274]),
    .O(okEH[14])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<80>1  (
    .I0(okEHx[15]),
    .I1(okEHx[80]),
    .I2(okEHx[145]),
    .I3(okEHx[210]),
    .I4(okEHx[275]),
    .O(okEH[15])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<81>1  (
    .I0(okEHx[16]),
    .I1(okEHx[81]),
    .I2(okEHx[146]),
    .I3(okEHx[211]),
    .I4(okEHx[276]),
    .O(okEH[16])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<82>1  (
    .I0(okEHx[17]),
    .I1(okEHx[82]),
    .I2(okEHx[147]),
    .I3(okEHx[212]),
    .I4(okEHx[277]),
    .O(okEH[17])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<83>1  (
    .I0(okEHx[18]),
    .I1(okEHx[83]),
    .I2(okEHx[148]),
    .I3(okEHx[213]),
    .I4(okEHx[278]),
    .O(okEH[18])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<84>1  (
    .I0(okEHx[19]),
    .I1(okEHx[84]),
    .I2(okEHx[149]),
    .I3(okEHx[214]),
    .I4(okEHx[279]),
    .O(okEH[19])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<85>1  (
    .I0(okEHx[20]),
    .I1(okEHx[85]),
    .I2(okEHx[150]),
    .I3(okEHx[215]),
    .I4(okEHx[280]),
    .O(okEH[20])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<86>1  (
    .I0(okEHx[21]),
    .I1(okEHx[86]),
    .I2(okEHx[151]),
    .I3(okEHx[216]),
    .I4(okEHx[281]),
    .O(okEH[21])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<87>1  (
    .I0(okEHx[22]),
    .I1(okEHx[87]),
    .I2(okEHx[152]),
    .I3(okEHx[217]),
    .I4(okEHx[282]),
    .O(okEH[22])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<88>1  (
    .I0(okEHx[23]),
    .I1(okEHx[88]),
    .I2(okEHx[153]),
    .I3(okEHx[218]),
    .I4(okEHx[283]),
    .O(okEH[23])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<89>1  (
    .I0(okEHx[24]),
    .I1(okEHx[89]),
    .I2(okEHx[154]),
    .I3(okEHx[219]),
    .I4(okEHx[284]),
    .O(okEH[24])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<90>1  (
    .I0(okEHx[25]),
    .I1(okEHx[90]),
    .I2(okEHx[155]),
    .I3(okEHx[220]),
    .I4(okEHx[285]),
    .O(okEH[25])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<91>1  (
    .I0(okEHx[26]),
    .I1(okEHx[91]),
    .I2(okEHx[156]),
    .I3(okEHx[221]),
    .I4(okEHx[286]),
    .O(okEH[26])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<92>1  (
    .I0(okEHx[27]),
    .I1(okEHx[92]),
    .I2(okEHx[157]),
    .I3(okEHx[222]),
    .I4(okEHx[287]),
    .O(okEH[27])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<93>1  (
    .I0(okEHx[28]),
    .I1(okEHx[93]),
    .I2(okEHx[158]),
    .I3(okEHx[223]),
    .I4(okEHx[288]),
    .O(okEH[28])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<94>1  (
    .I0(okEHx[29]),
    .I1(okEHx[94]),
    .I2(okEHx[159]),
    .I3(okEHx[224]),
    .I4(okEHx[289]),
    .O(okEH[29])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<95>1  (
    .I0(okEHx[30]),
    .I1(okEHx[95]),
    .I2(okEHx[160]),
    .I3(okEHx[225]),
    .I4(okEHx[290]),
    .O(okEH[30])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<96>1  (
    .I0(okEHx[31]),
    .I1(okEHx[96]),
    .I2(okEHx[161]),
    .I3(okEHx[226]),
    .I4(okEHx[291]),
    .O(okEH[31])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<97>1  (
    .I0(okEHx[32]),
    .I1(okEHx[97]),
    .I2(okEHx[162]),
    .I3(okEHx[227]),
    .I4(okEHx[292]),
    .O(okEH[32])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<98>1  (
    .I0(okEHx[33]),
    .I1(okEHx[98]),
    .I2(okEHx[163]),
    .I3(okEHx[228]),
    .I4(okEHx[293]),
    .O(okEH[33])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<99>1  (
    .I0(okEHx[34]),
    .I1(okEHx[99]),
    .I2(okEHx[164]),
    .I3(okEHx[229]),
    .I4(okEHx[294]),
    .O(okEH[34])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<100>1  (
    .I0(okEHx[35]),
    .I1(okEHx[100]),
    .I2(okEHx[165]),
    .I3(okEHx[230]),
    .I4(okEHx[295]),
    .O(okEH[35])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<101>1  (
    .I0(okEHx[36]),
    .I1(okEHx[101]),
    .I2(okEHx[166]),
    .I3(okEHx[231]),
    .I4(okEHx[296]),
    .O(okEH[36])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<102>1  (
    .I0(okEHx[37]),
    .I1(okEHx[102]),
    .I2(okEHx[167]),
    .I3(okEHx[232]),
    .I4(okEHx[297]),
    .O(okEH[37])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<103>1  (
    .I0(okEHx[38]),
    .I1(okEHx[103]),
    .I2(okEHx[168]),
    .I3(okEHx[233]),
    .I4(okEHx[298]),
    .O(okEH[38])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<104>1  (
    .I0(okEHx[39]),
    .I1(okEHx[104]),
    .I2(okEHx[169]),
    .I3(okEHx[234]),
    .I4(okEHx[299]),
    .O(okEH[39])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<105>1  (
    .I0(okEHx[40]),
    .I1(okEHx[105]),
    .I2(okEHx[170]),
    .I3(okEHx[235]),
    .I4(okEHx[300]),
    .O(okEH[40])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<106>1  (
    .I0(okEHx[41]),
    .I1(okEHx[106]),
    .I2(okEHx[171]),
    .I3(okEHx[236]),
    .I4(okEHx[301]),
    .O(okEH[41])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<107>1  (
    .I0(okEHx[42]),
    .I1(okEHx[107]),
    .I2(okEHx[172]),
    .I3(okEHx[237]),
    .I4(okEHx[302]),
    .O(okEH[42])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<108>1  (
    .I0(okEHx[43]),
    .I1(okEHx[108]),
    .I2(okEHx[173]),
    .I3(okEHx[238]),
    .I4(okEHx[303]),
    .O(okEH[43])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<109>1  (
    .I0(okEHx[44]),
    .I1(okEHx[109]),
    .I2(okEHx[174]),
    .I3(okEHx[239]),
    .I4(okEHx[304]),
    .O(okEH[44])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<110>1  (
    .I0(okEHx[45]),
    .I1(okEHx[110]),
    .I2(okEHx[175]),
    .I3(okEHx[240]),
    .I4(okEHx[305]),
    .O(okEH[45])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<111>1  (
    .I0(okEHx[46]),
    .I1(okEHx[111]),
    .I2(okEHx[176]),
    .I3(okEHx[241]),
    .I4(okEHx[306]),
    .O(okEH[46])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<112>1  (
    .I0(okEHx[47]),
    .I1(okEHx[112]),
    .I2(okEHx[177]),
    .I3(okEHx[242]),
    .I4(okEHx[307]),
    .O(okEH[47])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<113>1  (
    .I0(okEHx[48]),
    .I1(okEHx[113]),
    .I2(okEHx[178]),
    .I3(okEHx[243]),
    .I4(okEHx[308]),
    .O(okEH[48])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<114>1  (
    .I0(okEHx[49]),
    .I1(okEHx[114]),
    .I2(okEHx[179]),
    .I3(okEHx[244]),
    .I4(okEHx[309]),
    .O(okEH[49])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<115>1  (
    .I0(okEHx[50]),
    .I1(okEHx[115]),
    .I2(okEHx[180]),
    .I3(okEHx[245]),
    .I4(okEHx[310]),
    .O(okEH[50])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<116>1  (
    .I0(okEHx[51]),
    .I1(okEHx[116]),
    .I2(okEHx[181]),
    .I3(okEHx[246]),
    .I4(okEHx[311]),
    .O(okEH[51])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<117>1  (
    .I0(okEHx[52]),
    .I1(okEHx[117]),
    .I2(okEHx[182]),
    .I3(okEHx[247]),
    .I4(okEHx[312]),
    .O(okEH[52])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<118>1  (
    .I0(okEHx[53]),
    .I1(okEHx[118]),
    .I2(okEHx[183]),
    .I3(okEHx[248]),
    .I4(okEHx[313]),
    .O(okEH[53])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<119>1  (
    .I0(okEHx[54]),
    .I1(okEHx[119]),
    .I2(okEHx[184]),
    .I3(okEHx[249]),
    .I4(okEHx[314]),
    .O(okEH[54])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<120>1  (
    .I0(okEHx[55]),
    .I1(okEHx[120]),
    .I2(okEHx[185]),
    .I3(okEHx[250]),
    .I4(okEHx[315]),
    .O(okEH[55])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<121>1  (
    .I0(okEHx[56]),
    .I1(okEHx[121]),
    .I2(okEHx[186]),
    .I3(okEHx[251]),
    .I4(okEHx[316]),
    .O(okEH[56])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<122>1  (
    .I0(okEHx[57]),
    .I1(okEHx[122]),
    .I2(okEHx[187]),
    .I3(okEHx[252]),
    .I4(okEHx[317]),
    .O(okEH[57])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<123>1  (
    .I0(okEHx[58]),
    .I1(okEHx[123]),
    .I2(okEHx[188]),
    .I3(okEHx[253]),
    .I4(okEHx[318]),
    .O(okEH[58])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<124>1  (
    .I0(okEHx[59]),
    .I1(okEHx[124]),
    .I2(okEHx[189]),
    .I3(okEHx[254]),
    .I4(okEHx[319]),
    .O(okEH[59])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<125>1  (
    .I0(okEHx[60]),
    .I1(okEHx[125]),
    .I2(okEHx[190]),
    .I3(okEHx[255]),
    .I4(okEHx[320]),
    .O(okEH[60])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<126>1  (
    .I0(okEHx[61]),
    .I1(okEHx[126]),
    .I2(okEHx[191]),
    .I3(okEHx[256]),
    .I4(okEHx[321]),
    .O(okEH[61])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<127>1  (
    .I0(okEHx[62]),
    .I1(okEHx[127]),
    .I2(okEHx[192]),
    .I3(okEHx[257]),
    .I4(okEHx[322]),
    .O(okEH[62])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<128>1  (
    .I0(okEHx[63]),
    .I1(okEHx[128]),
    .I2(okEHx[193]),
    .I3(okEHx[258]),
    .I4(okEHx[323]),
    .O(okEH[63])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \wireOR/okEH<129>1  (
    .I0(okEHx[64]),
    .I1(okEHx[129]),
    .I2(okEHx[194]),
    .I3(okEHx[259]),
    .I4(okEHx[324]),
    .O(okEH[64])
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>11  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd5_872 ),
    .I2(\ROImager_inst/state_FSM_FFd6_873 ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>1_731 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFAAA8 ))
  \ROImager_inst/state_state[7]_GND_6_o_Select_53_o1  (
    .I0(\ROImager_inst/OK_DRAIN_B_204 ),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/state_FSM_FFd5_872 ),
    .I4(\ROImager_inst/state_FSM_FFd4_871 ),
    .O(\ROImager_inst/state[7]_GND_6_o_Select_53_o )
  );
  LUT5 #(
    .INIT ( 32'h88880800 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>31  (
    .I0(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I1(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I2(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<6>_786 ),
    .I3(\ROImager_inst/state_FSM_FFd5_872 ),
    .I4(\ROImager_inst/state_FSM_FFd6_873 ),
    .O(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFA8AAA8A8 ))
  \ROImager_inst/state_state[7]_FSMIND1_i_Select_62_o1  (
    .I0(\ROImager_inst/FSMIND1_i_206 ),
    .I1(\ROImager_inst/state_FSM_FFd4_871 ),
    .I2(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>1_731 ),
    .I3(FSMIND0_IBUF_15),
    .I4(\ROImager_inst/state_FSM_FFd1_868 ),
    .I5(\ROImager_inst/state_FSM_FFd2_869 ),
    .O(\ROImager_inst/state[7]_FSMIND1_i_Select_62_o )
  );
  LUT6 #(
    .INIT ( 64'h0100011000000010 ))
  \ROImager_inst/state_FSM_FFd1-In1  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd6-In4_879 ),
    .I2(\ROImager_inst/state_FSM_FFd1_868 ),
    .I3(\ROImager_inst/state_FSM_FFd2_869 ),
    .I4(FSMIND0_IBUF_15),
    .I5(FSMIND1ACK_IBUF_16),
    .O(\ROImager_inst/state_FSM_FFd1-In )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<9>1  (
    .I0(\ROImager_inst/count_subsc [9]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<9> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<9> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<8>1  (
    .I0(\ROImager_inst/count_subsc [8]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<8> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<8> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<7>1  (
    .I0(\ROImager_inst/count_subsc [7]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<7> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<7> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<6>1  (
    .I0(\ROImager_inst/count_subsc [6]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<6> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<6> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<5>1  (
    .I0(\ROImager_inst/count_subsc [5]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<5> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<5> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<4>1  (
    .I0(\ROImager_inst/count_subsc [4]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<4> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<4> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<3>1  (
    .I0(\ROImager_inst/count_subsc [3]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<3> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<3> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<31>1  (
    .I0(\ROImager_inst/count_subsc [31]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<31> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<31> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<30>1  (
    .I0(\ROImager_inst/count_subsc [30]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<30> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<30> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<2>1  (
    .I0(\ROImager_inst/count_subsc [2]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<2> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<2> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<29>1  (
    .I0(\ROImager_inst/count_subsc [29]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<29> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<29> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<28>1  (
    .I0(\ROImager_inst/count_subsc [28]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<28> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<28> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<27>1  (
    .I0(\ROImager_inst/count_subsc [27]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<27> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<27> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<26>1  (
    .I0(\ROImager_inst/count_subsc [26]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<26> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<26> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<25>1  (
    .I0(\ROImager_inst/count_subsc [25]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<25> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<25> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<24>1  (
    .I0(\ROImager_inst/count_subsc [24]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<24> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<24> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<23>1  (
    .I0(\ROImager_inst/count_subsc [23]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<23> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<23> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<22>1  (
    .I0(\ROImager_inst/count_subsc [22]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<22> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<22> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<21>1  (
    .I0(\ROImager_inst/count_subsc [21]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<21> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<21> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<20>1  (
    .I0(\ROImager_inst/count_subsc [20]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<20> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<20> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<1>1  (
    .I0(\ROImager_inst/count_subsc [1]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<1> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<1> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<19>1  (
    .I0(\ROImager_inst/count_subsc [19]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<19> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<19> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<18>1  (
    .I0(\ROImager_inst/count_subsc [18]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<18> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<18> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<17>1  (
    .I0(\ROImager_inst/count_subsc [17]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<17> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<17> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<16>1  (
    .I0(\ROImager_inst/count_subsc [16]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<16> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<16> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<15>1  (
    .I0(\ROImager_inst/count_subsc [15]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<15> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<15> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<14>1  (
    .I0(\ROImager_inst/count_subsc [14]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<14> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<14> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<13>1  (
    .I0(\ROImager_inst/count_subsc [13]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<13> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<13> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<12>1  (
    .I0(\ROImager_inst/count_subsc [12]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<12> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<12> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<11>1  (
    .I0(\ROImager_inst/count_subsc [11]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<11> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<11> )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<10>1  (
    .I0(\ROImager_inst/count_subsc [10]),
    .I1(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I2(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<10> ),
    .I3(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_count_subsc[31]_select_54_OUT<10> )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>21  (
    .I0(\ROImager_inst/state_FSM_FFd1_868 ),
    .I1(\ROImager_inst/state_FSM_FFd2_869 ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>2 )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \ROImager_inst/state_FSM_FFd6-In41  (
    .I0(\ROImager_inst/state_FSM_FFd5_872 ),
    .I1(\ROImager_inst/state_FSM_FFd6_873 ),
    .I2(\ROImager_inst/state_FSM_FFd4_871 ),
    .O(\ROImager_inst/state_FSM_FFd6-In4_879 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \ROImager_inst/state[7]_PWR_6_o_select_49_OUT<3>1  (
    .I0(\ROImager_inst/state_FSM_FFd5_872 ),
    .I1(\ROImager_inst/state_FSM_FFd6_873 ),
    .I2(\ROImager_inst/state_FSM_FFd1_868 ),
    .I3(\ROImager_inst/state_FSM_FFd2_869 ),
    .I4(\ROImager_inst/state_FSM_FFd3_870 ),
    .I5(\ROImager_inst/state_FSM_FFd4_871 ),
    .O(\ROImager_inst/state[7]_PWR_6_o_select_49_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'hBBBB8088AAAA8088 ))
  \pat_gen/state_state[4]_PatGen_start[9]_select_32_OUT<4>1  (
    .I0(\pat_gen/state_FSM_FFd1_1207 ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/FIFO_wr_210 ),
    .I3(PatFIFO_empty),
    .I4(\pat_gen/Pat_i[5] ),
    .I5(\pat_gen/state_FSM_FFd3_1209 ),
    .O(\pat_gen/state[4]_PatGen_start[9]_select_32_OUT<4> )
  );
  LUT6 #(
    .INIT ( 64'hFAFAFAFA08088808 ))
  \pat_gen/state_state[4]_PatGen_start[9]_select_32_OUT<9>1  (
    .I0(\pat_gen/Pat_i[10] ),
    .I1(\pat_gen/state_FSM_FFd1_1207 ),
    .I2(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I3(PatFIFO_empty),
    .I4(\pat_gen/FIFO_wr_210 ),
    .I5(\pat_gen/state_FSM_FFd3_1209 ),
    .O(\pat_gen/state[4]_PatGen_start[9]_select_32_OUT<9> )
  );
  LUT6 #(
    .INIT ( 64'hFB73FA70BB33AA20 ))
  \pat_gen/state_state[4]_FIFO_wr_Select_35_o1  (
    .I0(\pat_gen/FIFO_wr_210 ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd1_1207 ),
    .I3(\pat_gen/state_FSM_FFd2_1208 ),
    .I4(\pat_gen/state_FSM_FFd3_1209 ),
    .I5(PatFIFO_empty),
    .O(\pat_gen/state[4]_FIFO_wr_Select_35_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFF2A ))
  \ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1  (
    .I0(\ROImager_inst/state_FSM_FFd5_872 ),
    .I1(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I2(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I3(\ROImager_inst/state_FSM_FFd3_870 ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>2 ),
    .I5(\ROImager_inst/state_FSM_FFd4_871 ),
    .O(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \ROImager_inst/state_FSM_FFd4-In1  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd6_873 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/state_FSM_FFd1_868 ),
    .O(\ROImager_inst/state_FSM_FFd4-In1_1310 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \ROImager_inst/state_FSM_FFd4-In2  (
    .I0(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I1(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I2(\ROImager_inst/state_FSM_FFd5_872 ),
    .I3(\ROImager_inst/state_FSM_FFd4_871 ),
    .I4(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<6>_786 ),
    .O(\ROImager_inst/state_FSM_FFd4-In2_1311 )
  );
  LUT5 #(
    .INIT ( 32'hF020F000 ))
  \ROImager_inst/state_FSM_FFd4-In3  (
    .I0(\ROImager_inst/state_FSM_FFd4_871 ),
    .I1(\ROImager_inst/state_FSM_FFd5_872 ),
    .I2(\ROImager_inst/state_FSM_FFd4-In1_1310 ),
    .I3(\ROImager_inst/state_FSM_FFd4-In2_1311 ),
    .I4(\ROImager_inst/Mcompar_n0023_cy [6]),
    .O(\ROImager_inst/state_FSM_FFd4-In )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \ROImager_inst/state_state[7]_FSMIND0ACK_i_Select_64_o_SW0  (
    .I0(\ROImager_inst/state_FSM_FFd4_871 ),
    .I1(\ROImager_inst/state_FSM_FFd3_870 ),
    .O(N4)
  );
  LUT6 #(
    .INIT ( 64'hFFFFAAA8AAAAAAA8 ))
  \ROImager_inst/state_state[7]_FSMIND0ACK_i_Select_64_o  (
    .I0(\ROImager_inst/FSMIND0ACK_i_207 ),
    .I1(\ROImager_inst/state_FSM_FFd6_873 ),
    .I2(\ROImager_inst/state_FSM_FFd5_872 ),
    .I3(N4),
    .I4(\ROImager_inst/state_FSM_FFd1_868 ),
    .I5(FSMIND0_IBUF_15),
    .O(\ROImager_inst/state[7]_FSMIND0ACK_i_Select_64_o )
  );
  LUT6 #(
    .INIT ( 64'hFFEEFFEEEEAAEEA8 ))
  \ROImager_inst/state_FSM_FFd6-In2  (
    .I0(\ROImager_inst/state_FSM_FFd2_869 ),
    .I1(\ROImager_inst/state_FSM_FFd5_872 ),
    .I2(\ROImager_inst/state_FSM_FFd1_868 ),
    .I3(\ROImager_inst/state_FSM_FFd3_870 ),
    .I4(\ROImager_inst/state_FSM_FFd4_871 ),
    .I5(\ROImager_inst/state_FSM_FFd6_873 ),
    .O(\ROImager_inst/state_FSM_FFd6-In2_1314 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \ROImager_inst/state_FSM_FFd3-In_SW0  (
    .I0(\ROImager_inst/state_FSM_FFd6_873 ),
    .I1(\ROImager_inst/state_FSM_FFd4_871 ),
    .I2(\ROImager_inst/state_FSM_FFd1_868 ),
    .I3(\ROImager_inst/state_FSM_FFd2_869 ),
    .O(N8)
  );
  LUT6 #(
    .INIT ( 64'h0410101000101010 ))
  \ROImager_inst/state_FSM_FFd3-In  (
    .I0(N8),
    .I1(\ROImager_inst/state_FSM_FFd5_872 ),
    .I2(\ROImager_inst/state_FSM_FFd3_870 ),
    .I3(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I4(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I5(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<6>_786 ),
    .O(\ROImager_inst/state_FSM_FFd3-In_876 )
  );
  LUT6 #(
    .INIT ( 64'h0414001000100010 ))
  \ROImager_inst/state_FSM_FFd2-In  (
    .I0(N10),
    .I1(\ROImager_inst/state_FSM_FFd3_870 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(FSMIND1ACK_IBUF_16),
    .I4(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I5(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .O(\ROImager_inst/state_FSM_FFd2-In_875 )
  );
  BUFG   CLK_HS_BUFG (
    .O(CLK_HS_BUFG_565),
    .I(CLK_HS)
  );
  BUFG   CLK0_BUFG (
    .O(CLK0_BUFG_563),
    .I(CLK0)
  );
  BUFG   CLK_HS180_BUFG (
    .O(CLK_HS180_BUFG_566),
    .I(CLK_HS180)
  );
  BUFG   CLKDV_BUFG (
    .O(CLKDV_BUFG_564),
    .I(CLKDV)
  );
  BUFG   CLKMPRE_int180_BUFG (
    .O(CLKMPRE_int180_BUFG_580),
    .I(CLKMPRE_int180)
  );
  BUFG   CLKMPRE_int_BUFG (
    .O(CLKMPRE_int_BUFG_579),
    .I(CLKMPRE_int)
  );
  IBUF   im_data_clk_IBUF (
    .I(im_data_clk),
    .O(im_data_clk_IBUF_14)
  );
  IBUF   okUH_4_IBUF (
    .I(okUH[4]),
    .O(okUH_4_IBUF_0)
  );
  IBUF   okUH_3_IBUF (
    .I(okUH[3]),
    .O(okUH_3_IBUF_1)
  );
  IBUF   okUH_2_IBUF (
    .I(okUH[2]),
    .O(okUH_2_IBUF_2)
  );
  IBUF   okUH_1_IBUF (
    .I(okUH[1]),
    .O(okUH_1_IBUF_3)
  );
  IBUF   im_data_5_IBUF (
    .I(im_data[5]),
    .O(im_data_5_IBUF_5)
  );
  IBUF   im_data_4_IBUF (
    .I(im_data[4]),
    .O(im_data_4_IBUF_6)
  );
  IBUF   im_data_3_IBUF (
    .I(im_data[3]),
    .O(im_data_3_IBUF_7)
  );
  IBUF   im_data_2_IBUF (
    .I(im_data[2]),
    .O(im_data_2_IBUF_8)
  );
  IBUF   im_data_1_IBUF (
    .I(im_data[1]),
    .O(im_data_1_IBUF_9)
  );
  IBUF   im_data_0_IBUF (
    .I(im_data[0]),
    .O(im_data_0_IBUF_10)
  );
  IBUF   im_data_val_IBUF (
    .I(im_data_val),
    .O(im_data_val_IBUF_13)
  );
  IBUF   FSMIND0_IBUF (
    .I(FSMIND0),
    .O(FSMIND0_IBUF_15)
  );
  IBUF   FSMIND1ACK_IBUF (
    .I(FSMIND1ACK),
    .O(FSMIND1ACK_IBUF_16)
  );
  OBUF   okHU_2_OBUF (
    .I(okHU_2_OBUF_17),
    .O(okHU[2])
  );
  OBUF   okHU_1_OBUF (
    .I(okHU_1_OBUF_18),
    .O(okHU[1])
  );
  OBUF   okHU_0_OBUF (
    .I(okHU_0_OBUF_19),
    .O(okHU[0])
  );
  OBUF   led_7_OBUF (
    .I(\ROImager_inst/fsm_stat_i [6]),
    .O(led[7])
  );
  OBUF   led_6_OBUF (
    .I(\ROImager_inst/fsm_stat_i [5]),
    .O(led[6])
  );
  OBUF   led_5_OBUF (
    .I(\ROImager_inst/fsm_stat_i [6]),
    .O(led[5])
  );
  OBUF   led_4_OBUF (
    .I(\ROImager_inst/fsm_stat_i [5]),
    .O(led[4])
  );
  OBUF   led_3_OBUF (
    .I(\ROImager_inst/fsm_stat_i [4]),
    .O(led[3])
  );
  OBUF   led_2_OBUF (
    .I(\ROImager_inst/fsm_stat_i [3]),
    .O(led[2])
  );
  OBUF   led_1_OBUF (
    .I(\ROImager_inst/fsm_stat_i [2]),
    .O(led[1])
  );
  OBUF   led_0_OBUF (
    .I(\ROImager_inst/fsm_stat_i [1]),
    .O(led[0])
  );
  OBUF   MSTREAM_10_OBUF (
    .I(MSTREAM_10_OBUF_567),
    .O(MSTREAM[10])
  );
  OBUF   MSTREAM_9_OBUF (
    .I(MSTREAM_9_OBUF_568),
    .O(MSTREAM[9])
  );
  OBUF   MSTREAM_8_OBUF (
    .I(MSTREAM_8_OBUF_569),
    .O(MSTREAM[8])
  );
  OBUF   MSTREAM_7_OBUF (
    .I(MSTREAM_7_OBUF_570),
    .O(MSTREAM[7])
  );
  OBUF   MSTREAM_6_OBUF (
    .I(MSTREAM_6_OBUF_571),
    .O(MSTREAM[6])
  );
  OBUF   MSTREAM_5_OBUF (
    .I(MSTREAM_5_OBUF_572),
    .O(MSTREAM[5])
  );
  OBUF   MSTREAM_4_OBUF (
    .I(MSTREAM_4_OBUF_573),
    .O(MSTREAM[4])
  );
  OBUF   MSTREAM_3_OBUF (
    .I(MSTREAM_3_OBUF_574),
    .O(MSTREAM[3])
  );
  OBUF   MSTREAM_2_OBUF (
    .I(MSTREAM_2_OBUF_575),
    .O(MSTREAM[2])
  );
  OBUF   MSTREAM_1_OBUF (
    .I(MSTREAM_1_OBUF_576),
    .O(MSTREAM[1])
  );
  OBUF   FPGA_rst_n_OBUF (
    .I(FPGA_rst_n_OBUF_578),
    .O(FPGA_rst_n)
  );
  OBUF   CLKM_OBUF (
    .I(CLKM_OBUF_581),
    .O(CLKM)
  );
  OBUF   CLKMPRE_OBUF (
    .I(CLKMPRE_OBUF_647),
    .O(CLKMPRE)
  );
  OBUF   STREAM_OBUF (
    .I(\ROImager_inst/STREAM_203 ),
    .O(STREAM)
  );
  OBUF   OK_DRAIN_B_OBUF (
    .I(\ROImager_inst/OK_DRAIN_B_204 ),
    .O(OK_DRAIN_B)
  );
  OBUF   OK_PIXRES_GLOB_OBUF (
    .I(\ROImager_inst/OK_PIXRES_GLOB_202 ),
    .O(OK_PIXRES_GLOB)
  );
  OBUF   FSMIND1_OBUF (
    .I(\ROImager_inst/FSMIND1_i_206 ),
    .O(FSMIND1)
  );
  OBUF   FSMIND0ACK_OBUF (
    .I(\ROImager_inst/FSMIND0ACK_i_207 ),
    .O(FSMIND0ACK)
  );
  FDR #(
    .INIT ( 1'b0 ))
  \ROImager_inst/STREAM  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/STREAM_glue_set_1366 ),
    .R(FSMstop),
    .Q(\ROImager_inst/STREAM_203 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \ROImager_inst/fsm_stat_i_5  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/fsm_stat_i_5_glue_rst_1367 ),
    .Q(\ROImager_inst/fsm_stat_i [5])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \ROImager_inst/fsm_stat_i_5_glue_rst  (
    .I0(FSMstop),
    .I1(\ROImager_inst/state[7]_PWR_6_o_select_49_OUT<3> ),
    .O(\ROImager_inst/fsm_stat_i_5_glue_rst_1367 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ROImager_inst/fsm_stat_i_4  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/fsm_stat_i_4_glue_set_1368 ),
    .Q(\ROImager_inst/fsm_stat_i [4])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \ROImager_inst/fsm_stat_i_4_glue_set  (
    .I0(\ROImager_inst/state[7]_PWR_6_o_select_49_OUT<3> ),
    .I1(FSMstop),
    .O(\ROImager_inst/fsm_stat_i_4_glue_set_1368 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ROImager_inst/fsm_stat_i_2  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/fsm_stat_i_2_glue_set_1369 ),
    .Q(\ROImager_inst/fsm_stat_i [2])
  );
  FD #(
    .INIT ( 1'b1 ))
  \ROImager_inst/count_subsc_0  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/count_subsc_0_glue_rst_1370 ),
    .Q(\ROImager_inst/count_subsc [0])
  );
  FD #(
    .INIT ( 1'b1 ))
  \pat_gen/state_FSM_FFd2  (
    .C(CLK_HS_BUFG_565),
    .D(\pat_gen/state_FSM_FFd2_glue_rst_1371 ),
    .Q(\pat_gen/state_FSM_FFd2_1208 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \pat_gen/state_FSM_FFd3  (
    .C(CLK_HS_BUFG_565),
    .D(\pat_gen/state_FSM_FFd3_glue_set_1372 ),
    .Q(\pat_gen/state_FSM_FFd3_1209 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_rt  (
    .I0(\ROImager_inst/count_subsc [30]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<30>_rt_1373 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_rt  (
    .I0(\ROImager_inst/count_subsc [29]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<29>_rt_1374 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_rt  (
    .I0(\ROImager_inst/count_subsc [28]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<28>_rt_1375 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_rt  (
    .I0(\ROImager_inst/count_subsc [27]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<27>_rt_1376 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_rt  (
    .I0(\ROImager_inst/count_subsc [26]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<26>_rt_1377 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_rt  (
    .I0(\ROImager_inst/count_subsc [25]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<25>_rt_1378 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_rt  (
    .I0(\ROImager_inst/count_subsc [24]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<24>_rt_1379 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_rt  (
    .I0(\ROImager_inst/count_subsc [23]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<23>_rt_1380 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_rt  (
    .I0(\ROImager_inst/count_subsc [22]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<22>_rt_1381 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_rt  (
    .I0(\ROImager_inst/count_subsc [21]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<21>_rt_1382 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_rt  (
    .I0(\ROImager_inst/count_subsc [20]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<20>_rt_1383 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_rt  (
    .I0(\ROImager_inst/count_subsc [19]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<19>_rt_1384 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_rt  (
    .I0(\ROImager_inst/count_subsc [18]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<18>_rt_1385 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_rt  (
    .I0(\ROImager_inst/count_subsc [17]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<17>_rt_1386 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_rt  (
    .I0(\ROImager_inst/count_subsc [16]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<16>_rt_1387 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_rt  (
    .I0(\ROImager_inst/count_subsc [15]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<15>_rt_1388 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_rt  (
    .I0(\ROImager_inst/count_subsc [14]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<14>_rt_1389 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_rt  (
    .I0(\ROImager_inst/count_subsc [13]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<13>_rt_1390 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_rt  (
    .I0(\ROImager_inst/count_subsc [12]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<12>_rt_1391 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_rt  (
    .I0(\ROImager_inst/count_subsc [11]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<11>_rt_1392 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_rt  (
    .I0(\ROImager_inst/count_subsc [10]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<10>_rt_1393 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_rt  (
    .I0(\ROImager_inst/count_subsc [9]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<9>_rt_1394 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_rt  (
    .I0(\ROImager_inst/count_subsc [8]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<8>_rt_1395 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_rt  (
    .I0(\ROImager_inst/count_subsc [7]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<7>_rt_1396 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_rt  (
    .I0(\ROImager_inst/count_subsc [6]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<6>_rt_1397 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_rt  (
    .I0(\ROImager_inst/count_subsc [5]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<5>_rt_1398 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_rt  (
    .I0(\ROImager_inst/count_subsc [4]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<4>_rt_1399 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_rt  (
    .I0(\ROImager_inst/count_subsc [3]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<3>_rt_1400 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_rt  (
    .I0(\ROImager_inst/count_subsc [2]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<2>_rt_1401 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_rt  (
    .I0(\ROImager_inst/count_subsc [1]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_cy<1>_rt_1402 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_rt  (
    .I0(\ROImager_inst/count_mpre [30]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<30>_rt_1403 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_rt  (
    .I0(\ROImager_inst/count_mpre [29]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<29>_rt_1404 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_rt  (
    .I0(\ROImager_inst/count_mpre [28]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<28>_rt_1405 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_rt  (
    .I0(\ROImager_inst/count_mpre [27]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<27>_rt_1406 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_rt  (
    .I0(\ROImager_inst/count_mpre [26]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<26>_rt_1407 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_rt  (
    .I0(\ROImager_inst/count_mpre [25]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<25>_rt_1408 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_rt  (
    .I0(\ROImager_inst/count_mpre [24]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<24>_rt_1409 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_rt  (
    .I0(\ROImager_inst/count_mpre [23]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<23>_rt_1410 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_rt  (
    .I0(\ROImager_inst/count_mpre [22]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<22>_rt_1411 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_rt  (
    .I0(\ROImager_inst/count_mpre [21]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<21>_rt_1412 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_rt  (
    .I0(\ROImager_inst/count_mpre [20]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<20>_rt_1413 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_rt  (
    .I0(\ROImager_inst/count_mpre [19]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<19>_rt_1414 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_rt  (
    .I0(\ROImager_inst/count_mpre [18]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<18>_rt_1415 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_rt  (
    .I0(\ROImager_inst/count_mpre [17]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<17>_rt_1416 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_rt  (
    .I0(\ROImager_inst/count_mpre [16]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<16>_rt_1417 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_rt  (
    .I0(\ROImager_inst/count_mpre [15]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<15>_rt_1418 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_rt  (
    .I0(\ROImager_inst/count_mpre [14]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<14>_rt_1419 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_rt  (
    .I0(\ROImager_inst/count_mpre [13]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<13>_rt_1420 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_rt  (
    .I0(\ROImager_inst/count_mpre [12]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<12>_rt_1421 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_rt  (
    .I0(\ROImager_inst/count_mpre [11]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<11>_rt_1422 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_rt  (
    .I0(\ROImager_inst/count_mpre [10]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<10>_rt_1423 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_rt  (
    .I0(\ROImager_inst/count_mpre [9]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<9>_rt_1424 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_rt  (
    .I0(\ROImager_inst/count_mpre [8]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<8>_rt_1425 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_rt  (
    .I0(\ROImager_inst/count_mpre [7]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<7>_rt_1426 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_rt  (
    .I0(\ROImager_inst/count_mpre [6]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<6>_rt_1427 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_rt  (
    .I0(\ROImager_inst/count_mpre [5]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<5>_rt_1428 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_rt  (
    .I0(\ROImager_inst/count_mpre [4]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<4>_rt_1429 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_rt  (
    .I0(\ROImager_inst/count_mpre [3]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<3>_rt_1430 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_rt  (
    .I0(\ROImager_inst/count_mpre [2]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<2>_rt_1431 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_rt  (
    .I0(\ROImager_inst/count_mpre [1]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_cy<1>_rt_1432 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_rt  (
    .I0(\pat_gen/cntPat [30]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<30>_rt_1433 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_rt  (
    .I0(\pat_gen/cntPat [29]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<29>_rt_1434 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_rt  (
    .I0(\pat_gen/cntPat [28]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<28>_rt_1435 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_rt  (
    .I0(\pat_gen/cntPat [27]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<27>_rt_1436 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_rt  (
    .I0(\pat_gen/cntPat [26]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<26>_rt_1437 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_rt  (
    .I0(\pat_gen/cntPat [25]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<25>_rt_1438 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_rt  (
    .I0(\pat_gen/cntPat [24]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<24>_rt_1439 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_rt  (
    .I0(\pat_gen/cntPat [23]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<23>_rt_1440 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_rt  (
    .I0(\pat_gen/cntPat [22]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<22>_rt_1441 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_rt  (
    .I0(\pat_gen/cntPat [21]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<21>_rt_1442 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_rt  (
    .I0(\pat_gen/cntPat [20]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<20>_rt_1443 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_rt  (
    .I0(\pat_gen/cntPat [19]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<19>_rt_1444 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_rt  (
    .I0(\pat_gen/cntPat [18]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<18>_rt_1445 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_rt  (
    .I0(\pat_gen/cntPat [17]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<17>_rt_1446 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_rt  (
    .I0(\pat_gen/cntPat [16]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<16>_rt_1447 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_rt  (
    .I0(\pat_gen/cntPat [15]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<15>_rt_1448 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_rt  (
    .I0(\pat_gen/cntPat [14]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<14>_rt_1449 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_rt  (
    .I0(\pat_gen/cntPat [13]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<13>_rt_1450 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_rt  (
    .I0(\pat_gen/cntPat [12]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<12>_rt_1451 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_rt  (
    .I0(\pat_gen/cntPat [11]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<11>_rt_1452 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_rt  (
    .I0(\pat_gen/cntPat [10]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<10>_rt_1453 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_rt  (
    .I0(\pat_gen/cntPat [9]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<9>_rt_1454 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_rt  (
    .I0(\pat_gen/cntPat [8]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<8>_rt_1455 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_rt  (
    .I0(\pat_gen/cntPat [7]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<7>_rt_1456 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_rt  (
    .I0(\pat_gen/cntPat [6]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<6>_rt_1457 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_rt  (
    .I0(\pat_gen/cntPat [5]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<5>_rt_1458 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_rt  (
    .I0(\pat_gen/cntPat [4]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<4>_rt_1459 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_rt  (
    .I0(\pat_gen/cntPat [3]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<3>_rt_1460 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_rt  (
    .I0(\pat_gen/cntPat [2]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<2>_rt_1461 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_rt  (
    .I0(\pat_gen/cntPat [1]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_cy<1>_rt_1462 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<31>_rt  (
    .I0(\ROImager_inst/count_subsc [31]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_xor<31>_rt_1463 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<31>_rt  (
    .I0(\ROImager_inst/count_mpre [31]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_xor<31>_rt_1464 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<31>_rt  (
    .I0(\pat_gen/cntPat [31]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_xor<31>_rt_1465 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \pat_gen/state_FSM_FFd1  (
    .C(CLK_HS_BUFG_565),
    .D(\pat_gen/state_FSM_FFd1_rstpot_1466 ),
    .Q(\pat_gen/state_FSM_FFd1_1207 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \ROImager_inst/state_FSM_FFd5  (
    .C(CLKMPRE_int_BUFG_579),
    .D(\ROImager_inst/state_FSM_FFd5_rstpot_1467 ),
    .Q(\ROImager_inst/state_FSM_FFd5_872 )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<8>1  (
    .I0(\ROImager_inst/count_mpre [8]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<8> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<8> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<7>1  (
    .I0(\ROImager_inst/count_mpre [7]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<7> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<7> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<6>1  (
    .I0(\ROImager_inst/count_mpre [6]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<6> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<6> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<5>1  (
    .I0(\ROImager_inst/count_mpre [5]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<5> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<5> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<4>1  (
    .I0(\ROImager_inst/count_mpre [4]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<4> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<4> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<3>1  (
    .I0(\ROImager_inst/count_mpre [3]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<3> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<3> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<31>1  (
    .I0(\ROImager_inst/count_mpre [31]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<31> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<31> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<30>1  (
    .I0(\ROImager_inst/count_mpre [30]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<30> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<30> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<2>1  (
    .I0(\ROImager_inst/count_mpre [2]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<2> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<2> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<29>1  (
    .I0(\ROImager_inst/count_mpre [29]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<29> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<29> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<28>1  (
    .I0(\ROImager_inst/count_mpre [28]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<28> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<28> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<27>1  (
    .I0(\ROImager_inst/count_mpre [27]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<27> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<27> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<26>1  (
    .I0(\ROImager_inst/count_mpre [26]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<26> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<26> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<25>1  (
    .I0(\ROImager_inst/count_mpre [25]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<25> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<25> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<24>1  (
    .I0(\ROImager_inst/count_mpre [24]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<24> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<24> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<23>1  (
    .I0(\ROImager_inst/count_mpre [23]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<23> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<23> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<22>1  (
    .I0(\ROImager_inst/count_mpre [22]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<22> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<22> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<21>1  (
    .I0(\ROImager_inst/count_mpre [21]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<21> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<21> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<20>1  (
    .I0(\ROImager_inst/count_mpre [20]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<20> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<20> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<1>1  (
    .I0(\ROImager_inst/count_mpre [1]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<1> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<1> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<19>1  (
    .I0(\ROImager_inst/count_mpre [19]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<19> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<19> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<18>1  (
    .I0(\ROImager_inst/count_mpre [18]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<18> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<18> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<17>1  (
    .I0(\ROImager_inst/count_mpre [17]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<17> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<17> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<16>1  (
    .I0(\ROImager_inst/count_mpre [16]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<16> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<16> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<15>1  (
    .I0(\ROImager_inst/count_mpre [15]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<15> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<15> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<14>1  (
    .I0(\ROImager_inst/count_mpre [14]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<14> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<14> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<13>1  (
    .I0(\ROImager_inst/count_mpre [13]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<13> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<13> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<12>1  (
    .I0(\ROImager_inst/count_mpre [12]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<12> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<12> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<11>1  (
    .I0(\ROImager_inst/count_mpre [11]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<11> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<11> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<10>1  (
    .I0(\ROImager_inst/count_mpre [10]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<10> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<10> )
  );
  LUT5 #(
    .INIT ( 32'hFFA8A8A8 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>1  (
    .I0(\ROImager_inst/count_mpre [0]),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<0> ),
    .I4(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<0> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \ROImager_inst/state_FSM_FFd5-In22_SW1  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd2_869 ),
    .I2(\ROImager_inst/state_FSM_FFd1_868 ),
    .I3(FSMstop),
    .O(N45)
  );
  LUT6 #(
    .INIT ( 64'h0000014000110140 ))
  \ROImager_inst/state_FSM_FFd5_rstpot  (
    .I0(N45),
    .I1(\ROImager_inst/state_FSM_FFd6_873 ),
    .I2(N6),
    .I3(\ROImager_inst/state_FSM_FFd5_872 ),
    .I4(\ROImager_inst/state_FSM_FFd4_871 ),
    .I5(\ROImager_inst/Mcompar_n0023_cy [6]),
    .O(\ROImager_inst/state_FSM_FFd5_rstpot_1467 )
  );
  MUXCY   \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_cy  (
    .CI(\ROImager_inst/Mcompar_n0023_cy [6]),
    .DI(wireout[0]),
    .S(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_cy_rt_1474 ),
    .O(\ROImager_inst/Mcompar_n0023_cy<6>_l1 )
  );
  MUXCY   \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_cy1  (
    .CI(\ROImager_inst/Mcompar_n0023_cy<6>_l1 ),
    .DI(wireExp[29]),
    .S(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_lut_1470 ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 )
  );
  MUXCY   \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_cy  (
    .CI(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3 ),
    .DI(wireout[0]),
    .S(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_cy_rt_1475 ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3_l1 )
  );
  LUT3 #(
    .INIT ( 8'h1F ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_lut  (
    .I0(\ROImager_inst/state_FSM_FFd2_869 ),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/count_mpre [9]),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_lut_1472 )
  );
  MUXCY   \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_cy1  (
    .CI(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>3_l1 ),
    .DI(wireExp[29]),
    .S(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_lut_1472 ),
    .O(\ROImager_inst/state[7]_GND_6_o_select_57_OUT<9> )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF0414 ))
  \pat_gen/state_FSM_FFd3_glue_set  (
    .I0(\pat_gen/state_FSM_FFd1_1207 ),
    .I1(\pat_gen/state_FSM_FFd2_1208 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I4(FSMIND0_IBUF_15),
    .I5(FSMstop),
    .O(\pat_gen/state_FSM_FFd3_glue_set_1372 )
  );
  LUT5 #(
    .INIT ( 32'h11101001 ))
  \pat_gen/state_FSM_FFd2_glue_rst  (
    .I0(FSMIND0_IBUF_15),
    .I1(FSMstop),
    .I2(\pat_gen/state_FSM_FFd2_1208 ),
    .I3(\pat_gen/state_FSM_FFd3_1209 ),
    .I4(\pat_gen/state_FSM_FFd1_1207 ),
    .O(\pat_gen/state_FSM_FFd2_glue_rst_1371 )
  );
  LUT5 #(
    .INIT ( 32'h55404040 ))
  \ROImager_inst/count_subsc_0_glue_rst  (
    .I0(FSMstop),
    .I1(\ROImager_inst/count_subsc [0]),
    .I2(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>1_732 ),
    .I3(\ROImager_inst/count_subsc[31]_GND_6_o_add_5_OUT<0> ),
    .I4(\ROImager_inst/state_state[7]_count_subsc[31]_select_54_OUT<0>3 ),
    .O(\ROImager_inst/count_subsc_0_glue_rst_1370 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \ROImager_inst/fsm_stat_i_2_glue_set  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd1_868 ),
    .I2(\ROImager_inst/state_FSM_FFd2_869 ),
    .I3(\ROImager_inst/state_FSM_FFd6_873 ),
    .I4(FSMstop),
    .O(\ROImager_inst/fsm_stat_i_2_glue_set_1369 )
  );
  LUT6 #(
    .INIT ( 64'h0001010101010101 ))
  \ROImager_inst/state_FSM_FFd6-In4_SW0  (
    .I0(\ROImager_inst/state_FSM_FFd2_869 ),
    .I1(\ROImager_inst/state_FSM_FFd3_870 ),
    .I2(\ROImager_inst/state_FSM_FFd5_872 ),
    .I3(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I4(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I5(\ROImager_inst/state_FSM_FFd6_873 ),
    .O(N47)
  );
  LUT6 #(
    .INIT ( 64'hFFFFEEFDFFFFEEA8 ))
  \ROImager_inst/state_FSM_FFd6-In4  (
    .I0(\ROImager_inst/state_FSM_FFd1_868 ),
    .I1(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>1_731 ),
    .I2(FSMIND0_IBUF_15),
    .I3(\ROImager_inst/state_FSM_FFd4_871 ),
    .I4(\ROImager_inst/state_FSM_FFd6-In2_1314 ),
    .I5(N47),
    .O(\ROImager_inst/state_FSM_FFd6-In )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<6>  (
    .I0(\ROImager_inst/count_subsc [30]),
    .I1(\ROImager_inst/count_subsc [31]),
    .I2(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<5>_787 ),
    .O(\ROImager_inst/Mcompar_count_subsc[31]_Num_Pat[31]_LessThan_17_o_cy<6>_786 )
  );
  LUT3 #(
    .INIT ( 8'h54 ))
  \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>  (
    .I0(\ROImager_inst/count_mpre [31]),
    .I1(\ROImager_inst/count_mpre [30]),
    .I2(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<4>_771 ),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<0>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<0> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<0> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<10>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<10> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<10> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<11>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<11> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<11> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<12>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<12> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<12> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<13>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<13> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<13> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<14>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<14> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<14> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<15>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<15> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<15> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<16>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<16> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<16> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<17>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<17> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<17> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<18>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<18> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<18> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<19>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<19> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<19> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<1>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<1> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<1> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<20>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<20> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<20> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<21>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<21> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<21> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<22>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<22> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<22> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<23>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<23> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<23> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<24>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<24> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<24> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<25>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<25> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<25> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<26>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<26> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<26> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<27>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<27> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<27> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<28>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<28> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<28> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<29>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<29> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<29> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<2>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<2> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<2> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<30>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<30> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<30> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<31>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<31> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<31> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<3>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<3> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<4>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<4> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<4> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<5>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<5> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<5> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<6>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<6> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<6> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<7>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<7> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<7> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<8>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<8> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<8> )
  );
  LUT6 #(
    .INIT ( 64'h22202220AA202220 ))
  \pat_gen/state_state[4]_GND_9_o_select_34_OUT<9>1  (
    .I0(\pat_gen/cntPat[31]_GND_9_o_add_2_OUT<9> ),
    .I1(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .I2(\pat_gen/state_FSM_FFd3_1209 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(PatFIFO_empty),
    .I5(\pat_gen/FIFO_wr_210 ),
    .O(\pat_gen/state[4]_GND_9_o_select_34_OUT<9> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \ROImager_inst/state_state[7]_PWR_6_o_select_49_OUT<0>1  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd5_872 ),
    .I2(\ROImager_inst/state_FSM_FFd1_868 ),
    .I3(\ROImager_inst/state_FSM_FFd2_869 ),
    .O(\ROImager_inst/state[7]_PWR_6_o_select_49_OUT<0> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \ROImager_inst/state_FSM_FFd2-In_SW0  (
    .I0(\ROImager_inst/state_FSM_FFd5_872 ),
    .I1(\ROImager_inst/state_FSM_FFd6_873 ),
    .I2(\ROImager_inst/state_FSM_FFd4_871 ),
    .I3(\ROImager_inst/state_FSM_FFd1_868 ),
    .O(N10)
  );
  LUT5 #(
    .INIT ( 32'hFF010101 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_lut  (
    .I0(\ROImager_inst/state_FSM_FFd3_870 ),
    .I1(\ROImager_inst/state_FSM_FFd5_872 ),
    .I2(\ROImager_inst/state_FSM_FFd6_873 ),
    .I3(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I4(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_lut_1470 )
  );
  LUT4 #(
    .INIT ( 16'h5554 ))
  \ROImager_inst/state__n0143_inv1  (
    .I0(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I1(\ROImager_inst/state_FSM_FFd3_870 ),
    .I2(\ROImager_inst/state_FSM_FFd5_872 ),
    .I3(\ROImager_inst/state_FSM_FFd6_873 ),
    .O(\ROImager_inst/_n0143_inv )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \pat_gen/rst_inv1  (
    .I0(FSMstop),
    .I1(FSMIND0_IBUF_15),
    .O(\pat_gen/rst_inv )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAAAAA8 ))
  \ROImager_inst/state_state[7]_PWR_6_o_Select_51_o1  (
    .I0(\ROImager_inst/OK_PIXRES_GLOB_202 ),
    .I1(\ROImager_inst/state_FSM_FFd3_870 ),
    .I2(\ROImager_inst/state_FSM_FFd5_872 ),
    .I3(\ROImager_inst/state_FSM_FFd1_868 ),
    .I4(\ROImager_inst/state_FSM_FFd2_869 ),
    .I5(\ROImager_inst/state_FSM_FFd6_873 ),
    .O(\ROImager_inst/state[7]_PWR_6_o_Select_51_o )
  );
  LUT4 #(
    .INIT ( 16'h2220 ))
  \ROImager_inst/state_FSM_FFd5-In22_SW0  (
    .I0(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_cy<6>_750 ),
    .I1(\ROImager_inst/count_mpre [31]),
    .I2(\ROImager_inst/count_mpre [30]),
    .I3(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<4>_771 ),
    .O(N6)
  );
  LUT6 #(
    .INIT ( 64'h00010001FFFF0001 ))
  \ROImager_inst/STREAM_glue_set  (
    .I0(\ROImager_inst/state_FSM_FFd2_869 ),
    .I1(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_2_o_cy<5>_770 ),
    .I2(\ROImager_inst/state_FSM_FFd4_871 ),
    .I3(\ROImager_inst/state_FSM_FFd1_868 ),
    .I4(\ROImager_inst/STREAM_203 ),
    .I5(\ROImager_inst/_n0143_inv ),
    .O(\ROImager_inst/STREAM_glue_set_1366 )
  );
  LUT6 #(
    .INIT ( 64'h0001010000000100 ))
  \pat_gen/state_FSM_FFd1_rstpot  (
    .I0(FSMstop),
    .I1(FSMIND0_IBUF_15),
    .I2(\pat_gen/state_FSM_FFd2_1208 ),
    .I3(\pat_gen/state_FSM_FFd1_1207 ),
    .I4(\pat_gen/state_FSM_FFd3_1209 ),
    .I5(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_cy<5>_1158 ),
    .O(\pat_gen/state_FSM_FFd1_rstpot_1466 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_cy_rt  (
    .I0(\ROImager_inst/state_FSM_FFd4_871 ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<0>31_cy_rt_1474 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_cy_rt  (
    .I0(\ROImager_inst/count_mpre[31]_GND_6_o_add_4_OUT<9> ),
    .O(\ROImager_inst/state_state[7]_GND_6_o_select_57_OUT<9>1_cy_rt_1475 )
  );
  BUFG   sys_clk_BUFG (
    .O(sys_clk_BUFG_194),
    .I(sys_clk)
  );
  INV   \ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<6>_INV_0  (
    .I(\ROImager_inst/count_mpre [31]),
    .O(\ROImager_inst/Mcompar_GND_6_o_count_mpre[31]_LessThan_4_o_lut<6> )
  );
  INV   \ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_lut<0>_INV_0  (
    .I(\ROImager_inst/count_subsc [0]),
    .O(\ROImager_inst/Madd_count_subsc[31]_GND_6_o_add_5_OUT_lut<0> )
  );
  INV   \ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_lut<0>_INV_0  (
    .I(\ROImager_inst/count_mpre [0]),
    .O(\ROImager_inst/Madd_count_mpre[31]_GND_6_o_add_4_OUT_lut<0> )
  );
  INV   \pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<5>_INV_0  (
    .I(\pat_gen/cntPat [31]),
    .O(\pat_gen/Mcompar_GND_9_o_cntPat[31]_LessThan_2_o_lut<5> )
  );
  INV   \pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_lut<0>_INV_0  (
    .I(\pat_gen/cntPat [0]),
    .O(\pat_gen/Madd_cntPat[31]_GND_9_o_add_2_OUT_lut<0> )
  );
  INV   FPGA_rst_n1_INV_0 (
    .I(FSMstop),
    .O(FPGA_rst_n_OBUF_578)
  );
  INV   \hostIF/okHC<38>1_INV_0  (
    .I(\hostIF/dcm0_locked ),
    .O(\hostIF/okHC [38])
  );
  INV   \hostIF/okCH[36]_INV_86_o1_INV_0  (
    .I(\hostIF/okCH [36]),
    .O(\hostIF/okCH[36]_INV_86_o )
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[31].iobf0  (
    .I(\hostIF/regout0_q [31]),
    .T(\hostIF/regvalid_q [31]),
    .O(\hostIF/iobf0_o [31]),
    .IO(okUHU[31])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[31].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [31]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [36])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[31].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [31])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[31].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [34]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [31])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[30].iobf0  (
    .I(\hostIF/regout0_q [30]),
    .T(\hostIF/regvalid_q [30]),
    .O(\hostIF/iobf0_o [30]),
    .IO(okUHU[30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[30].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [30]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [35])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[30].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[30].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [33]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [30])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[29].iobf0  (
    .I(\hostIF/regout0_q [29]),
    .T(\hostIF/regvalid_q [29]),
    .O(\hostIF/iobf0_o [29]),
    .IO(okUHU[29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[29].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [29]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [34])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[29].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[29].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [32]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [29])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[28].iobf0  (
    .I(\hostIF/regout0_q [28]),
    .T(\hostIF/regvalid_q [28]),
    .O(\hostIF/iobf0_o [28]),
    .IO(okUHU[28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[28].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [28]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [33])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[28].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[28].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [31]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [28])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[27].iobf0  (
    .I(\hostIF/regout0_q [27]),
    .T(\hostIF/regvalid_q [27]),
    .O(\hostIF/iobf0_o [27]),
    .IO(okUHU[27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[27].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [27]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [32])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[27].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[27].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [30]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [27])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[26].iobf0  (
    .I(\hostIF/regout0_q [26]),
    .T(\hostIF/regvalid_q [26]),
    .O(\hostIF/iobf0_o [26]),
    .IO(okUHU[26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[26].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [26]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [31])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[26].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[26].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [29]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [26])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[25].iobf0  (
    .I(\hostIF/regout0_q [25]),
    .T(\hostIF/regvalid_q [25]),
    .O(\hostIF/iobf0_o [25]),
    .IO(okUHU[25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[25].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [25]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [30])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[25].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[25].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [28]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [25])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[24].iobf0  (
    .I(\hostIF/regout0_q [24]),
    .T(\hostIF/regvalid_q [24]),
    .O(\hostIF/iobf0_o [24]),
    .IO(okUHU[24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[24].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [24]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [29])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[24].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[24].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [27]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [24])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[23].iobf0  (
    .I(\hostIF/regout0_q [23]),
    .T(\hostIF/regvalid_q [23]),
    .O(\hostIF/iobf0_o [23]),
    .IO(okUHU[23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[23].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [23]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [28])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[23].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[23].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [26]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [23])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[22].iobf0  (
    .I(\hostIF/regout0_q [22]),
    .T(\hostIF/regvalid_q [22]),
    .O(\hostIF/iobf0_o [22]),
    .IO(okUHU[22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[22].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [22]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [27])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[22].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[22].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [25]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [22])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[21].iobf0  (
    .I(\hostIF/regout0_q [21]),
    .T(\hostIF/regvalid_q [21]),
    .O(\hostIF/iobf0_o [21]),
    .IO(okUHU[21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[21].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [21]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [26])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[21].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[21].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [24]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [21])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[20].iobf0  (
    .I(\hostIF/regout0_q [20]),
    .T(\hostIF/regvalid_q [20]),
    .O(\hostIF/iobf0_o [20]),
    .IO(okUHU[20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[20].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [20]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [25])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[20].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[20].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [23]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [20])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[19].iobf0  (
    .I(\hostIF/regout0_q [19]),
    .T(\hostIF/regvalid_q [19]),
    .O(\hostIF/iobf0_o [19]),
    .IO(okUHU[19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[19].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [19]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [24])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[19].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[19].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [22]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [19])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[18].iobf0  (
    .I(\hostIF/regout0_q [18]),
    .T(\hostIF/regvalid_q [18]),
    .O(\hostIF/iobf0_o [18]),
    .IO(okUHU[18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[18].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [18]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [23])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[18].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[18].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [21]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [18])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[17].iobf0  (
    .I(\hostIF/regout0_q [17]),
    .T(\hostIF/regvalid_q [17]),
    .O(\hostIF/iobf0_o [17]),
    .IO(okUHU[17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[17].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [17]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [22])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[17].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[17].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [20]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [17])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[16].iobf0  (
    .I(\hostIF/regout0_q [16]),
    .T(\hostIF/regvalid_q [16]),
    .O(\hostIF/iobf0_o [16]),
    .IO(okUHU[16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[16].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [16]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [21])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[16].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[16].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [19]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [16])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[15].iobf0  (
    .I(\hostIF/regout0_q [15]),
    .T(\hostIF/regvalid_q [15]),
    .O(\hostIF/iobf0_o [15]),
    .IO(okUHU[15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[15].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [15]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [20])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[15].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[15].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [18]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [15])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[14].iobf0  (
    .I(\hostIF/regout0_q [14]),
    .T(\hostIF/regvalid_q [14]),
    .O(\hostIF/iobf0_o [14]),
    .IO(okUHU[14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[14].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [14]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [19])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[14].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[14].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [17]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [14])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[13].iobf0  (
    .I(\hostIF/regout0_q [13]),
    .T(\hostIF/regvalid_q [13]),
    .O(\hostIF/iobf0_o [13]),
    .IO(okUHU[13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[13].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [13]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [18])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[13].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[13].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [16]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [13])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[12].iobf0  (
    .I(\hostIF/regout0_q [12]),
    .T(\hostIF/regvalid_q [12]),
    .O(\hostIF/iobf0_o [12]),
    .IO(okUHU[12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[12].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [12]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [17])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[12].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[12].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [15]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [12])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[11].iobf0  (
    .I(\hostIF/regout0_q [11]),
    .T(\hostIF/regvalid_q [11]),
    .O(\hostIF/iobf0_o [11]),
    .IO(okUHU[11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[11].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [11]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [16])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[11].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[11].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [14]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [11])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[10].iobf0  (
    .I(\hostIF/regout0_q [10]),
    .T(\hostIF/regvalid_q [10]),
    .O(\hostIF/iobf0_o [10]),
    .IO(okUHU[10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[10].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [10]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [15])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[10].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[10].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [13]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [10])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[9].iobf0  (
    .I(\hostIF/regout0_q [9]),
    .T(\hostIF/regvalid_q [9]),
    .O(\hostIF/iobf0_o [9]),
    .IO(okUHU[9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[9].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [9]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [14])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[9].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[9].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [12]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [9])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[8].iobf0  (
    .I(\hostIF/regout0_q [8]),
    .T(\hostIF/regvalid_q [8]),
    .O(\hostIF/iobf0_o [8]),
    .IO(okUHU[8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[8].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [8]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [13])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[8].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[8].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [11]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [8])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[7].iobf0  (
    .I(\hostIF/regout0_q [7]),
    .T(\hostIF/regvalid_q [7]),
    .O(\hostIF/iobf0_o [7]),
    .IO(okUHU[7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[7].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [7]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [12])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[7].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[7].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [10]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [7])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[6].iobf0  (
    .I(\hostIF/regout0_q [6]),
    .T(\hostIF/regvalid_q [6]),
    .O(\hostIF/iobf0_o [6]),
    .IO(okUHU[6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[6].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [6]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [11])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[6].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[6].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [9]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [6])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[5].iobf0  (
    .I(\hostIF/regout0_q [5]),
    .T(\hostIF/regvalid_q [5]),
    .O(\hostIF/iobf0_o [5]),
    .IO(okUHU[5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[5].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [5]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [10])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[5].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[5].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [8]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [5])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[4].iobf0  (
    .I(\hostIF/regout0_q [4]),
    .T(\hostIF/regvalid_q [4]),
    .O(\hostIF/iobf0_o [4]),
    .IO(okUHU[4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[4].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [4]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [9])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[4].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[4].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [7]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [4])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[3].iobf0  (
    .I(\hostIF/regout0_q [3]),
    .T(\hostIF/regvalid_q [3]),
    .O(\hostIF/iobf0_o [3]),
    .IO(okUHU[3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[3].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [3]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [8])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[3].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[3].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [6]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [3])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[2].iobf0  (
    .I(\hostIF/regout0_q [2]),
    .T(\hostIF/regvalid_q [2]),
    .O(\hostIF/iobf0_o [2]),
    .IO(okUHU[2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[2].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [2]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[2].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[2].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [5]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [2])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[1].iobf0  (
    .I(\hostIF/regout0_q [1]),
    .T(\hostIF/regvalid_q [1]),
    .O(\hostIF/iobf0_o [1]),
    .IO(okUHU[1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[1].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [1]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[1].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[1].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [4]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [1])
  );
  IOBUF #(
    .CAPACITANCE ( "DONT_CARE" ),
    .IBUF_DELAY_VALUE ( "0" ),
    .IBUF_LOW_PWR ( "TRUE" ),
    .IFD_DELAY_VALUE ( "AUTO" ),
    .IOSTANDARD ( "DEFAULT" ),
    .SLEW ( "20" ),
    .DRIVE ( 12 ))
  \hostIF/iob_regs[0].iobf0  (
    .I(\hostIF/regout0_q [0]),
    .T(\hostIF/regvalid_q [0]),
    .O(\hostIF/iobf0_o [0]),
    .IO(okUHU[0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[0].regin0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/iobf0_o [0]),
    .R(wireout[0]),
    .Q(\hostIF/okHC [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[0].regvalid  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH[36]_INV_86_o ),
    .R(wireout[0]),
    .Q(\hostIF/regvalid_q [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \hostIF/iob_regs[0].regout0  (
    .C(okClk),
    .CE(wireExp[29]),
    .D(\hostIF/okCH [3]),
    .R(wireout[0]),
    .Q(\hostIF/regout0_q [0])
  );
  fifo_6to24   fifo_databuf (
    .rst(wireout[0]),
    .wr_clk(im_data_clk_IBUF_14),
    .rd_clk(okClk),
    .wr_en(im_data_val_IBUF_13),
    .rd_en(wireExp[29]),
    .full(NLW_fifo_databuf_full_UNCONNECTED),
    .empty(NLW_fifo_databuf_empty_UNCONNECTED),
    .almost_empty(NLW_fifo_databuf_almost_empty_UNCONNECTED),
    .valid(d_buf_valid),
    .din({im_data_5_IBUF_5, im_data_4_IBUF_6, im_data_3_IBUF_7, im_data_2_IBUF_8, im_data_1_IBUF_9, im_data_0_IBUF_10}),
    .dout({dout[23], dout[22], dout[21], dout[20], dout[19], dout[18], dout[17], dout[16], dout[15], dout[14], dout[13], dout[12], dout[11], dout[10]
, dout[9], dout[8], dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]})
  );
  okWireOut   wire24 (
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]}),
    .ep_addr({wireout[0], wireout[0], wireExp[29], wireout[0], wireout[0], wireExp[29], wireout[0], wireout[0]}),
    .ep_datain({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireExp[29], wireout[0], wireout[0]}),
    .okEH({okEHx[324], okEHx[323], okEHx[322], okEHx[321], okEHx[320], okEHx[319], okEHx[318], okEHx[317], okEHx[316], okEHx[315], okEHx[314], 
okEHx[313], okEHx[312], okEHx[311], okEHx[310], okEHx[309], okEHx[308], okEHx[307], okEHx[306], okEHx[305], okEHx[304], okEHx[303], okEHx[302], 
okEHx[301], okEHx[300], okEHx[299], okEHx[298], okEHx[297], okEHx[296], okEHx[295], okEHx[294], okEHx[293], okEHx[292], okEHx[291], okEHx[290], 
okEHx[289], okEHx[288], okEHx[287], okEHx[286], okEHx[285], okEHx[284], okEHx[283], okEHx[282], okEHx[281], okEHx[280], okEHx[279], okEHx[278], 
okEHx[277], okEHx[276], okEHx[275], okEHx[274], okEHx[273], okEHx[272], okEHx[271], okEHx[270], okEHx[269], okEHx[268], okEHx[267], okEHx[266], 
okEHx[265], okEHx[264], okEHx[263], okEHx[262], okEHx[261], okEHx[260]})
  );
  okWireOut   wire23 (
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]}),
    .ep_addr({wireout[0], wireout[0], wireExp[29], wireout[0], wireout[0], wireout[0], wireExp[29], wireExp[29]}),
    .ep_datain({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireExp[29], wireout[0], wireExp[29], wireExp[29], wireExp[29], wireExp[29]}),
    .okEH({okEHx[259], okEHx[258], okEHx[257], okEHx[256], okEHx[255], okEHx[254], okEHx[253], okEHx[252], okEHx[251], okEHx[250], okEHx[249], 
okEHx[248], okEHx[247], okEHx[246], okEHx[245], okEHx[244], okEHx[243], okEHx[242], okEHx[241], okEHx[240], okEHx[239], okEHx[238], okEHx[237], 
okEHx[236], okEHx[235], okEHx[234], okEHx[233], okEHx[232], okEHx[231], okEHx[230], okEHx[229], okEHx[228], okEHx[227], okEHx[226], okEHx[225], 
okEHx[224], okEHx[223], okEHx[222], okEHx[221], okEHx[220], okEHx[219], okEHx[218], okEHx[217], okEHx[216], okEHx[215], okEHx[214], okEHx[213], 
okEHx[212], okEHx[211], okEHx[210], okEHx[209], okEHx[208], okEHx[207], okEHx[206], okEHx[205], okEHx[204], okEHx[203], okEHx[202], okEHx[201], 
okEHx[200], okEHx[199], okEHx[198], okEHx[197], okEHx[196], okEHx[195]})
  );
  okWireOut   wire22 (
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]}),
    .ep_addr({wireout[0], wireout[0], wireExp[29], wireout[0], wireout[0], wireout[0], wireExp[29], wireout[0]}),
    .ep_datain({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireExp[29], wireExp[29], wireExp[29], wireExp[29]}),
    .okEH({okEHx[64], okEHx[63], okEHx[62], okEHx[61], okEHx[60], okEHx[59], okEHx[58], okEHx[57], okEHx[56], okEHx[55], okEHx[54], okEHx[53], 
okEHx[52], okEHx[51], okEHx[50], okEHx[49], okEHx[48], okEHx[47], okEHx[46], okEHx[45], okEHx[44], okEHx[43], okEHx[42], okEHx[41], okEHx[40], 
okEHx[39], okEHx[38], okEHx[37], okEHx[36], okEHx[35], okEHx[34], okEHx[33], okEHx[32], okEHx[31], okEHx[30], okEHx[29], okEHx[28], okEHx[27], 
okEHx[26], okEHx[25], okEHx[24], okEHx[23], okEHx[22], okEHx[21], okEHx[20], okEHx[19], okEHx[18], okEHx[17], okEHx[16], okEHx[15], okEHx[14], 
okEHx[13], okEHx[12], okEHx[11], okEHx[10], okEHx[9], okEHx[8], okEHx[7], okEHx[6], okEHx[5], okEHx[4], okEHx[3], okEHx[2], okEHx[1], okEHx[0]})
  );
  okTriggerIn   trigIn53 (
    .ep_clk(CLKDV_BUFG_564),
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]}),
    .ep_addr({wireout[0], wireExp[29], wireout[0], wireExp[29], wireout[0], wireout[0], wireExp[29], wireExp[29]}),
    .ep_trigger({\NLW_trigIn53_ep_trigger<31>_UNCONNECTED , \NLW_trigIn53_ep_trigger<30>_UNCONNECTED , \NLW_trigIn53_ep_trigger<29>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<28>_UNCONNECTED , \NLW_trigIn53_ep_trigger<27>_UNCONNECTED , \NLW_trigIn53_ep_trigger<26>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<25>_UNCONNECTED , \NLW_trigIn53_ep_trigger<24>_UNCONNECTED , \NLW_trigIn53_ep_trigger<23>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<22>_UNCONNECTED , \NLW_trigIn53_ep_trigger<21>_UNCONNECTED , \NLW_trigIn53_ep_trigger<20>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<19>_UNCONNECTED , \NLW_trigIn53_ep_trigger<18>_UNCONNECTED , \NLW_trigIn53_ep_trigger<17>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<16>_UNCONNECTED , \NLW_trigIn53_ep_trigger<15>_UNCONNECTED , \NLW_trigIn53_ep_trigger<14>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<13>_UNCONNECTED , \NLW_trigIn53_ep_trigger<12>_UNCONNECTED , \NLW_trigIn53_ep_trigger<11>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<10>_UNCONNECTED , \NLW_trigIn53_ep_trigger<9>_UNCONNECTED , \NLW_trigIn53_ep_trigger<8>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<7>_UNCONNECTED , \NLW_trigIn53_ep_trigger<6>_UNCONNECTED , \NLW_trigIn53_ep_trigger<5>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<4>_UNCONNECTED , \NLW_trigIn53_ep_trigger<3>_UNCONNECTED , \NLW_trigIn53_ep_trigger<2>_UNCONNECTED , 
\NLW_trigIn53_ep_trigger<1>_UNCONNECTED , \NLW_trigIn53_ep_trigger<0>_UNCONNECTED })
  );
  okTriggerOut   trigOut6A (
    .ep_clk(sys_clk_BUFG_194),
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]}),
    .ep_addr({wireout[0], wireExp[29], wireExp[29], wireout[0], wireExp[29], wireout[0], wireExp[29], wireout[0]}),
    .ep_trigger({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], 
wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], FSMstop, full_2}),
    .okEH({okEHx[129], okEHx[128], okEHx[127], okEHx[126], okEHx[125], okEHx[124], okEHx[123], okEHx[122], okEHx[121], okEHx[120], okEHx[119], 
okEHx[118], okEHx[117], okEHx[116], okEHx[115], okEHx[114], okEHx[113], okEHx[112], okEHx[111], okEHx[110], okEHx[109], okEHx[108], okEHx[107], 
okEHx[106], okEHx[105], okEHx[104], okEHx[103], okEHx[102], okEHx[101], okEHx[100], okEHx[99], okEHx[98], okEHx[97], okEHx[96], okEHx[95], okEHx[94], 
okEHx[93], okEHx[92], okEHx[91], okEHx[90], okEHx[89], okEHx[88], okEHx[87], okEHx[86], okEHx[85], okEHx[84], okEHx[83], okEHx[82], okEHx[81], 
okEHx[80], okEHx[79], okEHx[78], okEHx[77], okEHx[76], okEHx[75], okEHx[74], okEHx[73], okEHx[72], okEHx[71], okEHx[70], okEHx[69], okEHx[68], 
okEHx[67], okEHx[66], okEHx[65]})
  );
  okPipeOut   pipeA0 (
    .ep_read(rd_en),
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]}),
    .ep_addr({wireExp[29], wireout[0], wireExp[29], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0]}),
    .ep_datain({wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], wireout[0], dout_buf[23], dout_buf[22], 
dout_buf[21], dout_buf[20], dout_buf[19], dout_buf[18], dout_buf[17], dout_buf[16], dout_buf[15], dout_buf[14], dout_buf[13], dout_buf[12], 
dout_buf[11], dout_buf[10], dout_buf[9], dout_buf[8], dout_buf[7], dout_buf[6], dout_buf[5], dout_buf[4], dout_buf[3], dout_buf[2], dout_buf[1], 
dout_buf[0]}),
    .okEH({okEHx[194], okEHx[193], okEHx[192], okEHx[191], okEHx[190], okEHx[189], okEHx[188], okEHx[187], okEHx[186], okEHx[185], okEHx[184], 
okEHx[183], okEHx[182], okEHx[181], okEHx[180], okEHx[179], okEHx[178], okEHx[177], okEHx[176], okEHx[175], okEHx[174], okEHx[173], okEHx[172], 
okEHx[171], okEHx[170], okEHx[169], okEHx[168], okEHx[167], okEHx[166], okEHx[165], okEHx[164], okEHx[163], okEHx[162], okEHx[161], okEHx[160], 
okEHx[159], okEHx[158], okEHx[157], okEHx[156], okEHx[155], okEHx[154], okEHx[153], okEHx[152], okEHx[151], okEHx[150], okEHx[149], okEHx[148], 
okEHx[147], okEHx[146], okEHx[145], okEHx[144], okEHx[143], okEHx[142], okEHx[141], okEHx[140], okEHx[139], okEHx[138], okEHx[137], okEHx[136], 
okEHx[135], okEHx[134], okEHx[133], okEHx[132], okEHx[131], okEHx[130]})
  );
  fifo_usbout   fifo256kB_out (
    .clk(okClk),
    .rst(wireout[0]),
    .wr_en(d_buf_valid),
    .rd_en(rd_en),
    .full(full_2),
    .empty(NLW_fifo256kB_out_empty_UNCONNECTED),
    .prog_full(FSMstop),
    .din({dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0], dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9]
, dout[8], dout[23], dout[22], dout[21], dout[20], dout[19], dout[18], dout[17], dout[16]}),
    .dout({dout_buf[23], dout_buf[22], dout_buf[21], dout_buf[20], dout_buf[19], dout_buf[18], dout_buf[17], dout_buf[16], dout_buf[15], dout_buf[14]
, dout_buf[13], dout_buf[12], dout_buf[11], dout_buf[10], dout_buf[9], dout_buf[8], dout_buf[7], dout_buf[6], dout_buf[5], dout_buf[4], dout_buf[3], 
dout_buf[2], dout_buf[1], dout_buf[0]})
  );
  fifo_patterns   FIFO_Patterns (
    .clk(CLK_HS_BUFG_565),
    .rst(RstPat),
    .wr_en(\pat_gen/FIFO_wr_210 ),
    .rd_en(\ROImager_inst/STREAM_203 ),
    .full(NLW_FIFO_Patterns_full_UNCONNECTED),
    .empty(NLW_FIFO_Patterns_empty_UNCONNECTED),
    .valid(NLW_FIFO_Patterns_valid_UNCONNECTED),
    .prog_full(NLW_FIFO_Patterns_prog_full_UNCONNECTED),
    .prog_empty(PatFIFO_empty),
    .din({\pat_gen/Pat_i[10] , \pat_gen/Pat_i[10] , \pat_gen/Pat_i[10] , \pat_gen/Pat_i[10] , \pat_gen/Pat_i[10] , \pat_gen/Pat_i[5] , 
\pat_gen/Pat_i[5] , \pat_gen/Pat_i[5] , \pat_gen/Pat_i[5] , \pat_gen/Pat_i[5] }),
    .dout({MSTREAM_10_OBUF_567, MSTREAM_9_OBUF_568, MSTREAM_8_OBUF_569, MSTREAM_7_OBUF_570, MSTREAM_6_OBUF_571, MSTREAM_5_OBUF_572, MSTREAM_4_OBUF_573
, MSTREAM_3_OBUF_574, MSTREAM_2_OBUF_575, MSTREAM_1_OBUF_576})
  );
  okCoreHarness   \hostIF/core0  (
    .okHC({\hostIF/okHC [38], \hostIF/okHC [37], \hostIF/okHC [36], \hostIF/okHC [35], \hostIF/okHC [34], \hostIF/okHC [33], \hostIF/okHC [32], 
\hostIF/okHC [31], \hostIF/okHC [30], \hostIF/okHC [29], \hostIF/okHC [28], \hostIF/okHC [27], \hostIF/okHC [26], \hostIF/okHC [25], \hostIF/okHC [24]
, \hostIF/okHC [23], \hostIF/okHC [22], \hostIF/okHC [21], \hostIF/okHC [20], \hostIF/okHC [19], \hostIF/okHC [18], \hostIF/okHC [17], 
\hostIF/okHC [16], \hostIF/okHC [15], \hostIF/okHC [14], \hostIF/okHC [13], \hostIF/okHC [12], \hostIF/okHC [11], \hostIF/okHC [10], \hostIF/okHC [9]
, \hostIF/okHC [8], \hostIF/okHC [7], \hostIF/okHC [6], \hostIF/okHC [5], \hostIF/okHC [4], \hostIF/okHC [3], \hostIF/okHC [2], \hostIF/okHC [1], 
okClk}),
    .okEH({okEH[64], okEH[63], okEH[62], okEH[61], okEH[60], okEH[59], okEH[58], okEH[57], okEH[56], okEH[55], okEH[54], okEH[53], okEH[52], okEH[51]
, okEH[50], okEH[49], okEH[48], okEH[47], okEH[46], okEH[45], okEH[44], okEH[43], okEH[42], okEH[41], okEH[40], okEH[39], okEH[38], okEH[37], okEH[36]
, okEH[35], okEH[34], okEH[33], okEH[32], okEH[31], okEH[30], okEH[29], okEH[28], okEH[27], okEH[26], okEH[25], okEH[24], okEH[23], okEH[22], okEH[21]
, okEH[20], okEH[19], okEH[18], okEH[17], okEH[16], okEH[15], okEH[14], okEH[13], okEH[12], okEH[11], okEH[10], okEH[9], okEH[8], okEH[7], okEH[6], 
okEH[5], okEH[4], okEH[3], okEH[2], okEH[1], okEH[0]}),
    .okCH({\hostIF/okCH [37], \hostIF/okCH [36], \hostIF/okCH [35], \hostIF/okCH [34], \hostIF/okCH [33], \hostIF/okCH [32], \hostIF/okCH [31], 
\hostIF/okCH [30], \hostIF/okCH [29], \hostIF/okCH [28], \hostIF/okCH [27], \hostIF/okCH [26], \hostIF/okCH [25], \hostIF/okCH [24], \hostIF/okCH [23]
, \hostIF/okCH [22], \hostIF/okCH [21], \hostIF/okCH [20], \hostIF/okCH [19], \hostIF/okCH [18], \hostIF/okCH [17], \hostIF/okCH [16], 
\hostIF/okCH [15], \hostIF/okCH [14], \hostIF/okCH [13], \hostIF/okCH [12], \hostIF/okCH [11], \hostIF/okCH [10], \hostIF/okCH [9], \hostIF/okCH [8], 
\hostIF/okCH [7], \hostIF/okCH [6], \hostIF/okCH [5], \hostIF/okCH [4], \hostIF/okCH [3], \hostIF/okCH [2], \hostIF/okCH [1], \hostIF/okCH [0]}),
    .okHE({okHE[112], okHE[111], okHE[110], okHE[109], okHE[108], okHE[107], okHE[106], okHE[105], okHE[104], okHE[103], okHE[102], okHE[101], 
okHE[100], okHE[99], okHE[98], okHE[97], okHE[96], okHE[95], okHE[94], okHE[93], okHE[92], okHE[91], okHE[90], okHE[89], okHE[88], okHE[87], okHE[86]
, okHE[85], okHE[84], okHE[83], okHE[82], okHE[81], okHE[80], okHE[79], okHE[78], okHE[77], okHE[76], okHE[75], okHE[74], okHE[73], okHE[72], okHE[71]
, okHE[70], okHE[69], okHE[68], okHE[67], okHE[66], okHE[65], okHE[64], okHE[63], okHE[62], okHE[61], okHE[60], okHE[59], okHE[58], okHE[57], okHE[56]
, okHE[55], okHE[54], okHE[53], okHE[52], okHE[51], okHE[50], okHE[49], okHE[48], okHE[47], okHE[46], okHE[45], okHE[44], okHE[43], okHE[42], okHE[41]
, okHE[40], okHE[39], okHE[38], okHE[37], okHE[36], okHE[35], okHE[34], okHE[33], okHE[32], okHE[31], okHE[30], okHE[29], okHE[28], okHE[27], okHE[26]
, okHE[25], okHE[24], okHE[23], okHE[22], okHE[21], okHE[20], okHE[19], okHE[18], okHE[17], okHE[16], okHE[15], okHE[14], okHE[13], okHE[12], okHE[11]
, okHE[10], okHE[9], okHE[8], okHE[7], okHE[6], okHE[5], okHE[4], okHE[3], okHE[2], okHE[1], okHE[0]})
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
