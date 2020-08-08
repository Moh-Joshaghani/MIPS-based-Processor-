module mux2_1_rd(
input  wire [31:0] in_1, 
input  wire [31:0] in_2,
input  wire         sel,
output reg [31:0] out);

always@(*)
begin  
	out = in_1;
	if(sel==1'b1)
	 out = in_2;
  
end
endmodule

