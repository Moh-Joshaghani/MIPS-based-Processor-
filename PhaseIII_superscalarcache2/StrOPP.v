`timescale 1ns/1ns
module StrOPP(
input  wire [31:0] Instr_Str,
input  wire [31:0] InstrNO_Str,

//--regfile
output reg  [4:0]  AR1_Str,
output reg  [4:0]  AR2_Str,
output reg         WE,
//--ALU
output reg  [15:0]  Out_LOPP,
output reg         s_z,
input  wire		   clk
);

always@(posedge clk)
begin
 //WE=1'b0;

end

always@(Instr_Str,InstrNO_Str)
begin
    
	  Out_LOPP = Instr_Str[15:0];
      AR1_Str  = Instr_Str[25:21];
	  AR2_Str  = Instr_Str[20:16];	
      s_z = 0; 
	  WE=1'b1;
	  
end



endmodule