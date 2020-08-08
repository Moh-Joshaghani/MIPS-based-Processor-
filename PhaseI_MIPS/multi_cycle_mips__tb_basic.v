
`timescale 1ns/1ns

module multi_cycle_mips__tb;

   reg clk = 1;
   always @(clk)
      clk <= #5 ~clk;

   reg reset;
   initial begin
      reset = 1;
  //    @(posedge clk);
    //  @(posedge clk);
      //@(posedge clk);
      #15;
      reset = 0;
   end

   pipelined uut(
      .clk(clk),
      .rst(reset)
   );
  defparam uut.DataMemory.memsize= 1023;

 //  initial
   //   $readmemh("isort32.hex", uut.DataMemory.memory);


   parameter end_pc = 32'h7C;
// parameter end_pc = 32'h30;

   integer i;
   always @(uut.PCF)
      if(uut.PCF == end_pc) begin
         for(i=0; i<96; i=i+1) begin
            $write("%x ", uut.DataMemory.memory[32+i]); // 32+ for iosort32
            if(((i+1) % 16) == 0)
               $write("\n");
         end
         $stop;
      end




endmodule

