if { [ catch { xload xmp D:/MBImager/MBImager_full/MB_SPI/MB_SPI.xmp } result ] } {
  exit 10
}
set gotbram [xget hasbram]
if { $gotbram == 1 } {
   #
   # Call the test bench generation
   if { [catch {run memgen -od D:/MBImager/MBImager_full D:/MBImager/MBImager_full/MB_SPI/MB_SPI.mhs} result ] } {
      puts "ERROR: xps 'run memgen' call failed"
      exit -1
   }
}
exit 0
