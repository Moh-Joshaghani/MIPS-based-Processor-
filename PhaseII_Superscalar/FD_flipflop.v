module FD_flipflop (
 input  wire        clk,
 input  wire        CLR,

 
 input  wire [31:0] InstrF0,
 input  wire [31:0] InstrF1,
 input  wire [31:0] InstrF2,
 input  wire [31:0] InstrF3,
 input  wire [31:0] InstrF4,
 input  wire [31:0] InstrF5,
 input  wire [31:0] InstrF6,
 input  wire [31:0] InstrF7,
 
 output reg [31:0] InstrD0,
 output reg [31:0] InstrD1,
 output reg [31:0] InstrD2,
 output reg [31:0] InstrD3,
 output reg [31:0] InstrD4,
 output reg [31:0] InstrD5,
 output reg [31:0] InstrD6,
 output reg [31:0] InstrD7,
 input  wire [31:0] PC0in,
 input  wire [31:0] PC1in,
 input  wire [31:0] PC2in,
 input  wire [31:0] PC3in,
 input  wire [31:0] PC4in,
 input  wire [31:0] PC5in,
 input  wire [31:0] PC6in,
 input  wire [31:0] PC7in,
 
 
 output reg [31:0] PC0out,
 output reg [31:0] PC1out,
 output reg [31:0] PC2out,
 output reg [31:0] PC3out,
 output reg [31:0] PC4out,
 output reg [31:0] PC5out,
 output reg [31:0] PC6out,
 output reg [31:0] PC7out  
 );
//----------------------------------------  
  
always@(posedge clk)
begin
  
  
    
    if (CLR)
      begin
        InstrD0<=32'b0;
        InstrD1<=32'b0;
        InstrD2<=32'b0;
        InstrD3<=32'b0;
        InstrD4<=32'b0;
        InstrD5<=32'b0;
        InstrD6<=32'b0;
        InstrD7<=32'b0;        

      end
    else 
      begin
        InstrD0<=InstrF0;
        InstrD1<=InstrF1;
        InstrD2<=InstrF2;
        InstrD3<=InstrF3;
        InstrD4<=InstrF4;
        InstrD5<=InstrF5;
        InstrD6<=InstrF6;
        InstrD7<=InstrF7;
	    PC0out<=PC0in;
		PC1out<=PC1in;
		PC2out<=PC2in;
		PC3out<=PC3in;
		PC4out<=PC4in;
		PC5out<=PC5in;
		PC6out<=PC6in;
		PC7out<=PC7in;


 	end
  end
 
  
endmodule