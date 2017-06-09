proc pnsynth {} {
  cd D:/Shichen_Lu/MBImager/MBImager/MBImager_full/MB_SPI
  if { [ catch { xload xmp MB_SPI.xmp } result ] } {
    exit 10
  }
  if { [catch {run netlist} result] } {
    return -1
  }
  return $result
}
if { [catch {pnsynth} result] } {
  exit -1
}
exit $result
