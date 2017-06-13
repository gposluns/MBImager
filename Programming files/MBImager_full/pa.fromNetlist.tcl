
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name MBImager_full -dir "C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/planAhead_run_1" -part xc6slx25tfgg484-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full} {ipcore_dir} }
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Users/MBImager/Documents/MBImager_ams/ISE_projects/MotherBoard/MBImager_full/MB_SPI_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/fifo_4kB.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Microblaze_System_top.ucf" [current_fileset -constrset]
add_files [list {Microblaze_System_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
