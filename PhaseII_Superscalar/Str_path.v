`timescale 1ns/1ns
module Str_path (
input  wire [31:0] Instr_Str,
input  wire [31:0] InstrNO_Str,
input  wire [31:0] R1_Str,
input  wire [31:0] ROB_FAddr,
input  wire 	      ROB_FSAddr,
input  wire [31:0] ROB_Fvalue,
input  wire 	      ROB_FSvalue,
output wire         WE_AG,
output wire [4:0]  AR1_Str,
output wire [31:0] StrAddr_AG,
output wire [4:0]  AR2_Str,
input  wire [31:0] R2_Str,
output wire  [31:0] store_data_AG,
input  wire         clk
);

wire [15:0] Out_LOPP;
wire 	      s_z;
wire [31:0] Add1;
wire [31:0] Add2;


StrOPP Str_OPP(
Instr_Str,
InstrNO_Str,
AR1_Str,
AR2_Str,
WE_AG,
Out_LOPP,
s_z,
clk);


sign_zero_ext s_z_ext(
.in(Out_LOPP),
.out(Add1),
.modee(s_z)
);

mux2_1 Mux_ADDG(
.in_1(R1_Str), 
.in_2(ROB_FAddr),
.sel(ROB_FSAddr),
.out(Add2)
);

mux2_1 Mux_Data(
.in_1(R2_Str), 
.in_2(ROB_Fvalue),
.sel(ROB_FSvalue),
.out(store_data_AG)
);




assign StrAddr_AG = Add1 + Add2;

endmodule