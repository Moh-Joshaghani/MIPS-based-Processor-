

module Register_File(
input  wire [4:0] AR1_CU2RF, 
input  wire [4:0] AR2_CU2RF,
//----
input  wire        WE2,
input  wire [31:0] ResultW2,
input  wire  [4:0] WriteReg2,
input  wire        WE1,
input  wire [31:0] ResultW1,
input  wire  [4:0] WriteReg1,
input  wire  [4:0] Ar7,
input  wire  [4:0] Ar6,
input  wire  [4:0] Ar5,
input  wire  [4:0] AR1_ALU2, 
input  wire  [4:0] AR2_ALU2,
input  wire  [4:0] AR1_ALU1, 
input  wire  [4:0] AR2_ALU1,
input  wire clk,

output reg [31:0] R1_RF2CU, 
output reg [31:0] R2_RF2CU, 
output reg [31:0] Rd7,
output reg [31:0] Rd6, 
output reg [31:0] Rd5,
output reg [31:0] R1_RF2ALU2,
output reg [31:0] R2_RF2ALU2 ,
output reg [31:0] R1_RF2ALU1 ,
output reg [31:0] R2_RF2ALU1 ,
input  wire[4:0] Ar8,
output reg [31:0] Rd8,
output reg [31:0] Rd9 ,
output reg [31:0] Rd10 ,
output reg [31:0] Rd11 ,
input  wire [4:0]  Ar9,
input  wire [4:0]  Ar10,
input  wire [4:0]  Ar11
);

//variabes
reg [31:0] register [0:31];//adress  ezafe she mire paeen
integer i;

initial 
begin
  for (i=0;i<32;i=i+1)
      register[i]<=32'b0;  
end 
 
 
//read regs from file
//these sould be in testbench only.
// $readmemb ("register.dat",register);
// #display("******************");


  
// assign RD1=(A1==5'b0)? 32'b0:register[A1];
// assign RD2=(A2==5'b0)? 32'b0:register[A2];
 
always @ (*)
begin
      if(AR1_CU2RF!=0)
          R1_RF2CU = register[AR1_CU2RF];
      else   
          R1_RF2CU = 0;

      if(AR2_CU2RF!=0)
          R2_RF2CU = register[AR2_CU2RF];
      else   
          R2_RF2CU = 0;

      if(Ar5!=0)
          Rd5 = register[Ar5];
      else   
          Rd5 = 0;

      if(Ar6!=0)
          Rd6 = register[Ar6];
      else   
          Rd6 = 0;
          
      if(Ar7!=0)
          Rd7 = register[Ar7];
      else   
          Rd7 = 0;
	
	  if(Ar8!=0)
          Rd8 = register[Ar8];
      else   
          Rd8 = 0;	
	if(Ar9!=0)
          Rd9 = register[Ar9];
      else   
          Rd9= 0;	
		  
	if(Ar10!=0)
          Rd10 = register[Ar10];
      else   
          Rd10 = 0;	
	if(Ar11!=0)
          Rd11 = register[Ar11];
      else   
          Rd11 = 0;			  
//
      if(AR1_ALU2!=0)
          R1_RF2ALU2 = register[AR1_ALU2];
      else   
          R1_RF2ALU2 = 0;
      if(AR2_ALU2!=0)
          R2_RF2ALU2 = register[AR2_ALU2];
      else   
          R2_RF2ALU2 = 0;
          
      if(AR1_ALU1!=0)
          R1_RF2ALU1 = register[AR1_ALU1];
      else   
          R1_RF2ALU1 = 0;

      if(AR2_ALU1!=0)
          R2_RF2ALU1 = register[AR2_ALU1];
      else   
          R2_RF2ALU1 = 0;
          
       if(WE1)
         register[WriteReg1] = ResultW1; 
              
       if(WE2)
         register[WriteReg2] = ResultW2;    
   
/*  //new hazard cases
  if(WE3==1 && A3==A1)  
    RD1=WD3;
  if(WE3==1 && A3==A2)
    RD2=WD3; */
    
end //alw




endmodule

