`timescale 1ns/1ns
module PC(clk, rst, parallelIn, out);
  input clk, rst;
  input[15:0] parallelIn;
  output reg[15:0] out;
  
  always@(posedge clk, posedge rst) begin
    if(rst) out <= 16'b0;
    else out <= parallelIn;
  end
endmodule