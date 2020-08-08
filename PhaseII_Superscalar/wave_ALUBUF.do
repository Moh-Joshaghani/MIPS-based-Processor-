onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALU_Instr
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALU_InstrNO
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALU_DR
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/clk
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/rst
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALUrs_RD
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALUrd_RD
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALUrt_RD
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALUbuffer_ready
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALUInstrNO0_ROB
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALUInstrNO1_ROB
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALU_rs
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALU_rt
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/ALU_rd
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/InstrNO_ROB
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/InstrE0
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/InstrNO0_E
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/InstrE1
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/InstrNO1_E
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/BC_indx
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/end_buffer
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/Icounter
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/Jcounter
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/commit_counter
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/OP
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/rs
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/rt
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/rd
add wave -noupdate -radix hexadecimal /TestBench/my_alubuf/addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15857 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 241
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
WaveRestoreZoom {0 ps} {27776 ps}
