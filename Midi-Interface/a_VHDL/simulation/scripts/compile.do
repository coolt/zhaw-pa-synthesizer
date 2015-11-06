# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../source/MIDI_Interface_top.vhd
vcom -2002 -explicit -work work ../../source/Testbench_MIDI_Interface_top.vhd
vcom -2002 -explicit -work work ../../source/IO/IO.vhd
vcom -2002 -explicit -work work ../../source/MIDI_Decoder/MIDI_Decoder.vhd
vcom -2002 -explicit -work work ../../source/Note_to_Parallel/Note_to_Parallel.vhd
vcom -2002 -explicit -work work ../../source/UART/Abtaster.vhd
vcom -2002 -explicit -work work ../../source/UART/Flanken_Det.vhd
vcom -2002 -explicit -work work ../../source/UART/Tick_Generator.vhd
vcom -2002 -explicit -work work ../../source/UART/UART_RX.vhd

# run the simulation
vsim -t 1ns -lib work work.tb_MIDIInterface
do ../scripts/wave.do
run 1000 ms

