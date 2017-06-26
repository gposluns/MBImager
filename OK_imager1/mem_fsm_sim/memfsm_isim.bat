call D:\ISE\14.7\ISE_DS\settings64.bat

fuse -intstyle ise ^
	 -L secureip ^
     -lib unisims_ver ^
     -lib unimacro_ver ^
     -lib xilinxcorelib_ver ^
     -i ./oksim ^
     -o memfsm_isim.exe ^
     -prj memfsm_isim.prj ^
     work.memfsm_tf work.glbl
memfsm_isim.exe -gui -tclbatch memfsm_isim.tcl -wdb memfsm_isim.wdb