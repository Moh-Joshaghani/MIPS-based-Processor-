`timescale 1ns/100ps
module Data_Memory(
input  wire [31:0] LdAddr_DM,
input  wire [31:0] StrAddr_DM,
input  wire        clk,
input  wire        WE_DM ,
input  wire [31:0] WriteData_DM,
output wire [31:0] LdData_ROB ,
output reg [255:0] LdData_cache,       
output reg [255:0] StrData_cache ,
output reg          new_mem   

);
parameter memsize=256;
reg [31:0] memory [0:memsize];
integer i1;
integer add1,add2;


assign LdData_ROB = memory[LdAddr_DM[31:2]];
//assign LdData_cache[255:0] = memory[LdAddr_DM[31:6] +: 8][31:0];

always@(*)
begin
	if(WE_DM)
	begin
		memory[StrAddr_DM[31:2]] = WriteData_DM;
		for (i1=1; i1<5; i1=i1+1)
		begin
			add1 = {StrAddr_DM[31:4],2'b0} + i1-1 ;
			StrData_cache[((i1<<5) -1) -:32] = memory[add1];
		end 
		new_mem = 1'b1;
		
	end	
	for (i1=1; i1<9; i1=i1+1)
	begin
		add2= {LdAddr_DM[31:4],2'b0} + i1-1;
		LdData_cache[((i1<<5) -1) -:32] = memory[add2];
	end 
	
	#2 new_mem = 1'b0;
end



endmodule
