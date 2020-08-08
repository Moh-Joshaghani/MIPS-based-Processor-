
`timescale 1ns/1ns

module multi_cycle_mips__tb;
  integer alaki;
   reg clk = 1;
   always @(clk)
      clk <= #5 ~clk;

   reg reset;
   initial
   begin
      reset = 1;
      alaki = 1;
      #7;
      reset = 0;
   end
 
   SuperScalar uut(
      .clk(clk),
      .rst(reset)
   );
//  defparam uut.DataMemory.memsize= 1023;

 //  initial
   //   $readmemh("isort32.hex", uut.DataMemory.memory);


   parameter end_pc = 32'h7C;
// parameter end_pc = 32'h30;

   integer i;
   always @(uut.PC0, uut.PC1, uut.PC2,uut.PC3)
      if(uut.PC0 == end_pc || uut.PC1 == end_pc)begin //	||uut.PC1 == end_pc ||uut.PC2 == end_pc ||uut.PC3 == end_pc ||uut.PC4 == end_pc ||uut.PC5 == end_pc ||uut.PC6 == end_pc ||uut.PC7 == end_pc  ) begin
	//  if(uut.PC0 > end_pc) begin
         for(i=0; i<96; i=i+1) begin
        $write("%x ", uut.DataMemory.memory[32+i]); // 
            if(((i+1) % 16) == 0)
               $write("\n");
         end
         $stop;
      end




endmodule

