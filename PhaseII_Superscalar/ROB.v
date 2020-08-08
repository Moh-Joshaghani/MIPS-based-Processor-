// lw = 10001101000011000000000010000000
//mylw = 10001101000000110000000010000000

`timescale 1ns/100ps
module ROB (
input  wire        rst,
input  wire        clk,
//--RF
output reg         WE1,
output reg  [31:0] ResultW1,
output reg  [4:0]  WriteReg1,
output reg         WE2,
output reg  [31:0] ResultW2,
output reg  [4:0]  WriteReg2,
//-- CU
output reg  [31:0] forw_R12CU,
output reg  [31:0] forw_R22CU,
output reg         forwsel_CU1,
output reg         forwsel_CU2,
input  wire [4:0]  AR1_CU2ROB,
input  wire [4:0]  AR2_CU2ROB,
input  wire [31:0] InstrNO_bc0,
input  wire [31:0] InstrNO_bc1,
output reg         R1_stat,
output reg         R2_stat,
input  wire [31:0] Sent_Instr0,
input  wire [31:0] Sent_Instr1,
input  wire [31:0] Sent_Instr2,
input  wire [31:0] Instr_NO0,
input  wire [31:0] Instr_NO1,
input  wire [31:0] Instr_NO2,
//--Ldbuf
output reg         Ldrs_RD,
output reg         Ldrt_RD,
output reg         Ldoffset_RD,
input  wire [4:0]  Ld_rs, 
input  wire [4:0]  Ld_rt, 
input  wire [15:0]  Ld_offset, 
input  wire [31:0] LdInstrNO2ROB, 
input  wire [31:0] Ld_InstrNO_Issue,
input  wire [31:0] Ld_Instr_Issue,
//--strbuf
output reg         Strrs_RD,
output reg         Strrt_RD,
output reg         Stroffset_RD,
input  wire [4:0]  Str_rs,
input  wire [4:0]  Str_rt,
input  wire [15:0]  Str_offset,
input  wire [31:0] Str_InstrNO2ROB,
input  wire [31:0]  Str_InstrNO_Issued,
input  wire [31:0]  Str_Instr_Issued,
//--ALUbuf
input  wire [4:0]  ALU_rs,
input  wire [4:0]  ALU_rt,
input  wire [4:0]  ALU_rd,
input  wire [31:0] ALU_InstrNO2ROB,
input  wire [31:0] ALUInstrNO0_Issued,
input  wire [31:0] ALUInstr0_Issued,
input  wire [31:0] ALU_InstrNO1_Issued,
input  wire [31:0] ALUInstr1_Issued,
output reg         ALUrs_RD,
output reg         ALUrt_RD,
output reg         ALUrd_RD,
//--alu1,2
output reg  [31:0] ROB_FA1,
output reg  [31:0] ROB_FB1 ,
output reg         ROB_FSA1,
output reg         ROB_FSB1,
output reg  [31:0] ROB_FA2,
output reg  [31:0] ROB_FB2 ,
output reg         ROB_FSA2,
output reg         ROB_FSB2,
//--str
output reg         ROB_FSvalue, 
output reg         ROB_FSAddr,
output reg  [31:0] ROB_FAddr,
output reg  [31:0] ROB_Fvalue,
//--ld
output reg         ROB_LdFSAddr,
output reg  [31:0] ROB_LdFAddr, 
//-- wb
input  wire [31:0] ALU1Out,
input  wire [31:0] ALU2Out,
input  wire [31:0] LdData_ROB,
input  wire [31:0] LdInstrNO_DM ,
output reg  [4:0]  Ar8,
input  wire [31:0] Rd8,
input  wire        chk,
input  wire        chk_s,
input  wire 	   chk_l ,
input  wire [31:0] LdInstr_DM ,
input  wire [31:0] Rd9 ,
input  wire [31:0] Rd10 ,
input  wire [31:0] Rd11 ,
output reg  [4:0]  Ar9,
output reg  [4:0]  Ar10,
output reg  [4:0]  Ar11,
input  wire 	   chk_ab
);

//-- memory units
reg [31:0]commit_order [0:200]; /*harki commit shod pak mishe 
          shift mikhore bala -radifaye fard  = stat balayi */
integer CO_end_indx; 
integer CO_counter0,CO_counter1,CO_counter2,CO_counter3;
integer c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c111,c166;
integer j_indx;
integer i1,i2,i3,i4,i5,i6 ;
integer ch1,ch2,ch3,ch4,ch5,ch6,ch7,ch8,ch9,ch9_1,ch10,ch_10,ch10_1,
		ch11,ch11_1,ch12_1;

reg [1:0] bo_e; //branch operand exist
integer c2_counter,c;
reg [5:0] RSA_indx [0:31];
reg [4:0] r_temp;
reg [5:0] r1_temp,r2_temp;
reg [1:0] wb_counter;
reg [7:0] indx_temp7;
reg       brk0,brk1,brk2,brk3,brk4,brk5,brk6,brk7, oo, oo1, oo2, oo3;

reg [5:0] RSA_indx_temp,RSA_indx_temp0,RSA_indx_temp1,RSA_indx_temp2,
          RSA_indx_temp3,RSA_indx_temp4,RSA_indx_temp5,RSA_indxld,
		  RSA_indx_temp6,RSA13_indx_temp,RSA15_indx_temp,RSA14_indx_temp;
reg [10:0] RSA,RSA1,RSA2,RSA3,RSA4,RSA5,RSA10,RSA11,RSA13,RSA14,RSA15,RSA16,RSA17,RSA18,RSA22,RSA23, RSA_temp, RSA_temp1,RSA_temp2,RSA_temp3; // [AR_reg] + [4 bit baraye reg [3:0] RSA_indx          
reg [10:0] RSA_ld;
reg [34:0] Reg_stat [0:(1<<11)-1] ;//sartaye fard meghdare registere 

reg [4:0] rt,rd,rs,rt0,rt1,rt2,rt3,rt4,rd0,rd1,rd2,rd3,rd4,
          rs0,rs1,rs2,rs3,rs4,rt5,rs5,rt6,rs6,rt7,rt55,rt77,rs55;
reg [4:0] op,op1,op2,op3,op4     ;     
reg [15:0] offset,offset0,offset1,offset2;
reg [31:0] addr;

reg [32:0] addr_stat [0:200] ;
reg addr_valid [0:200] ;
integer AS_end ;
reg [31:0] temp_reg;
reg        reg_exist;
reg [31:0] temp_instr0;
reg [7:0] temp_1;
reg [7:0] shift [0:1]; // andise unayi ke tuye commit shift mikhoran
reg [1:0] Ld_c ; // load commited??
reg [31:0] last [0:31]; 
//---- CU 
 
always@(posedge clk)
begin
      if (rst)
      begin
			bo_e = 2'b0;
			CO_end_indx =0;
      for (c1=0;c1<32;c1=c1+1)
        			RSA_indx[c1] =6'b0; 
			ALUrt_RD =1'b0;
			ALUrd_RD =1'b0;
			ALUrs_RD =1'b0;
			AS_end =0;
      end

end     

//#1---saving new instrs    
always@(Instr_NO0)
begin
    
	if(Sent_Instr0[25:21] !=0)
	begin
		last[Sent_Instr0[25:21]] = Instr_NO0;
		RSA = {{Sent_Instr0[25:21]} ,{RSA_indx[Sent_Instr0[25:21]]}}; 
		Reg_stat[RSA] = {{Instr_NO0},1'b0,1'b0,1'b0};
		Reg_stat[RSA+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr0[25:21]]<2'b10)
		begin
			Ar9 = Sent_Instr0[25:21];
			#0.3
			{Reg_stat[RSA][1:0],Reg_stat[RSA+1'b1][34:3]} = {2'b11,Rd9};
			
		end	
		else if ( (Reg_stat[RSA - 2'b10][2] ==0 &&Reg_stat[RSA - 2'b10][1] ==1) || (Reg_stat[RSA - 2'b10][2] ==1 &&Reg_stat[RSA - 2'b10][0] ==1)  )	
			Reg_stat[RSA][1] = 1'b1;
			
	
			
		RSA_indx[Sent_Instr0[25:21]] = RSA_indx[Sent_Instr0[25:21]] +2'b10;
	end	
   
 if(Sent_Instr0[31:26] == 6'b0) // Rtype
    begin 
	if(Sent_Instr0[20:16] != 0)	
	begin
		last[Sent_Instr0[20:16]] = Instr_NO0;
        RSA = {{Sent_Instr0[20:16]} ,{RSA_indx[Sent_Instr0[20:16]]}}; 
        Reg_stat[RSA] = {{Instr_NO0},1'b0,1'b0,1'b0};
		Reg_stat[RSA+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr0[20:16]]<2'b10)
		begin
			Ar9 = Sent_Instr0[20:16];
			#0.3
			{Reg_stat[RSA][1:0],Reg_stat[RSA+1'b1][34:3]} = {2'b11,Rd9};
		end	
		else if ( (Reg_stat[RSA - 2'b10][2] ==0 &&Reg_stat[RSA - 2'b10][1] ==1) || (Reg_stat[RSA - 2'b10][2] ==1 &&Reg_stat[RSA - 2'b10][0] ==1)  )	
			Reg_stat[RSA][1] = 1'b1;		
		RSA_indx[Sent_Instr0[20:16]] = RSA_indx[Sent_Instr0[20:16]] +2'b10;	
	end
	if (Sent_Instr0[15:11] !=0)
	begin
		last[Sent_Instr0[15:11]] = Instr_NO0;
        RSA = {{Sent_Instr0[15:11]} ,{RSA_indx[Sent_Instr0[15:11]]}}; 
		Reg_stat[RSA] = {{Instr_NO0},1'b1,1'b0,1'b0};
		Reg_stat[RSA+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr0[15:11]]<2'b10)
		begin
			Ar9 = Sent_Instr0[15:11];
			#0.3
			{Reg_stat[RSA][1:0],Reg_stat[RSA+1'b1][34:3]} = {2'b10,Rd9};
		end	
		else if ( (Reg_stat[RSA - 2'b10][2] ==0 &&Reg_stat[RSA - 2'b10][1] ==1) || (Reg_stat[RSA - 2'b10][2] ==1 &&Reg_stat[RSA - 2'b10][0] ==1)  )	
			Reg_stat[RSA][1] = 1'b1;
		RSA_indx[Sent_Instr0[15:11]] = RSA_indx[Sent_Instr0[15:11]] +2'b10;
	end	
		commit_order[CO_end_indx] = Instr_NO0;
    commit_order[CO_end_indx+2][1:0] = 2'b0;
		commit_order[CO_end_indx+2][30:26] = Sent_Instr0[25:21];
		commit_order[CO_end_indx+2][25:21] = Sent_Instr0[15:11];
		commit_order[CO_end_indx+2][20:16] = Sent_Instr0[20:16];
		CO_end_indx = CO_end_indx+3;
    end
    else // Itype
    begin      
		if (Sent_Instr0[20:16] !=0)
		begin
			last[Sent_Instr0[20:16]] = Instr_NO0;
			RSA = {{Sent_Instr0[20:16]} ,{RSA_indx[Sent_Instr0[20:16]]}}; 
			Reg_stat[RSA] = {{Instr_NO0},1'b1,1'b0,1'b0};
			Reg_stat[RSA+1'b1] = {{32'b0},3'b101};
			if (RSA_indx[Sent_Instr0[20:16]]<2'b10)
			begin
				Ar9 = Sent_Instr0[20:16];
				#0.3
				{Reg_stat[RSA][1:0],Reg_stat[RSA+1'b1][34:3]} = {2'b10,Rd9};
			end	
			else if ( (Reg_stat[RSA - 2'b10][2] ==0 &&Reg_stat[RSA - 2'b10][1] ==1) || (Reg_stat[RSA - 2'b10][2] ==1 &&Reg_stat[RSA - 2'b10][0] ==1)  )	
				Reg_stat[RSA][1] = 1'b1;
			RSA_indx[Sent_Instr0[20:16]] = RSA_indx[Sent_Instr0[20:16]] +2'b10;
		end
		commit_order[CO_end_indx] = Instr_NO0;
		commit_order[CO_end_indx+2][1:0] = 2'b0;
		commit_order[CO_end_indx+2][30:26] = Sent_Instr0[25:21];
		commit_order[CO_end_indx+2][25:21] = Sent_Instr0[20:16];		
		CO_end_indx = CO_end_indx+3;
    end
  
end          
always@(Instr_NO1) //store
begin
	if (Sent_Instr1[25:21] !=0)
	begin
		last[Sent_Instr1[25:21]] = Instr_NO1;
		RSA13 = {{Sent_Instr1[25:21]} ,{RSA_indx[Sent_Instr1[25:21]]}}; 
		Reg_stat[RSA13] = {{Instr_NO1},1'b0,1'b0,1'b0};
		Reg_stat[RSA13+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr1[25:21]]<2'b10)
		begin
			Ar10 = Sent_Instr1[25:21];
			#0.3
			{Reg_stat[RSA13][1:0],Reg_stat[RSA13+1'b1][34:3]} = {2'b11,Rd10};
		end	
		RSA_indx[Sent_Instr1[25:21]] = RSA_indx[Sent_Instr1[25:21]] +2'b10;
    end
	if (Sent_Instr1[20:16] !=0)
	begin
		last[Sent_Instr1[20:16]] = Instr_NO1;
		RSA13 = {{Sent_Instr1[20:16]} ,{RSA_indx[Sent_Instr1[20:16]]}}; 
		Reg_stat[RSA13] = {{Instr_NO1},1'b0,1'b0,1'b0};
		Reg_stat[RSA13+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr0[20:16]]<2'b10)
		begin
			Ar10 = Sent_Instr1[20:16];
			#0.3
			{Reg_stat[RSA13][1:0],Reg_stat[RSA13+1'b1][34:3]} = {2'b11,Rd10};
		end	
		else if ( (Reg_stat[RSA13 - 2'b10][2] ==0 &&Reg_stat[RSA13 - 2'b10][1] ==1) || (Reg_stat[RSA13 - 2'b10][2] ==1 &&Reg_stat[RSA13 - 2'b10][0] ==1)  )	
			Reg_stat[RSA13][1] = 1'b1;
		RSA_indx[Sent_Instr1[20:16]] = RSA_indx[Sent_Instr1[20:16]] +2'b10;
	end
		addr_stat[AS_end+1] = {{Instr_NO1},{1'b0}};
		addr_stat[AS_end][0]= 1'b0;
		addr_valid[AS_end] = 1'b0;
		AS_end = AS_end +2;
end          

always@(Instr_NO2) //load
begin
  
    commit_order[CO_end_indx+2'b10][1:0] = 2'b10;
	commit_order[CO_end_indx] =Instr_NO2;
	commit_order[CO_end_indx+2'b10][30:26] = Sent_Instr2[25:21];
	commit_order[CO_end_indx+2'b10][25:21] = Sent_Instr2[20:16];		
	CO_end_indx = CO_end_indx+3;
	if (Sent_Instr2[25:21] !=0)
	begin
		last[Sent_Instr2[25:21]] = Instr_NO2;
		RSA14 = {{Sent_Instr2[25:21]} ,{RSA_indx[Sent_Instr2[25:21]]}}; 
		Reg_stat[RSA14] = {{Instr_NO2},1'b0,1'b0,1'b0};
		Reg_stat[RSA14+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr2[25:21]]<2'b10)
		begin
			Ar11 = Sent_Instr2[25:21];
			#0.3
			{Reg_stat[RSA14][1:0],Reg_stat[RSA14+1'b1][34:3]} = {2'b11,Rd11};
		end	
		else if ( (Reg_stat[RSA14 - 2'b10][2] ==0 &&Reg_stat[RSA14 - 2'b10][1] ==1) || (Reg_stat[RSA14 - 2'b10][2] ==1 &&Reg_stat[RSA14 - 2'b10][0] ==1)  )	
			Reg_stat[RSA14][1] = 1'b1;	
		RSA_indx[Sent_Instr2[25:21]] = RSA_indx[Sent_Instr2[25:21]] +2'b10;
    end
	
	if (Sent_Instr2[20:16] !=0)
	begin
		last[Sent_Instr2[20:16]] = Instr_NO2;
		RSA14 = {{Sent_Instr2[20:16]} ,{RSA_indx[Sent_Instr2[20:16]]}}; 
		Reg_stat[RSA14] = {{Instr_NO2},1'b1,1'b0,1'b0};
		Reg_stat[RSA14+1'b1] = {{32'b0},3'b101};
		if (RSA_indx[Sent_Instr2[20:16]]<2'b10)
		begin
			Ar11 = Sent_Instr2[20:16];
			#0.3
			{Reg_stat[RSA14][1:0],Reg_stat[RSA14+1'b1][34:3]} = {2'b10,Rd11};
		end	
		else if ( (Reg_stat[RSA14 - 2'b10][2] ==0 &&Reg_stat[RSA14 - 2'b10][1] ==1) || (Reg_stat[RSA14 - 2'b10][2] ==1 &&Reg_stat[RSA14 - 2'b10][0] ==1)  )	
			Reg_stat[RSA14][1] = 1'b1;
		RSA_indx[Sent_Instr2[20:16]] = RSA_indx[Sent_Instr2[20:16]] +2'b10;
	end
	addr_stat[AS_end+1] = {{Instr_NO2},{1'b0}};
	addr_stat[AS_end][0]= 1'b1;
	addr_valid[AS_end] = 1'b0;
	AS_end= AS_end +2;
end          
      
//--------------------------
// #2 check kardane inke registerhaye CU ready hastan ya na
always@(AR1_CU2ROB , AR2_CU2ROB ,InstrNO_bc0, InstrNO_bc1 , chk)
begin 
if (chk)	
begin
// jadid az inja
	// r1
	/*
	if (AR1_CU2ROB == 5'b0)
		{R1_stat,forwsel_CU1} = 2'b10;
	else
	begin
		j_indx = 0;
		RSA15 = {{AR1_CU2ROB} ,{6'b0}};
		if (Reg_stat[RSA15][34:3] > InstrNO_bc0)// || )
			{R1_stat,forwsel_CU1} = {1'b1,1'b0};
		else if	(Reg_stat[RSA15][34:3] == InstrNO_bc0)
			{R1_stat,forwsel_CU1,forw_R12CU} = {1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]};
		else if (RSA_indx[AR1_CU2ROB] == 6'b0 && last[AR1_CU2ROB] >=InstrNO_bc0)
			{R1_stat,forwsel_CU1} = {1'b1,1'b0};
		else
		begin
			j_indx = 100;
			for (c1=0; c1<RSA_indx[AR1_CU2ROB]; c1 = c1+1)
			begin
				RSA15_indx_temp = c1;
				RSA15 = {{AR1_CU2ROB} ,{RSA15_indx_temp}};
				if (Reg_stat[RSA15][34:3] == InstrNO_bc0 && Reg_stat[RSA15][0] == 1'b1)
				begin
					R1_stat = 1'b1;
					j_indx = c1;
					c1 = c1+100;
					
				end	
			end
			
			if (j_indx == 100)
				R1_stat = 1'b0;
			else
				{R1_stat,forwsel_CU1,forw_R12CU} ={1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]};
		end
	end
	
	
//---- R2	
if (AR2_CU2ROB == 5'b0)
		{R2_stat,forwsel_CU2} = 2'b10;
	else
	begin
		j_indx= 0;
		RSA15 = {{AR2_CU2ROB} ,{6'b0}};
		if (Reg_stat[RSA15][34:3] > InstrNO_bc1)// || last[AR2_CU2ROB] >=InstrNO_bc1 )
			{R2_stat,forwsel_CU2} = {1'b1,1'b0};
		else if	(Reg_stat[RSA15][34:3] == InstrNO_bc1)	
			{R2_stat,forwsel_CU2,forw_R22CU} = {1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]};
		else if (RSA_indx[AR2_CU2ROB] == 6'b0 && last[AR2_CU2ROB] >=InstrNO_bc1)
			{R2_stat,forwsel_CU2} = {1'b1,1'b0};	
		else
		begin
			j_indx = 100;
			for (c1=0; c1<RSA_indx[AR2_CU2ROB]; c1 = c1+1)
			begin
				RSA15_indx_temp = c1;
				RSA15 = {{AR2_CU2ROB} ,{RSA15_indx_temp}};
				if (Reg_stat[RSA15][34:3] == InstrNO_bc1 && Reg_stat[RSA15][0] == 1'b1)
				begin
					R2_stat = 1'b1;
					j_indx = c1;
					c1 = c1+100;
				end	
			end
			
			if (j_indx == 100)
				R2_stat = 1'b0;
			else
				{R2_stat,forwsel_CU2,forw_R22CU} ={1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]};
		end
	end
	



// ta inja	
*/
 //____________ ghabli az inja
   RSA15_indx_temp = 6'b0;
  RSA15 = {{AR1_CU2ROB},{RSA15_indx_temp}};
   if(last[AR1_CU2ROB] > InstrNO_bc0)
		bo_e[0] = 1'b1;
	if(last[AR2_CU2ROB] > InstrNO_bc1)
		bo_e[1] = 1'b1;	
		
	 if (AR1_CU2ROB == 5'b0)
		{R1_stat,forwsel_CU1} = 2'b10;
			
	
	else if(RSA_indx[AR1_CU2ROB]<6'b0001 && last[AR1_CU2ROB] >= InstrNO_bc0)
		{R1_stat,forwsel_CU1} = 2'b10;			
	
	else if(Reg_stat[RSA15][34:3] > InstrNO_bc0 && bo_e[0] == 1'b1)
		{R1_stat,forwsel_CU1} = 2'b10;				
	
	else if (bo_e[0] == 1'b1)
	begin
		j_indx = 100;	
		for (c1=0; c1<RSA_indx[AR1_CU2ROB]; c1=c1+2)
		begin
			
				RSA15_indx_temp = c1;
				RSA15 = {{AR1_CU2ROB},{RSA15_indx_temp}};
				if ( InstrNO_bc0 >= Reg_stat[RSA15][36:5] )
				begin
					j_indx = c1;
					c1 = c1+100;
				end 
		end //for
		
		if (j_indx == 100)
			{R1_stat,forwsel_CU1} = 2'b10;	
		else
		begin
			RSA15_indx_temp = j_indx;
			RSA15 = {{AR1_CU2ROB},{RSA15_indx_temp}};
			if ((Reg_stat[RSA15][2] == 0)&& (Reg_stat[RSA15][0]== 1 ) )
			begin
				{R1_stat,forwsel_CU1,forw_R12CU} ={1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]}	;				
			end
			else if ( (Reg_stat[RSA15][2] == 1) && (Reg_stat[RSA15][0] == 1))
				{R1_stat,forwsel_CU1,forw_R12CU} ={1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]}	;
			else 
				R1_stat = 1'b0;
		end
   
    
	end	
	else if (bo_e[0] ==0)
		R1_stat=1'b0;

//----------------R2	
  RSA15_indx_temp = 6'b0;
  RSA15 = {{AR2_CU2ROB},{RSA15_indx_temp}};
	if (AR2_CU2ROB == 5'b0)
		{R2_stat,forwsel_CU2} = 2'b10;

	else if(RSA_indx[AR2_CU2ROB]<6'b0001 && last[AR2_CU2ROB] >= InstrNO_bc1)
		{R2_stat,forwsel_CU2} = 2'b10;		
		
	else if(Reg_stat[RSA15][34:3] > InstrNO_bc1 && bo_e[1] == 1'b1)
		{R2_stat,forwsel_CU2} = 2'b10;					
		
    else if (bo_e[1] == 1'b1)
	begin
		j_indx = 100;	
		for (c1=0; c1<RSA_indx[AR2_CU2ROB]; c1=c1+2)
		begin
			
				RSA15_indx_temp = c1;
				RSA15 = {{AR2_CU2ROB},{RSA15_indx_temp}};
				if ( InstrNO_bc1 >= Reg_stat[RSA15][36:5] )
				begin
					j_indx = c1;
					c1 = c1+100;
				end    
			
		end
		if (j_indx == 100)
			{R2_stat,forwsel_CU2} = 2'b10;	 
		else
		begin
			RSA15_indx_temp = j_indx;
			RSA15 = {{AR2_CU2ROB},{RSA15_indx_temp}};
			if (Reg_stat[RSA15][2] == 0 && Reg_stat[RSA15][0]== 1 )
			begin
				{R2_stat,forwsel_CU2,forw_R22CU} ={1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]}	;
			end
				
			else if (Reg_stat[RSA15][2] == 1 && Reg_stat[RSA15][0] == 1)
				{R2_stat,forwsel_CU2,forw_R22CU} ={1'b1,1'b1,Reg_stat[RSA15+1'b1][34:3]}	;
			else 
				R2_stat = 1'b0;
				
		end	
	end//  else 244
	
	else if (bo_e[1]==1'b0)
		R2_stat = 1'b0;
	
	if (R1_stat==1'b1 && R2_stat==1'b1)
		#2 bo_e = 2'b0;
	//-------------faraham kardane r1 ha dar surate amade budan ba forwarding
 // ______________________________________ta inja
	
end // if
end //alw 


//#3 ALUs buffer mikhad issue kone
always@(ALU_InstrNO2ROB, chk_ab)
begin
if(chk_ab == 1'b1)
begin
	rt0 = ALU_rt;
	rd0 = ALU_rd;
	rs0 = ALU_rs;
	
	ch1 = 200; //ke befahmim commit shode ya na
	ch2 = 200;
	ch3 = 200;
	
	//rt0
	for (c1=0;c1<RSA_indx[rt0]; c1 = c1+2)
	begin
		RSA_indx_temp0 = c1;
		RSA16 = {rt0,RSA_indx_temp0};
		if( Reg_stat[RSA16][34:3] == ALU_InstrNO2ROB)
		begin
			ch1 = c1;
			if ( Reg_stat[RSA16][1]==1 || c1 == 0)
				ALUrt_RD = 1'b1;
			//else if(((Reg_stat[RSA16][2] == 1) && (Reg_stat[RSA16][1] == 1)) || c1==0)
//				ALUrt_RD = 1'b1;
/*			else if ( c1<2 )
				ALU_rt = 1'b1;
			else if (c1<4 && (Reg_stat[RSA16][34:3] == Reg_stat[RSA16 - 2'b10][34:3]) )	
				ALU_rt = 1'b1;
			else if (c1<4 && (Reg_stat[RSA16][34:3] == Reg_stat[RSA16 + 2'b10][34:3]) )	
				ALU_rt = 1'b1;	
			else if (Reg_stat[RSA16][34:3] == Reg_stat[RSA16 - 2'b10][34:3])		*/	
			else 
				ALUrt_RD = 1'b0;
		end
	end
	
	if(ch1==200)
		ALUrt_RD=1'b1;
	RSA_indx_temp0 = ch1;
	RSA16 = {rt0,RSA_indx_temp0};	
	if (ALUrt_RD ==1'b1 && ch1<200 && (Reg_stat[RSA16][34:3] == Reg_stat[RSA16+2'b10][34:3] ))	
	begin
		Reg_stat[RSA16+2'b10][1] = 1'b1 ;	
	end
		
	// rs0	
	for (c2=0;c2<RSA_indx[rs0]; c2 = c2+2)
	begin
		RSA_indx_temp0 = c2;
		RSA16 = {rs0,RSA_indx_temp0};
		if( Reg_stat[RSA16][34:3] == ALU_InstrNO2ROB)
		begin
			ch2 = c2;
			if ( Reg_stat[RSA16][1]==1 || c2 ==0)
				ALUrs_RD = 1'b1;
		//	else if( (Reg_stat[RSA16][2] == 1) &&( Reg_stat[RSA16][0] == 1))
			//	ALUrs_RD = 1'b1;
			else 
				ALUrs_RD = 1'b0;
		end
	end
	
	if(ch2==200)
		ALUrs_RD=1'b1;	
	RSA_indx_temp0 = ch2;
	RSA16 = {rs0,RSA_indx_temp0};	
	if (ALUrs_RD ==1'b1 && ch2<200 && (Reg_stat[RSA16][34:3] == Reg_stat[RSA16+2'b10][34:3] ))	
	begin
		Reg_stat[RSA16+2'b10][1] = 1'b1 ;	
	end		
		
		
		
		
	for (c3=0;c3<RSA_indx[rd0]; c3 = c3+2)
	begin
		RSA_indx_temp0 = c3;
		RSA16 = {rd0,RSA_indx_temp0};
		if( Reg_stat[RSA16][34:3] == ALU_InstrNO2ROB)
		begin
			ch3 = c3;
			if (Reg_stat[RSA16][1]==1 || c3 ==0 )
				ALUrd_RD = 1'b1;
	//		else if(Reg_stat[RSA16][2] == 1 && Reg_stat[RSA16][0] == 1)
		//		ALUrd_RD = 1'b1;
			else 
				ALUrd_RD = 1'b0;
		end
	end
	
	if(ch3==200)
		ALUrd_RD=1'b1;	
		
	if(ch3==200)
		ALUrd_RD=1'b1;	
	RSA_indx_temp0 = ch3;
	RSA16 = {rd0,RSA_indx_temp0};	
	if (ALUrd_RD ==1'b1 && ch3<200 && (Reg_stat[RSA16][34:3] == Reg_stat[RSA16+2'b10][34:3] ))	
	begin
		Reg_stat[RSA16+2'b10][1] = 1'b1 ;	
	end		
				
		
		
end
end


//#4: checke dade haye load o save 
always@(LdInstrNO2ROB, chk_l)
begin
if(chk_l==1)
begin
	
	rs1 = Ld_rs;
	rt1 = Ld_rt;
	offset0 = Ld_offset;
	// address bade check kadrane reg ha
	ch4 = 200; //ke befahmim commit shode ya na
	ch5 = 200;
	//rt1
	for (c4=0;c4<RSA_indx[rt1]; c4 = c4+2)
	begin
		RSA_indx_temp1 = c4;
		RSA17 = {rt1,RSA_indx_temp1};
		if( Reg_stat[RSA17][34:3] == LdInstrNO2ROB)
		begin
			ch4 = c4;
			c4 = c4+100;
			if ( Reg_stat[RSA17][1]==1 || ch4 ==0 )
				Ldrt_RD = 1'b1;
//			else if(Reg_stat[RSA17][2] == 1 && Reg_stat[RSA17][0] == 1)
	//			Ldrt_RD = 1'b1;
			else 
				Ldrt_RD = 1'b0;
		end 
	end
	
	if(ch4==200)
		Ldrt_RD=1'b1;
		
		
	for (c5=0;c5<RSA_indx[rs1]; c5 = c5+2)
	begin
		RSA_indx_temp1 = c5;
		RSA17 = {rs1,RSA_indx_temp1};
		if( Reg_stat[RSA17][34:3] == LdInstrNO2ROB)
		begin
			ch5 = c5; // kojaye regstat e
			c5 = c5+100;
			reg_exist = 1'b1;
			if ( (Reg_stat[RSA17][2] ==0 && Reg_stat[RSA17][0]==1) || c5==0)
				Ldrs_RD = 1'b1;
			else if(Reg_stat[RSA17][2] == 1 && Reg_stat[RSA17][0] == 1)
				Ldrs_RD = 1'b1;
			else 
				Ldrs_RD = 1'b0;
		end
	end
	
	if(ch5==200)
		{Ldrs_RD,reg_exist}=2'b10;	
	
	
	
	if (Ldrt_RD ==1 && Ldrs_RD ==1)	
	begin
		for (c4=0;c4<AS_end; c4= c4+2)
		begin
			if(addr_stat[c4+1][32:1] == LdInstrNO2ROB )	
			begin
				ch4 = c4; //kojaye addrstat e
				c4=c4+10;
			end	
						
		end
			
		if(ch5!=200)
		begin
			RSA_indx_temp1 = ch5;
			RSA17 = { {rs1} , {RSA_indx_temp1} };
			if (Reg_stat[RSA17][0] == 1'b1)
			begin
				addr_stat[ch4][32:1] = $signed(offset0) + $signed(Reg_stat[RSA17+1'b1][34:3]);
				addr_valid[ch4] = 1'b1;
			end	
			else
				Ldrs_RD = 1'b0;
		end
		else
		begin
			Ar8 = rs1;
			#0.3
			addr_stat[ch4][32:1] = $signed(offset0) + $signed(Rd8) ;
			addr_valid[ch4] = 1'b1;
		end
		
		
		/* addr load hazard: 1-ghablesh kesi mikahd un addreso tush save kone?
		
		*/
		if(ch4 == 0)
			Ldoffset_RD = 1'b1;
		else
		begin	
			for (c4=ch4-2; c4>= 0; c4=c4-2)
			begin
				if(addr_valid[c4] == 1'b0)
				begin
					Ldoffset_RD = 1'b0;
					c4 = -10;
				end
				else if(addr_stat[ch4][32:1] == addr_stat[c4][32:1])
				begin					
					if(addr_stat[c4][0]==0 &&addr_stat[c4+1][0]==0)
					begin  
						Ldoffset_RD=1'b0;
						c4 = -10;
					end	
					else
						Ldoffset_RD=1'b1;
						
				end		
														
			end
		end
	end//if 381
	
end
end //alw

always@(Str_InstrNO2ROB, chk_s)
begin
if(chk_s)
begin
	rs2 = Str_rs;
	rt2 = Str_rt;
	offset2 = Str_offset;
	// address bade check kadrane reg ha
	ch7 = 200; //ke befahmim commit shode ya na
	ch8 = 200;
	//rt2
	for (c7=0;c7<RSA_indx[rt2]; c7 = c7+2)
	begin
		RSA_indx_temp2 = c7;
		RSA23 = {rt2,RSA_indx_temp2};
		if( Reg_stat[RSA23][34:3] == Str_InstrNO2ROB)
		begin
			ch7 = c7;
			c7 = c7+100;
			if ( (Reg_stat[RSA23][2] ==0 && Reg_stat[RSA23][0]==1) || ch7==0)
				Strrt_RD = 1'b1;
			else if(Reg_stat[RSA23][2] == 1 && Reg_stat[RSA23][0] == 1)
				Strrt_RD = 1'b1;
			else 
				Strrt_RD = 1'b0;
		end 
	end
	
	if(ch7==200)
		Strrt_RD=1'b1;
		
		
	for (c8=0;c8<RSA_indx[rs2]; c8 = c8+2)
	begin
		RSA_indx_temp2 = c8;
		RSA23 = {rs2,RSA_indx_temp2};
		if( Reg_stat[RSA23][34:3] == Str_InstrNO2ROB)
		begin
			ch8 = c8;
			c8 = c8+100;
			reg_exist = 1'b1;
			if ((Reg_stat[RSA23][2] ==0 && Reg_stat[RSA23][0]==1) || ch8==0 )
				Strrs_RD = 1'b1;
			else if(Reg_stat[RSA23][2] == 1 && Reg_stat[RSA23][0] == 1)
				Strrs_RD = 1'b1;
			else 
				Strrs_RD = 1'b0;
				
		end
	end
	
	if(ch8==200)
		Strrs_RD=1'b1;	
	
	
	
	if (Strrt_RD ==1 && Strrs_RD ==1)	
	begin
		ch7 = 220;
		for (c7=0;c7<AS_end; c7= c7+2)
		begin
			if(addr_stat[c7+1][32:1] == Str_InstrNO2ROB )	
			begin
				ch7 = c7;
				c7 = c7+100;				
			end				
		end
		
	if(ch7 != 220)
	begin
		if(ch8!=200)
		begin
			RSA_indx_temp2 = ch8;
			RSA18 = { {rs2} , {RSA_indx_temp2} };
			if(Reg_stat[RSA18][0] == 1)
			begin  
        			addr_stat[ch7][32:1] = $signed(offset2) + $signed(Reg_stat[RSA18+1'b1][34:3]);
					addr_valid[ch7] = 1'b1;
			end		
			else
					Strrs_RD = 1'b0; 
			          		
			
		end
		else
		begin
			Ar8 = rs2;
			#0.3
			addr_stat[ch7][32:1] = $signed(offset2) + $signed(Rd8) ;
			addr_valid[ch7] = 1'b1;
		end
		
		
		
		/* addr str  hazard: 1-ghablesh kesi mikahd un addreso load kone?
		
		*/
		if(ch7==0)
			Stroffset_RD=1'b1;
		else	
		begin
			for (c7=ch7-2; c7>= 0; c7=c7-2)
			begin
				if(addr_valid[c7] ==1'b0)
				begin
					c7 = -10;
					Stroffset_RD = 1'b0;
				end
				else if(addr_stat[ch7][32:1] == addr_stat[c7][32:1])
				begin
					
					if(addr_stat[c7][0]==0 &&addr_stat[c7+1][0]==1)
					begin
						Stroffset_RD=1'b0;
						c7 = -10;	
					end	
					else
						Stroffset_RD=1'b1;
				end		
			
				
		
			end//for
		end	
	end	
	
	end//if 381



end

end //alw

//#5 : sabte inke ki tuye ALU exe rafte o faraham kardane operand ha

always@(ALUInstrNO0_Issued)
begin
// ye search bayad bezane tuye reg_stat o forwardinga ro ok kone
	
	
	rt3 = ALUInstr0_Issued[20:16];
	rs3 = ALUInstr0_Issued[25:21];
	rd3 = ALUInstr0_Issued[15:11];
	op1 = ALUInstr0_Issued[31:26];

	ch9_1 = 100;	
	
	ch9=200;

	if(rs3 != 5'b0)
	begin
	for (c9=0; c9<RSA_indx[rs3]; c9=c9+2)
	begin
		RSA_indx_temp3=c9;
		RSA22 = {{rs3}, {RSA_indx_temp3} } ;
		if ( (Reg_stat[RSA22][34:3] == ALUInstrNO0_Issued) && rs3 !=0 ) // ??? un chize n
		begin
			oo = Reg_stat[RSA22][0] ;
			RSA_temp = RSA22;
			if(oo == 1'b1)
				ch9=c9;		
			for(i1=c9+2; i1<RSA_indx[rs3]; i1=i1+2)
				begin
					 RSA22 = RSA22 + 2'b10;
					 if(Reg_stat[RSA22][2]==0 && oo==1'b1)
					 begin
						Reg_stat[RSA22][1:0]  = 2'b11 ;
						Reg_stat[RSA22+1'b1][34:3] = Reg_stat[RSA_temp+1'b1][34:3] ;
					 end		
					 else if(Reg_stat[RSA22][2] == 0)
						Reg_stat[RSA22][1:0]  = 2'b10 ;
					 else
					 begin
						Reg_stat[RSA22][1]  = 1'b1 ;
						i1=i1+100;
					 end	
				end
			c9=c9+100;	
		end
	end
	end// if
	
	if (ch9==200 || rs3==0)
		{ROB_FSA1} = 1'b0;
	else
	begin
		RSA_indx_temp3=ch9;
		RSA22 = {{rs3}, {RSA_indx_temp3} } ;
		{{ROB_FSA1} , {ROB_FA1}} = {1'b1 , {Reg_stat[RSA22+1'b1][34:3]}};
	end	
		
	if(op1==0) //rtype
	begin
		ch9=200;
	  if(rt3 != 5'b0)
	  begin	    
		for (c9=0; c9<RSA_indx[rt3]; c9=c9+2)
		begin
			RSA_indx_temp3=c9;
			RSA22 = {{rt3}, {RSA_indx_temp3} } ;
			
			if ( (Reg_stat[RSA22][34:3] == ALUInstrNO0_Issued) && rt3!=0 && Reg_stat[RSA22][2] ==1'b0)
			begin
				oo = Reg_stat[RSA22][0];
				if(oo== 1'b1)
					ch9=c9;		
				RSA_temp = RSA22;
				for(i1=c9+2; i1<RSA_indx[rt3]; i1=i1+2)
				begin
					 RSA22 = RSA22 + 2'b10;
					 if(Reg_stat[RSA22][2] == 0 && Reg_stat[RSA_temp][0] == 1'b1)
					 begin
						Reg_stat[RSA22][1:0]  = 2'b11 ;
						Reg_stat[RSA22][34:3] = Reg_stat[RSA_temp][34:3];
					 end	
					 else if (Reg_stat[RSA22][2] == 1'b0)
						Reg_stat[RSA22][1:0] = 2'b10;
					 else
					 begin	
						i1=i1+100;
						Reg_stat[RSA22][1] = 1'b1 ;
					 end	
				end
				c9 = c9+100;	
			end
		end
		end // if
		
		if (ch9==200 || rt3==0)
			{ROB_FSB1} = 1'b0;
		else
		begin
			RSA_indx_temp3=ch9;
			RSA22 = {{rt3}, {RSA_indx_temp3} } ;
			{{ROB_FSB1} , {ROB_FB1}} = {1'b1 , {Reg_stat[RSA22+1'b1][34:3]}};
			
		end	
	#1
	
		for (c9=0; c9<RSA_indx[rd3]; c9=c9+2)
		begin
			RSA_indx_temp3=c9;
			RSA22 = {{rd3}, {RSA_indx_temp3} } ;
			if ((Reg_stat[RSA22][34:3] == ALUInstrNO0_Issued )&& rd3!=0 && (Reg_stat[RSA22][2] == 1'b1))
			begin
				ch9_1 = c9;
				Reg_stat[RSA22+1'b1][34:3] = ALU1Out;
				Reg_stat[RSA22+1'b1][2:0] = 3'b001;
				Reg_stat[RSA22][1:0] = 2'b11;
				for(i1=c9+2; i1<RSA_indx[rd3]; i1=i1+2)
				begin
					 RSA22 = RSA22 + 2'b10;
					 if(Reg_stat[RSA22][2] == 0)
						{Reg_stat[RSA22][1:0],Reg_stat[RSA22+1'b1][34:3] }  = {2'b11 , ALU1Out} ;
					 else
					 begin
						Reg_stat[RSA22][1:0]  = 2'b10;
						i1=i1+100;						
					 end	
				end
				c9 = c9+100;
			end	
		end
	
//---	
	end
	else // i type
	begin
		#1
		for (c9=0; c9<RSA_indx[rt3]; c9=c9+2)
		begin
			RSA_indx_temp3=c9;
			RSA22 = {{rt3}, {RSA_indx_temp3} } ;
			if (((Reg_stat[RSA22][34:3]) == (ALUInstrNO0_Issued)) && rt3!=0 && (Reg_stat[RSA22][2]==1'b1))
			begin
				Reg_stat[RSA22][1:0] = 2'b11;	
				ch9_1 = c9;
				Reg_stat[RSA22+1'b1][34:3] = ALU1Out;
				Reg_stat[RSA22+1'b1][2:0] = 3'b001;
				Reg_stat[RSA22][1:0] = 2'b11;
				for(i1=c9+2; i1<RSA_indx[rt3]; i1=i1+2)
				begin
					 RSA22 = RSA22 + 2'b10;
					 if(Reg_stat[RSA22][2] == 0)
						{Reg_stat[RSA22+1'b1][34:3] , Reg_stat[RSA22][1:0] }  ={ALU1Out, 2'b11}; 
					 else
					 begin
						Reg_stat[RSA22][1:0] = 2'b10;
						i1=i1+100;
					 end
				end
				c9 = c9+100;
			end	
		end

	
		
	end
	
	
	for (CO_counter0=0;CO_counter0<CO_end_indx; CO_counter0=CO_counter0+3 )
	begin
		
			if (commit_order[CO_counter0] == ALUInstrNO0_Issued)	
			begin
				commit_order[CO_counter0+2'b10][0] = 1'b1;
				
				commit_order[CO_counter0+1'b1]= ALU1Out;
				CO_counter0 = CO_counter0+100;
			end
			
	end
	
	

end	

always@(ALU_InstrNO1_Issued)
begin
		
	
	rt4 = ALUInstr1_Issued[20:16];
	rs4 = ALUInstr1_Issued[25:21];
	rd4 = ALUInstr1_Issued[15:11];
	op2 = ALUInstr1_Issued[31:26];

	ch10_1 = 100;	
	
	ch10=200;
	if( rs4 != 5'b0)
	begin
	for (c10=0; c10<RSA_indx[rs4]; c10=c10+2)
	begin
		RSA_indx_temp4=c10;
		RSA4 = {{rs4}, {RSA_indx_temp4} } ;
		if ( (Reg_stat[RSA4][34:3] == ALU_InstrNO1_Issued) && rs4 !=0 ) // ??? un chize n
		begin
			oo1 = Reg_stat[RSA4][0] ;
			RSA_temp1 = RSA4;
			if(oo1 == 1'b1)
				ch10=c10;		
			for(i2=c10+2; i2<RSA_indx[rs4]; i2=i2+2)
				begin
					 RSA4 = RSA4 + 2'b10;
					 if(Reg_stat[RSA4][2]==0 && oo1==1'b1)
					 begin
						Reg_stat[RSA4][1:0]  = 2'b11 ;
						Reg_stat[RSA4+1'b1][34:3] = Reg_stat[RSA_temp1+1'b1][34:3] ;
					 end		
					 else if(Reg_stat[RSA4][2] == 0)
						Reg_stat[RSA4][1:0]  = 2'b10 ;
					 else
					 begin
						Reg_stat[RSA4][1]  = 1'b1 ;
						i2=i2+100;
					 end	
				end
			c10=c10+100;	
		end
	end
	end // if
	
	if (ch10==200 || rs4==0)
		{ROB_FSA2} = 1'b0;
	else
	begin
		RSA_indx_temp4=ch10;
		RSA4 = {{rs4}, {RSA_indx_temp4} } ;
		{{ROB_FSA2} , {ROB_FA2}} = {1'b1 , {Reg_stat[RSA4+1'b1][34:3]}};
	end	
		
	if(op2==0) //rtype
	begin
		ch10=200;
		if (rt4 !=0)
		begin
		for (c10=0; c10<RSA_indx[rt4]; c10=c10+2)
		begin
			RSA_indx_temp4=c10;
			RSA4 = {{rt4}, {RSA_indx_temp4} } ;
			
			if ( (Reg_stat[RSA4][34:3] == ALU_InstrNO1_Issued) && rt4!=0 && Reg_stat[RSA4][2] ==1'b0)
			begin
				oo1 = Reg_stat[RSA4][0];
				if(oo1== 1'b1)
					ch10=c10;		
				RSA_temp1 = RSA4;
				for(i2=c10+2; i2<RSA_indx[rt4]; i2=i2+2)
				begin
					 RSA4 = RSA4 + 2'b10;
					 if(Reg_stat[RSA4][2] == 0 && Reg_stat[RSA_temp1][0] == 1'b1)
					 begin
						Reg_stat[RSA4][1:0]  = 2'b11 ;
						Reg_stat[RSA4][34:3] = Reg_stat[RSA_temp1][34:3];
					 end	
					 else if (Reg_stat[RSA4][2] == 1'b0)
						Reg_stat[RSA4][1:0] = 2'b10;
					 else
					 begin	
						i2=i2+100;
						Reg_stat[RSA4][1] = 1'b1 ;
					 end	
				end
				c10 = c10+100;	
			end
		end
		end
		
		if (ch10==200 || rt4==0)
			{ROB_FSB2} = 1'b0;
		else
		begin
			RSA_indx_temp4=ch10;
			RSA4 = {{rt4}, {RSA_indx_temp4} } ;
			{{ROB_FSB2} , {ROB_FB2}} = {1'b1 , {Reg_stat[RSA4+1'b1][34:3]}};
			
		end	
	#1
	
		for (c10=0; c10<RSA_indx[rd4]; c10=c10+2)
		begin
			RSA_indx_temp4=c10;
			RSA4 = {{rd4}, {RSA_indx_temp4} } ;
			if ((Reg_stat[RSA4][34:3] == ALU_InstrNO1_Issued )&& rd4!=0 && (Reg_stat[RSA4][2] == 1'b1))
			begin
				ch10_1 = c10;
				Reg_stat[RSA4+1'b1][34:3] = ALU2Out;
				Reg_stat[RSA4+1'b1][2:0] = 3'b001;
				Reg_stat[RSA4][1:0] = 2'b11;
				for(i2=c10+2; i2<RSA_indx[rd4]; i2=i2+2)
				begin
					 RSA4 = RSA4 + 2'b10;
					 if(Reg_stat[RSA4][2] == 0)
						{Reg_stat[RSA4][1:0],Reg_stat[RSA4+1'b1][34:3] }  = {2'b11 , ALU2Out} ;
					 else
					 begin
						Reg_stat[RSA4][1:0]  = 2'b10;
						i2=i2+100;						
					 end	
				end
				c10=c10+100;	
			end	
		end
	
//---	
	end
	else // i type
	begin
		#1
		for (c10=0; c10<RSA_indx[rt4]; c10=c10+2)
		begin
			RSA_indx_temp4=c10;
			RSA4 = {{rt4}, {RSA_indx_temp4} } ;
			if (((Reg_stat[RSA4][34:3]) == (ALU_InstrNO1_Issued)) && rt4!=0 && (Reg_stat[RSA4][2]==1'b1))
			begin
				Reg_stat[RSA4][1:0] = 2'b11;	
				ch10_1 = c10;
				Reg_stat[RSA4+1'b1][34:3] = ALU2Out;
				Reg_stat[RSA4+1'b1][2:0] = 3'b001;
				Reg_stat[RSA4][1:0] = 2'b11;
				for(i2=c10+2; i2<RSA_indx[rt4]; i2=i2+2)
				begin
					 RSA4 = RSA4 + 2'b10;
					 if(Reg_stat[RSA4][2] == 0)
						{Reg_stat[RSA4+1'b1][34:3] , Reg_stat[RSA4][1:0] }  ={ALU2Out, 2'b11}; 
					 else
					 begin
						Reg_stat[RSA4][1:0] = 2'b10;
						i2=i2+100;
					 end
				end
				c10=c10+100;	
			end	
		end

	
		
	end
	
	
	for (CO_counter0=0;CO_counter0<CO_end_indx; CO_counter0=CO_counter0+3 )
	begin
		
			if (commit_order[CO_counter0] == ALU_InstrNO1_Issued)	
			begin
				commit_order[CO_counter0+2'b10][0] = 1'b1;
				
				commit_order[CO_counter0+1'b1]= ALU2Out;
				CO_counter0 = CO_counter0+100;
			end
			
	end
	
		
end

//#6 : load  ro faraham mikone

always@(Ld_InstrNO_Issue)
begin
	
	rs5 = Ld_Instr_Issue[25:21];
	rt5 = Ld_Instr_Issue[20:16];
	
	for (c11=0; c11<RSA_indx[rt5]; c11=c11+2)
	begin
		RSA_indx_temp5=c11;
		RSA5 = {{rt5}, {RSA_indx_temp5} } ;
		if ( (Reg_stat[RSA5][34:3] == Ld_InstrNO_Issue) && rt5!=0)
		begin
			rt7 = rt5;
			Reg_stat[RSA5][1:0]	= 2'b10;
			ch11_1 = c11;
			c11 = c11+100;
		end
	end
	
	
	ch11=200;	
	for (c11=0; c11<RSA_indx[rs5]; c11=c11+2)
	begin
		RSA_indx_temp5=c11;
		RSA5 = {{rs5}, {RSA_indx_temp5} } ;
		if ( (Reg_stat[RSA5][34:3] == Ld_InstrNO_Issue )&& rs5 !=0)
		begin
			ch11=c11;		
			c11=c11+100;
		end	
	end
	
	if (ch11==200 || rs5==0)
		ROB_LdFSAddr = 1'b0;
	else
	begin
		RSA_indx_temp5=ch11;
		RSA5 = {{rs5}, {RSA_indx_temp5} } ;
		ROB_LdFSAddr = 1'b1;
		ROB_LdFAddr = Reg_stat[RSA5+1'b1][34:3];
	end	
	
		
end

always@(LdInstrNO_DM)
begin
	
	rt55 = Ld_Instr_Issue[20:16];
	rs55 = Ld_Instr_Issue[25:21];
	
	for (c12=0; c12<RSA_indx[rt55]; c12=c12+2)
	begin
		RSA_indxld=c12;
		RSA_ld = {{rt55}, {RSA_indxld} } ;
		if ( (Reg_stat[RSA_ld][34:3] == LdInstrNO_DM) && rt55!=0)
		begin
			rt77 = rt55;
			Reg_stat[RSA_ld][1:0]	= 2'b10;
			ch12_1 = c12;
			c12 = c12+100;
		end
	end	


	
	RSA_indxld = ch12_1;
//	rt7= rt5;
	RSA_ld = {{rt77},{RSA_indxld}};
	#1
	Reg_stat[RSA_ld+1'b1][34:3] = LdData_ROB;
	Reg_stat[RSA_ld+1'b1][2:0] = 3'b001;
	Reg_stat[RSA_ld][1:0] = 2'b11;

	for(c12=ch12_1+2 ;c12<RSA_indx[rt77] ;c12= c12+2)
	begin
		RSA_indxld = c12;
		RSA_ld={{rt77} , {RSA_indxld}} ;
		if(Reg_stat[RSA_indxld][2] == 0)
			{{Reg_stat[RSA_indxld][1:0]} , {Reg_stat[RSA_indxld+1'b1][34:3]} } = {2'b11,LdData_ROB};
		else
		begin
			Reg_stat[RSA_ld][1] = 1'b1;
			c12 = c12+100;		
		end		
		
	end
	
	
	brk2=1'b0;
	for (c12=0; c12<AS_end; c12=c12+2)
	begin
		  
			indx_temp7 = c12;
			if(addr_stat[indx_temp7+1][32:1] == LdInstrNO_DM)
			begin
				addr_stat[indx_temp7+1][0] = 1'b1;
				c12 =c12 +200;
			end
		
	end

	brk2=1'b0;
	for (CO_counter2=0;CO_counter2<CO_end_indx; CO_counter2=CO_counter2+3 )
	begin
	   
    		if (commit_order[CO_counter2]==LdInstrNO_DM)	
    		begin
    			commit_order[CO_counter2+2'b10][0] = 1'b1;
    			
    			commit_order[CO_counter2+1'b1]= LdData_ROB;
    			CO_counter2 = CO_counter2 + 300;
    		end
  		end
 	
	

end
  
//#7 : store  ro faraham mikone

always@(Str_InstrNO_Issued)
begin
	rt6 = Str_Instr_Issued[20:16];
	rs6 = Str_Instr_Issued[25:21];	
	op3 = Str_Instr_Issued[31:26];
	
	ch11=200;
	
	for (c11=0; c11<RSA_indx[rs6]; c11=c11+2)
	begin
		RSA_indx_temp6=c11;
		RSA5 = {{rs6}, {RSA_indx_temp6} } ;
		if (Reg_stat[RSA5][34:3] == Str_InstrNO_Issued)
		begin
			oo2 = Reg_stat[RSA5][0];
			RSA_temp2 = RSA5;
			if(oo2 == 1'b1)
				ch11=c11;		
			for(i3 = c11+2; i3<RSA_indx[rs3]; i3 = i3+2)
			begin
				RSA5 = RSA5 + 2'b10;
				if(Reg_stat[RSA5][2] == 0 && Reg_stat[RSA_temp2][0] == 1'b1)
				begin
					Reg_stat[RSA5][1:0]  = 2'b11;
					Reg_stat[RSA5+ 1'b1][34:3] = Reg_stat[RSA_temp2+1'b1][34:3];
				end		
				else if(Reg_stat[RSA5][2] == 0 )
					Reg_stat[RSA5][1:0]  = 2'b10;
				else
				begin
					Reg_stat[RSA5][1]  = 1'b1;
					i3 = i3+100;
				end	
			end
			c11 = c11 + 100;
		end	
	end
	
	if (ch11==200)
		{ROB_FSAddr} = 1'b0;
	else
	begin
		RSA_indx_temp6=ch11;
		RSA5 = {{rs6}, {RSA_indx_temp6} } ;
		{{ROB_FSAddr} , {ROB_FAddr}} = {1'b1 , {Reg_stat[RSA5+1'b1][34:3]}};
	end	
		
	
	ch11=200;
	for (c11=0; c11<RSA_indx[rt6]; c11=c11+2)
	begin
		RSA_indx_temp6=c11;
		RSA5 = {{rt6}, {RSA_indx_temp6} } ;
		if (Reg_stat[RSA5][34:3] == Str_InstrNO_Issued)
		begin
			oo2 = Reg_stat[RSA5][0];
			RSA_temp2 = RSA5;
			if(oo2 == 1'b1)
				ch11=c11;		
			for(i3 = c11+2; i3<RSA_indx[rs3]; i3 = i3+2)
			begin 
				RSA5 = RSA5 + 2'b10;
				if(Reg_stat[RSA5][2] == 0 && Reg_stat[RSA_temp2][0] == 1'b1)
				begin
					Reg_stat[RSA5][1:0]  = 2'b11;
					Reg_stat[RSA5+ 1'b1][34:3] = Reg_stat[RSA_temp2+1'b1][34:3];
				end		
				else if(Reg_stat[RSA5][2] == 0 )
					Reg_stat[RSA5][1:0]  = 2'b10;
				else
				begin
					Reg_stat[RSA5][1]  = 1'b1;
					i3 = i3+100;
				end	
			end
			c11 = c11 + 100;
		end	
	end
		
	if (ch11==200)
		{ROB_FSvalue} = 1'b0;
	else
	begin
		RSA_indx_temp5=ch11;
		RSA5 = {{rt6}, {RSA_indx_temp5} } ;
		{{ROB_FSvalue} , {ROB_Fvalue}} = {1'b1 , {Reg_stat[RSA5+1'b1][34:3]}};
	end	

	for (c11=0; c11<AS_end ; c11=c11+2)
	begin
		if(addr_stat[c11+1][32:1]	 == Str_InstrNO_Issued)
		begin
			for (c111=c11 ;c111<AS_end ;c111=c111+2)
			begin
				addr_stat[c111] = addr_stat[c111+2];
				addr_stat[c111+1] = addr_stat[c111+3];
				addr_valid[c111] = addr_valid[c111+2];
				addr_valid[c111+1] = addr_valid[c111+3];
			end
		AS_end = AS_end -2;
		c11 = c11+300;	
		end
	
	end
	
//-- shifte regstat	

	RSA5 = { {rt6} ,{6'b0} };
	for (c11=0; c11<RSA_indx[rt6] ; c11=c11+2)
	begin
		if(Reg_stat[RSA5][34:3] == Str_InstrNO_Issued)
		begin
			for (c111=c11 ;c111<RSA_indx[rt6] ;c111=c111+2)
			begin
				Reg_stat[RSA5] = Reg_stat[RSA5+2'b10];
				Reg_stat[RSA5+1'b1] = Reg_stat[RSA5+2'b11];
				RSA5 = RSA5 +2'b10;
			end
		RSA_indx[rt6] = RSA_indx[rt6] -2'b10;
		c11 = c11+300;	
		end
	RSA5 = RSA5 +2'b10;
	end
	
	RSA5 = { {rs6},{6'b0} };
	for (c11=0; c11<RSA_indx[rs6] ; c11=c11+2)
	begin
		if(Reg_stat[RSA5][34:3] == Str_InstrNO_Issued)
		begin  
			for (c111=c11 ;c111<RSA_indx[rs6] ;c111=c111+2)
			begin
				Reg_stat[RSA5] = Reg_stat[RSA5+2'b10];
				Reg_stat[RSA5+1'b1] = Reg_stat[RSA5+2'b11];
				RSA5 = RSA5 +2'b10;
			end
		RSA_indx[rs6] = RSA_indx[rs6] -2;
		c11 = c11+300;	
		end
	RSA5 = RSA5 +2'b10;
	end
		
end  
  
  
  
  
// #8: ba posedge clk; be tartib az bala harkio amadas befreste tu  
always@ (posedge clk)
begin

	wb_counter=2'b0;
	shift[0] = 8'b11111111;
	shift[1] = 8'b11111111;
	Ld_c[1:0] = 2'b0;
	
	
		
	for(c13=0;c13<CO_end_indx;c13=c13+3)
	begin
	if ( InstrNO_bc0 == commit_order[c13] && commit_order[c13+2][0]==1)
		{R1_stat,forwsel_CU1, forw_R12CU, bo_e[0]} = {1'b1,1'b1,commit_order[c13+1], 1'b1};
	if ( InstrNO_bc1 == commit_order[c13] && commit_order[c13+2][0]==1)
		{R2_stat,forwsel_CU2, forw_R22CU, bo_e[1]} = {1'b1,1'b1,commit_order[c13+1], 1'b1};	
	end
	
	brk3=1'b0;
	for(c13=0;c13<CO_end_indx;c13=c13+3)
	begin
		if(brk3==1'b0)  //------------   shiftha
		begin
			temp_1 = c13; // 8 bit e 
			if (commit_order[temp_1 + 2'b10][0] == 1'b1)
			begin	
				if(wb_counter==2'b0)		
					{wb_counter,WE1, ResultW1, WriteReg1,shift[0],Ld_c[0]} = 
						{2'b01,1'b1,commit_order[temp_1+1],commit_order[temp_1+2'b10][25:21],temp_1 ,commit_order[temp_1+2'b10][1]};
				else if (wb_counter == 2'b01)
					{wb_counter,WE2, ResultW2, WriteReg2,shift[1],Ld_c[1]} = 
						{2'b10,1'b1,commit_order[temp_1+1],commit_order[temp_1+2'b10][25:21],temp_1,commit_order[temp_1+2'b10][1] };
	
				if(wb_counter==2'b10)
          brk3 = 1'b1;
			end//898
			else
          brk3 = 1'b1;
		end		////895	
	end//893
	
	brk3=1'b0;
	for(c15=30;c15>=20;c15=c15-5)
	begin

			if (shift[0] < 8'b11111111)
			begin
				r_temp = commit_order[shift[0]+2'b10][c15 -: 5] ;
				for (c13=0;c13<RSA_indx[r_temp]; c13 = c13+2)
				begin
					r1_temp = c13;
					RSA10 = {{r_temp},r1_temp} ;
					if((Reg_stat[RSA10][34:3] == commit_order[shift[0]]) && r_temp!=5'b0)
					begin
						for (c14 = c13; c14<RSA_indx[r_temp]; c14 = c14+2)
						begin
							r2_temp = c14;
							RSA11 = {{r_temp},{r2_temp}};
							if (Reg_stat[RSA11+2'b10][2] == 1'b0)
								{Reg_stat[RSA11+2'b10][0] ,Reg_stat[RSA11+2'b11][34:3] } =
									{2'b11,Reg_stat[RSA11+2'b01][34:3] } ;
							else
							begin
								Reg_stat[RSA11+2'b10][1] =1'b1;
								c14 = c14+100;
							end	
						
						end
						
						for (c14 = c13; c14<RSA_indx[r_temp]; c14 = c14+2)
						begin	
							r2_temp = c14;
							RSA11 = {{r_temp},{r2_temp}};
							Reg_stat[RSA11] = Reg_stat[RSA11+2]	;
							Reg_stat[RSA11+1] = Reg_stat[RSA11+3];
						end
						RSA_indx[r_temp] = RSA_indx[r_temp] - 2'b10;	
						c13 = c13 -2;
					end			
				end
			end

	end
	
	brk3=1'b0;
	for(c15=30;c15>=20;c15=c15-5)
	begin
		
			if(shift[1]<8'b11111111)
			begin
				r_temp = commit_order[shift[1]+2'b10][c15 -:5] ;
				for (c13=0;c13<RSA_indx[r_temp]; c13 = c13+2)
				begin
					r1_temp = c13;
					RSA10 = {{r_temp},r1_temp} ;
					if( (Reg_stat[RSA10][34:3] == commit_order[shift[1]]) && r_temp!=5'b0 )
					begin
						for (c14 = c13; c14<RSA_indx[r_temp]; c14 = c14+2)
						begin
							r2_temp = c14;
							RSA11 = {{r_temp},{r2_temp}};
							if (Reg_stat[RSA11+2'b10][2] == 1'b0)
								{Reg_stat[RSA11+2'b10][0] ,Reg_stat[RSA11+2'b11][34:3] } =
									{2'b11,Reg_stat[RSA11+2'b01][34:3] } ;
							else
							begin
								Reg_stat[RSA11+2'b10][1] =1'b1;
								c14 = c14+100;
							end	
						
						end
						for (c14 = c13; c14<RSA_indx[r_temp]; c14 = c14+2)
						begin	
							r2_temp = c14;
							RSA11 = {{r_temp},{r2_temp}};
							Reg_stat[RSA11] = Reg_stat[RSA11+2]	;
							Reg_stat[RSA11+1] = Reg_stat[RSA11+3];
						end
						RSA_indx[r_temp] = RSA_indx[r_temp] - 2'b10;
						c13 = c13 - 2;
						brk3=1'b1;
					end			
				end
			end
			
	end
	
	
	//---- shifting add_stat
	if (Ld_c[0] == 1 && shift[0] < 8'b1111111)
	for (c16=0; c16<AS_end ; c16=c16+2)
	begin
		if(addr_stat[c16+1][32:1] == commit_order[shift[0]] )
		begin
			for (c166=c16 ;c166<AS_end ;c166=c166+2)
			begin
				addr_stat[c166] = addr_stat[c166+2];
				addr_stat[c166+1] = addr_stat[c166+3];
				addr_valid[c166] = addr_valid[c166+2];
				addr_valid[c166+1] = addr_valid[c166+3];
			end
		AS_end = AS_end -2;
		c16 = c16+300;	
		end
	end	

	if (Ld_c[1] == 1 && shift[1] < 8'b1111111)
	for (c16=0; c16<AS_end ; c16=c16+2)
	begin
		if(addr_stat[c16+1][32:1]	 == commit_order[shift[1]] )
		begin
			for (c166=c16 ;c166<AS_end ;c166=c166+2)
			begin
				addr_stat[c166] = addr_stat[c166+2];
				addr_stat[c166+1] = addr_stat[c166+3];
				addr_valid[c166] = addr_valid[c166+2];
				addr_valid[c166+1] = addr_valid[c166+3];
				
			end
		AS_end = AS_end -2;
		c16 = c16+300;	
		end
	end	
	
	
	
	if(shift[0] < 8'b11111111 && shift[1] < 8'b11111111)
	begin		
		for(c16=shift[0]; c16<shift[1]; c16 = c16+3)
		begin
			commit_order[c16] = commit_order[c16+3] ;
			commit_order[c16+1] = commit_order[c16+4] ;		
			commit_order[c16+2] = commit_order[c16+5] ;		
		end
		for(c16=shift[1]-3; c16<CO_end_indx; c16 = c16+3)
		begin
			commit_order[c16] = commit_order[c16+6] ;
			commit_order[c16+1] = commit_order[c16+7] ;		
			commit_order[c16+2] = commit_order[c16+8] ;		
		end
		CO_end_indx = CO_end_indx - 6;	
	end
 	else if (shift[0] < 8'b11111111)
	begin		
		for(c16=shift[0]; c16<CO_end_indx; c16 = c16+3)
		begin
			commit_order[c16] = commit_order[c16+3] ;
			commit_order[c16+1] = commit_order[c16+4] ;		
			commit_order[c16+2] = commit_order[c16+5] ;		
		end
		CO_end_indx = CO_end_indx - 3;	
	end
		
		
		
	#2
	WE1=0;
	WE2=0;
	
end  
  
  
  
  
  
  
  
  
endmodule
