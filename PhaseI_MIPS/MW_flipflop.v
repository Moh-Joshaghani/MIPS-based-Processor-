module MW_flipflop (
 input  wire        clk,
 input  wire [31:0] ReadDataM,
 input  wire [31:0] ALUOutM,
 input  wire [4:0] WriteRegM,
 input  wire       RegWriteM,
 input  wire       MemtoRegM,


 output reg [31:0] ALUOutW,
 output reg [31:0] ReadDataW,
 output reg [4:0]  WriteRegW,
 output reg        RegWriteW,
 output reg        MemtoRegW
);
//----------------------------------------  
  
always@(posedge clk)
begin
    ALUOutW<=ALUOutM;
    ReadDataW<=ReadDataM;    
    WriteRegW<=WriteRegM;    
    RegWriteW<=RegWriteM;    
    MemtoRegW<=MemtoRegM;      
end  
  
endmodule


