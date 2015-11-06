# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../Note_to_Parallel.vhd
vcom -2002 -explicit -work work ../../Testbench_Note_to_Parallel.vhd

# run the simulation
vsim -t 1ns -lib work work.tb_NoteToParallel
do ../scripts/wave.do
run 100 ms

