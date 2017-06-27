proc exportToSDK {} {
  cd C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI
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
set sExportDir [ file join "C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI" "$sExportDir" "hw" ] 
if { [ file exists C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_top.bit ] } {
   puts "Copying bit file C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_top.bit to $sExportDir" 
   file copy -force "C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_top.bit" $sExportDir
}
exit $result
