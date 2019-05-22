module mainController(clk, rst, zero, opcode, memWrite, mem2reg, jump, branch, regWrite, aluOP);
  input clk, rst, zero;
  input[3:0] opcode;
  output reg[2:0] aluOP;
  output reg memWrite, mem2reg, jump, branch, regWrite;
  
  parameter[3:0] beq = 4'b 0100, Rtype = 4'b 1000, Load = 4'b0000, Store = 4'b0001, Jump = 4'b0010;
  parameter[2:0] need_add = 0, need_sub = 1, need_and = 2, need_or = 3, need_func = 4;
  
    
  always@(opcode, zero) begin
    {memWrite, mem2reg, jump, branch, regWrite, aluOP} = 9'b 0;
    
    case(opcode)
      Load: begin
        mem2reg = 1'b1;
        regWrite = 1'b1;
      end
      
      Store: memWrite = 1'b1;

      Jump: jump = 1'b1;

      beq:begin
        aluOP = need_sub;
        branch = zero? 1'b1: 1'b0;
      end
      
      Rtype:begin
        aluOP = need_func;
        regWrite = 1'b 1;
      end
      default: aluOP = 5;
    endcase
  end
  endmodule
