module mux5_1(
input  wire [31:0]in_1, 
input  wire [31:0]in_2,
input  wire [31:0]in_3,
input  wire [31:0]in_4,
input  wire [31:0]in_5,
input  wire [2:0] sel,
output wire [31:0]out);
  
assign out =  (sel == 3'b000)? in_1:
              (sel == 3'b001)? in_2:
			  (sel == 3'b010)? in_3:
			  (sel == 3'b011)? in_4: in_5 ;
  
  
endmodule