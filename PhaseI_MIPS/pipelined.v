module pipelined(input reg clk,input reg rst);


//________________________________________________________________________________
wire [31:0] PCBranchD,RD1,RD2,RD1_m,RD2_m,RD1_mm,RD2_mm,RD1E,RD2E,ResultW,ALUOutM;
wire PCSrcD,StallD,StallF,ForwardAD,ForwardBD;
wire [31:0] PC,PCF,InstrF,PCPlus4F,InstrD,SignImmD,SignImmE,PCPlus4D,
            SrcAE,SrcBE,WriteDataE,ALUOutE,WriteDataM,ReadDataM,
            ReadDataW,ALUOutW;
wire [4:0] WriteRegW,WriteRegE,RsD,RtD,RdD,RsE,RtE,RdE,WriteRegM;              
wire [3:0] ALUControlD,ALUControlE;
wire [1:0] ForwardAE,ForwardBE;
wire RegWriteW,MemtoRegD,MemWriteD,EqualD,FlushE,RegWriteM;
wire MemtoRegM,MemWriteM,Zero,MemtoRegW,EqualD1,BranchD,ALUSrcD,RegDstD,RegWriteD;
wire ZeroOrSign;
//________________________________________________________________________________            

//______    Fetch Stage
mux2_1 PCmux(PCPlus4F,PCBranchD,PCSrcD,PC);  
PC_flipflop PCff(clk,(~StallF),PC,rst,PCF);
Instr_Memory Instruction_memory(PCF,InstrF);

adder PCadder(PCF,32'b100,PCPlus4F);
FD_flipflop F_D(clk,InstrF,PCPlus4F,PCSrcD,(~StallD),InstrD,PCPlus4D);
                  
//______   Decode Stage:
Register_File RegisterFile(InstrD[25:21],InstrD[20:16],WriteRegW,RD1,RD2,ResultW,RegWriteW,clk);
Control_Unit ControlUnit(InstrD[31:26],InstrD[5:0],MemtoRegD,MemWriteD,BranchD,ALUSrcD,RegDstD,
                                                              RegWriteD,ALUControlD,ZeroOrSign);
sign_zero_ext SignExtend(InstrD[15:0],SignImmD,ZeroOrSign);
mux2_1 muxRD1 (RD1,ALUOutM,ForwardAD,RD1_m);
mux2_1 muxRD2 (RD2,ALUOutM,ForwardBD,RD2_m);

// to support bne
assign EqualD1 = (RD1_m==RD2_m)? 1'b1:1'b0; 
mux2_1_1b muxbranch (EqualD1,~EqualD1,InstrD[26],EqualD);  
assign PCSrcD = EqualD & BranchD;

assign RsD[4:0]=InstrD[25:21];
assign RtD[4:0]=InstrD[20:16];
assign RdD[4:0]=InstrD[15:11];

adder AdderD ({SignImmD[29:0],{2'b00}},PCPlus4D,PCBranchD);
DE_flipflop D_E(clk,RD1,RD2,SignImmD,RsD,RtD,RdD,RegWriteD,MemtoRegD,MemWriteD,
            ALUControlD,ALUSrcD,RegDstD,FlushE,RegWriteE,MemtoRegE,MemWriteE,
            ALUControlE,ALUSrcE,RegDstE,RsE,RtE,RdE,SignImmE,RD1E,RD2E);


// execute stage
mux2_1_5b muxd0 (RtE,RdE,RegDstE,WriteRegE);
mux3_1 muxd1 (RD1E,ResultW,ALUOutM,ForwardAE,SrcAE);
mux3_1 muxd2 (RD2E,ResultW,ALUOutM,ForwardBE,WriteDataE);
mux2_1 muxd3 (WriteDataE,SignImmE,ALUSrcE,SrcBE);

ALU MIPSALU(SrcAE,SrcBE,ALUControlE,ALUOutE,Zero);





EM_flipflop E_M(clk,ALUOutE,WriteDataE,WriteRegE,RegWriteE,MemtoRegE,
                MemWriteE,ALUOutM,WriteDataM,WriteRegM,RegWriteM,
                MemtoRegM,MemWriteM);


//mem stage
Data_Memory DataMemory(ALUOutM,clk,MemWriteM,ReadDataM,WriteDataM);
//defparam DataMemory.memsize=1024;
MW_flipflop M_W(clk,ReadDataM,ALUOutM,WriteRegM,RegWriteM,MemtoRegM,
                ALUOutW,ReadDataW,WriteRegW,RegWriteW,MemtoRegW);

//write back stage
mux2_1 muxw0 (ALUOutW,ReadDataW,MemtoRegW,ResultW);


//implementing hazard unit
Hazard_Unit HazardUnit(RsE,RtE,RsD,RtD,WriteRegW,WriteRegM,WriteRegE,MemtoRegE,
                  MemtoRegM,RegWriteE,RegWriteM,RegWriteW,BranchD,rst,StallF,
                  StallD,FlushE,ForwardAD,ForwardBD,ForwardAE,ForwardBE);


endmodule



