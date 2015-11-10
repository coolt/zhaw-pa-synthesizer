# create work library
vlib work

# compile project files
#-------------------------------------


# textbased testbench
vcom -2002 -explicit -work work ../source/std_logic_textio.vhd


# Midi-UART
vcom -2002 -explicit -work work ../source/edge_detector.vhd
vcom -2002 -explicit -work work ../source/bit_sampling_generator.vhd
vcom -2002 -explicit -work work ../source/read_midi.vhd
vcom -2002 -explicit -work work ../source/uart_top.vhd

# testbench
vcom -2002 -explicit -work work ../source/tb_midi_uart.vhd


#-------------------------------------

# run simulation
vsim -t 1ps -lib work work.tb_midi_uart
do wave_uart.do
run 1.2 ms 

