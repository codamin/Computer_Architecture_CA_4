library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        \add_\          : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        \sub_\          : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        \and_\          : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        \or_\           : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        \lt_\           : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    port(
        aluControl      : in     vl_logic_vector(2 downto 0);
        input1          : in     vl_logic_vector(31 downto 0);
        input2          : in     vl_logic_vector(31 downto 0);
        aluOUT          : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \add_\ : constant is 2;
    attribute mti_svvh_generic_type of \sub_\ : constant is 2;
    attribute mti_svvh_generic_type of \and_\ : constant is 2;
    attribute mti_svvh_generic_type of \or_\ : constant is 2;
    attribute mti_svvh_generic_type of \lt_\ : constant is 2;
end ALU;
