# create work library
vlib work

# compile project files
#-------------------------------------

# textbased testbench
vcom -2002 -explicit -work work ../source/std_logic_textio.vhd


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
vsim -t 1ps -lib work work.tb_midi_interface
do wave_midi_interface.do
run 1.2 ms 

