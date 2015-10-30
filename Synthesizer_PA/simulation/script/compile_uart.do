# create work library
vlib work

# compile project files
#-------------------------------------

# packedge
vcom -2002 -explicit -work work ../source/reg_table_pkg.vhd
vcom -2002 -explicit -work work ../source/tone_gen_pkg.vhd

# textbased testbench
vcom -2002 -explicit -work work ../source/std_logic_textio.vhd

# infrastructure
vcom -2002 -explicit -work work ../source/infrastructure_block.vhd
vcom -2002 -explicit -work work ../source/modulo_divider.vhd
# vcom -2002 -explicit -work work ../source/pll.vhd
vcom -2002 -explicit -work work ../source/sync_block.vhd

# Midi-Interface
vcom -2002 -explicit -work work ../source/Tick_Generator.vhd
vcom -2002 -explicit -work work ../source/Abtaster.vhd
vcom -2002 -explicit -work work ../source/Flanken_Det.vhd
vcom -2002 -explicit -work work ../source/Abtaster.vhd
vcom -2002 -explicit -work work ../source/UART_Top.vhd
vcom -2002 -explicit -work work ../source/midi_control.vhd

# Audio path
vcom -2002 -explicit -work work ../source/FSM_BCLK_COUNT.vhd
vcom -2002 -explicit -work work ../source/audio_control.vhd
vcom -2002 -explicit -work work ../source/codeccontroller.vhd
vcom -2002 -explicit -work work ../source/P2S.vhd
vcom -2002 -explicit -work work ../source/S2P.vhd
vcom -2002 -explicit -work work ../source/i2s_master.vhd
vcom -2002 -explicit -work work ../source/i2c_master.vhd

# Tone generator
vcom -2002 -explicit -work work ../source/tone_decoder.vhd
vcom -2002 -explicit -work work ../source/dds.vhd
vcom -2002 -explicit -work work ../source/fm_sel.vhd
vcom -2002 -explicit -work work ../source/fm_coder_7segment.vhd
#vcom -2002 -explicit -work work ../source/lied_fsm.vhd
vcom -2002 -explicit -work work ../source/music_list.vhd

# Top level and Testbench
vcom -2002 -explicit -work work ../source/top_level.vhd
vcom -2002 -explicit -work work ../source/tb_uart.vhd

#-------------------------------------

# run simulation
vsim -t 1ps -lib work work.tb_uart
do wave_uart.do
run 1.2 ms 

