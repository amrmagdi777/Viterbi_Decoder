library verilog;
use verilog.vl_types.all;
entity trace_back is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        trace_enable    : in     vl_logic;
        idx_out         : in     vl_logic_vector(2 downto 0);
        read_data       : in     vl_logic_vector(7 downto 0);
        mem_address_read: out    vl_logic_vector(5 downto 0);
        decoded_bit     : out    vl_logic;
        Turbo_done      : out    vl_logic
    );
end trace_back;
