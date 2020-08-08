module SuperScalar (input wire rst,input wire clk);

//________________________ wire and regs
 wire [31:0] PC0,PC1,PC2,PC3,PC4,PC5,PC6,PC7,InstrF0,InstrF1,InstrF2,InstrF3,InstrF4,InstrF5,InstrF6,InstrF7;
 wire [31:0] InstrD0,InstrD1,InstrD2,InstrD3,InstrD4,InstrD5,InstrD6,InstrD7,LdInstr_DM;
 wire        CLR,EN,chk,chk_l,chk_s, chk_ab ;
 //--- CU
wire  [31:0] R1_ROB,R2_ROB, InstrNO_bc0,InstrNO_bc1 ;
wire  [31:0] LdInstrNO2ROB;
wire  [31:0] Str_InstrNO;
wire  [31:0] Str_InstrNO2ROB;
wire  [31:0] Str_InstrNO_issued;
wire  [4:0]  Ar7,Ar6 ;
wire [255:0] str_data_mem,ld_data_mem;
wire new_mem;
wire  [31:0] Sent_Instr0;
wire  [31:0] Sent_Instr1;
wire  [31:0] Sent_Instr2;
wire  [31:0] Instr_NO0;
wire  [31:0] Instr_NO1;
wire  [31:0] Instr_NO2;
wire  [4:0]  AR1_CU2ROB;
wire  [4:0]  AR2_CU2ROB;
wire [31:0] ALU_Instr;
wire [31:0] ALU_InstrNO;
wire        ALU_DR;
wire [31:0] Ld_Instr;
wire [31:0] Ld_InstrNO;
wire        Ld_DR;
wire [31:0] Str_Instr;
wire [31:0] Str_Instr_NO;
wire        Str_DR;
wire  [4:0] AR1_CU2RF;
wire  [4:0] AR2_CU2RF; 
//-- ALUbuf
wire         ALUbuffer_ready;
wire  [31:0] ALUInstrNO0_issued;
wire  [31:0] ALUInstr0_issued;
wire  [31:0] ALUInstrNO1_issued;
wire  [31:0] ALUInstr1_issued;
wire  [4:0]  ALU_rs;
wire  [4:0]  ALU_rt;
wire  [4:0]  ALU_rd;
wire  [31:0] ALU_InstrNO2ROB;
wire  [31:0] InstrE0;
wire  [31:0] InstrNO0_E;
wire  [31:0] InstrE1;
wire  [31:0] InstrNO1_E;
//--load buf

wire         Ldbuffer_ready;
wire  [31:0] LdInstrNO_ROB;
wire  [4:0]  Ld_rs;
wire  [4:0]  Ld_rt;
wire  [15:0]  Ld_offset;
wire  [31:0] Ld_InstrNO_issue;
wire  [31:0] Ld_Instr_issue;
wire  [31:0] Instr_LdBuf;
wire  [31:0] LdInstrNO_AG;
//--
wire         Strbuffer_ready;
//wire  [31:0] StrInstrNO_ROB;
wire  [4:0]  Str_rs;
wire  [4:0]  Str_rt;
wire  [15:0]  Str_offset;
//wire  [31:0] StrInstrNO2ROB;
wire  [31:0] Str_Instr_issued;
wire  [31:0] Instr_Strpath;
wire  [31:0] InstrNO_Strpath;
//--- RF
wire [31:0] R1_RF2CU; 
wire [31:0] R2_RF2CU; 
wire [31:0] Rd7;
wire [31:0] Rd6; 
wire [31:0] Rd5;
wire [31:0] R1_RF2ALU2;
wire [31:0] R2_RF2ALU2 ;
wire [31:0] R1_RF2ALU1 ;
wire [31:0] R2_RF2ALU1 ;
wire [31:0] Rd8,Rd9,Rd10,Rd11;
//-- exec path
wire [4:0]  AR1_ALU1;
wire [4:0]  AR2_ALU1;
wire [31:0] ALU1Out;
wire [4:0]  AR1_ALU2;
wire [4:0]  AR2_ALU2;
wire [31:0] ALU2Out;
//-- load path
wire  [4:0]  Ar5;
wire [31:0] LdAddr_AG;
//-- str path
 wire         WE_AG;
 wire  [4:0]  AR1_Str;
 wire [31:0] StrAddr_AG;
 wire  [4:0]  Ar2_Str;
 wire  [31:0] store_data_AG;
//--dmff
wire  [31:0] WriteData_DM;
wire  [31:0] LdInstrNO_DM;
wire  [31:0] LdAddr_DM;
wire  [31:0] StrAddr_DM;
wire 	     WE_DM;
//-- data memory
wire [31:0] LdData_ROB  ;
//-- ROB
wire         WE1;
wire  [31:0] ResultW1;
wire  [4:0]  WriteReg1;
wire         WE2;
wire  [31:0] ResultW2;
wire  [4:0]  WriteReg2;
wire  [31:0] forw_R12CU;
wire  [31:0] forw_R22CU;
wire         forwsel_CU1;
wire         forwsel_CU2;
wire         R1_stat;
wire         R2_stat;
wire         Ldrs_RD;
wire         Ldrt_RD;
wire         Ldoffset_RD;
wire         Strrs_RD;
wire         Strrt_RD;
wire         Stroffset_RD;
wire         ALUrs_RD;
wire         ALUrt_RD;
wire         ALUrd_RD;
wire  [31:0] ROB_FA1;
wire  [31:0] ROB_FB1 ;
wire         ROB_FSA1;
wire         ROB_FSB1;
wire  [31:0] ROB_FA2;
wire  [31:0] ROB_FB2 ;
wire         ROB_FSA2;
wire         ROB_FSB2;
wire         ROB_FSvalue; 
wire         ROB_FSAddr;
wire  [31:0] ROB_FAddr;
wire  [31:0] ROB_Fvalue;
wire         ROB_LdFSAddr,new_PC;
wire  [31:0] ROB_LdFAddr; 
wire  [4:0]  Ar8,Ar9,Ar10,Ar11;
wire  [31:0] PC_0;
wire  [31:0] PC_1;
wire  [31:0] PC_2;
wire  [31:0] PC_3;
wire  [31:0] PC_4;
wire  [31:0] PC_5;
wire  [31:0] PC_6;
wire  [31:0] PC_7;
wire  [31:0] PC_0D;
wire  [31:0] PC_1D;
wire  [31:0] PC_2D;
wire  [31:0] PC_3D;
wire  [31:0] PC_4D;
wire  [31:0] PC_5D;
wire  [31:0] PC_6D;
wire  [31:0] PC_7D;
wire  [31:0] Ld_data2ROB,Ld_instr2ROB,Ld_INO2ROB;
wire  [31:0] Ld_instr_AG,Ld_INO_AG,Ld_addr_AG,Str_data_AG,Str_addr_AG;
wire		 WE_c_AG;
//wire [31:0] InstrNO_bc;


//_________________________Fetch
Instr_Memory Instruction_Memory(.A1(PC_0),
                                .A2(PC_1),
                                .A3(PC_2),
                                .A4(PC_3),
                                .A5(PC_4),
                                .A6(PC_5),
                                .A7(PC_6),
                                .A8(PC_7),
                            	.RD1(InstrF0),
                            	.RD2(InstrF1),
                            	.RD3(InstrF2),
                            	.RD4(InstrF3),
                            	.RD5(InstrF4),
                            	.RD6(InstrF5),
                            	.RD7(InstrF6),
                            	.RD8(InstrF7));

PCC PC_calc(
InstrF0,
InstrF1,
InstrF2,
InstrF3,
InstrF4,
InstrF5,
InstrF6,
InstrF7, 
new_PC,
PC0,
PC1,
PC2,
PC3,
PC4,
PC5,
PC6,
PC7,
PC_0,
PC_1,
PC_2,
PC_3,
PC_4,
PC_5,
PC_6,
PC_7);
								FD_flipflop  F_D                
								(.clk(clk),
                                 .CLR(CLR),                                 
                                 .InstrF0(InstrF0),
                                 .InstrF1(InstrF1),
                                 .InstrF2(InstrF2),
                                 .InstrF3(InstrF3),
                                 .InstrF4(InstrF4),
                                 .InstrF5(InstrF5),
                                 .InstrF6(InstrF6),
                                 .InstrF7(InstrF7),                                 
                                 .InstrD0(InstrD0),
                                 .InstrD1(InstrD1),
                                 .InstrD2(InstrD2),
                                 .InstrD3(InstrD3),
                                 .InstrD4(InstrD4),
                                 .InstrD5(InstrD5),
                                 .InstrD6(InstrD6),
                                 .InstrD7(InstrD7),
								 .PC0in(PC_0),
								 .PC1in(PC_1),
								 .PC2in(PC_2),
								 .PC3in(PC_3),
								 .PC4in(PC_4),
								 .PC5in(PC_5),
								 .PC6in(PC_6),
								 .PC7in(PC_7),
								 .PC0out(PC_0D),
								 .PC1out(PC_1D),
								 .PC2out(PC_2D),
								 .PC3out(PC_3D),
								 .PC4out(PC_4D),
								 .PC5out(PC_5D),
								 .PC6out(PC_6D),
								 .PC7out(PC_7D)
								 
								 );

//___________________________________________________
//_________   Decode ________________________________

Control_Unit CU(
R1_ROB,
R2_ROB,
R1_stat,
R2_stat,
InstrD0,
InstrD1,
InstrD2,
InstrD3,
InstrD4,
InstrD5,
InstrD6,
InstrD7,
rst,
clk,
Strbuffer_ready,
Ldbuffer_ready,
ALUbuffer_ready,
Sent_Instr0,
Sent_Instr1,
Sent_Instr2,
Instr_NO0,
Instr_NO1,
Instr_NO2,
AR1_CU2ROB,
AR2_CU2ROB,
InstrNO_bc0,
InstrNO_bc1,
ALU_Instr,
ALU_InstrNO,
ALU_DR,
Ld_Instr,
Ld_InstrNO,
Ld_DR,
Str_Instr,
Str_InstrNO,
Str_DR,
AR1_CU2RF,
AR2_CU2RF,
PC0,
PC1,
PC2,
PC3,
PC4,
PC5,
PC6,
PC7,
chk,
new_PC,
PC_0D,
PC_1D,
PC_2D,
PC_3D,
PC_4D,
PC_5D,
PC_6D,
PC_7D
);
//------ bayad mux4-1 beshe
mux2_1 mux_CUf1(R1_RF2CU,forw_R12CU,forwsel_CU1,R1_ROB);
mux2_1 mux_CUf2(R2_RF2CU,forw_R22CU,forwsel_CU2,R2_ROB);

ALUBuffer ALU_Buffers(
ALU_Instr, 
ALU_InstrNO, 
ALU_DR,
clk,
rst,
ALUrs_RD,
ALUrd_RD,
ALUrt_RD,
ALUbuffer_ready,
ALUInstrNO0_issued,
ALUInstr0_issued,
ALUInstrNO1_issued,
ALUInstr1_issued,
ALU_rs,
ALU_rt,
ALU_rd,
ALU_InstrNO2ROB,
InstrE0,
InstrNO0_E,
InstrE1,
InstrNO1_E,
chk_ab);
	  
LoadBuffer Load_Buffer(
 Ld_Instr, 
 Ld_InstrNO,
 Ld_DR,
 clk,
 rst, 
 Ldrs_RD,
 Ldoffset_RD,
 Ldrt_RD,
 Ldbuffer_ready,
 Ld_InstrNO_issue,
 Ld_rs,
 Ld_rt,
 Ld_offset,
 LdInstrNO2ROB,
 Ld_Instr_issue,
 Instr_LdBuf, //loadpath
 LdInstrNO_AG,
 chk_l);
	  
cachecontroller cacheC(
clk,
rst,
Instr_LdBuf,
LdInstrNO_AG,
Instr_Strpath,
InstrNO_Strpath,
store_data_AG, // az strpath
WE_AG,
//az AG ha
LdAddr_AG,
StrAddr_AG,
//--ROB
Ld_data2ROB,//----------------------------
Ld_instr2ROB,
Ld_INO2ROB,

//from memory
str_data_mem, //----------
ld_data_mem,



//-- to dmff

Ld_instr_AG,
Ld_INO_AG,
Ld_addr_AG,
WE_c_AG,
Str_data_AG,
Str_addr_AG,
new_mem
);	  
	  
StrBuffer Str_Buffer(
 Str_Instr,
 Str_InstrNO, 
 Str_DR,
 clk,
 rst,
 Strrs_RD,
 Stroffset_RD,
 Strrt_RD, 
 Strbuffer_ready,
 Str_InstrNO_issued,
 Str_rs, 
 Str_rt,
 Str_offset,
 Str_InstrNO2ROB,
 Str_Instr_issued,
 Instr_Strpath, //store path
 InstrNO_Strpath,
 chk_s);

Register_File RegFile(
AR1_CU2RF,
AR2_CU2RF,
WE2,
ResultW2,
WriteReg2,
WE1,
ResultW1,
WriteReg1,
Ar7,
Ar6,
Ar5,
AR1_ALU2,
AR2_ALU2,
AR1_ALU1,
AR2_ALU1,
clk,
R1_RF2CU,
R2_RF2CU,
Rd7,
Rd6,
Rd5,
R1_RF2ALU2,
R2_RF2ALU2,
R1_RF2ALU1,
R2_RF2ALU1,
Ar8,
Rd8,
Rd9,
Rd10,
Rd11,
Ar9,
Ar10,
Ar11
);

//_________________________________________
//_____________________ EXEC ______________
// ------ esme wire haye ROB kharabe yekie

exec_path EXE_path_1( 
 InstrE0,
 InstrNO0_E,
 R1_RF2ALU1,
 R2_RF2ALU1,
 ROB_FA1,
 ROB_FB1,
 ROB_FSA1,
 ROB_FSB1,
 AR1_ALU1,
 AR2_ALU1,
 ALU1Out);
 
exec_path EXE_path_2(
InstrE1,
InstrNO1_E,
R1_RF2ALU2,
R2_RF2ALU2,
ROB_FA2,
ROB_FB2,
ROB_FSA2,
ROB_FSB2,
AR1_ALU2,
AR2_ALU2,
ALU2Out);

Ld_path Load_path(
Instr_LdBuf,
LdInstrNO_AG,
Rd5,
ROB_LdFAddr,
ROB_LdFSAddr,
Ar5,
LdAddr_AG);

Str_path Store_path(
Instr_Strpath,
InstrNO_Strpath,
Rd6,
ROB_FAddr,
ROB_FSAddr,
ROB_Fvalue,
ROB_FSvalue,
WE_AG,
Ar6,
StrAddr_AG,
Ar7,
Rd7,
store_data_AG,
clk);


//--------------str addr
DMFF DM_flipflop(
Ld_INO_AG,
Ld_addr_AG,
Str_addr_AG,
clk,
WE_c_AG,
Str_data_AG,
WriteData_DM,
LdInstrNO_DM,
LdAddr_DM,
StrAddr_DM,
WE_DM,
LdInstr_DM,
Ld_instr_AG);

Data_Memory DataMemory(
LdAddr_DM,
StrAddr_DM,
clk,
WE_DM ,
WriteData_DM,
LdData_ROB,
ld_data_mem,
str_data_mem ,
new_mem       
);

ROB my_ROB(
rst,
clk,
WE1,
ResultW1,
WriteReg1,
WE2,
ResultW2,
WriteReg2,
forw_R12CU,
forw_R22CU,
forwsel_CU1,
forwsel_CU2,
AR1_CU2ROB,
AR2_CU2ROB,
InstrNO_bc0,
InstrNO_bc1,
R1_stat,
R2_stat,
Sent_Instr0,
Sent_Instr1,
Sent_Instr2,
Instr_NO0,
Instr_NO1,
Instr_NO2,
Ldrs_RD,
Ldrt_RD,
Ldoffset_RD,
Ld_rs,
Ld_rt,
Ld_offset,
LdInstrNO2ROB,
Ld_InstrNO_issue,
Ld_Instr_issue,
Strrs_RD,
Strrt_RD,
Stroffset_RD,
Str_rs,
Str_rt,
Str_offset,
Str_InstrNO2ROB,
Str_InstrNO_issued,
Str_Instr_issued,
ALU_rs,
ALU_rt,
ALU_rd,
ALU_InstrNO2ROB,
ALUInstrNO0_issued,
ALUInstr0_issued,
ALUInstrNO1_issued,
ALUInstr1_issued,
ALUrs_RD,
ALUrt_RD,
ALUrd_RD,
ROB_FA1,
ROB_FB1,
ROB_FSA1,
ROB_FSB1,
ROB_FA2,
ROB_FB2,
ROB_FSA2,
ROB_FSB2,
ROB_FSvalue,
ROB_FSAddr,
ROB_FAddr,
ROB_Fvalue,
ROB_LdFSAddr,
ROB_LdFAddr,
ALU1Out,
ALU2Out,
LdData_ROB,
LdInstrNO_DM,
Ar8,
Rd8,
chk,
chk_s,
chk_l,
LdInstr_DM,
Rd9,
Rd10,
Rd11,
Ar9,
Ar10,
Ar11,
chk_ab,
Ld_INO2ROB,
Ld_data2ROB,
Ld_instr2ROB
);

endmodule