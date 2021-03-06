/* ALUCtrlE[2:0]:
0000: and,andi
0001: or,ori
0010: add,addu,addi,addiu
0011: slt,sltu,slti,sltui
0100: xor,xori
0101: nor, 
0110: sub,subu,subi,
0111: lui
1000: 
1001:
1010:
*/


module ALU(
SrcAE,
SrcBE,
ALUCtrlE,
ALUOutE,
Zero
);
input [31:0] SrcAE;
input [31:0] SrcBE;
input [3:0] ALUCtrlE;
output [31:0] ALUOutE;
output Zero;
reg [31:0] ALUOutE;
reg Zero;
always @(SrcAE or SrcBE or ALUCtrlE) 
 begin


case (ALUCtrlE)
  4'b0000: //and
   begin
     ALUOutE = SrcAE & SrcBE;
     if (ALUOutE == 32'b0) 
      Zero = 1'b1;
     else 
      Zero = 1'b0;   
   end//

  4'b0001://OR
   begin
    ALUOutE = SrcAE | SrcBE;
    if (ALUOutE == 32'b0) 
     Zero = 1'b1;    
    else 
     Zero = 1'b0;
      
   end //
   
  4'b0010://add
   begin
     ALUOutE = SrcAE + SrcBE;
     if (ALUOutE == 32'b0)
     Zero = 1'b1;
     else 
     Zero = 1'b0; 
   end//
   
  4'b0011: //slt
   begin
    if ((SrcAE - SrcBE) < 0) 
     ALUOutE = 32'b1;    
    else 
      begin
       ALUOutE = 32'b0; 
       Zero=1;
      end     
   end//
   
  4'b0100: //xor
   begin
     ALUOutE=SrcAE^SrcBE;
     if (ALUOutE ==32'b0)
       Zero=1'b1;
    else
       Zero=1'b0; 
   end
   
  4'b0101://nor
   begin
    ALUOutE = (~(SrcAE|SrcBE));
    if (ALUOutE == 32'b0) 
     Zero = 1'b1;    
    else 
     Zero = 1'b0; 
   end
   
  4'b0110: //sub
   begin
    ALUOutE = SrcAE - SrcBE;
    if (ALUOutE == 32'b0) 
     Zero = 1'b1;
    else 
     Zero = 1'b0;     
   end //
   
  4'b0111: //lui of srcA
   begin
    ALUOutE={SrcAE[31:16],16'b0};
   end
   
  default:ALUOutE=0; 
endcase

end //always


endmodule
