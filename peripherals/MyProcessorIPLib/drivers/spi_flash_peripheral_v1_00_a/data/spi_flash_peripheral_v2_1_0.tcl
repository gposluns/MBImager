##############################################################################
## Filename:          C:\Users\MBImager\Documents\MBImager_ams\repo\MBImager\peripherals\MyProcessorIPLib/drivers/spi_flash_peripheral_v1_00_a/data/spi_flash_peripheral_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Tue May 09 14:44:11 2017 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "spi_flash_peripheral" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
