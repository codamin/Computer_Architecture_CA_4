`timescale 1ns/1ns
module BranchPrediction(opCode, compResult, PCSrcS, FlushS, jumpS);
   input[5:0] opCode;
   input compResult;
   output reg PCSrcS, FlushS, jumpS;
   
   always@(opCode, compResult) begin
      {PCSrcS, FlushS, jumpS} = 3'b000;
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
         FlushS = 1'b1;
      end
   end
endmodule