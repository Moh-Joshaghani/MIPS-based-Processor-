//=========================================================
// Instruction memory (read-only)
//RD = out instruction
//A= input address
//=========================================================
//
module Instr_Memory(A1,A2,A3,A4,A5,A6,A7,A8,RD1,RD2,RD3,RD4,RD5,RD6,RD7,RD8);

input  wire [31:0] A1,A2,A3,A4,A5,A6,A7,A8;
output wire [31:0] RD1,RD2,RD3,RD4,RD5,RD6,RD7,RD8;

parameter memsize=256;
integer i;
reg [31:0] memory [0:memsize];
//_____________________initial
initial 
begin
    for(i=0;i<memsize+1;i=i+1)
        memory[i]=32'b0;  
  
    $readmemh("isort32.hex",memory);    
end

//_____________________assign

assign RD1 = (A1==32'hffff)? 32'b0:memory[A1[31:2]];
assign RD2 = (A2==32'hffff)? 32'b0:memory[A2[31:2]];
assign RD3 = (A3==32'hffff)? 32'b0:memory[A3[31:2]];
assign RD4 = (A4==32'hffff)? 32'b0:memory[A4[31:2]];
assign RD5 = (A5==32'hffff)? 32'b0:memory[A5[31:2]];
assign RD6 = (A6==32'hffff)? 32'b0:memory[A6[31:2]];  
assign RD7 = (A7==32'hffff)? 32'b0:memory[A7[31:2]];
assign RD8 = (A8==32'hffff)? 32'b0:memory[A8[31:2]];
endmodule
