# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../source/tone_gen_pkg.vhd
vcom -2002 -explicit -work work ../../source/dds.vhd
vcom -2002 -explicit -work work ../../source/testbench_dds.vhd

# run the simulation
vsim -t 1ns -lib work work.testbench_dds
do ../scripts/wave_dds.do
run 1000.0 ns 

