`timescale 1ns/1ns

module RegisterFile(clk, rst,regMem, writeS, address1, address2, address3, writeData, data1, data2);
   input clk, rst, writeS;
   input[31:0] regMem[0:31];
   input[4:0] address1, address2, address3;
   input[31:0] writeData;
   output[31:0] data1, data2;
   
   reg[31:0] memory[0:31];

   assign data1 = memory[address1];
   assign data2 = memory[address2];
   integer i;
   always@(posedge clk, posedge rst) begin
      if(rst) begin
         for(i=0; i<32; i=i+1) memory[i] <= regMem[i];
      end
      else if(writeS) memory[address3] <= writeData;
   end
endmodule
