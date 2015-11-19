onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_midi_interface/tb_clk
add wave -noupdate /tb_midi_interface/tb_reset_n
add wave -noupdate /tb_midi_interface/i_midi_interface/i_uart_top/baude_tick
add wave -noupdate -color Magenta -itemcolor Magenta -label {byte in (serial)} /tb_midi_interface/tb_serial_in
add wave -noupdate -color Magenta -itemcolor Magenta -label {rx_data (8 bit)} -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/rx_data_i
add wave -noupdate -color Gold -itemcolor Orange -label rx_data_valid /tb_midi_interface/i_midi_interface/s_data_valid
add wave -noupdate -label state /tb_midi_interface/i_midi_interface/i_midi_control/state
add wave -noupdate -color Cyan -itemcolor Cyan -label en_register /tb_midi_interface/i_midi_interface/i_midi_control/enable_note_register
add wave -noupdate -color Cyan -itemcolor Cyan -label en_off/on /tb_midi_interface/i_midi_interface/i_midi_control/enable_note_off
add wave -noupdate -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o
add wave -noupdate -radix hexadecimal -childformat {{/tb_midi_interface/tb_note_1(8) -radix hexadecimal} {/tb_midi_interface/tb_note_1(7) -radix hexadecimal} {/tb_midi_interface/tb_note_1(6) -radix hexadecimal} {/tb_midi_interface/tb_note_1(5) -radix hexadecimal} {/tb_midi_interface/tb_note_1(4) -radix hexadecimal} {/tb_midi_interface/tb_note_1(3) -radix hexadecimal} {/tb_midi_interface/tb_note_1(2) -radix hexadecimal} {/tb_midi_interface/tb_note_1(1) -radix hexadecimal} {/tb_midi_interface/tb_note_1(0) -radix hexadecimal}} -subitemconfig {/tb_midi_interface/tb_note_1(8) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(7) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(6) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(5) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(4) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(3) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(2) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(1) {-height 17 -radix hexadecimal} /tb_midi_interface/tb_note_1(0) {-height 17 -radix hexadecimal}} /tb_midi_interface/tb_note_1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5326306 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 184
configure wave -valuecolwidth 151
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {3644880 ns}
