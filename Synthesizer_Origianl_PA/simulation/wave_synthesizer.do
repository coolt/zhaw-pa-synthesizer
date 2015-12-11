onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label clk_50M -radix hexadecimal /tb_synthesizer/tb_clk_50M
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label infrastructure -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/INFRASTRUCTURE_BLOCK_INST/key_in
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label {infrastrucure: clk 12M5 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/INFRASTRUCTURE_BLOCK_INST/clk_12M
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label serial_in -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/serial_i
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {uart: data out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_uart_top/rx_data
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {midi control: note out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_midi_control/note_out_o
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {polyphony: note_0 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_0
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_1 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_1
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {polyphony: note_2 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_2
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_3 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_3
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_4 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_4
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_5 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_5
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {midi interface: note_out} -radix hexadecimal -childformat {{/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(0) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(1) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(2) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(3) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(4) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(5) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(6) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(7) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(8) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(9) -radix hexadecimal}} -expand -subitemconfig {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(0) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(1) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(2) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(3) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(4) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(5) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(6) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(7) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(8) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(9) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal}} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: NUM_notes} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/N_CUM_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: NUM_switch} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/N_CUM_taster
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: note on_out} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: note_on_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: NUM_switch} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/N_CUM_taster
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: NUM_notes} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/N_CUM_keyboard
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_2: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_2: NUM_notes} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/N_CUM_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_2: note_on out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_3: note_on out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_3: NUM_notes} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/N_CUM_keyboard
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_3: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_4: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_4: NUM_note} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/N_CUM_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_4: note on out} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_5: note on out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_5: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/notes_keyboard
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_5: NUM_note} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/N_CUM_keyboard
add wave -noupdate -color {Cadet Blue} -itemcolor {Cadet Blue} -label {fm_0: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_0/data_o
add wave -noupdate -color {Dark Slate Gray} -itemcolor {Dark Slate Gray} -label {fm_1: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_2/data_o
add wave -noupdate -color {Cadet Blue} -itemcolor {Cadet Blue} -label {fm_2: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_3/data_o
add wave -noupdate -color {Dark Slate Gray} -itemcolor {Dark Slate Gray} -label {fm_3: data out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_4/data_o
add wave -noupdate -color {Cadet Blue} -itemcolor {Cadet Blue} -label {fm_4: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_5/data_o
add wave -noupdate -color {Dark Slate Gray} -itemcolor {Dark Slate Gray} -label {fm_5: data out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_6/data_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 162
configure wave -valuecolwidth 48
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
WaveRestoreZoom {0 ns} {5775104 ns}
