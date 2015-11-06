# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../Abtaster.vhd
vcom -2002 -explicit -work work ../../Flanken_Det.vhd
vcom -2002 -explicit -work work ../../testbench_TopLevelUart.vhd
vcom -2002 -explicit -work work ../../Tick_Generator.vhd
vcom -2002 -explicit -work work ../../UART_RX.vhd

# run the simulation
vsim -t 1ns -lib work work.testbench_TopLevelUart
do ../scripts/wave.do
run 60 ms

