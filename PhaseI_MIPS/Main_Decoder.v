module Main_Decoder(
input  wire [5:0] Op	   ,
output reg [3:0] ALUOp    ,
output reg       MemtoRegD,
output reg       MemWriteD,
output reg       BranchD  ,
output reg       ALUSrcD  ,
output reg       RegDstD  ,
output reg       RegWriteD,
output reg       ZeroOrSign);

//-----------------------------------------------


//-----------------------------------------------
always @(Op)
 case(Op)
//******************   
  6'b000000: //R-type
     	{ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01100000000;  	
 	6'b000010: //j
	    {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b00XXX0XXX1; 	 
	6'b000100: //be
    	 {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b00x010x0111 ; 	 
	6'b000101: //bne
	    {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b00x010x0111 ; //????=be??????
//*******************
	6'b001000: //addi
   	  {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01010000001; 	 
	6'b001001: //addiu
	    {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01010000001;  //??	   	
	6'b000110: //slti
    	 {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01010000010;	 //??
  6'b001011: //sltiu
     	{ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01010001010;  //??	
	6'b001100: //andi
	    {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b11010000011;  //?? 		 
	6'b001101: //ori
    	 {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b11010000100; 	//?? 
	6'b001110: //xori
    	 {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b11010000101;  //??	
  6'b001111: //lui	
     	{ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01010000110;  //??
//*******************
  6'b101011: //sw
	    {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b00X101X1000;	 
  6'b100011: //lw
     	{ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b01010011001;
  default: 	
      {ZeroOrSign,RegWriteD,RegDstD,ALUSrcD,BranchD,MemWriteD,MemtoRegD,ALUOp} = 11'b00;
endcase 


endmodule




