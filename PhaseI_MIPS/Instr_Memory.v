//=========================================================
// Instruction memory (read-only)
//RD = out instruction
//A= input address
//=========================================================
//
module Instr_Memory(A,RD);
input  [31:0]A;
output [31:0]RD;

parameter memsize=256;
reg [31:0] memory [memsize:0];

assign RD = memory[A[31:2]];

endmodule
