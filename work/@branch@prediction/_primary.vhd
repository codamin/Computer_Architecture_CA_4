library verilog;
use verilog.vl_types.all;
entity BranchPrediction is
    port(
        opCode          : in     vl_logic_vector(5 downto 0);
        compResult      : in     vl_logic;
        PCSrcS          : out    vl_logic;
        FlushS          : out    vl_logic;
        jumpS           : out    vl_logic
    );
end BranchPrediction;
