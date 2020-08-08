module DE_flipflop (
 input  wire        clk,
 input  wire [31:0] RD1,
 input  wire [31:0] RD2,
 input  wire [31:0] SignImmD,
 input  wire [4:0] RsD,
 input  wire [4:0] RtD,
 input  wire [4:0] RdD,
 input  wire       RegWriteD,
 input  wire       MemtoRegD,
 input  wire       MemWriteD,
 input  wire [3:0] ALUControlD,
 input  wire       ALUSrcD,
 input  wire       RegDstD,
 input  wire        CLR,

 output  reg       RegWriteE,
 output  reg       MemtoRegE,
 output  reg       MemWriteE,
 output  reg [3:0] ALUControlE,
 output  reg       ALUSrcE,
 output  reg       RegDstE,
 output  reg [4:0] RsE,
 output  reg [4:0] RtE,
 output  reg [4:0] RdE,
 output reg [31:0] SignImmE,
 output reg [31:0] RD1E,
 output reg [31:0] RD2E
);
//----------------------------------------  
  
always@(posedge clk)
begin
    RegWriteE<=RegWriteD;
    MemtoRegE<=MemtoRegD;    
    MemWriteE<=MemWriteD;    
    ALUControlE<=ALUControlD;    
    ALUSrcE<=ALUSrcD;    
    RegDstE<=RegDstD; 
    RsE<=RsD;    
    RtE<=RtD;    
    RdE<=RdD;    
    SignImmE<=SignImmD;    
	RD1E<=RD1;
    RD2E<=RD2;

    if (CLR)
      begin
        RegWriteE<=1'b0;
        MemtoRegE<=1'b0;    
        MemWriteE<=1'b0;    
        ALUControlE<=3'b0;    
        ALUSrcE<=1'b0;    
        RegDstE<=1'b0; 
        RsE<=5'b0;    
        RtE<=5'b0;    
        RdE<=5'b0;    
        SignImmE<=32'b0;
		RD1E<=32'b0;
		RD2E<=32'b0;
      end
  
end  
  
endmodule
