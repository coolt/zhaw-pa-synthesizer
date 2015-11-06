onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_midiinterface/t_clk
add wave -noupdate /tb_midiinterface/dut/sig_clk_12_5_MHZ
add wave -noupdate /tb_midiinterface/t_button_n
add wave -noupdate /tb_midiinterface/t_serial_in
add wave -noupdate /tb_midiinterface/t_parallelNote
add wave -noupdate /tb_midiinterface/t_testParallelNote
add wave -noupdate /tb_midiinterface/dut/reset_n
add wave -noupdate /tb_midiinterface/dut/sig_serial_in_sync
add wave -noupdate /tb_midiinterface/dut/sig_rx_data
add wave -noupdate /tb_midiinterface/dut/sig_rx_data_valid
add wave -noupdate /tb_midiinterface/dut/sig_noteOnOff
add wave -noupdate /tb_midiinterface/dut/sig_note
add wave -noupdate /tb_midiinterface/dut/sig_noteEn
add wave -noupdate /tb_midiinterface/t_serial_data
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/note
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/state
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/v_geg
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/cmd_geg
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/ch_geg
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/noteEN_geg
add wave -noupdate /tb_midiinterface/dut/i_MIDIDecoder/noteOnOff_geg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {477867 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
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
WaveRestoreZoom {0 ns} {716800 ns}
