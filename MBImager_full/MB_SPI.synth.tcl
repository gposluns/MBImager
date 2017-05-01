proc pnsynth {} {
  cd C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI
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
