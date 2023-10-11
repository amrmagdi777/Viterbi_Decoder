library verilog;
use verilog.vl_types.all;
entity next_idx is
    port(
        decoded_bit     : in     vl_logic;
        current_idx     : in     vl_logic;
        next_idx        : out    vl_logic
    );
end next_idx;
