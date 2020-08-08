/*

*/
`timescale 1ns/1ns
module StrBuffer(
input  wire [31:0] Str_Instr, 
input  wire [31:0] Str_InstrNO, 
input  wire        Str_DR,
input  wire        clk,
input  wire        rst,
input  wire        Strrs_RD,
input  wire        Stroffset_RD,
input  wire        Strrt_RD,

output reg         Strbuffer_ready,
//-- ROB signals

output reg  [31:0] StrInstrNO_ROB, //issue

output reg  [4:0]  Str_rs,
output reg  [4:0]  Str_rt,
output reg  [15:0] Str_offset,
output reg  [31:0] StrInstrNO2ROB,
output reg  [31:0] StrInstr2ROB, //issue
//--

output reg  [31:0] Instr_Strpath,
output reg  [31:0] InstrNO_Strpath,
output reg		   chk_s

);

reg [31:0] StrBuf [0:30]; //saves intructions and numbers
reg [30:0] BC_indx; //ke kodum buffer rafte ta badan shift bede.
reg [4:0]  end_buffer; //indicates last valid data
reg		   sent;
//--------
integer Icounter;
integer Jcounter;
//reg [1:0] commit_counter;
//-------
reg [5:0] OP;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [15:0] addr;
integer max;

always@ (posedge clk)
begin
  if(end_buffer>8)
		max = 8;
  else
		max = end_buffer ; 
  //commit_counter =2'b0;  
  sent = 1'b0;
  if (rst)
  begin
      end_buffer=5'b0; 
      Strbuffer_ready=1'b0;
      BC_indx = 31'b0;
	  sent = 1'b0;
  end
  
  
  else
  begin
//------------------------------
  
// #1 : ersale dasturate amade be op provider    
	  #5
      for (Icounter=0; Icounter<max; Icounter=Icounter+2)
      begin
            if (BC_indx[Icounter] !=1  && sent ==1'b0)
            begin
               
                  OP   = StrBuf[Icounter][31:26];
                  rs   = StrBuf[Icounter][25:21];
                  rt   = StrBuf[Icounter][20:16];                  
                  addr = StrBuf[Icounter][15:0];                  
    
                  if (OP == 6'b101011)
                  begin
                        Str_rs = rs;
                        Str_rt = rt;
                        Str_offset = addr;
                        
                        StrInstrNO2ROB = StrBuf[Icounter+1];
						chk_s = 1'b1;
                        #0.5 
                        if (Strrs_RD == 1'b1 && Stroffset_RD == 1'b1 && Strrt_RD == 1'b1)
                        begin
                         
                            {Instr_Strpath,InstrNO_Strpath,BC_indx[Icounter],StrInstrNO_ROB,StrInstr2ROB}
                              ={StrBuf[Icounter],StrBuf[Icounter+1],1'b1,StrBuf[Icounter+1],StrBuf[Icounter]};
                            sent = 1'b1;
							chk_s=1'bx;	
                        end
                        else
                              chk_s=1'bx;
                            
                        
                  
                  end    
                    
                
            end
        
      end// for
      
//-------------------------------------
// #2 : dasturayi ro ke ferestad shift bede bala      
       for (Icounter=0; Icounter<end_buffer; Icounter=Icounter+2)
      begin
            if (BC_indx[Icounter] ==1)
            begin
                BC_indx[Icounter] =0 ;              
                for (Jcounter=Icounter;Jcounter<end_buffer;Jcounter=Jcounter+1)
                begin
                      StrBuf[Jcounter] = StrBuf[Jcounter+2];                     
                end                
                end_buffer= end_buffer - 2'b10;   
            end
      
      end // for
      
      
  end     // else rst
end// always


//---------------------------------  
//3: khandane instr haye jadid  
always@(Str_InstrNO,Str_DR,Str_Instr)
begin
      if(Strbuffer_ready && Str_DR)
      begin
            StrBuf[end_buffer] = Str_Instr;
            StrBuf[end_buffer+1'b1] = Str_InstrNO;        
            end_buffer = end_buffer+2'b10;
      end
          if (end_buffer <5'b11011)
        Strbuffer_ready = 1'b1;
		 else
       Strbuffer_ready = 1'b0;
  
end//always


  
endmodule

