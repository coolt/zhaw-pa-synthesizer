# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../source/S2P.vhd
vcom -2002 -explicit -work work ../../source/testbench_S2P.vhd

# run the simulation
vsim -t 1ns -lib work work.testbench_S2P
do ../scripts/wave_s2p.do
run 500.0 ns 

