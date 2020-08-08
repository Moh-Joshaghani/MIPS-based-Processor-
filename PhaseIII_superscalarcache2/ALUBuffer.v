/*

*/
`timescale 1ns/100ps
module ALUBuffer(
input  wire [31:0] ALU_Instr, 
input  wire [31:0] ALU_InstrNO, 
input  wire        ALU_DR,
input  wire        clk,
input  wire        rst,
input  wire        ALUrs_RD,
input  wire        ALUrd_RD,
input  wire        ALUrt_RD,

output reg         ALUbuffer_ready,
//-- ROB signals

output reg  [31:0] ALUInstrNO0_Issued,
output reg  [31:0] ALUInstr0_Issued,
//output reg  [4:0]  ALU_DReg1,
output reg  [31:0] ALUInstrNO1_Issued,
output reg  [31:0] ALUInstr1_Issued,
output reg  [4:0]  ALU_rs,
output reg  [4:0]  ALU_rt,
output reg  [4:0]  ALU_rd,
output reg  [31:0] ALU_InstrNO2ROB,
//--

output reg  [31:0] InstrE0,
output reg  [31:0] InstrNO0_E,

output reg  [31:0] InstrE1,
output reg  [31:0] InstrNO1_E,
output reg         chk_ab
);

reg [31:0] InstrBuf [0:30]; //saves intructions and numbers
reg [30:0] BC_indx; //ke kodum buffer rafte ta badan shift bede.
reg [4:0] end_buffer; //indicates last valid data
//--------
integer Icounter;
integer Jcounter;
reg [1:0] commit_counter;
//-------
reg [5:0] OP;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [15:0] addr;
reg cc;

//(OP == 6'b000100 ||OP == 6'b000101 ||OP == 6'b001000 ||OP == 6'b001001 ||OP == 6'b000110 ||
                     //       OP == 6'b000110 ||OP == 6'b001011 ||OP == 6'b001100 ||OP == 6'b001101 ||OP == 6'b001110 ||
                       //     OP == 6'b001111 ||OP == 6'b101011 ||OP == 6'b100011) 






always@ (posedge clk)
begin
 if (end_buffer <5'b11010)
        ALUbuffer_ready = 1'b1;
	    else 	
	       ALUbuffer_ready = 1'b0;

  chk_ab= 1'b1;
  commit_counter =2'b0;  
  
  if (rst)
  begin
      end_buffer=5'b0; 
      ALUbuffer_ready=1'b0;
      BC_indx = 31'b0;
  end
  
  
  else
  begin
//------------------------------
 
// #1 : ersale dasturate amade be op provider    
    #1.5;
      for (Icounter=0; Icounter<end_buffer; Icounter=Icounter+2)
      begin
            if (BC_indx[Icounter] !=1 && commit_counter<2'b10 )
            begin
               
                  OP   = InstrBuf[Icounter][31:26];
                  rs   = InstrBuf[Icounter][25:21];
                  rt   = InstrBuf[Icounter][20:16];                  
                  rd   = InstrBuf[Icounter][15:11];                  
//                  addr = InstrBuf[Icounter][15:0];                  

                  //---- r type
                  if (OP == 6'b0)
                  begin
                        ALU_rs = rs;
                        ALU_rd = rd;
                        ALU_rt = rt;
                        ALU_InstrNO2ROB = InstrBuf[Icounter+1];
						
                        #0.5 //////????????????????????????????????????????????????????????????????
                           //// ???????????????????????????????
                        if ((ALUrs_RD == 1'b1 ||ALU_rs==5'b0) && ALUrd_RD == 1'b1 && (ALUrt_RD == 1'b1||ALU_rt==5'b0) )
                        begin
                          if (commit_counter == 2'b0)
						  begin
                               {InstrE0,InstrNO0_E,commit_counter,BC_indx[Icounter],ALUInstrNO0_Issued,ALUInstr0_Issued}
                              ={InstrBuf[Icounter],InstrBuf[Icounter+1],2'b01,1'b1,InstrBuf[Icounter+1],InstrBuf[Icounter]};
							 #3   InstrE0 = InstrBuf[Icounter]; 
						  end	  
                          else if (commit_counter == 2'b1)
                              {InstrE1,InstrNO1_E,commit_counter,BC_indx[Icounter],ALUInstrNO1_Issued,ALUInstr1_Issued}
                              ={InstrBuf[Icounter],InstrBuf[Icounter+1],2'b10,1'b1,InstrBuf[Icounter+1],InstrBuf[Icounter]};   

                          
                        end 
                  
                  end    

                  //---- I type
                  else if (OP == 6'b001000 ||OP == 6'b001001 ||OP == 6'b000110 ||
                            OP == 6'b000110 ||OP == 6'b001011 ||OP == 6'b001100 ||OP == 6'b001101 ||OP == 6'b001110 ||
                            OP == 6'b001111 ||OP == 6'b101011 ||OP == 6'b100011)                             
                  begin
                        ALU_rs = rs;
                        ALU_rt = rt;
                        ALU_InstrNO2ROB = InstrBuf[Icounter+1];
                        #0.5 //////????????????????????????????????????????????????????????????????
                           //// ???????????????????????????????
                        if ( (ALUrs_RD == 1'b1 && ALUrt_RD == 1'b1) || (ALU_rs==5'b0 && ALUrt_RD == 1'b1))
                        begin
                          if (commit_counter == 2'b0)
						  begin
                               {InstrE0,InstrNO0_E,commit_counter,BC_indx[Icounter],ALUInstrNO0_Issued,ALUInstr0_Issued}
                              ={InstrBuf[Icounter],InstrBuf[Icounter+1],2'b01,1'b1,InstrBuf[Icounter+1],InstrBuf[Icounter]};
							#3   InstrE0 = InstrBuf[Icounter];
						  end	  
                         else if (commit_counter == 2'b01)
                              {InstrE1,InstrNO1_E,commit_counter,BC_indx[Icounter],ALUInstrNO1_Issued,ALUInstr1_Issued}
                              ={InstrBuf[Icounter],InstrBuf[Icounter+1],2'b10,1'b1,InstrBuf[Icounter+1],InstrBuf[Icounter]};   

                          
                        end      
                  
                  
                  
                  
                  end                      
                
            end
        
      end// for
	  
	  chk_ab = 1'b0;
      
//-------------------------------------
// #2 : dasturayi ro ke ferestad shift bede bala      
      cc=1'b0;
      for (Icounter=0; Icounter<end_buffer; Icounter=Icounter+2)
      begin
//            if (cc==1'b1)
//            begin
//                cc=1'b0;
                
//            end
            if (BC_indx[Icounter] ==1)
            begin
//                cc=1'b1;
                BC_indx[Icounter] =0 ;              
                for (Jcounter=Icounter;Jcounter<end_buffer;Jcounter=Jcounter+2)
                begin
                      InstrBuf[Jcounter] = InstrBuf[Jcounter+2]; 
                      InstrBuf[Jcounter+1] = InstrBuf[Jcounter+3]; 
                      BC_indx[Jcounter] =BC_indx[Jcounter+2]  ;                             
                      BC_indx[Jcounter+1] =BC_indx[Jcounter+3]  ;                                                   
                end                
                end_buffer= end_buffer - 2'b10;  
                Icounter=Icounter-2;
               
            end
      
      end // for
      
      
  end     // else rst
  
  
end// always


//---------------------------------  
//3: khandane instr haye jadid  
always@(ALU_InstrNO,ALU_DR,ALU_Instr)
begin
      if(ALUbuffer_ready && ALU_DR)
      begin
            InstrBuf[end_buffer] = ALU_Instr;
            InstrBuf[end_buffer+1'b1] = ALU_InstrNO;        
            end_buffer = end_buffer+2'b10;
      end
      if (end_buffer <5'b11010)
        ALUbuffer_ready = 1'b1;
	    else 	
	       ALUbuffer_ready = 1'b0;     
      
      
  
end//always


  
endmodule