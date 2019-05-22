library verilog;
use verilog.vl_types.all;
entity forwarding is
    port(
        id_ex_rs        : in     vl_logic_vector(4 downto 0);
        id_ex_rt        : in     vl_logic_vector(4 downto 0);
        ex_mem_regWrite : in     vl_logic;
        ex_mem_rd       : in     vl_logic_vector(4 downto 0);
        mem_wb_regWrite : in     vl_logic;
        mem_wb_rd       : in     vl_logic_vector(4 downto 0);
        fwA             : out    vl_logic_vector(1 downto 0);
        fwB             : out    vl_logic_vector(1 downto 0)
    );
end forwarding;
