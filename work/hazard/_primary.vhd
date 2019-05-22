library verilog;
use verilog.vl_types.all;
entity hazard is
    port(
        id_ex_memRead   : in     vl_logic;
        id_ex_rt        : in     vl_logic_vector(4 downto 0);
        if_id_rs        : in     vl_logic_vector(4 downto 0);
        if_id_rt        : in     vl_logic_vector(4 downto 0);
        PCwrite         : out    vl_logic;
        if_id_write     : out    vl_logic;
        cancel          : out    vl_logic
    );
end hazard;
