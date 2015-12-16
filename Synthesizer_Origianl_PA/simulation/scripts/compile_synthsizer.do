# create work library
vlib work
vlib altera_mf  


# compile project files
#-------------------------------------

# textbased testbench
vcom -2002 -explicit -work work ../source/std_logic_textio.vhd

# package and library
vcom -2008 -explicit -work work ../source/note_type_pkg.vhd
vcom -2008 -explicit -work work ../source/tone_gen_pkg.vhd
vcom -2008 -explicit -work work ../source/reg_table_pkg.vhd
vcom -2008 -explicit -work altera_mf  ./altera_mf_components.vhd
vcom -2008 -explicit -work altera_mf  ./altera_mf.vhd   



# infrastructure
vcom -2008 -explicit -work work ../source/pll.vhd
vcom -2008 -explicit -work work ../source/modulo_divider.vhd
vcom -2008 -explicit -work work ../source/sync_block.vhd
vcom -2008 -explicit -work work ../source/infrastructure_block.vhd

# midi interface
vcom -2008 -explicit -work work ../source/edge_detector.vhd
vcom -2008 -explicit -work work ../source/bit_sampling_generator.vhd
vcom -2008 -explicit -work work ../source/read_midi.vhd
vcom -2008 -explicit -work work ../source/uart_top.vhd
vcom -2008 -explicit -work work ../source/midi_control.vhd
vcom -2008 -explicit -work work ../source/polyphone_out.vhd
vcom -2008 -explicit -work work ../source/midi_interface.vhd

# music box
vcom -2008 -explicit -work work ../source/music_list.vhd
vcom -2008 -explicit -work work ../source/lied_fsm.vhd

# tone generator
vcom -2008 -explicit -work work ../source/tone_decoder.vhd
vcom -2008 -explicit -work work ../source/dds.vhd
vcom -2008 -explicit -work work ../source/fm_sel.vhd
vcom -2008 -explicit -work work ../source/fm_synth.vhd
vcom -2008 -explicit -work work ../source/adder.vhd
vcom -2008 -explicit -work work ../source/fm_coder_7segment.vhd

# audio control
vcom -2008 -explicit -work work ../source/FSM_BCLK_COUNT.vhd
vcom -2008 -explicit -work work ../source/S2P.vhd
vcom -2008 -explicit -work work ../source/P2S.vhd
vcom -2008 -explicit -work work ../source/codeccontroller.vhd
vcom -2008 -explicit -work work ../source/audio_control.vhd
vcom -2008 -explicit -work work ../source/i2s_master.vhd
vcom -2008 -explicit -work work ../source/i2c_master.vhd


vcom -2008 -explicit -work work ../source/top_level.vhd

vcom -2008 -explicit -work work ../source/tb_synthesizer.vhd


#-------------------------------------

# run simulation
vsim -novopt -t 1ns -lib work work.tb_synthesizer
do wave_synthesizer.do
# 1 note: 1.5 us. 
# 1 Linie: ca. 4 us
run 22 ms 

