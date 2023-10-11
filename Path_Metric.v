module path_metric (
    input wire rst,
    input wire clk,
    input wire path_enable,
    input wire [1:0] state1_1_error ,
    input wire [1:0] state1_2_error ,
    input wire [1:0] state2_3_error ,
    input wire [1:0] state2_4_error ,
    input wire [1:0] state3_5_error ,
    input wire [1:0] state3_6_error ,
    input wire [1:0] state4_7_error ,
    input wire [1:0] state4_8_error ,
    input wire [1:0] state5_1_error ,
    input wire [1:0] state5_2_error ,
    input wire [1:0] state6_3_error ,
    input wire [1:0] state6_4_error ,
    input wire [1:0] state7_5_error ,
    input wire [1:0] state7_6_error ,
    input wire [1:0] state8_7_error ,
    input wire [1:0] state8_8_error ,

    /*
    output     [6:0] state1_acc_error, //based on the fact that max seq is 2560bit
    output     [6:0] state2_acc_error,
    output     [6:0] state3_acc_error,
    output     [6:0] state4_acc_error,
    output     [6:0] state5_acc_error,
    output     [6:0] state6_acc_error,
    output     [6:0] state7_acc_error,
    output     [6:0] state8_acc_error,
    */
    input wire [2:0] less_error_idx,
    output wire [2:0] idx_out,
    output reg [5:0] mem_address,
    output reg [7:0] states_survivors



);

parameter  max_address = 64;

reg [6:0] state2_acc_error_temp;
reg [6:0] state1_acc_error_temp;
reg [6:0] state3_acc_error_temp;
reg [6:0] state4_acc_error_temp;
reg [6:0] state5_acc_error_temp;
reg [6:0] state6_acc_error_temp;
reg [6:0] state7_acc_error_temp;
reg [6:0] state8_acc_error_temp;

wire [7:0] states_survivors_temp;


wire [1:0] state1_less_error;
wire [1:0] state2_less_error;
wire [1:0] state3_less_error;
wire [1:0] state4_less_error;
wire [1:0] state5_less_error;
wire [1:0] state6_less_error;
wire [1:0] state7_less_error;
wire [1:0] state8_less_error;

wire enable;


always @( posedge clk ,negedge rst) begin
    if (!rst)
        begin
            state1_acc_error_temp <= 0;
            state2_acc_error_temp <= 0;
            state3_acc_error_temp <= 0;
            state4_acc_error_temp <= 0;
            state5_acc_error_temp <= 0;
            state6_acc_error_temp <= 0;
            state7_acc_error_temp <= 0;
            state8_acc_error_temp <= 0;           
            states_survivors      <= 0;
            
        end
    else if (path_enable)
        begin

            state1_acc_error_temp <= state1_acc_error_temp+state1_less_error;
            state2_acc_error_temp <= state2_acc_error_temp+state2_less_error;
            state3_acc_error_temp <= state3_acc_error_temp+state3_less_error;
            state4_acc_error_temp <= state4_acc_error_temp+state4_less_error;
            state5_acc_error_temp <= state5_acc_error_temp+state5_less_error;
            state6_acc_error_temp <= state6_acc_error_temp+state6_less_error;
            state7_acc_error_temp <= state7_acc_error_temp+state7_less_error;
            state8_acc_error_temp <= state8_acc_error_temp+state8_less_error;
            states_survivors      <= states_survivors_temp;
        end
end

//address counter 

always @ (posedge clk or negedge rst)
 begin
  if(!rst)
   begin
    mem_address  <= 6'b111111 ;
   end

  else if(path_enable)
   begin
    if(mem_address< max_address)
        mem_address <= mem_address+1;
    else
    mem_address <=0;
   end
 end
/*
assign state1_acc_error = state1_acc_error_temp;  
assign state2_acc_error = state2_acc_error_temp;
assign state3_acc_error = state3_acc_error_temp;
assign state4_acc_error = state4_acc_error_temp;
assign state5_acc_error = state5_acc_error_temp;
assign state6_acc_error = state6_acc_error_temp;
assign state7_acc_error = state7_acc_error_temp;
assign state8_acc_error = state8_acc_error_temp;
*/
assign {state1_less_error,states_survivors_temp[0]} = (state1_1_error) < state1_2_error ? {state1_1_error,1'b0}:{state1_2_error,1'b1};
assign {state2_less_error,states_survivors_temp[1]} = (state2_4_error) < state2_3_error ? {state2_4_error,1'b0}:{state2_3_error,1'b1};
assign {state3_less_error,states_survivors_temp[2]} = (state3_5_error) < state3_6_error ? {state3_5_error,1'b0}:{state3_6_error,1'b1};
assign {state4_less_error,states_survivors_temp[3]} = (state4_8_error) < state4_7_error ? {state4_8_error,1'b0}:{state4_7_error,1'b1};
assign {state5_less_error,states_survivors_temp[4]} = (state5_2_error) < state5_1_error ? {state5_2_error,1'b0}:{state5_1_error,1'b1};
assign {state6_less_error,states_survivors_temp[5]} = (state6_3_error) < state6_4_error ? {state6_3_error,1'b0}:{state6_4_error,1'b1};
assign {state7_less_error,states_survivors_temp[6]} = (state7_6_error) < state7_5_error ? {state7_6_error,1'b0}:{state7_5_error,1'b1};
assign {state8_less_error,states_survivors_temp[7]} = (state8_7_error) < state8_8_error ? {state8_7_error,1'b0}:{state8_8_error,1'b1};

assign enable = (mem_address == max_address-1) ? 1:0;
assign idx_out = enable? less_error_idx : idx_out;

min_8 m(
.state1_acc_error(state1_acc_error_temp),
.state2_acc_error(state2_acc_error_temp),
.state3_acc_error(state3_acc_error_temp),
.state4_acc_error(state4_acc_error_temp),
.state5_acc_error(state5_acc_error_temp),
.state6_acc_error(state6_acc_error_temp),
.state7_acc_error(state7_acc_error_temp),
.state8_acc_error(state8_acc_error_temp),
.less_error_idx  (less_error_idx),
.enable(enable)
);
    
endmodule

