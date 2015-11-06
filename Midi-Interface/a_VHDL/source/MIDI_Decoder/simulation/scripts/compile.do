# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../MIDI_Decoder.vhd
vcom -2002 -explicit -work work ../../Testbench_MIDI_Decoder.vhd

# run the simulation
vsim -t 1ns -lib work work.tb_MIDIDecoder
do ../scripts/wave.do
run 100 ms

