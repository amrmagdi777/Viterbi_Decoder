library verilog;
use verilog.vl_types.all;
entity min_8 is
    port(
        state1_acc_error: in     vl_logic_vector(6 downto 0);
        state2_acc_error: in     vl_logic_vector(6 downto 0);
        state3_acc_error: in     vl_logic_vector(6 downto 0);
        state4_acc_error: in     vl_logic_vector(6 downto 0);
        state5_acc_error: in     vl_logic_vector(6 downto 0);
        state6_acc_error: in     vl_logic_vector(6 downto 0);
        state7_acc_error: in     vl_logic_vector(6 downto 0);
        state8_acc_error: in     vl_logic_vector(6 downto 0);
        enable          : in     vl_logic;
        less_error_idx  : out    vl_logic_vector(2 downto 0)
    );
end min_8;
