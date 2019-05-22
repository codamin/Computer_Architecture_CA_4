library verilog;
use verilog.vl_types.all;
entity mainController is
    generic(
        beq             : vl_logic_vector(3 downto 0) := (Hi0, Hi1, Hi0, Hi0);
        Rtype           : vl_logic_vector(3 downto 0) := (Hi1, Hi0, Hi0, Hi0);
        Load            : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi0);
        Store           : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi0, Hi1);
        \Jump\          : vl_logic_vector(3 downto 0) := (Hi0, Hi0, Hi1, Hi0);
        need_add        : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        need_sub        : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        need_and        : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        need_or         : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        need_func       : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        zero            : in     vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        memWrite        : out    vl_logic;
        mem2reg         : out    vl_logic;
        jump            : out    vl_logic;
        branch          : out    vl_logic;
        regWrite        : out    vl_logic;
        aluOP           : out    vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of beq : constant is 2;
    attribute mti_svvh_generic_type of Rtype : constant is 2;
    attribute mti_svvh_generic_type of Load : constant is 2;
    attribute mti_svvh_generic_type of Store : constant is 2;
    attribute mti_svvh_generic_type of \Jump\ : constant is 2;
    attribute mti_svvh_generic_type of need_add : constant is 2;
    attribute mti_svvh_generic_type of need_sub : constant is 2;
    attribute mti_svvh_generic_type of need_and : constant is 2;
    attribute mti_svvh_generic_type of need_or : constant is 2;
    attribute mti_svvh_generic_type of need_func : constant is 2;
end mainController;
