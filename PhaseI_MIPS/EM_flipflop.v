module EM_flipflop (
 input  wire        clk,
 input  wire [31:0] ALUOutE,
 input  wire [31:0] WriteDataE,
 input  wire [4:0] WriteRegE,
 input  wire       RegWriteE,
 input  wire       MemtoRegE,
 input  wire       MemWriteE,

 output reg [31:0] ALUOutM,
 output reg [31:0] WriteDataM,
 output reg [4:0] WriteRegM,
 output reg       RegWriteM,
 output reg       MemtoRegM,
 output reg       MemWriteM
 

);
//----------------------------------------  
  
always@(posedge clk)
begin
    ALUOutM<=ALUOutE;
    WriteDataM<=WriteDataE;    
    WriteRegM<=WriteRegE;    
    RegWriteM<=RegWriteE;    
    MemtoRegM<=MemtoRegE;    
    MemWriteM<=MemWriteE; 
  
end  
  
endmodule

