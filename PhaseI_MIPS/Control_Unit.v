module Control_Unit(
input  wire [5:0] Opcode   ,  
input  wire [5:0] Funct    ,
output wire       MemtoRegD,
output wire       MemWriteD,
output wire       BranchD  ,
output wire       ALUSrcD  ,
output wire       RegDstD  ,
output wire       RegWriteD,
output wire [3:0] ALUControlD,
output wire       ZeroOrSign);

//------------------------------------
wire [3:0] ALUOp;
Main_Decoder mips_maindecoder (Opcode,ALUOp,MemtoRegD,MemWriteD,
                      BranchD,ALUSrcD,RegDstD,RegWriteD,ZeroOrSign) ;

ALU_Decoder mips_aludecoder (Funct,ALUOp,ALUControlD);




endmodule
