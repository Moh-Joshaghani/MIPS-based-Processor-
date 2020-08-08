`timescale 1ns/1ns
module LoadOPP(
input  wire [31:0] Instr_Ld,
input  wire [31:0] InstrNO_Ld,

//--regfile
output reg  [4:0]  AR1_Ld,

//--ALU
output reg  [15:0]  Out_LOPP,
output reg         s_z
);


always@(Instr_Ld,InstrNO_Ld)
begin
      Out_LOPP = Instr_Ld[15:0];
      AR1_Ld   = Instr_Ld[25:21];       
      s_z = 0; 

end



endmodule