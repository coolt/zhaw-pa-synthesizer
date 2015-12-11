onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_s2p/t_clk
add wave -noupdate /testbench_s2p/t_reset_n
add wave -noupdate /testbench_s2p/t_BCLK
add wave -noupdate /testbench_s2p/t_ADCDAT_s_i
add wave -noupdate /testbench_s2p/t_ADCDAT_pl_o
add wave -noupdate /testbench_s2p/t_ADCDAT_pr_o
add wave -noupdate /testbench_s2p/t_ADCL_shift
add wave -noupdate /testbench_s2p/t_ADCR_shift
add wave -noupdate /testbench_s2p/BCLK_test
add wave -noupdate /testbench_s2p/clk_test
add wave -noupdate /testbench_s2p/dut1/l_zustand
add wave -noupdate /testbench_s2p/dut1/l_folgezustand
add wave -noupdate /testbench_s2p/dut1/r_zustand
add wave -noupdate /testbench_s2p/dut1/r_folgezustand
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {481 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 204
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
WaveRestoreZoom {0 ns} {1272 ns}
