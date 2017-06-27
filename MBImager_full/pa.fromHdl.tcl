
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name MBImager_full -dir "C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/planAhead_run_1" -part xc6slx25tfgg484-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Microblaze_System_top.ucf" [current_fileset -constrset]
add_files [list {ipcore_dir/fifo_4kB.ngc}]
set hdlfile [add_files [list {TI_ADC_RO.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ROImager.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MB_SPI/MB_SPI_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ipcore_dir/fifo_4kB.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Imager_SPI.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {MB_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top MB_top $srcset
add_files [list {Microblaze_System_top.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/MB_SPI.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/MB_SPI_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/MB_SPI_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/MB_SPI_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/MB_SPI_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/MBImager_full/MB_SPI_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_4kB.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx25tfgg484-3
