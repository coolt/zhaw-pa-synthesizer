onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label system_clk /tb_midi_interface/tb_clk
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label reset_n /tb_midi_interface/tb_reset_n
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label baud_tick /tb_midi_interface/i_midi_interface/i_uart_top/baude_tick
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label {byte in (serial)} /tb_midi_interface/tb_serial_in
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label {rx_data (8 bit)} -radix hexadecimal /tb_midi_interface/i_midi_interface/i_midi_control/rx_data_i
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label rx_data_valid /tb_midi_interface/i_midi_interface/s_data_valid
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label state /tb_midi_interface/i_midi_interface/i_midi_control/state
<<<<<<< HEAD
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label s_note_on /tb_midi_interface/i_midi_interface/i_midi_control/s_note_on
=======
add wave -noupdate -color {Medium Spring Green} -itemcolor {Dark Orchid} -label s_note_on /tb_midi_interface/i_midi_interface/i_midi_control/s_note_on
>>>>>>> branch_is_working
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label current_note -radix hexadecimal -childformat {{/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(7) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(6) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(5) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(4) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(3) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(2) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(1) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(0) -radix hexadecimal}} -subitemconfig {/tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(7) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(6) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(5) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(4) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(3) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(2) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(1) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note(0) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal}} /tb_midi_interface/i_midi_interface/i_midi_control/s_current_note
add wave -noupdate -color {Dark Orchid} -itemcolor {Dark Orchid} -label vector_o -radix hexadecimal -childformat {{/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(8) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(7) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(6) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(5) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(4) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(3) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(2) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(1) -radix hexadecimal} {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(0) -radix hexadecimal}} -subitemconfig {/tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(8) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(7) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(6) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(5) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(4) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(3) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(2) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(1) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o(0) {-color {Dark Orchid} -height 17 -itemcolor {Dark Orchid} -radix hexadecimal}} /tb_midi_interface/i_midi_interface/i_midi_control/note_out_o
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label note_valid_i /tb_midi_interface/i_midi_interface/i_polyphone_out/note_valid_i
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label note_i -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/note_value_i
<<<<<<< HEAD
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label next_index -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_next_index
=======
>>>>>>> branch_is_working
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label index -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_next_index
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_0 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_0
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_1 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_1
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_2 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_2
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_3 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_3
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_4 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_4
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_5 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_5
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_6 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_6
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_7 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_7
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_8 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_8
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label s_note_9 -radix hexadecimal /tb_midi_interface/i_midi_interface/i_polyphone_out/s_note_9
<<<<<<< HEAD
add wave -noupdate -color {Cornflower Blue} -label tb_note_0 -radix hexadecimal /tb_midi_interface/tb_note_0
add wave -noupdate -color {Cornflower Blue} -label tb_note_1 -radix hexadecimal /tb_midi_interface/tb_note_1
add wave -noupdate -color {Cornflower Blue} -label tb_note_2 -radix hexadecimal /tb_midi_interface/tb_note_2
add wave -noupdate -color {Cornflower Blue} -label tb_note_3 -radix hexadecimal /tb_midi_interface/tb_note_3
add wave -noupdate -color {Cornflower Blue} -label tb_note_4 -radix hexadecimal /tb_midi_interface/tb_note_4
add wave -noupdate -color {Cornflower Blue} -label tb_note_5 -radix hexadecimal /tb_midi_interface/tb_note_5
add wave -noupdate -color {Cornflower Blue} -label tb_note_6 -radix hexadecimal /tb_midi_interface/tb_note_6
add wave -noupdate -color {Cornflower Blue} -label tb_note_7 -radix hexadecimal /tb_midi_interface/tb_note_7
add wave -noupdate -color {Cornflower Blue} -label tb_note_8 -radix hexadecimal /tb_midi_interface/tb_note_8
add wave -noupdate -color {Cornflower Blue} -label tb_note_9 -radix hexadecimal /tb_midi_interface/tb_note_9
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 137
=======
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13541335 ns} 0} {{Cursor 2} {8433366 ns} 0}
quietly wave cursor active 2
configure wave -namecolwidth 154
>>>>>>> branch_is_working
configure wave -valuecolwidth 44
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
<<<<<<< HEAD
WaveRestoreZoom {1974472 ns} {23053976 ns}
=======
WaveRestoreZoom {9919896 ns} {21879480 ns}
>>>>>>> branch_is_working
