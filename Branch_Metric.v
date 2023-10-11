module branch_metric (
    input wire clk,
    input wire rst,
    input wire sys,
    input wire parity,
    input wire branch_enable,
    output reg [1:0] state1_1_error ,
    output reg [1:0] state1_2_error ,
    output reg [1:0] state2_4_error ,
    output reg [1:0] state2_3_error ,
    output reg [1:0] state3_5_error ,
    output reg [1:0] state3_6_error ,
    output reg [1:0] state4_8_error ,
    output reg [1:0] state4_7_error ,
    output reg [1:0] state5_2_error ,
    output reg [1:0] state5_1_error ,
    output reg [1:0] state6_3_error ,
    output reg [1:0] state6_4_error ,
    output reg [1:0] state7_6_error ,
    output reg [1:0] state7_5_error ,
    output reg [1:0] state8_7_error ,
    output reg [1:0] state8_8_error 
);

  parameter S1 = 3'b000;
  parameter S2 = 3'b001;
  parameter S3 = 3'b010;
  parameter S4 = 3'b011;
  parameter S5 = 3'b100;
  parameter S6 = 3'b101;
  parameter S7 = 3'b110;
  parameter S8 = 3'b111;



  parameter state1_1_output = 2'b00;
  parameter state1_2_output = 2'b11;
  parameter state2_4_output = 2'b01;
  parameter state2_3_output = 2'b10;
  parameter state3_5_output = 2'b01;
  parameter state3_6_output = 2'b10;
  parameter state4_8_output = 2'b00;
  parameter state4_7_output = 2'b11;
  parameter state5_2_output = 2'b00;
  parameter state5_1_output = 2'b11;
  parameter state6_3_output = 2'b01;
  parameter state6_4_output = 2'b10;
  parameter state7_5_output = 2'b10;
  parameter state7_6_output = 2'b01;
  parameter state8_7_output = 2'b00;
  parameter state8_8_output = 2'b11;


  wire [1:0] state1_1_error_temp ;
  wire [1:0] state1_2_error_temp ;
  wire [1:0] state2_4_error_temp ;
  wire [1:0] state2_3_error_temp ;
  wire [1:0] state3_5_error_temp ;
  wire [1:0] state3_6_error_temp ;
  wire [1:0] state4_8_error_temp ;
  wire [1:0] state4_7_error_temp ;
  wire [1:0] state5_2_error_temp ;
  wire [1:0] state5_1_error_temp ;
  wire [1:0] state6_3_error_temp ;
  wire [1:0] state6_4_error_temp ;
  wire [1:0] state7_5_error_temp ;
  wire [1:0] state7_6_error_temp ;
  wire [1:0] state8_8_error_temp ;
  wire [1:0] state8_7_error_temp;

  always @(posedge clk , negedge rst) begin
    if (!rst)
    begin
    state1_1_error <=0;
    state1_2_error <=0;
    state2_4_error <=0;
    state2_3_error <=0;
    state3_5_error <=0;
    state3_6_error <=0;
    state4_8_error <=0;
    state4_7_error <=0;
    state5_2_error <=0;
    state5_1_error <=0;
    state6_3_error <=0;
    state6_4_error <=0;
    state7_5_error <=0;
    state7_6_error <=0;
    state8_8_error <=0;
    state8_7_error <=0;
    end
    else if( branch_enable)
    begin
    state1_1_error <=  state1_1_error_temp ;
    state1_2_error <=  state1_2_error_temp ;
    state2_4_error <=  state2_4_error_temp ;
    state2_3_error <=  state2_3_error_temp ;
    state3_5_error <=  state3_5_error_temp ;
    state3_6_error <=  state3_6_error_temp ;
    state4_8_error <=  state4_8_error_temp ;
    state4_7_error <=  state4_7_error_temp ;
    state5_2_error <=  state5_2_error_temp ;
    state5_1_error <=  state5_1_error_temp ;
    state6_3_error <=  state6_3_error_temp ;
    state6_4_error <=  state6_4_error_temp ;
    state7_5_error <=  state7_5_error_temp ;
    state7_6_error <=  state7_6_error_temp ;
    state8_8_error <=  state8_8_error_temp ;
    state8_7_error <=  state8_7_error_temp ;
    end
  end



  hamming_distance d1 (.sys(sys),.parity(parity),.poosible_codeword(state1_1_output),.num_errors(state1_1_error_temp));
  hamming_distance d2 (.sys(sys),.parity(parity),.poosible_codeword(state1_2_output),.num_errors(state1_2_error_temp));
  hamming_distance d3 (.sys(sys),.parity(parity),.poosible_codeword(state2_4_output),.num_errors(state2_4_error_temp));
  hamming_distance d4 (.sys(sys),.parity(parity),.poosible_codeword(state2_3_output),.num_errors(state2_3_error_temp));
  hamming_distance d5 (.sys(sys),.parity(parity),.poosible_codeword(state3_5_output),.num_errors(state3_5_error_temp));
  hamming_distance d6 (.sys(sys),.parity(parity),.poosible_codeword(state3_6_output),.num_errors(state3_6_error_temp));
  hamming_distance d7 (.sys(sys),.parity(parity),.poosible_codeword(state4_8_output),.num_errors(state4_8_error_temp));
  hamming_distance d8 (.sys(sys),.parity(parity),.poosible_codeword(state4_7_output),.num_errors(state4_7_error_temp));
  hamming_distance d9 (.sys(sys),.parity(parity),.poosible_codeword(state5_2_output),.num_errors(state5_2_error_temp));
  hamming_distance d10 (.sys(sys),.parity(parity),.poosible_codeword(state5_1_output),.num_errors(state5_1_error_temp));
  hamming_distance d11 (.sys(sys),.parity(parity),.poosible_codeword(state6_3_output),.num_errors(state6_3_error_temp));
  hamming_distance d12 (.sys(sys),.parity(parity),.poosible_codeword(state6_4_output),.num_errors(state6_4_error_temp));
  hamming_distance d13 (.sys(sys),.parity(parity),.poosible_codeword(state7_5_output),.num_errors(state7_5_error_temp));
  hamming_distance d14 (.sys(sys),.parity(parity),.poosible_codeword(state7_6_output),.num_errors(state7_6_error_temp));
  hamming_distance d15 (.sys(sys),.parity(parity),.poosible_codeword(state8_8_output),.num_errors(state8_8_error_temp));
  hamming_distance d16 (.sys(sys),.parity(parity),.poosible_codeword(state8_7_output),.num_errors(state8_7_error_temp));



endmodule