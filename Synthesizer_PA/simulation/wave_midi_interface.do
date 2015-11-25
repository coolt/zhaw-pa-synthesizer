onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label system_clk /tb_midi_interface/tb_clk
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label reset_n /tb_midi_interface/tb_reset_n
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label baud_tick /tb_midi_interface/i_midi_interface/i_uart_top/baude_tick
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label {byte in (serial)} /tb_midi_interface/tb_serial_in
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label {rx_data (8 bit)} -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/rx_data_i
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label rx_data_valid /tb_midi_interface/i_midi_interface/s_data_valid
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label state /tb_midi_interface/i_midi_interface/i_midi_control/state
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label en_note_register /tb_midi_interface/i_midi_interface/i_midi_control/enable_note_register
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label s_note_valid /tb_midi_interface/i_midi_interface/i_midi_control/s_note_valid
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label note_ON /tb_midi_interface/i_midi_interface/i_midi_control/enable_note_on
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label s_next_note -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/s_next_note
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label vector_o -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o
add wave -noupdate -color Green -itemcolor Green -label state_polyphonie /tb_midi_interface/i_midi_interface/i_polyphone_out/state
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label note_valid_i /tb_midi_interface/i_midi_interface/i_polyphone_out/note_valid_i
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label current_noteVector -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_current_noteVector
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label s_current_note -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_current_note
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label s_current_on /tb_midi_interface/i_midi_interface/i_polyphone_out/s_current_on
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label temp_on /tb_midi_interface/i_midi_interface/i_polyphone_out/s_temp_on
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label temp_note_vector -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_temp_noteVector
add wave -noupdate -color {Lime Green} -itemcolor {Lime Green} -label temp_note -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_temp_note
add wave -noupdate -color Coral -itemcolor Coral -label inex -radix unsigned /tb_midi_interface/i_midi_interface/i_polyphone_out/s_index
add wave -noupdate -color Gold -itemcolor Gold -label {note1 out} -radix hexadecimal -childformat {{/tb_midi_interface/tb_note_1(8) -radix hexadecimal} {/tb_midi_interface/tb_note_1(7) -radix hexadecimal} {/tb_midi_interface/tb_note_1(6) -radix hexadecimal} {/tb_midi_interface/tb_note_1(5) -radix hexadecimal} {/tb_midi_interface/tb_note_1(4) -radix hexadecimal} {/tb_midi_interface/tb_note_1(3) -radix hexadecimal} {/tb_midi_interface/tb_note_1(2) -radix hexadecimal} {/tb_midi_interface/tb_note_1(1) -radix hexadecimal} {/tb_midi_interface/tb_note_1(0) -radix hexadecimal}} -subitemconfig {/tb_midi_interface/tb_note_1(8) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(7) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(6) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(5) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(4) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(3) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(2) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(1) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal} /tb_midi_interface/tb_note_1(0) {-color Gold -height 18 -itemcolor Gold -radix hexadecimal}} /tb_midi_interface/tb_note_1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1281210 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 164
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
WaveRestoreZoom {0 ns} {18235169 ns}
