`timescale 1ns/1ns

module Main(clk, rst, instMemory, regMem);
   input clk, rst;
   input[31:0] instMemory[0:65535];
   input[31:0] regMem[0:31];
   wire zero, Szero, PCWrite, IFIDWrite, normalS, PCSrcS, FlushS, CompBranchPrediction;
   wire[8:0] sigT, SsigT, sigTFinal;
   wire[4:0] S2sigT;
   wire[1:0] S3sigT, frwrdASel, frwrdBSel;

   wire[15:0] PCIn, PCOut, PlussedPC, SPlussedPC, PCSrc1, SPCSrc1, S2PlussedPC;
   wire[31:0] InstMemOut, SInstMemOut, regDataIn, regDataOut1, regDataOut2, extAdr, SregDataOut1, SregDataOut2, SextAdr;
   wire[31:0] aluSrcB, aluOut, ShiftedExtAdr, SaluOut, S2regDataOut2, dataMemOut;
   wire[4:0] Sreg1, Sreg2, Sreg3, regDst, SregDst, S2regDst;

   PC pc(clk, rst, PCWrite, PCIn, PCOut);
   assign InstMemOut = instMemory[PCOut];
   assign PlussedPC = PCOut + 1;
   assign PCIn = PCSrcS ? PCSrc1 : PlussedPC;

   Stage1 stage1(clk, rst, FlushS, IFIDWrite, PlussedPC, InstMemOut, SPlussedPC, SInstMemOut);

   RegisterFile regFile(clk, rst, regMem, S3sigT[1], SInstMemOut[25:21], SInstMemOut[20:16], S2regDst, regDataIn, regDataOut1, regDataOut2);
   assign CompBranchPrediction = (regDataOut1 == regDataOut2);
   Extend1632 extAddress(SInstMemOut[15:0], extAdr);
   assign ShiftedExtAdr = extAdr << 2;
   assign PCSrc1 = SPlussedPC + ShiftedExtAdr;
   module Hazard(id_ex_memRead, id_ex_rt, if_id_rs, if_id_rt, PCwrite, if_id_write, cancel);
   Hazard hazard(SsigT[3], Sreg2, SInstMemOut[25:21], SInstMemOut[20:16], PCWrite, IFIDWrite, normalS);
   assign sigTFinal = normalS ? sigT : 9'b0;
   
   ControllerUnit cu(zero, InstMemOut[31:26], InstMemOut[5:0] sigT[8:6], sigT[5], sigT[4], sigT[3], sigT[2], sigT[1], sigT[0]);

   Stage2 stage2(clk, rst, sigTFinal, SPlussedPC, regDataOut1, regDataOut2, extAdr, SInstMemOut[25:21], SInstMemOut[20:16], SInstMemOut[15:11],
                     SsigT, S2PlussedPC, SregDataOut1, SregDataOut2, SextAdr, Sreg1, Sreg2, Sreg3);
   
   assign aluSrcBb = (frwrdBSel == 2'b00) ? SextAdr : (frwrdBSel == 2'b01) ? SaluOut : regDataIn;
   assign aluSrcB = SsigT[4] ? aluSrcBb : SregDataOut2;
   assign aluSrcA = (frwrdASel == 2'b00) ? SregDataOut1: (frwrdASel == 2'b01) ? SaluOut : regDataIn;
   ALU alu(SsigT[8:6], aluSrcA, aluSrcB, aluOut, zero);
   assign regDst = SsigT[5] ? Sreg3 : Sreg2;
   ForwardingUnit forwarding(Sreg1, Sreg2, S2sigT[1], SregDst, S3sigT[1], S2regDst, frwrdASel, frwrdBSel);
   Stage3 stage3(clk, rst, SsigT[3:0], zero, aluOut, SregDataOut2, regDst,
                     S2sigT, Szero, SaluOut, S2regDataOut2, SregDst);
   
   DataMemory dataMemory(clk, rst, S2sigT[2], SaluOut[15:0], S2regDataOut2, dataMemOut);

   Stage4 stage4(clk, rst, S2sigT[1:0], dataMemOut, S2regDataOut2, SregDst,
                     S3sigT, SdataMemOut, S3regDataOut2, S2regDst);
   
   assign regDataIn = S3sigT[0] ? SdataMemOut : S3regDataOut2;

endmodule
   


   



