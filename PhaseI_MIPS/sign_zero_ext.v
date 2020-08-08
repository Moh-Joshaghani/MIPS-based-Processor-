//mode0 = sign ext, mode1 = zero ext

module sign_zero_ext(
input wire [15:0]  in, output wire [31:0] out, input  wire modee
);

assign out = modee? {{16{1'b0}},in[15:0]} :{{16{in[15]}},in[15:0]} ;

endmodule