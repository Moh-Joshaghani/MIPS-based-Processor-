module Data_Memory(
input  wire [31:0] A  ,
input  wire        clk,
input  wire        WE ,
output wire [31:0] RD ,                    
input  wire [31:0] WD );

parameter memsize=256;
reg [31:0] memory [memsize:0];


assign RD = memory[A[31:2]];


always@(posedge clk)
begin
  if(WE)
    memory[A[31:2]]=WD;
end



endmodule
