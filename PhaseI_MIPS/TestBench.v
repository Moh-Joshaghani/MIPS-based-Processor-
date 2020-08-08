`timescale 1ns/1ps
`define INS_EXTR //fills instruction memory with instruction.dat
`define REG_EXTR //fills Register file with register.dat
`define DATA_EXTR //fills data memory memory with memory.dat

module TestBench;

//  variables to test Data_Memory
parameter data_size=512;
reg [31:0] A;
reg clk;
reg [31:0] WD;
reg WE;
wire [31:0] RD;
integer i;



Data_Memory DUT_DM (A,clk,WE,RD,WD);
defparam DUT_DM.memsize=data_size;


//  variables to test ALU
reg [31:0] SrcAE;
reg [31:0] SrcBE;
reg [3:0] ALUCtrlE;
wire [31:0] ALUOutE;
wire Zero;

ALU DUT_ALU(SrcAE,SrcBE,ALUCtrlE,ALUOutE,Zero);


//  variables to test Register File
reg [4:0] A1;
reg [4:0] A2;
reg [4:0] A3;
reg [31:0] WD3;
reg WE3;
wire [31:0] RD1;
wire [31:0] RD2;

Register_File DUT_RF (A1,A2,A3,RD1,RD2,WD3,WE3,clk);


//  variables to test Instruction Memory
reg [31:0] Ai;
wire [31:0] RDi;
parameter instr_size=256;
Instr_Memory DUT_IM(Ai,RDi);
defparam DUT_IM.memsize=instr_size;



// generating clock
initial 
  begin
    clk = 0;
  end  
  always @(*)
  begin
   clk <=#5 ~clk;
  end


// ********************** checking register file

initial 
  begin
    `ifdef REG_EXTR
   $display("testing Register FIle      ***");
   $readmemb ("register.dat",DUT_RF.register);
   $display("******************************");
 
 //init
`endif//ifdef
	// verifying module
    WD3=32'h00000000;  
 $display("reading current registers:" );
//verifying reads from external file  
for (i=0;i<31;i=i+2)   
 begin
    A1=i;
   A2=i+1;
   #20 
   $display("A1=%d ,RD1=%d  ***   A2=%d ,RD2=%d",A1,RD1,A2,RD2);    
  end
  
 $display("________________________________________")   ;
 $display("****************************************")   ;
 $display("write and verify write")   ;
 
 for (i=1;i<30;i=i+1)   
 begin
   A3=i;
   #1 WE3=1;
   A1=i-1;
   A2=i; 
   #13 WE3=0;
   $display("A3=%d, WD3=%d  ***  A2=%d, RD2=%d",A3,WD3,A2,RD2) ;
   #13 WD3=WD3+32'h00000001;   
  end
 
   //  $stop;
  
  

  
  //---------------------------------------------
  //****************************** checking ALU
  


   $display("******************************************");
   $display("             Testing ALU                  ");
   $display("******************************************");
 
 

  ALUCtrlE=3'b000;
  SrcAE=32'h0000F000;
  SrcBE=32'h000000FF;

  $display("checking alu functions :" );
  for (i=0;i<8;i=i+1)   
   begin
    #5
    case (ALUCtrlE)
      4'b0000: $display("and:");
      4'b0001: $display("OR:");
      4'b0010: $display("add:");
      4'b0011: $display("slt");
      4'b0100: $display("XOR");
      4'b0101: $display("NOR");
      4'b0110: $display("sub");
      4'b0111: $display("lui");
    endcase
    
    $display("SrcAE=%h    ,SrcBE=%h   ,ALUCtrlE=%d    ***   ALUOutE=%h   Zero=%d",SrcAE,SrcBE,ALUCtrlE,ALUOutE,Zero);    
    #5 ALUCtrlE=ALUCtrlE+4'b0001;
   end
  
  $display("           DONE                ")   ;


  
  
  
//******************** Data Memory
  `ifdef DATA_EXTR

   $display(" reading memory.dat ***"); 
   $readmemb("memory.dat",DUT_DM.memory);
   $display("***********************"); 
 
`endif//ifdef


  WD=32'h00000000;  
 $display("reading all data memory  :" );
//verifying reads from external file  
for (i=0;i<data_size;i=i+4)   
 begin
   #10 A=i;

   $display("address=%d  ======>  data=%d",(A>>2),RD);    
  end
  
 $display("________________________________________")   ;
 $display("****************************************")   ;
 $display("write and verify writen data")   ;
 
 for (i=1;i<data_size;i=i+4)   
 begin
   A=i;
   #1 WE=1;
   #13 WE=0;
   $display("Adress=%d =========> data=%d ",(A>>2),WD) ;
   #13 WD=WD+32'h00000001;   
  end
 
//     $stop;




  //****************************** instruction file

`ifdef INS_EXTR

   $display(" reading instruction.dat ***"); 
   $readmemb("instruction.dat",DUT_IM.memory);
   $display("***********************"); 

`endif//ifdef

 $display("reading all instructions in memory  :" );
//verifying reads from external file  
for (i=0;i<instr_size;i=i+4)   
 begin
   Ai=i;
   

   #5 $display("address=%d  ======>  instr=%d",(Ai>>2),RDi);    
  end
  
  
     $stop;
  end  
  
  
 







endmodule