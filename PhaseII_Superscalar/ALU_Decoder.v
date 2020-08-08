/*
ALUOp 	Meaning
-----	--------
00 		add
01 		subtract
10 		look at funct field
11		n/a
*/


/*
ALUOp	 Funct 			ALUControl
-----	 ------	    	-----------
00   	   X			      010 (add)
X1 		    X 		    	 110 (subtract)
1X 		100000(add)	     010 (add)
1X 		100010 (sub) 	 110 (subtract)
1X 		100100 (and)	 000 (and)
1X 		100101 (or)		 001 (or)
1X 		101010 (slt) 	 111 (set less than)
*/

/* ALUCtrlE[2:0]:
000: and,andi
001: or,ori
010: add,addu,addi,addiu
011: slt,sltu,slti,sltui
100: xor,xori
101: nor, 
110: sub,subu,subi,
111: lui */


module ALU_Decoder(
input  wire [5:0] Funct ,
input  wire [3:0] ALUOp,
output reg  [3:0] ALUControlD);

//---------------------------------------------------------



//---------------------------------------------------------
always @ (*)
begin
  case (ALUOp[3:0])
  4'b0001:ALUControlD = 4'b0010; //addi
  4'b0010:ALUControlD = 4'b0011; //slti
	4'b0011:ALUControlD = 4'b0000; //andi
	4'b0100:ALUControlD = 4'b0001; //ori
	4'b0101:ALUControlD = 4'b0100; //xori
	4'b0110:ALUControlD = 4'b0111; //lui
	4'b0111:ALUControlD = 4'b0010; //beq , bneq???
	4'b1000:ALUControlD = 4'b0010; //sw??
	4'b1001:ALUControlD = 4'b0010; //lw??
	
    4'b0000:begin
            case (Funct[5:0]) //add, sub, addu, subu, and, or, xor, nor, slt, sltu
              6'b100000: ALUControlD = 4'b0010;  //add
              6'b100001: ALUControlD = 4'b0010;  //addu
              6'b100010: ALUControlD = 4'b0110;  //sub
              6'b100011: ALUControlD = 4'b0110;  //subu
              6'b100100: ALUControlD = 4'b0000;  //and
              6'b100101: ALUControlD = 4'b0001;  //or
              6'b100110: ALUControlD = 4'b0100;  //xor
              6'b100111: ALUControlD = 4'b0101;  //nor
        //***************************
              6'b101010: ALUControlD = 4'b0011;  //slt         
              6'b101011: ALUControlD = 4'b1000;  //sltu         
           endcase
  
         end
      default: ALUControlD=4'b0000;   
      endcase
end

endmodule
