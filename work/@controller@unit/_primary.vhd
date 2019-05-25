library verilog;
use verilog.vl_types.all;
entity ControllerUnit is
    generic(
        LW              : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        SW              : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1);
        JMP             : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        BEQ             : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        BNE             : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        RT              : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        NOP             : vl_logic_vector(5 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        ADD             : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        SUB             : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi0);
        \AND\           : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        \OR\            : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1);
        SLT             : vl_logic_vector(5 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0);
        \add_\          : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        \sub_\          : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        \and_\          : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        \or_\           : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        \lt_\           : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0)
    );
    port(
        zero            : in     vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        aluS            : out    vl_logic_vector(2 downto 0);
        regDstS         : out    vl_logic;
        aluSrcS         : out    vl_logic;
        dataMemReadS    : out    vl_logic;
        dataMemWriteS   : out    vl_logic;
        writeRegS       : out    vl_logic;
        memToRegS       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of LW : constant is 2;
    attribute mti_svvh_generic_type of SW : constant is 2;
    attribute mti_svvh_generic_type of JMP : constant is 2;
    attribute mti_svvh_generic_type of BEQ : constant is 2;
    attribute mti_svvh_generic_type of BNE : constant is 2;
    attribute mti_svvh_generic_type of RT : constant is 2;
    attribute mti_svvh_generic_type of NOP : constant is 2;
    attribute mti_svvh_generic_type of ADD : constant is 2;
    attribute mti_svvh_generic_type of SUB : constant is 2;
    attribute mti_svvh_generic_type of \AND\ : constant is 2;
    attribute mti_svvh_generic_type of \OR\ : constant is 2;
    attribute mti_svvh_generic_type of SLT : constant is 2;
    attribute mti_svvh_generic_type of \add_\ : constant is 2;
    attribute mti_svvh_generic_type of \sub_\ : constant is 2;
    attribute mti_svvh_generic_type of \and_\ : constant is 2;
    attribute mti_svvh_generic_type of \or_\ : constant is 2;
    attribute mti_svvh_generic_type of \lt_\ : constant is 2;
end ControllerUnit;
