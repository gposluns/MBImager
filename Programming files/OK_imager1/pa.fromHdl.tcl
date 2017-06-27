
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name OK_imager1 -dir "C:/Users/MBImager/Documents/OpalKelly/Navid/ISEproj/OK_imager1/planAhead_run_1" -part xc6slx45fgg484-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "OK_imager1.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/fifo_128kB.ngc}]
set hdlfile [add_files [list {okLibrary.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/fifo_128kB.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {OK_imager1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top OK_imager $srcset
add_files [list {OK_imager1.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_128kB.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx45fgg484-2
