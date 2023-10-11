library verilog;
use verilog.vl_types.all;
entity veterbi_decoder is
    port(
        Turbo_clk       : in     vl_logic;
        rst             : in     vl_logic;
        sys             : in     vl_logic;
        parity          : in     vl_logic;
        Data_Valid      : in     vl_logic;
        Hard_out_bits   : out    vl_logic;
        Turbo_done      : out    vl_logic
    );
end veterbi_decoder;
