proc exportToSDK {} {
  cd D:/MBImager/MBImager_full/MB_SPI
  if { [ catch { xload xmp MB_SPI.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

set sExportDir [ xget sdk_export_dir ]
set sExportDir [ file join "D:/MBImager/MBImager_full/MB_SPI" "$sExportDir" "hw" ] 
if { [ file exists D:/MBImager/MBImager_full/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file D:/MBImager/MBImager_full/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "D:/MBImager/MBImager_full/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists D:/MBImager/MBImager_full/MB_top.bit ] } {
   puts "Copying bit file D:/MBImager/MBImager_full/MB_top.bit to $sExportDir" 
   file copy -force "D:/MBImager/MBImager_full/MB_top.bit" $sExportDir
}
exit $result
