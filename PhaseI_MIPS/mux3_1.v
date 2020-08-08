module mux3_1(
input  wire [31:0]in_1, 
input  wire [31:0]in_2,
input  wire [31:0]in_3,
input  wire [1:0] sel,
output wire [31:0]out);
  
assign out = (sel == 2'b00)? in_1 :
              (sel == 2'b01)? in_2:in_3 ;
  
  
endmodule