onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /TestBench/CU/rst
add wave -noupdate -radix hexadecimal /TestBench/CU/clk
add wave -noupdate -radix hexadecimal /TestBench/CU/R1_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/R2_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/R1_stat
add wave -noupdate -radix hexadecimal /TestBench/CU/R2_stat
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD0
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD1
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD2
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD3
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD4
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD5
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD6
add wave -noupdate -radix hexadecimal /TestBench/CU/InstrD7
add wave -noupdate -radix hexadecimal /TestBench/CU/Strbuffer_ready
add wave -noupdate -radix hexadecimal /TestBench/CU/Loadbuffer_ready
add wave -noupdate -radix hexadecimal /TestBench/CU/ALUbuffer_ready
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr0
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr1
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr2
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr3
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO0
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO1
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO2
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO3
add wave -noupdate -radix hexadecimal /TestBench/CU/AR1_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/AR2_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/ALU_Instr
add wave -noupdate -radix hexadecimal /TestBench/CU/ALU_Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/ALU_DR
add wave -noupdate -radix hexadecimal /TestBench/CU/Load_Instr
add wave -noupdate -radix hexadecimal /TestBench/CU/Load_Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/Load_DR
add wave -noupdate -radix hexadecimal /TestBench/CU/Str_Instr
add wave -noupdate -radix hexadecimal /TestBench/CU/Str_Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/Str_DR
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC0
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC1
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC2
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC3
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC4
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC5
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC6
add wave -noupdate -radix hexadecimal /TestBench/CU/next_PC7
add wave -noupdate -radix hexadecimal /TestBench/CU/waiting_for_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/icache_pc
add wave -noupdate -radix hexadecimal /TestBench/CU/Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/last_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/OP
add wave -noupdate -radix hexadecimal /TestBench/CU/temp_temp_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/done_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/sent_IC
add wave -noupdate -radix hexadecimal /TestBench/CU/jump
add wave -noupdate -radix hexadecimal /TestBench/CU/Icounter
add wave -noupdate -radix hexadecimal /TestBench/CU/jump_indx
add wave -noupdate -radix hexadecimal /TestBench/CU/execute_jump
add wave -noupdate -radix hexadecimal /TestBench/CU/checked_jump
add wave -noupdate -radix hexadecimal /TestBench/CU/ok_jump
add wave -noupdate -radix hexadecimal /TestBench/CU/temp_R1_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/temp_R1_stat
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr0
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr1
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr2
add wave -noupdate -radix hexadecimal /TestBench/CU/Sent_Instr3
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO0
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO1
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO2
add wave -noupdate -radix hexadecimal /TestBench/CU/Inst_NO3
add wave -noupdate -radix hexadecimal /TestBench/CU/AR1_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/AR2_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/ALU_Instr
add wave -noupdate -radix hexadecimal /TestBench/CU/ALU_Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/ALU_DR
add wave -noupdate -radix hexadecimal /TestBench/CU/Load_Instr
add wave -noupdate -radix hexadecimal /TestBench/CU/Load_Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/Load_DR
add wave -noupdate -radix hexadecimal /TestBench/CU/Str_Instr
add wave -noupdate -radix hexadecimal /TestBench/CU/Str_Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/Str_DR
add wave -noupdate -radix hexadecimal /TestBench/CU/waiting_for_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/icache_pc
add wave -noupdate -radix hexadecimal /TestBench/CU/Instr_NO
add wave -noupdate -radix hexadecimal /TestBench/CU/last_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/OP
add wave -noupdate -radix hexadecimal /TestBench/CU/temp_temp_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/done_instr
add wave -noupdate -radix hexadecimal /TestBench/CU/sent_IC
add wave -noupdate -radix hexadecimal /TestBench/CU/jump
add wave -noupdate -radix hexadecimal /TestBench/CU/Icounter
add wave -noupdate -radix hexadecimal /TestBench/CU/jump_indx
add wave -noupdate -radix hexadecimal /TestBench/CU/execute_jump
add wave -noupdate -radix hexadecimal /TestBench/CU/checked_jump
add wave -noupdate -radix hexadecimal /TestBench/CU/ok_jump
add wave -noupdate -radix hexadecimal /TestBench/CU/temp_R1_ROB
add wave -noupdate -radix hexadecimal /TestBench/CU/temp_R1_stat
add wave -noupdate -radix hexadecimal -childformat {{{/TestBench/CU/temp_instr[0]} -radix hexadecimal} {{/TestBench/CU/temp_instr[1]} -radix hexadecimal} {{/TestBench/CU/temp_instr[2]} -radix hexadecimal} {{/TestBench/CU/temp_instr[3]} -radix hexadecimal} {{/TestBench/CU/temp_instr[4]} -radix hexadecimal} {{/TestBench/CU/temp_instr[5]} -radix hexadecimal} {{/TestBench/CU/temp_instr[6]} -radix hexadecimal} {{/TestBench/CU/temp_instr[7]} -radix hexadecimal}} -expand -subitemconfig {{/TestBench/CU/temp_instr[0]} {-radix hexadecimal} {/TestBench/CU/temp_instr[1]} {-radix hexadecimal} {/TestBench/CU/temp_instr[2]} {-radix hexadecimal} {/TestBench/CU/temp_instr[3]} {-radix hexadecimal} {/TestBench/CU/temp_instr[4]} {-radix hexadecimal} {/TestBench/CU/temp_instr[5]} {-radix hexadecimal} {/TestBench/CU/temp_instr[6]} {-radix hexadecimal} {/TestBench/CU/temp_instr[7]} {-radix hexadecimal}} /TestBench/CU/temp_instr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30892 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 120
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
WaveRestoreZoom {13613 ps} {41389 ps}
