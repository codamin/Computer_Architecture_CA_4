`timescale 1ns/1ns

module Main(clk, rst, instMemory, regMem);
   input clk, rst;
   input[31:0] instMemory[0:65535];
   input[31:0] regMem[0:31];
   wire zero, Szero;
   wire[9:0] sigT, SsigT;
   wire[4:0] S2sigT;
   wire[1:0] S3sigT;

   wire[15:0] PCIn, PCOut, PlussedPC, SPlussedPC, PCSrc1, SPCSrc1, S2PlussedPC;
   wire[31:0] InstMemOut, SInstMemOut, regDataIn, regDataOut1, regDataOut2, extAdr, SregDataOut1, SregDataOut2, SextAdr;
   wire[31:0] aluSrcB, aluOut, ShiftedExtAdr, SaluOut, S2regDataOut2, dataMemOut;
   wire[4:0] Sreg1, Sreg2, regDst, SregDst, S2regDst;

   PC pc(clk, rst, PCIn, PCOut);
   assign InstMemOut = instMemory[PCOut];
   assign PlussedPC = PCOut + 1;
   assign PCIn = S2sigT[3] ? PCSrc1 : PlussedPC;

   Stage1 stage1(clk, rst, PlussedPC, InstMemOut, SPlussedPC, SInstMemOut);

   RegisterFile regFile(clk, rst, regMem, S3sigT[1], SInstMemOut[25:21], SInstMemOut[20:16], S2regDst, regDataIn, regDataOut1, regDataOut2);
   Extend1632 extAddress(SInstMemOut[15:0], extAdr);
   assign ShiftedExtAdr = extAdr << 2;
   assign PCSrc1 = SPlussedPC + ShiftedExtAdr;
   
   ControllerUnit cu(zero, InstMemOut[31:26], sigT[9:7], sigT[6], sigT[5], sigT[4], sigT[3], sigT[2], sigT[1], sigT[0]);

   Stage2 stage2(clk, rst, sigT, SPlussedPC, regDataOut1, regDataOut2, extAdr, SInstMemOut[20:16], SInstMemOut[15:11],
                     SsigT, S2PlussedPC, SregDataOut1, SregDataOut2, SextAdr, Sreg1, Sreg2);

   assign aluSrcB = SsigT[5] ? SextAdr : SregDataOut2;
   // assign ShiftedSExtAdr = SextAdr << 2;
   ALU alu(SsigT[9:7], SregDataOut1, aluSrcB, aluOut, zero);
   // assign PCSrc1 = S2PlussedPC + ShiftedSextAdr;
   assign regDst = SsigT[6] ? Sreg2 : Sreg1;

   Stage3 stage3(clk, rst, SsigT[4:0], zero, aluOut, SregDataOut2, regDst,
                     S2sigT, Szero, SaluOut, S2regDataOut2, SregDst);
   
   DataMemory dataMemory(clk, rst, S2sigT[2], SaluOut[15:0], S2regDataOut2, dataMemOut);

   Stage4 stage4(clk, rst, S2sigT[1:0], dataMemOut, S2regDataOut2, SregDst,
                     S3sigT, SdataMemOut, S3regDataOut2, S2regDst);
   
   assign regDataIn = S3sigT[0] ? SdataMemOut : S3regDataOut2;

endmodule
   


   



