`timescale 1ns/1ns

module Stage1(clk, rst,flush, load, PcPIn, InstIn, PcPOut, InstOut);
   input clk, rst, flush, load;
   input[15:0] PcPIn;
   input[31:0] InstIn;
   output reg[15:0] PcPOut;
   output reg[31:0] InstOut;

   always@(posedge clk, posedge rst) begin
      if(rst) begin
         PcPOut <= 16'b0;
         InstOut <= 16'b0;
      end
      else if(flush) begin
         PcPOut <= 16'b0;
         InstOut <= 16'b0;
      else if(load) begin
         PcPOut <= PcPIn;
         InstOut <= InstIn;
      end
      else begin
         PcPOut <= PcPOut;
         InstOut <= InstOut;
      end
   end
endmodule

module Stage2(clk, rst, sigI, data1, data2, data3, data4, data5, data6, data7, sigO, out1, out2, out3, out4, out5, out6, out7);
      input clk, rst;
      input[8:0] sigI;
      input[15:0] data1;
      input[31:0] data2, data3, data4;
      input[4:0] data5, data6, data7;
      output reg[8:0] sigO;
      output reg[15:0] out1;
      output reg[31:0] out2, out3, out4;
      output reg[4:0] out5, out6, out7;

      always@(posedge clk, posedge rst) begin
         if(rst) begin
            sigO <= 9'b0;
            out1 <= 16'b0;
            out2 <= 32'b0;
            out3 <= 32'b0;
            out4 <= 32'b0;
            out5 <= 5'b0;
            out6 <= 5'b0;
         end
         else begin
            sigO <= sigO;
            out1 <= out1;
            out2 <= out2;
            out3 <= out3;
            out4 <= out4;
            out5 <= out5;
            out6 <= out6;
      end
   endmodule

   module Stage3(clk, rst, sigI, data2, data3, data4, data5, sigO, out2, out3, out4, out5);
   input clk, rst, data2;
   input[4:0] sigI;
   input[15:0] data1;
   input[31:0] data3, data4;
   input[4:0] data5;

   output reg[4:0] sigO;
   output reg out2;
   output reg[15:0] out1;
   output reg[31:0] out3, out4;
   output reg[4:0] out5;

   always@(posedge clk, posedge rst) begin
      if(rst) begin
         sigO <= 5'b0;
         out1 <= 16'b0;
         out2 <= 1'b0;
         out3 <= 32'b0;
         out4 <= 32'b0;
         out5 <= 5'b0;
      end
      else begin
         sigO <= sigI;
         out1 <= data1;
         out2 <= data2;
         out3 <= data3;
         out4 <= data4;
         out5 <= data5;
      end
   end
endmodule

module Stage4(clk, rst, sigI, data1, data2, data3, sigO, out1, out2, out3);
   input clk, rst;
   input[1:0] sigI;
   input[31:0]data1, data2;
   input[4:0]data3;

   output reg[1:0] sigO;
   output reg[31:0]out1, out2;
   output reg[4:0]out3;

   always@(posedge clk, posedge rst) begin
      if(rst) begin
         sigO <= 2'b0;
         out1 <= 32'b0;
         out2 <= 32'b0;
         out3 <= 5'b0;
      end
      else begin
         sigO <= sigI;
         out1 <= data1;
         out2 <= data2;
         out3 <= data3;
      end
   end
endmodule


