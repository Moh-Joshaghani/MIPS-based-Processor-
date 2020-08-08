`timescale 1ns/1ns
module exec_path (
input  wire [31:0] InstrE,
input  wire [31:0] InstrNOE,
input  wire [31:0] R1_ALU,
input  wire [31:0] R2_ALU,
input  wire [31:0] ROB_forwA,
input  wire [31:0] ROB_forwB,
input  wire 	   ROB_forwselA,
input  wire 	   ROB_forwselB,

output wire [4:0]  AR1_RF,
output wire [4:0]  AR2_RF,
output wire [31:0] ALUout

);
wire [15:0] Imm;
wire 		s_z;
wire [31:0] Imm_in;
wire 		SrcBsel;
wire [3:0]  ALU_Function;
wire [31:0] ALU_Src1;
wire [31:0] ALU_Src2;
wire [31:0] SrcB1;
wire 		zero;


ALUOperandProvider ALU_OPP(
.InstrE(InstrE),
.InstrNOE(InstrNOE),
.AR1_RF(AR1_RF),
.AR2_RF(AR2_RF),
.ALU_Func(ALU_Function),
.Imm(Imm),
.SrcBsel(SrcBsel),
.s_z(s_z)
);
sign_zero_ext s_z_ext(
.in(Imm),
.out(Imm_in),
.modee(s_z)
);

mux2_1 Mux_A_forw(
.in_1(R1_ALU), 
.in_2(ROB_forwA),
.sel(ROB_forwselA),
.out(ALU_Src1)
);
mux2_1 Mux_B_forw(
.in_1(R2_ALU),
.in_2(ROB_forwB),
.sel(ROB_forwselB),
.out(SrcB1)
);
mux2_1 Mux_B_ImmReg(
.in_1(SrcB1), 
.in_2(Imm_in),
.sel(SrcBsel),
.out(ALU_Src2)
);
ALU ALU1(
.SrcAE(ALU_Src1),
.SrcBE(ALU_Src2),
.ALUCtrlE(ALU_Function),
.ALUOutE(ALUout)
);



endmodule