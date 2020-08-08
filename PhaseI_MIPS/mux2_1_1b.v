module mux2_1_1b(
input  wire in_1, 
input  wire in_2,
input  wire sel,
output wire out);
  
assign out = (sel == 1'b0)? in_1:in_2 ;
  
  
endmodule

