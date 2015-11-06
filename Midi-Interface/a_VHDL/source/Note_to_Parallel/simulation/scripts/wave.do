onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_notetoparallel/t_clk
add wave -noupdate /tb_notetoparallel/t_reset_n
add wave -noupdate /tb_notetoparallel/t_noteOnOff
add wave -noupdate /tb_notetoparallel/t_note
add wave -noupdate /tb_notetoparallel/t_noteEN
add wave -noupdate /tb_notetoparallel/t_parallelNote
add wave -noupdate /tb_notetoparallel/dut/parallelNote_folge
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 243
configure wave -valuecolwidth 99
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
configure wave -timelineunits ns
update
WaveRestoreZoom {3362 ns} {4266 ns}
