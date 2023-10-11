
module test_bench;

  // Declare inputs and outputs
  reg Turbo_clk;
  reg rst;
  reg  sys;
  reg parity ;
  reg Data_Valid;
  wire  Hard_out_bits;
  wire Turbo_done;

   // Instantiate the module to be tested
veterbi_decoder  dut(
    .Turbo_clk(Turbo_clk),
    .rst(rst),
    .sys(sys),
    .parity(parity),
    .Data_Valid(Data_Valid),
    .Hard_out_bits(Hard_out_bits),
	.Turbo_done(Turbo_done)

);

  // Initialize inputs
  initial begin
    Turbo_clk = 0;
    rst = 0;
    sys = 1;
    parity = 1;
    Data_Valid = 0;
    #10 rst = 1;
    Data_Valid =1;

    
  end
  initial begin

    $dumpfile("veterbi.vcd");
    $dumpvars;
    #5000 $finish;


  end

  // Clock generation
  always #5 Turbo_clk = ~Turbo_clk;
  always #50 sys = ~sys;
  always #100 parity = ~parity;





endmodule