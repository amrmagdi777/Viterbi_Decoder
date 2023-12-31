library verilog;
use verilog.vl_types.all;
entity RegFile is
    generic(
        WIDTH           : integer := 8;
        DEPTH           : integer := 64;
        ADDR            : integer := 6
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        WrEn            : in     vl_logic;
        RdEn            : in     vl_logic;
        Address         : in     vl_logic_vector;
        WrData          : in     vl_logic_vector;
        RdData          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR : constant is 1;
end RegFile;
