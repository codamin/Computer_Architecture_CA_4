module ControllerUnit(zero, opcode, func, aluS, regDstS, aluSrcS, dataMemReadS, dataMemWriteS, writeRegS, memToRegS);
  input zero;
  input[5:0] opcode, func;
  output reg[2:0] aluS;
  output reg writeRegS, memToRegS, dataMemWriteS, dataMemReadS, aluSrcS, regDstS;
  
  parameter[5:0] LW = 35, SW = 43, JMP = 2, BEQ = 4, BNE = 5, RT = 0;
  parameter[5:0] NOP = 0, ADD = 32, SUB = 34, AND = 36, OR = 37, SLT = 42;
  parameter[2:0] add_ = 0, sub_ = 1, and_ = 2, or_ = 3, lt_ = 4;



  always@(opcode, func, zero) begin
    {writeRegS, memToRegS, dataMemWriteS, aluS, aluSrcS, regDstS, dataMemReadS} = 9'b0;
    case(opcode)
    // NOP: begin
    RT: begin
      case(func)
      ADD: begin
        {writeRegS, regDstS} = 2'b11;
        aluS = add_;
      end
      SUB: begin
        {writeRegS, regDstS} = 2'b11;
        aluS = sub_;
      end
      AND: begin
        {writeRegS, regDstS} = 2'b11;
        aluS = and_;
      end
      OR: begin
        {writeRegS, regDstS} = 2'b11;
        aluS = or_;
      end
      SLT: begin
        {writeRegS, regDstS} = 2'b11;
        aluS = lt_;
      end
      default: begin
        {writeRegS, memToRegS, dataMemWriteS, aluS, aluSrcS, regDstS} = 9'b0;
      end
      endcase
    end
    LW: begin
      {writeRegS, aluSrcS, memToRegS, dataMemReadS} = 4'b1111;
      aluS = add_;
    end
    SW: begin
      {aluSrcS, dataMemWriteS} = 2'b11;
      aluS = add_;
    end
    // // JMP:
    BEQ: begin
      aluS = sub_;
    end
    BNE: begin
      aluS = sub_;
    end
    default: begin
      {writeRegS, memToRegS, dataMemWriteS, aluS, aluSrcS, regDstS} = 9'b0;
    end
    endcase
  end
endmodule