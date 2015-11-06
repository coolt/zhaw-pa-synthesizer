onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_topleveluart/clk
add wave -noupdate /testbench_topleveluart/reset_n
add wave -noupdate /testbench_topleveluart/serial_in
add wave -noupdate /testbench_topleveluart/rx_data
add wave -noupdate /testbench_topleveluart/clk_halfp
add wave -noupdate /testbench_topleveluart/data_fullp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {54179142 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 263
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
WaveRestoreZoom {50575862 ns} {54143626 ns}
