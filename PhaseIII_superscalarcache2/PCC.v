/* 
  -- cache nadaram

*/
`timescale 1ns/1ns
module PCC(

input  wire [31:0] InstrF0,
input  wire [31:0] InstrF1,
input  wire [31:0] InstrF2,
input  wire [31:0] InstrF3,
input  wire [31:0] InstrF4,
input  wire [31:0] InstrF5,
input  wire [31:0] InstrF6,
input  wire [31:0] InstrF7,
input  wire        new_PC,
input  wire [31:0] next_PC0,
input  wire [31:0] next_PC1,
input  wire [31:0] next_PC2,
input  wire [31:0] next_PC3,
input  wire [31:0] next_PC4,
input  wire [31:0] next_PC5,
input  wire [31:0] next_PC6,
input  wire [31:0] next_PC7,
//_____________________
output wire  [31:0] PC_0,
output wire  [31:0] PC_1,
output wire  [31:0] PC_2,
output wire  [31:0] PC_3,
output wire  [31:0] PC_4,
output wire  [31:0] PC_5,
output wire  [31:0] PC_6,
output wire  [31:0] PC_7


);
reg [31:0] instrs [0:7] ;
integer i1,i2;
reg [31:0] next_addr ;
reg [31:0] PCs [0:7] ;

assign PC_0 = PCs[0];
assign PC_1 = PCs[1];
assign PC_2 = PCs[2];
assign PC_3 = PCs[3];
assign PC_4 = PCs[4];
assign PC_5 = PCs[5];
assign PC_6 = PCs[6];
assign PC_7 = PCs[7];


always@(next_PC0,next_PC1,next_PC2,next_PC3,next_PC4,next_PC5,next_PC6,next_PC7,new_PC)
begin
if(new_PC == 1'b1)
begin
	PCs[0] =next_PC0; 
	PCs[1] =next_PC1; 
	PCs[2] =next_PC2; 
	PCs[3] =next_PC3; 
	PCs[4] =next_PC4; 
	PCs[5] =next_PC5; 
	PCs[6] =next_PC6; 
	PCs[7] =next_PC7; 
	#0.2
	instrs[0]=InstrF0;
	instrs[1]=InstrF1;
	instrs[2]=InstrF2;
	instrs[3]=InstrF3;
	instrs[4]=InstrF4;
	instrs[5]=InstrF5;
	instrs[6]=InstrF6;
	instrs[7]=InstrF7;

	for(i1=0; i1<8; i1 = i1+1)
	begin
		if(instrs[i1][31:16] == 16'h1000  )
		begin
			next_addr = $signed(PCs[i1]) + $signed((instrs[i1][15:0])<<2) + $signed(4'b0100);
			PCs[i1] = next_addr;
			for ( i2 = i1+1; i2<8; i2= i2+1)
			begin
				PCs[i2] = PCs[i2-1] + 4'b0100;
			end
			i1 = i1+100;
		end
			
	end

end
end


endmodule


