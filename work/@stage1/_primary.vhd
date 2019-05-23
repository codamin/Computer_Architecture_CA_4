library verilog;
use verilog.vl_types.all;
entity Stage1 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PcPIn           : in     vl_logic_vector(15 downto 0);
        InstIn          : in     vl_logic_vector(31 downto 0);
        PcPOut          : out    vl_logic_vector(15 downto 0);
        InstOut         : out    vl_logic_vector(31 downto 0)
    );
end Stage1;
