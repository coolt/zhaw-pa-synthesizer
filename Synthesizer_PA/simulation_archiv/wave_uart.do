onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_uart/s_clk_12M5
add wave -noupdate /tb_uart/s_reset_n
add wave -noupdate /tb_uart/s_serial_in
add wave -noupdate /tb_uart/s_rx_data
add wave -noupdate /tb_uart/s_rx_data_valid
add wave -noupdate /tb_uart/inst_1/baude_tick
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1999999770 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2100 us}
