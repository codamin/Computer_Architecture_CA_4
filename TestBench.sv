`timescale 1ns/1ns

module TestBench();
   reg clk = 0, rst = 0;
   reg[31:0] instMemory[0:65535];
   reg[31:0] regMem[0:31];
   Main uut(clk, rst, instMemory, regMem);

   always #23 clk = ~clk;
   integer i;
   initial begin
      regMem[0] = 32'b00000000000000000000000000000000;
      regMem[1] = 32'b00000000000000000000000000000001;
      regMem[2] = 32'b00000000000000000000000000000010;
      regMem[3] = 32'b00000000000000000000000000000011;
      regMem[4] = 32'b00000000000000000000000000000100;
      regMem[5] = 32'b00000000000000000000000000000101;
      regMem[6] = 32'b00000000000000000000000000000110;
      regMem[7] = 32'b00000000000000000000000000000111;
      regMem[8] = 32'b00000000000000000000000000001000;
      regMem[9] = 32'b00000000000000000000000000001001;
      regMem[10] = 32'b00000000000000000000000000001010;
      regMem[11] = 32'b00000000000000000000000000001011;
      regMem[12] = 32'b00000000000000000000000000001100;
      regMem[13] = 32'b00000000000000000000000000001101;
      regMem[14] = 32'b00000000000000000000000000001110;
      regMem[15] = 32'b00000000000000000000000000001111;
      regMem[16] = 32'b00000000000000000000000000010000;
      regMem[17] = 32'b00000000000000000000000000010001;
      regMem[18] = 32'b00000000000000000000000000010010;
      regMem[19] = 32'b00000000000000000000000000010011;
      regMem[20] = 32'b00000000000000000000000000010100;
      regMem[21] = 32'b00000000000000000000000000010101;
      regMem[22] = 32'b00000000000000000000000000010110;
      regMem[23] = 32'b00000000000000000000000000010111;
      regMem[24] = 32'b00000000000000000000000000011000;
      regMem[25] = 32'b00000000000000000000000000011001;
      regMem[26] = 32'b00000000000000000000000000011010;
      regMem[27] = 32'b00000000000000000000000000011011;
      regMem[28] = 32'b00000000000000000000000000011100;
      regMem[29] = 32'b00000000000000000000000000011101;
      regMem[30] = 32'b00000000000000000000000000011110;
      regMem[31] = 32'b00000000000000000000000000011111;

      instMemory[0] = 32'b00000000001000000001100000100000; // R3 = R1 + R0
      instMemory[1] = 32'b00000000000000000000000000000000; // NOP
      instMemory[2] = 32'b00000000101001000011000000100010; // R6 = R5 - R4
      instMemory[3] = 32'b00000000111010000100100000100100; // R9 = R7 & R8
      instMemory[4] = 32'b00000001010010110110000000100101; // R12 = R10 | R11
      instMemory[5] = 32'b00000001101011100111100000101010; // R15 = SLT(R13, R14)
      instMemory[6] = 32'b00000000000000000000000000000000; // NOP
      instMemory[7] = 32'b00000000001000100001100000100000; // R3 = R1 + R2
      instMemory[8] = 32'b00000000010000110010000000100000; // R4 = R2 + R3
      instMemory[9] = 32'b00000000011001000010100000100000; // R5 = R3 + R4
      instMemory[10] = 32'b00000000001000100001100000000000; // R3 = R1 + R2
      instMemory[11] = 32'b00000000000000000000000000000000; // NOP
      instMemory[12] = 32'b10001101111100000000000000000011; // R16 = M[R15 + 3] //loadWord
      instMemory[13] = 32'b10101110000100001100000000000011; // M[R17 + 3] = R3 //storeWord
      instMemory[14] = 32'b00001000000000000000000000000000; // R6 = R5 | R4

      for(i=15; i < 65536; i=i+1) instMemory[i] = 32'b00000000000000000000000000000000;

      rst = 1'b1;
      #85 rst = 1'b0;
      #5850 $stop();
   end
endmodule





