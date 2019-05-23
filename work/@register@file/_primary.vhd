library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        regMem          : in     vl_logic;
        writeS          : in     vl_logic;
        address1        : in     vl_logic_vector(4 downto 0);
        address2        : in     vl_logic_vector(4 downto 0);
        address3        : in     vl_logic_vector(4 downto 0);
        writeData       : in     vl_logic_vector(31 downto 0);
        data1           : out    vl_logic_vector(31 downto 0);
        data2           : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
