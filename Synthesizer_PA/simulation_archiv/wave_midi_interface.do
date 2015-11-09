onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_midi/s_serial_in
add wave -noupdate /tb_midi/s_clk
add wave -noupdate /tb_midi/s_reset_n
add wave -noupdate /tb_midi/s_rx_data
add wave -noupdate /tb_midi/s_rx_data_valid
add wave -noupdate /tb_midi/SYS_CLK_PERIOD
add wave -noupdate /tb_midi/SYS_CLK_HALFPERIOD
add wave -noupdate /tb_midi/MIDI_CLK_PERIOD
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
WaveRestoreZoom {582383 ps} {583383 ps}
