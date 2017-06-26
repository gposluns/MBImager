proc pngeninsttemplate {} {
  cd D:/MBImager/MBImager_full/MB_SPI
  if { [ catch { xload xmp MB_SPI.xmp } result ] } {
    exit 10
  }
  if { [catch {run mhs2hdl} result] } {
    return -1
  }
  return 0
}
if { [catch {pngeninsttemplate} result] } {
  exit -1
}
exit $result
