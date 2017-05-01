#  Simulation Model Generator
#  Xilinx EDK 14.7 EDK_P.20131013
#  Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
#
#  File     top_level_ports_wave.tcl (Tue Dec 06 14:47:35 2016)
#
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "MB_SPI_tb${ps}dut" }

wave add $tbpath${ps}EXT_RESET_N -into $id 
wave add $tbpath${ps}USER_CLOCK -into $id 
wave add $tbpath${ps}SPI_FLASH_SS -into $id 
wave add $tbpath${ps}SPI_FLASH_MOSI -into $id 
wave add $tbpath${ps}SPI_FLASH_SCLK -into $id 
wave add $tbpath${ps}SPI_FLASH_MISO -into $id 

