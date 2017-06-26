gui_open_window Wave
gui_sg_create CLK_DDR_group
gui_list_add_group -id Wave.1 {CLK_DDR_group}
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.test_phase}
gui_set_radix -radix {ascii} -signals {CLK_DDR_tb.test_phase}
gui_sg_addsignal -group CLK_DDR_group {{Input_clocks}} -divider
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.CLK_IN1}
gui_sg_addsignal -group CLK_DDR_group {{Output_clocks}} -divider
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.dut.clk}
gui_list_expand -id Wave.1 CLK_DDR_tb.dut.clk
gui_sg_addsignal -group CLK_DDR_group {{Status_control}} -divider
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.RESET}
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.LOCKED}
gui_sg_addsignal -group CLK_DDR_group {{Counters}} -divider
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.COUNT}
gui_sg_addsignal -group CLK_DDR_group {CLK_DDR_tb.dut.counter}
gui_list_expand -id Wave.1 CLK_DDR_tb.dut.counter
gui_zoom -window Wave.1 -full
