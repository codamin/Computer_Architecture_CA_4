library verilog;
use verilog.vl_types.all;
entity Stage3 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sigI            : in     vl_logic_vector(4 downto 0);
        data1           : in     vl_logic_vector(15 downto 0);
        data2           : in     vl_logic;
        data3           : in     vl_logic_vector(31 downto 0);
        data4           : in     vl_logic_vector(31 downto 0);
        data5           : in     vl_logic_vector(4 downto 0);
        sigO            : out    vl_logic_vector(4 downto 0);
        out1            : out    vl_logic_vector(15 downto 0);
        out2            : out    vl_logic;
        out3            : out    vl_logic_vector(31 downto 0);
        out4            : out    vl_logic_vector(31 downto 0);
        out5            : out    vl_logic_vector(4 downto 0)
    );
end Stage3;