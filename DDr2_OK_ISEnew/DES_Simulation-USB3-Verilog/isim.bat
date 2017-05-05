REM DES Simulation Batch File
REM $Rev: 2 $ $Date: 2014-05-02 08:39:50 -0700 (Fri, 02 May 2014) $

REM Edit path for settings32/64, depending on architecture
call %XILINX%\..\settings64.bat

fuse -intstyle ise ^
     -incremental ^
     -lib unisims_ver ^
     -lib unimacro_ver ^
     -lib xilinxcorelib_ver ^
     -i ./oksim ^
     -o isim.exe ^
     -prj isim.prj ^
     work.tf work.glbl
isim.exe -gui -tclbatch isim.tcl -wdb des_isim.wdb