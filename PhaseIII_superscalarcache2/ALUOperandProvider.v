`timescale 1ns/100ps
module ALUOperandProvider(
input  wire [31:0] InstrE,
input  wire [31:0] InstrNOE,

//--regfile
output reg  [4:0]  AR1_RF,
output reg  [4:0]  AR2_RF,
//--ALU
output reg  [3:0]  ALU_Func,
//output reg  [31:0] ALUSrcA,
//output reg  [31:0] ALUSrcB,
output reg  [15:0] Imm,
output reg         SrcBsel,
output reg         s_z
);
reg [5:0] OP;
reg  [5:0] Func;
reg [3:0] ALUOp;

always@(InstrE,InstrNOE)
begin
      AR1_RF = InstrE[25:21];
      AR2_RF = InstrE[20:16]; //rt
      OP = InstrE[31:26];
      Imm = { {16 {InstrE[15]} } ,InstrE[15:0] };
      Func = InstrE [5:0];
      #0.1
      case(OP)
            6'b000000: //R-type
               	{s_z,SrcBsel,ALUOp} = 6'b000000;  	
//****************************************************
           	6'b001000: //addi
           	    {s_z,SrcBsel,ALUOp} = 6'b010001; 	 
           	6'b001001: //addiu
           	    {s_z,SrcBsel,ALUOp} = 6'b010001;  //??	   	
            6'b000110: //slti
               	{s_z,SrcBsel,ALUOp} = 6'b010010;	 //??
            6'b001011: //sltiu
               	{s_z,SrcBsel,ALUOp} = 6'b011010;  //??	
            6'b001100: //andi
           	    {s_z,SrcBsel,ALUOp} = 6'b110011;  //?? 		 
           	6'b001101: //ori
              	 {s_z,SrcBsel,ALUOp} = 6'b110100; 	//?? 
           	6'b001110: //xori
              	 {s_z,SrcBsel,ALUOp} = 6'b110101;  //??	
            6'b001111: //lui	
               	{s_z,SrcBsel,ALUOp} = 6'b010110;  //??
//*******************
            default: 	
                {s_z,SrcBsel,ALUOp} = 6'b111111;
      endcase 
      
      #0.1
      
//___________________ moshakhas kardane kare ALU _____________
      
      case (ALUOp[3:0])
            4'b0001:ALU_Func = 4'b0010; //addi
            4'b0010:ALU_Func = 4'b0011; //slti
           	4'b0011:ALU_Func = 4'b0000; //andi
           	4'b0100:ALU_Func = 4'b0001; //ori
           	4'b0101:ALU_Func = 4'b0100; //xori
           	4'b0110:ALU_Func = 4'b0111; //lui
           	4'b0111:ALU_Func = 4'b0010; //beq , bneq???
           	4'b1000:ALU_Func = 4'b0010; //sw??
           	4'b1001:ALU_Func = 4'b0010; //lw??
	
            4'b0000:
            begin
               case (Func[5:0]) //add, sub, addu, subu, and, or, xor, nor, slt, sltu
                    6'b100000: ALU_Func = 4'b0010;  //add
                    6'b100001: ALU_Func = 4'b0010;  //addu
                    6'b100010: ALU_Func = 4'b0110;  //sub
                    6'b100011: ALU_Func = 4'b0110;  //subu
                    6'b100100: ALU_Func = 4'b0000;  //and
                    6'b100101: ALU_Func = 4'b0001;  //or
                    6'b100110: ALU_Func = 4'b0100;  //xor
                    6'b100111: ALU_Func = 4'b0101;  //nor
              //***************************
                    6'b101010: ALU_Func = 4'b0011;  //slt         
                    6'b101011: ALU_Func = 4'b1000;  //sltu         
                endcase  
            end
            default: ALU_Func=4'b0000;   
      endcase
      
      
      
      
          
  
end



endmodule