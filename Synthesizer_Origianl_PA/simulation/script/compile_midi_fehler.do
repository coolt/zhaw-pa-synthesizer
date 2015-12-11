# create work library
vlib work

# compile project files
#-------------------------------------

# textbased testbench
vcom -2002 -explicit -work work ../source/std_logic_textio.vhd
vcom -2008 -explicit -work work ../source/note_type_pkg.vhd

# Midi-Interface
vcom -2008 -explicit -work work ../source/edge_detector.vhd
vcom -2008 -explicit -work work ../source/bit_sampling_generator.vhd
vcom -2008 -explicit -work work ../source/read_midi.vhd
vcom -2008 -explicit -work work ../source/uart_top.vhd
vcom -2008 -explicit -work work ../source/midi_control.vhd
vcom -2008 -explicit -work work ../source/polyphone_out.vhd
vcom -2008 -explicit -work work ../source/midi_interface.vhd

vcom -2008 -explicit -work work ../source/tb_midi_interface.vhd


#-------------------------------------

# run simulation
vsim -novopt -t 1ns -lib work work.tb_midi_interface
do wave_fehler.do
# 1 note: 1.5 us. 
# 1 Linie: ca. 4 us
run 22 ms 

