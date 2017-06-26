cd D:/MBImager/MBImager_full/MB_SPI
if { [ catch { xload xmp MB_SPI.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
