# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../source/reg_table_pkg.vhd
vcom -2002 -explicit -work work ../../source/P2S.vhd
vcom -2002 -explicit -work work ../../source/S2P.vhd
vcom -2002 -explicit -work work ../../source/FSM_BCLK_COUNT.vhd
vcom -2002 -explicit -work work ../../source/i2s_master.vhd
vcom -2002 -explicit -work work ../../source/testbench_i2s_master.vhd

# run the simulation
vsim -t 1ns -lib work work.testbench_i2s_master
do ../scripts/wave_i2s.do
run 300.0 ns 

