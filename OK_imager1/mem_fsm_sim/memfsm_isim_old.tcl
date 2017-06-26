onerror {resume}

divider add "Simulation"
wave add -radix hex pipeIn
wave add -radix hex calib_done
wave add -radix hex /memfsm_tf/uut/mem_controller/read_done


divider add "uut/cam_fifo"
wave add -radix hex /memfsm_tf/uut/RstPat
wave add -radix hex /memfsm_tf/uut/CLK_HS
wave add -radix hex /memfsm_tf/uut/PatFIFO_wr
wave add -radix hex /memfsm_tf/uut/Pat_to_FIFO	
wave add -radix hex /memfsm_tf/uut/STREAM	
wave add -radix hex /memfsm_tf/uut/MSTREAM	
wave add -radix hex /memfsm_tf/uut/PatFIFO_empty
wave add -radix hex /memfsm_tf/uut/prog_full
wave add -radix hex /memfsm_tf/uut/empty_pat	
wave add -radix hex /memfsm_tf/uut/full_pat


divider add "uut/ro_imager"
wave add -radix hex /memfsm_tf/uut/ROImager_inst/RESET
wave add -radix hex /memfsm_tf/uut/ROImager_inst/state
wave add -radix hex /memfsm_tf/uut/ROImager_inst/fsm_stat_i
wave add -radix hex /memfsm_tf/uut/ROImager_inst/count_subsc
wave add -radix hex /memfsm_tf/uut/ROImager_inst/count_mpre


divider add "uut/pattern gen"
wave add -radix hex /memfsm_tf/uut/pat_gen/

run 1ms;