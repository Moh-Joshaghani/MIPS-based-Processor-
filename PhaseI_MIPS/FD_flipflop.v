module FD_flipflop (
 input  wire        clk,
 input  wire [31:0] RD,
 input  wire [31:0] PCPlus4F,
 input  wire        CLR,
 input  wire        EN,
 output reg [31:0] InstrD,
 output reg [31:0] PCPlus4D
 );
//----------------------------------------  
  
always@(posedge clk)
begin
  if (EN)
  begin
    
    if (CLR)
      begin
        InstrD<=32'b0;
        PCPlus4D<=32'b0;
      end
    else 
      begin
        InstrD<=RD;
        PCPlus4D<=PCPlus4F;
      end
  end
 end//EN
  
endmodule