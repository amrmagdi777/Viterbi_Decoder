library verilog;
use verilog.vl_types.all;
entity path_metric is
    generic(
        max_address     : integer := 64
    );
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        path_enable     : in     vl_logic;
        state1_1_error  : in     vl_logic_vector(1 downto 0);
        state1_2_error  : in     vl_logic_vector(1 downto 0);
        state2_3_error  : in     vl_logic_vector(1 downto 0);
        state2_4_error  : in     vl_logic_vector(1 downto 0);
        state3_5_error  : in     vl_logic_vector(1 downto 0);
        state3_6_error  : in     vl_logic_vector(1 downto 0);
        state4_7_error  : in     vl_logic_vector(1 downto 0);
        state4_8_error  : in     vl_logic_vector(1 downto 0);
        state5_1_error  : in     vl_logic_vector(1 downto 0);
        state5_2_error  : in     vl_logic_vector(1 downto 0);
        state6_3_error  : in     vl_logic_vector(1 downto 0);
        state6_4_error  : in     vl_logic_vector(1 downto 0);
        state7_5_error  : in     vl_logic_vector(1 downto 0);
        state7_6_error  : in     vl_logic_vector(1 downto 0);
        state8_7_error  : in     vl_logic_vector(1 downto 0);
        state8_8_error  : in     vl_logic_vector(1 downto 0);
        less_error_idx  : in     vl_logic_vector(2 downto 0);
        idx_out         : out    vl_logic_vector(2 downto 0);
        mem_address     : out    vl_logic_vector(5 downto 0);
        states_survivors: out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of max_address : constant is 1;
end path_metric;
