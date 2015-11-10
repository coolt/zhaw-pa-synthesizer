onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_einfach_schaltung/t_clock
add wave -noupdate /testbench_einfach_schaltung/t_reset_n
add wave -noupdate /testbench_einfach_schaltung/t_value_i
add wave -noupdate /testbench_einfach_schaltung/t_trigger_o
add wave -noupdate /testbench_einfach_schaltung/t_enable_i
add wave -noupdate /testbench_einfach_schaltung/t_count_dbg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16315 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 393
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
WaveRestoreZoom {0 ns} {22575 ns}
