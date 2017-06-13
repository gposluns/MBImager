cd C:/Users/MBImager/Documents/Navid_ISE/MBImager_full/MB_SPI/
if { [ catch { xload xmp MB_SPI.xmp } result ] } {
  exit 10
}
xset hdl verilog
run stubgen
exit 0
