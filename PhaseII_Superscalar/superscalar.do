onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/in_1
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/in_2
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/sel
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/out
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/in_1
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/in_2
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/sel
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/out
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/CU/rst
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/CU/clk
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/F_D/clk
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/F_D/CLR
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/in_1
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/in_2
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/sel
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf1/out
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/in_1
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/in_2
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/sel
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/mux_CUf2/out
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/CU/rst
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/CU/clk
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R1_ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R2_ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD3
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD4
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD5
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD6
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD7
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC3
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC4
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC5
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC6
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC7
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/done_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/sent_IC
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/jump_indx
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/execute_jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/checked_jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ok_jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R1_stat
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R2_stat
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Strbuffer_ready
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ldbuffer_ready
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALUbuffer_ready
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Sent_Instr0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Sent_Instr1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Sent_Instr2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR1_CU2ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR2_CU2ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALU_Instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALU_InstrNO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALU_DR
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ld_Instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ld_InstrNO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ld_DR
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Str_Instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Str_Instr_NO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Str_DR
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR1_CU2RF
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR2_CU2RF
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/waiting_for_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/icache_pc
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/last_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/OP
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/temp_temp_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Icounter
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R1_ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R2_ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R1_stat
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/R2_stat
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD3
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD4
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD5
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD6
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/InstrD7
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC3
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC4
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC5
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC6
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/next_PC7
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/jump_indx
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/execute_jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/checked_jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ok_jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Strbuffer_ready
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ldbuffer_ready
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALUbuffer_ready
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Sent_Instr0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Sent_Instr1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Sent_Instr2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO0
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO1
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO2
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR1_CU2ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR2_CU2ROB
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALU_Instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALU_InstrNO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/ALU_DR
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ld_Instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ld_InstrNO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Ld_DR
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Str_Instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Str_Instr_NO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Str_DR
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR1_CU2RF
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/AR2_CU2RF
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/waiting_for_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/icache_pc
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Instr_NO
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/last_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/OP
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/temp_temp_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/done_instr
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/sent_IC
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/jump
add wave -noupdate -group {CU
} -radix hexadecimal /multi_cycle_mips__tb/uut/CU/Icounter
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/rst
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/clk
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WE1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ResultW1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WriteReg1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WE2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ResultW2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WriteReg2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forw_R12CU
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forw_R22CU
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forwsel_CU1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forwsel_CU2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/AR1_CU2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/AR2_CU2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/R1_stat
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/R2_stat
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Sent_Instr0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Sent_Instr1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Sent_Instr2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Instr_NO0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Instr_NO1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Instr_NO2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ldrs_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ldrt_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ldoffset_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_rs
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_rt
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_offset
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/LdInstrNO2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_InstrNO_Issue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_Instr_Issue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Strrs_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Strrt_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Stroffset_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_rs
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_rt
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_offset
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_InstrNO2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_InstrNO_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_Instr_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_rs
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_rt
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_rd
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_InstrNO2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUInstrNO0_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUInstr0_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_InstrNO1_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUInstr1_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUrs_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUrt_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUrd_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FA1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FB1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSA1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSB1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FA2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FB2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSA2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSB2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSvalue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_Fvalue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_LdFSAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_LdFAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU1Out
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU2Out
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/LdData_ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/LdInstrNO_DM
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ar8
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Rd8
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_end_indx
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter3
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/c2_counter
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/c
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/r_temp
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/r1_temp
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/r2_temp
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/wb_counter
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/addr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/AS_end
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/temp_reg
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/reg_exist
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/temp_instr0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/temp_1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/rst
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/clk
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WE1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ResultW1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WriteReg1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WE2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ResultW2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/WriteReg2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forw_R12CU
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forw_R22CU
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forwsel_CU1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/forwsel_CU2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/AR1_CU2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/AR2_CU2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/R1_stat
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/R2_stat
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Sent_Instr0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Sent_Instr1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Sent_Instr2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Instr_NO0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Instr_NO1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Instr_NO2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ldrs_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ldrt_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ldoffset_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_rs
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_rt
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_offset
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/LdInstrNO2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_InstrNO_Issue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ld_Instr_Issue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Strrs_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Strrt_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Stroffset_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_rs
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_rt
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_offset
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_InstrNO2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_InstrNO_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Str_Instr_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_rs
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_rt
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_rd
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_InstrNO2ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUInstrNO0_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUInstr0_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU_InstrNO1_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUInstr1_Issued
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUrs_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUrt_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALUrd_RD
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FA1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FB1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSA1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSB1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FA2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FB2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSA2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSB2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSvalue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FSAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_FAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_Fvalue
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_LdFSAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ROB_LdFAddr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU1Out
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/ALU2Out
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/LdData_ROB
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/LdInstrNO_DM
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Ar8
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/Rd8
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_end_indx
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/CO_counter3
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/c2_counter
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/c
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/r_temp
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/r1_temp
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/r2_temp
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/wb_counter
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset1
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/offset2
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/addr
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/AS_end
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/temp_reg
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/reg_exist
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/temp_instr0
add wave -noupdate -group {ROB
} -radix hexadecimal /multi_cycle_mips__tb/uut/my_ROB/temp_1
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/F_D/clk
add wave -noupdate -radix hexadecimal /multi_cycle_mips__tb/uut/F_D/CLR
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR1_CU2RF
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR2_CU2RF
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WE2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/ResultW2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WriteReg2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WE1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/ResultW1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WriteReg1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar7
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar6
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar5
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR1_ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR2_ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR1_ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR2_ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/clk
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R1_RF2CU
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R2_RF2CU
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd7
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd6
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd5
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R1_RF2ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R2_RF2ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R1_RF2ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R2_RF2ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar8
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd8
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/i
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR1_CU2RF
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR2_CU2RF
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WE2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/ResultW2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WriteReg2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WE1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/ResultW1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/WriteReg1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar7
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar6
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar5
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR1_ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR2_ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR1_ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/AR2_ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/clk
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R1_RF2CU
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R2_RF2CU
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd7
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd6
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd5
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R1_RF2ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R2_RF2ALU2
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R1_RF2ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/R2_RF2ALU1
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Ar8
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/Rd8
add wave -noupdate -group RegFile -radix hexadecimal /multi_cycle_mips__tb/uut/RegFile/i
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Str_Instr
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Str_InstrNO
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Str_DR
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/clk
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/rst
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Strrs_RD
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Stroffset_RD
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Strrt_RD
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Strbuffer_ready
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/StrInstrNO_ROB
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Str_rs
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Str_rt
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Str_offset
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/StrInstrNO2ROB
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/StrInstr2ROB
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Instr_Strpath
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/InstrNO_Strpath
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/BC_indx
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/end_buffer
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/sent
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Icounter
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/Jcounter
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/OP
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/rs
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/rt
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/rd
add wave -noupdate -expand -group {Str buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Str_Buffer/addr
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_Instr
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_InstrNO
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_DR
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/clk
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/rst
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ldrs_RD
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ldoffset_RD
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ldrt_RD
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ldbuffer_ready
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/LdInstrNO_ROB
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_rs
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_rt
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_offset
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_InstrNO_Issue
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Ld_Instr_Issue
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Instr_LdBuf
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/LdInstrNO_DM
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/BC_indx
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/end_buffer
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Icounter
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/Jcounter
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/OP
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/rs
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/rt
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/rd
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/addr
add wave -noupdate -expand -group {load buff} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_Buffer/sent
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_DR
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/clk
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/rst
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUrs_RD
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUrd_RD
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUrt_RD
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUbuffer_ready
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUInstrNO0_Issued
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUInstr0_Issued
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUInstrNO1_Issued
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALUInstr1_Issued
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_rs
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_rt
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_rd
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_InstrNO2ROB
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/InstrE0
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/InstrNO0_E
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/InstrE1
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/InstrNO1_E
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/BC_indx
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/end_buffer
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/Icounter
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/Jcounter
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/commit_counter
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/OP
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/rs
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/rt
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/rd
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/addr
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_Instr
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/ALU_InstrNO
add wave -noupdate -expand -group ALUBuffer -radix hexadecimal /multi_cycle_mips__tb/uut/ALU_Buffers/clk
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/InstrE
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/InstrNOE
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/R1_ALU
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/R2_ALU
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ROB_forwA
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ROB_forwB
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ROB_forwselA
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ROB_forwselB
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/AR1_RF
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/AR2_RF
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ALUout
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/Imm
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/s_z
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/Imm_in
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ALU_Function
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ALU_Src1
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/ALU_Src2
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/SrcB1
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/zero
add wave -noupdate -expand -group EXEpath1 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_1/SrcBsel
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/InstrE
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/InstrNOE
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/R1_ALU
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/R2_ALU
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwA
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwB
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwselA
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwselB
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/AR1_RF
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/AR2_RF
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALUout
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/Imm
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/s_z
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/Imm_in
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALU_Function
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALU_Src1
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALU_Src2
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/SrcB1
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/zero
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/SrcBsel
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/InstrE
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/InstrNOE
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/R1_ALU
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/R2_ALU
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwA
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwB
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwselA
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ROB_forwselB
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/AR1_RF
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/AR2_RF
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALUout
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/Imm
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/s_z
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/Imm_in
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALU_Function
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALU_Src1
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/ALU_Src2
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/SrcB1
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/zero
add wave -noupdate -expand -group EXEpath2 -radix hexadecimal /multi_cycle_mips__tb/uut/EXE_path_2/SrcBsel
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdInstrNO_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdAddr_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdAddr_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdAddr_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/StrAddr_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/clk
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/WE_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/store_data_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/WriteData_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdInstrNO_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/StrAddr_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/WE_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdInstrNO_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdAddr_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/StrAddr_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/clk
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/WE_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/store_data_AG
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/WriteData_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/LdInstrNO_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/StrAddr_DM
add wave -noupdate -group DM -radix hexadecimal /multi_cycle_mips__tb/uut/DM_flipflop/WE_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/LdAddr_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/StrAddr_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/clk
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/WE_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/WriteData_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/LdData_ROB
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/LdAddr_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/StrAddr_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/clk
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/WE_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/WriteData_DM
add wave -noupdate -group {data memory} -radix hexadecimal /multi_cycle_mips__tb/uut/DataMemory/LdData_ROB
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Instr_LdBuf
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/LdInstrNO_AG
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Rd5
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/ROB_LdFAddr
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/ROB_LdFSAddr
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Ar5
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/LdAddr_AG
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Out_LOPP
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/s_z
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Add1
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Add2
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Instr_LdBuf
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/LdInstrNO_AG
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Rd5
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/ROB_LdFAddr
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/ROB_LdFSAddr
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Ar5
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/LdAddr_AG
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Out_LOPP
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/s_z
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Add1
add wave -noupdate -group {Load path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Load_path/Add2
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Instr_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/InstrNO_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/R1_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_FAddr
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_FSAddr
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_Fvalue
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_FSvalue
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/WE_AG
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/AR1_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/StrAddr_AG
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/AR2_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/R2_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/store_data_AG
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Out_LOPP
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/s_z
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Add1
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Add2
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Instr_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/InstrNO_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/R1_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_FAddr
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_FSAddr
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_Fvalue
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/ROB_FSvalue
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/WE_AG
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/AR1_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/StrAddr_AG
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/AR2_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/R2_Str
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/store_data_AG
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Out_LOPP
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/s_z
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Add1
add wave -noupdate -group {Store Path
} -radix hexadecimal /multi_cycle_mips__tb/uut/Store_path/Add2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32900 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 388
configure wave -valuecolwidth 67
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
WaveRestoreZoom {22 ns} {62 ns}
