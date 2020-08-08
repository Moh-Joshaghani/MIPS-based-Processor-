

module Register_File(
 input wire [4:0] A1,
 input wire [4:0] A2,
 input wire [4:0] A3,
 output wire [31:0] RD1,
 output wire [31:0] RD2,
input wire [31:0] WD3,
input wire WE3,
input wire clk);

//variabes
reg [31:0] register [31:0];//adress  ezafe she mire paeen
 
 
//read regs from file
//these sould be in testbench only.
// $readmemb ("register.dat",register);
// #display("******************");


  
 assign RD1=(A1==5'b0)? 32'b0:register[A1];
 assign RD2=(A2==5'b0)? 32'b0:register[A2];
 
 always @ (posedge clk)
  begin 
  if (WE3)
   begin
    register[A3]=WD3;	
	 end//if
	 
  end//alw




endmodule

