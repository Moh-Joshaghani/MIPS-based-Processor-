module mux2_1_5b(
input  wire [4:0] in_1, 
input  wire [4:0] in_2,
input  wire         sel,
output wire [4:0] out);
  
assign out = (sel == 1'b0)? in_1:in_2 ;
  
  
endmodule

