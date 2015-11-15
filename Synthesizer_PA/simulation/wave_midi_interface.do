onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_midi_interface/tb_clk
add wave -noupdate /tb_midi_interface/tb_reset_n
add wave -noupdate /tb_midi_interface/tb_serial_in
add wave -noupdate /tb_midi_interface/tb_note_1
add wave -noupdate /tb_midi_interface/i_midi_interface/i_uart_top/baude_tick
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {1199999050 ps} {1200000050 ps}
