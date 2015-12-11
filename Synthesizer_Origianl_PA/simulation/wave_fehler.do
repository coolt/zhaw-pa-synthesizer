onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label {byte in (serial)} /tb_midi_interface/tb_serial_in
add wave -noupdate -color {Spring Green} -itemcolor {Dark Orchid} -label {rx_data (8 bit)} -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/rx_data_i
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label rx_data_valid /tb_midi_interface/i_midi_interface/s_data_valid
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label state /tb_midi_interface/i_midi_interface/i_midi_control/state
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label enable_note_register /tb_midi_interface/i_midi_interface/i_midi_control/enable_note_register
add wave -noupdate -color {Lime Green} -label note -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note
add wave -noupdate -color {Medium Spring Green} -itemcolor {Dark Orchid} -label note_on /tb_midi_interface/i_midi_interface/i_midi_control/s_note_on
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label note_valid /tb_midi_interface/i_midi_interface/i_midi_control/s_note_valid
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label {note & on_off } -radix hexadecimal -childformat {{/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(8) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(7) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(6) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(5) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(4) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(3) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(2) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(1) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(0) -radix hexadecimal}} -subitemconfig {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(8) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(7) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(6) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(5) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(4) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(3) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(2) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(1) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(0) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal}} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
WaveRestoreCursors {{Cursor 1} {15601291 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
configure wave -valuecolwidth 40
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
WaveRestoreZoom {16306610 ns} {21375643 ns}
