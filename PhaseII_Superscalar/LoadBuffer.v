/*

*/
`timescale 1ns/100ps
module LoadBuffer(
input  wire [31:0] Ld_Instr, 
input  wire [31:0] Ld_InstrNO, 
input  wire        Ld_DR,
input  wire        clk,
input  wire        rst,
input  wire        Ldrs_RD,
input  wire        Ldoffset_RD,
input  wire        Ldrt_RD,

output reg         Ldbuffer_ready,
//-- ROB signals

output reg  [31:0] LdInstrNO_ROB, //issue

output reg  [4:0]  Ld_rs,
output reg  [4:0]  Ld_rt,
output reg  [15:0] Ld_offset,
output reg  [31:0] Ld_InstrNO_Issue,// not issue
output reg  [31:0] Ld_Instr_Issue,
//--

output reg  [31:0] Instr_LdBuf,
output reg  [31:0] LdInstrNO_DM,
output reg         chk_l

);

reg [31:0] LdBuf [0:30]; //saves intructions and numbers
reg [30:0] BC_indx; //ke kodum buffer rafte ta badan shift bede.
reg [4:0] end_buffer; //indicates last valid data
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
reg       sent;
integer max;

always@ (posedge clk)
begin
  
  sent= 1'b0;
 // commit_counter =2'b0;  
  if(end_buffer>8)
		max = 8;
  else
		max = end_buffer ;  
  if (rst)
  begin
      end_buffer=5'b0; 
      Ldbuffer_ready=1'b0;
      BC_indx = 31'b0;
	  sent=1'b0;
  end
  
  
  else
  begin
//------------------------------

// #1 : ersale dasturate amade be op provider    
	 #4
      for (Icounter=0; Icounter<max; Icounter=Icounter+2)
      begin
            if (BC_indx[Icounter] !=1 && sent == 1'b0)
            begin
               
                  OP   = LdBuf[Icounter][31:26];
                  rs   = LdBuf[Icounter][25:21];
                  rt   = LdBuf[Icounter][20:16];                  
                  addr = LdBuf[Icounter][15:0];                  
    
                  if (OP == 6'b100011)
                  begin
                        Ld_rs = rs;
                        Ld_rt = rt;
                        Ld_offset = addr;
                        Ld_InstrNO_Issue = LdBuf[Icounter+1];
						chk_l =1'b1;
                        #0.5 //////????????????????????????????????????????????????????????????????
                           //// ???????????????????????????????
                        if (Ldrs_RD == 1'b1 && Ldoffset_RD == 1'b1 && Ldrt_RD == 1'b1)
                        begin
                         
                            {Instr_LdBuf,LdInstrNO_DM,BC_indx[Icounter],LdInstrNO_ROB,Ld_Instr_Issue}
                              ={LdBuf[Icounter],LdBuf[Icounter+1],1'b1,LdBuf[Icounter+1],LdBuf[Icounter]};
							sent = 1'b1;
							chk_l = 1'b0;	
                        end
						else
							chk_l = 1'b0;
                  
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
                      LdBuf[Jcounter] = LdBuf[Jcounter+2];                     
                end                
                end_buffer= end_buffer - 2'b10;   
            end
      
      end // for
      
      
  end     // else rst
end// always


//---------------------------------  
//3: khandane instr haye jadid  
always@(Ld_InstrNO,Ld_DR,Ld_Instr)
begin
      if(Ldbuffer_ready && Ld_DR)
      begin
            LdBuf[end_buffer] = Ld_Instr;
            LdBuf[end_buffer+1'b1] = Ld_InstrNO;        
            end_buffer = end_buffer+2'b10;
      end
      
       if (end_buffer <5'b11011)
        Ldbuffer_ready = 1'b1;
		 else
       Ldbuffer_ready = 1'b0; 
      
  
end//always


  
endmodule
