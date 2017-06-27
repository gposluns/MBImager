
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name OK_imager1 -dir "C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/OK_imager1/planAhead_run_4" -part xc6slx45fgg484-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/OK_imager1/OK_imager.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/MBImager/Documents/MBImager_ams/repo/MBImager/OK_imager1} {ipcore_dir} }
add_files [list {ipcore_dir/fifo_128kB.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_24to6_testData.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_6to24.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_8to32.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_patterns.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_usbout.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "OK_imager1.ucf" [current_fileset -constrset]
add_files [list {OK_imager1.ucf}] -fileset [get_property constrset [current_run]]
link_design
