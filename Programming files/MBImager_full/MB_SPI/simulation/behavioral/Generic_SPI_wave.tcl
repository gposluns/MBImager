#  Simulation Model Generator
#  Xilinx EDK 14.7 EDK_P.20131013
#  Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
#
#  File     Generic_SPI_wave.tcl (Tue Dec 06 14:47:35 2016)
#
#  Module   MB_SPI_generic_spi_wrapper
#  Instance Generic_SPI
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "MB_SPI_tb${ps}dut" }

# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_ACLK -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_ARESETN -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_AWADDR -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_AWVALID -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_AWREADY -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_WDATA -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_WSTRB -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_WVALID -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_WREADY -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_BRESP -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_BVALID -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_BREADY -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_ARADDR -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_ARVALID -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_ARREADY -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_RDATA -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_RRESP -into $id
  wave add $tbpath${ps}Generic_SPI${ps}S_AXI_RVALID -into $id
# wave add $tbpath${ps}Generic_SPI${ps}S_AXI_RREADY -into $id
  wave add $tbpath${ps}Generic_SPI${ps}SCK_I -into $id
  wave add $tbpath${ps}Generic_SPI${ps}SCK_O -into $id
# wave add $tbpath${ps}Generic_SPI${ps}SCK_T -into $id
  wave add $tbpath${ps}Generic_SPI${ps}MISO_I -into $id
# wave add $tbpath${ps}Generic_SPI${ps}MISO_O -into $id
# wave add $tbpath${ps}Generic_SPI${ps}MISO_T -into $id
  wave add $tbpath${ps}Generic_SPI${ps}MOSI_I -into $id
  wave add $tbpath${ps}Generic_SPI${ps}MOSI_O -into $id
# wave add $tbpath${ps}Generic_SPI${ps}MOSI_T -into $id
  wave add $tbpath${ps}Generic_SPI${ps}SPISEL -into $id
  wave add $tbpath${ps}Generic_SPI${ps}SS_I -into $id
  wave add $tbpath${ps}Generic_SPI${ps}SS_O -into $id
# wave add $tbpath${ps}Generic_SPI${ps}SS_T -into $id
# wave add $tbpath${ps}Generic_SPI${ps}IP2INTC_Irpt -into $id

