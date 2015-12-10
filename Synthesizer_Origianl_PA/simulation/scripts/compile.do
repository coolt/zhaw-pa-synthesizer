# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../source/P2S.vhd
vcom -2002 -explicit -work work ../../source/testbench_P2S.vhd

# run the simulation
vsim -t 1ns -lib work work.testbench_P2S
do ../scripts/wave.do
run 300.0 ns 

