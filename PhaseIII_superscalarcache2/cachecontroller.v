`timescale 1ns/100ps
module cachecontroller(
input  wire			clk,
input  wire			rst,
//input  wire 		new_Ld,
input  wire [31:0]  Ld_instr,
input  wire [31:0]  Ld_INO,
//input  wire 		new_Str,
input  wire [31:0] Str_instr,
input  wire [31:0] Str_INO,
input  wire [31:0] Str_data,
input  wire        WE_AG,
//AG
input wire  [31:0] Ld_addr,
input wire  [31:0] Str_addr,
//--ROB
output reg  [31:0] Ld_data2ROB,
output reg  [31:0] Ld_instr2ROB,
output reg  [31:0] Ld_INO2ROB,

//from memory
input  wire [255:0] str_data_mem,
input  wire [255:0] ld_data_mem,



//-- to dmff

output reg [31:0]  Ld_instr_AG,
output reg [31:0]  Ld_INO_AG,
output reg [31:0]  Ld_addr_AG,
output reg		   WE_c_AG,
output reg [31:0]  Str_data_AG,
output reg [31:0]  Str_addr_AG,
input wire new_mem


);

//---------------------------------------------------------
reg [155:0] cache [0:3]; //yeki ezafe nist??
reg [27:0] str_tag;//yeki ezafe nist??
reg [27:0] tag_ld;
integer addd,addl;
reg [31:0] str_addrbuf;
reg [31:0] ld_addrbuf;
reg waiting_for_read_ld, waiting_for_read_str;
reg ld_hit,str_hit;
integer i1,i2,i3,i4,i5,i6;
reg  [1:0] lru;
always@(Ld_INO)
begin	
  #4;
	ld_hit = 1'b0;
	for(i1=0; i1<4; i1=i1+1)
	begin
    tag_ld = cache[i1][155:129];
		if(tag_ld == Ld_addr[31:4] && (cache[i1][128]==1'b1) )//hit
		begin
			ld_hit = 1'b1;
			Ld_INO2ROB    = Ld_INO;
			addl = ((Ld_addr[3:2]+1)<<5) -1;
			Ld_data2ROB   = cache[i1][addl -:32];
			Ld_instr2ROB  = Ld_instr;	
			i1=i1+10;		
		end	
	end
	
	if( ld_hit == 1'b0)	//miss
	begin
		Ld_instr_AG = Ld_instr;
		Ld_INO_AG = Ld_INO;
		Ld_addr_AG = Ld_addr;
		waiting_for_read_ld = 1'b1;
		ld_addrbuf = Ld_addr;
	end
end

always@(Str_INO) //write through
begin
  #4;
	str_hit = 1'b0;
	for(i2=0; i2<4; i2=i2+1)
	begin
	  	  str_tag = cache[i2][155:129];
		if( str_tag== Str_addr[31:4] && (cache[i2][128]==1'b1) )//hit
		begin
			str_hit =1'b1;
			addd =Str_addr[3:2];
			addd=addd +3'b001;
			addd=(addd<<5) -1;
			cache[i2][addd -:32] = Str_data;
			Str_data_AG=Str_data ;
			Str_addr_AG = Str_addr;
			WE_c_AG = WE_AG;
			i2= i2+10;
		end
	end
	if(str_hit == 1'b0) //miss
	begin
		waiting_for_read_str = 1'b1;
		Str_data_AG=Str_data ;
		Str_addr_AG = Str_addr;
		WE_c_AG = WE_AG;
		str_addrbuf = Str_addr;
	end
end

always@(posedge clk)
begin
	if(rst)
	begin
		lru = 1'b0;
	end
end
always@(new_mem)
begin
  if(new_mem)
    begin
	#2;
	if(waiting_for_read_str)
	begin
		waiting_for_read_str = 1'b0;
		cache[lru][127:0] = str_data_mem;
		cache[lru][155:129] = str_addrbuf[31:4];
//		cache[lru][257] = 1'b1;
		cache[lru][128] = 1'b1;
		lru = lru+1'b1;
	end
	
	if(waiting_for_read_ld)
	begin
		waiting_for_read_ld = 1'b0;
		cache[lru][127:0] = ld_data_mem;
		cache[lru][155:129] = ld_addrbuf[31:5];
		cache[lru][128] = 1'b1;
		lru = lru+1'b1;	
	end
	
	#2;
	WE_c_AG = 1'b0;
end	
end

endmodule
