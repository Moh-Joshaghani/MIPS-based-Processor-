`timescale 1ns/1ns
module Ld_path (
input  wire [31:0] Instr_LdBuf,
input  wire [31:0] LdInstrNO_AG,
input  wire [31:0] Rd5,
input  wire [31:0] ROB_LdFAddr,
input  wire 	    ROB_LdFSAddr,


output wire  [4:0]  Ar5,
output wire [31:0] LdAddr_AG
);

wire [15:0] Out_LOPP;
wire 	      s_z;
wire [31:0] Add1;
wire [31:0] Add2;


LoadOPP Load_OPP(Instr_LdBuf,LdInstrNO_AG,Ar5,Out_LOPP,s_z);


sign_zero_ext s_z_ext(
.in(Out_LOPP),
.out(Add1),
.modee(s_z)
);
mux2_1 Mux_ADDG(
.in_1(Rd5), 
.in_2(ROB_LdFAddr),
.sel(ROB_LdFSAddr),
.out(Add2)
);

assign LdAddr_AG = Add1 + Add2;



endmodule