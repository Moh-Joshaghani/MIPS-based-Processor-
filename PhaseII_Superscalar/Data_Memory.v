module Data_Memory(
input  wire [31:0] LdAddr_DM,
input  wire [31:0] StrAddr_DM,
input  wire        clk,
input  wire        WE_DM ,
input  wire [31:0] WriteData_DM,
output wire [31:0] LdData_ROB        


);
parameter memsize=256;
reg [31:0] memory [0:memsize];




assign LdData_ROB = memory[LdAddr_DM[31:2]];


always@(*)
begin
  if(WE_DM)
    memory[StrAddr_DM[31:2]] = WriteData_DM;
end



endmodule
