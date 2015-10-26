onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_i2s_master/t_clk_12M
add wave -noupdate /testbench_i2s_master/t_i2s_reset_n
add wave -noupdate /testbench_i2s_master/t_INIT_N_i
add wave -noupdate /testbench_i2s_master/t_ADCDAT_s
add wave -noupdate /testbench_i2s_master/t_DACDAT_pl
add wave -noupdate /testbench_i2s_master/t_BCLK
add wave -noupdate /testbench_i2s_master/t_DACDAT_pr
add wave -noupdate /testbench_i2s_master/t_DACDAT_s
add wave -noupdate /testbench_i2s_master/t_datalinks
add wave -noupdate /testbench_i2s_master/t_datarechts
add wave -noupdate /testbench_i2s_master/t_WS
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/clk
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/reset_n
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/init_n
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/WS
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/WS_dly
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/strobe
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/BCLK
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/DAC_load
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/ADCL_shift
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/ADCR_shift
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/s_WS
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/folge_zustand
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/zustand
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/reg_idx
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/next_reg_idx
add wave -noupdate /testbench_i2s_master/dut1/FSM_BCLK_COUNT_INST/s_bclk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 254
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {210 ns} {832 ns}
