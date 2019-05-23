library verilog;
use verilog.vl_types.all;
entity Main is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        instMemory      : in     vl_logic;
        regMem          : in     vl_logic
    );
end Main;
