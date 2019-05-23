`timescale 1ns/1ns
module BranchPrediction(opCode, compResult, PCSrcS, FlushS, jumpS);
   input[5:0] opCode;
   input compResult;
   output PCSrcS, FlushS;
   
   always@(opCode, compResult) begin
      {PCSrcS, FlushS, jumpS} = 2'b111;
      if(opCode == 4 && compResult) begin
         PCSrcS = 1'b1;
         FlushS = 1'b1;
      end
      else if(opCode == 5 && ~compResult) begin
         PCSrcS = 1'b1;
         FlushS = 1'b1;
      end
      else if(opCode == 2) begin
         jumpS = 1'b1;
      end
   end
endmodule