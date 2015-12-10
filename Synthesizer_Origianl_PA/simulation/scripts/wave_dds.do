onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /testbench_dds/t_clk_12M
add wave -noupdate /testbench_dds/t_bclk
add wave -noupdate -radix decimal /testbench_dds/t_reset_n
add wave -noupdate -radix decimal /testbench_dds/t_strobe_i
add wave -noupdate -radix decimal /testbench_dds/t_tone_on_i
add wave -noupdate -radix decimal /testbench_dds/t_phi_incr_i
add wave -noupdate /testbench_dds/t_dacdat_g_o
add wave -noupdate /testbench_dds/dut1/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 228
configure wave -valuecolwidth 155
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
WaveRestoreZoom {169 ns} {1044 ns}
