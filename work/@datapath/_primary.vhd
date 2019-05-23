library verilog;
use verilog.vl_types.all;
entity Datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instMemory      : in     vl_logic;
        regMem          : in     vl_logic
    );
end Datapath;
