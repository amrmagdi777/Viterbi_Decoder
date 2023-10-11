library verilog;
use verilog.vl_types.all;
entity hamming_distance is
    port(
        sys             : in     vl_logic;
        parity          : in     vl_logic;
        poosible_codeword: in     vl_logic_vector(1 downto 0);
        num_errors      : out    vl_logic_vector(1 downto 0)
    );
end hamming_distance;
