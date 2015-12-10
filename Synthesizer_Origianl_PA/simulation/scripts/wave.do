onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_p2s/dut/clk
add wave -noupdate /testbench_p2s/dut/reset_n
add wave -noupdate /testbench_p2s/dut/BCLK
add wave -noupdate /testbench_p2s/dut/DAC_load
add wave -noupdate /testbench_p2s/dut/WS_dly
add wave -noupdate /testbench_p2s/dut/DACDAT_pl_i
add wave -noupdate /testbench_p2s/dut/DACDAT_pr_i
add wave -noupdate /testbench_p2s/dut/DACDAT_s_o
add wave -noupdate /testbench_p2s/dut/l_zustand
add wave -noupdate /testbench_p2s/dut/l_folgezustand
add wave -noupdate /testbench_p2s/dut/r_zustand
add wave -noupdate /testbench_p2s/dut/r_folgezustand
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {177 ns} 0}
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
WaveRestoreZoom {0 ns} {636 ns}
