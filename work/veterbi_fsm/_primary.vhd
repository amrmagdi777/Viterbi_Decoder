library verilog;
use verilog.vl_types.all;
entity veterbi_fsm is
    generic(
        IDLE            : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi0);
        branch_metric   : vl_logic_vector(2 downto 0) := (Hi0, Hi0, Hi1);
        path_metric     : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi0);
        memory_write    : vl_logic_vector(2 downto 0) := (Hi0, Hi1, Hi1);
        trace_back      : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi0);
        memory_read     : vl_logic_vector(2 downto 0) := (Hi1, Hi0, Hi1);
        seq_num         : integer := 64
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Data_Valid      : in     vl_logic;
        branch_enable   : out    vl_logic;
        path_enable     : out    vl_logic;
        memory_enable   : out    vl_logic;
        trace_enable    : out    vl_logic;
        memory_read_enable: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of branch_metric : constant is 2;
    attribute mti_svvh_generic_type of path_metric : constant is 2;
    attribute mti_svvh_generic_type of memory_write : constant is 2;
    attribute mti_svvh_generic_type of trace_back : constant is 2;
    attribute mti_svvh_generic_type of memory_read : constant is 2;
    attribute mti_svvh_generic_type of seq_num : constant is 1;
end veterbi_fsm;
