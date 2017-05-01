#  Simulation Model Generator
#  Xilinx EDK 14.7 EDK_P.20131013
#  Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
#
#  File     microblaze_0_bram_block_wave.tcl (Tue Dec 06 14:47:35 2016)
#
#  Module   MB_SPI_microblaze_0_bram_block_wrapper
#  Instance microblaze_0_bram_block
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "MB_SPI_tb${ps}dut" }

# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Rst_A -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Clk_A -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_EN_A -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_WEN_A -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Addr_A -into $id
  wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Din_A -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Dout_A -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Rst_B -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Clk_B -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_EN_B -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_WEN_B -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Addr_B -into $id
  wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Din_B -into $id
# wave add $tbpath${ps}microblaze_0_bram_block${ps}BRAM_Dout_B -into $id

