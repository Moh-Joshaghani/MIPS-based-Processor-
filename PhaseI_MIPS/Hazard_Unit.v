/*
if ((rsE != 0) AND (rsE == WriteRegM) AND RegWriteM) then
 ForwardAE = 10
else if ((rsE != 0) AND (rsE == WriteRegW) AND RegWriteW) then
 ForwardAE = 01
else ForwardAE = 00
** B is similiar except rs ---> rt

-------------------------------------------
lwstall = ((RsD== RtE) OR (RtD== RtE)) AND MemtoRegE
StallF = StallD = FlushE = lwstall
--------------------------------------------
ForwardAD = (RsD != 0) AND (RsD == WriteRegM) AND RegWriteM
ForwardBD = (RtD != 0) AND (RtD == WriteRegM) AND RegWriteM
--------------------------------------------
branchstall =
BranchD AND RegWriteE AND (WriteRegE == RsD OR WriteRegE == RtD)
OR
BranchD AND MemtoRegM AND (WriteRegM == RsD OR WriteRegM == RtD)
StallF = StallD = FlushE = lwstall OR branchstall
--------------------------------------------



*/

module Hazard_Unit(
input  wire [4:0] RsE,//
input  wire [4:0] RtE,//
input  wire [4:0] RsD,//
input  wire [4:0] RtD,
input  wire [4:0] WriteRegW,
input  wire [4:0] WriteRegM,
input  wire [4:0] WriteRegE,
input  wire       MemtoRegE,//
input  wire       MemtoRegM,//
input  wire       RegWriteE,//
input  wire       RegWriteM,// 
input  wire       RegWriteW,//
input  wire       BranchD,
input  wire 	  rst,//
//input  wire       clk,
output reg        StallF,
output reg        StallD,//datafregf1,datafregf2
output reg        FlushE,
output reg        ForwardAD,
output reg        ForwardBD,
output reg [1:0] ForwardAE,
output reg [1:0] ForwardBE
);

reg alaki ;
always@(*)

begin
  if(rst)
  begin
  StallF=1'b0;
  StallD=1'b0;
  FlushE=1'b0;    
  end

  ForwardAE=2'b00;
  ForwardBE=2'b00;
  StallF=1'b0;
  StallD=1'b0;
  FlushE=1'b0;
  ForwardAD=1'b0;
  ForwardBD=1'b0;  

//if( (RsD==1'b0 || RsD==1'b1)&&rst==0)
//begin  
  if((RsE != 0) && (RsE == WriteRegM) && RegWriteM)
    ForwardAE=2'b10;
  else if ((RsE != 0) && (RsE == WriteRegW) && RegWriteW)
    ForwardAE=2'b01;
  else
    ForwardAE=2'b00;
  //
  if ((RtE != 0) && (RtE == WriteRegM) && RegWriteM)
    ForwardBE=2'b10;
  else if ((RtE != 0) && (RtE == WriteRegW) && RegWriteW)
    ForwardBE=2'b01;
  else 
    ForwardBE=2'b00;

   // 
  if ((((RsD== RtE)||(RtD== RtE)) && MemtoRegE)||(BranchD && RegWriteE && (WriteRegE == RsD || (WriteRegE == RtD)))|| (BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD)))
  
  begin
          StallF=1'b1;
          StallD=1'b1;
          FlushE=1'b1;
  end
     
     //
  if ((RsD != 0) && (RsD == WriteRegM) && RegWriteM)
       ForwardAD=1'b1;
  if ((RtD != 0) && (RtD == WriteRegM) && RegWriteM)
       ForwardBD=1'b1;
     

//end//if     
end//always

/*
assign ForwardAE = ((RsE != 0) && (RsE == WriteRegM) && RegWriteM)?
        10: ((RsE != 0) && (RsE == WriteRegM) && RegWriteM)? 
         01:00;
assign ForwardBE = ((RtE != 0) && (RtE == WriteRegM) && RegWriteM)?
        10: ((RtE != 0) && (RtE == WriteRegM) && RegWriteM)? 
         01:00;


assign StallF = (((RsD== RtE)||(RtD== RtE)) && MemtoRegE)||
                 BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)||
                 BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD);
assign StallD = (((RsD== RtE)||(RtD== RtE)) && MemtoRegE)||
                 BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)||
                 BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD);
assign FlushE = (((RsD== RtE)||(RtD== RtE)) && MemtoRegE)||
                 BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)||
                 BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD); 


assign ForwardAD = ((RsD != 0) && (RsD == WriteRegM) && RegWriteM);
assign ForwardBD = ((RtD != 0) && (RtD == WriteRegM) && RegWriteM);




*/
endmodule
