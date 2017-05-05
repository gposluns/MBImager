onerror {resume}

divider add "Toplevel"
wave add /tf/sys_clkp
wave add /tf/dut/okClk

divider add "Pipe Data"
wave add -radix hex /tf/pipeIn
wave add -radix hex /tf/pipeOut
wave add -radix hex /tf/pipetmp

divider add "Wire/Trigger Data"
wave add -radix hex /tf/WireIns
wave add -radix hex /tf/WireOuts
wave add -radix hex /tf/Triggered

run 250us;
