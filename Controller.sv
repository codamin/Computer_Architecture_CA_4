module ControllerUnit(zero, opcode,aluS, regDstS, aluSrcS, dataMemReadS, PCSrcS, dataMemWriteS, writeRegS, memToRegS);
  input zero;
  input[5:0] opcode;
  output reg[2:0] aluS;
  output reg writeRegS, memToRegS, dataMemWriteS, dataMemReadS, PCSrcS, aluSrcS, regDstS;
  
  parameter[5:0] NOP = 0, ADD = 1, SUB = 2, AND = 3, OR = 4, SLT = 5, LW = 6, SW = 7, JMP = 8, BEQ = 9, BNE = 10;
  parameter[2:0] add_ = 0, sub_ = 1, and_ = 2, or_ = 3, lt_ = 4;

  always@(opcode, zero) begin
    {writeRegS, memToRegS, dataMemWriteS, PCSrcS, aluS, aluSrcS, regDstS, dataMemReadS} = 10'b0;
    case(opcode)
    // NOP: begin
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
    LW: begin
      {writeRegS, aluSrcS, memToRegS, dataMemReadS} = 4'b1111;
      aluS = add_;
    end
    SW: begin
      {aluSrcS, dataMemWriteS} = 2'b11;
      aluS = add_;
    end
    // JMP:
    BEQ: begin
      aluS = sub_;
    end
    BNE: begin
      aluS = sub_;
    end
    default: begin
      {writeRegS, memToRegS, dataMemWriteS, PCSrcS, aluS, aluSrcS, regDstS} = 9'b0;
    end
    endcase
  end
endmodule