module PC_flipflop (
 input  wire        clk,
 input  wire        EN,
 input  wire [31:0] PC,
 input  wire        RST,
 output reg [31:0] PCF
);
//----------------------------------------  
  
always@(posedge clk)
begin
 if(EN)
   PCF<=PC; 
 
  if (RST)
   PCF<=32'b0;      
end  
  
endmodule



