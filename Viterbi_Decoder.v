module veterbi_decoder(
    input wire Turbo_clk,
    input wire rst,
    input wire sys,
    input wire parity,
    input wire Data_Valid,
    output wire Hard_out_bits,
	output wire Turbo_done


);
wire [1:0] state1_1_error;
wire [1:0] state1_2_error;
wire [1:0] state2_4_error;
wire [1:0] state2_3_error;
wire [1:0] state3_5_error;
wire [1:0] state3_6_error;
wire [1:0] state4_8_error;
wire [1:0] state4_7_error;
wire [1:0] state5_2_error;
wire [1:0] state5_1_error;
wire [1:0] state6_3_error;
wire [1:0] state6_4_error;
wire [1:0] state7_5_error;
wire [1:0] state7_6_error;
wire [1:0] state8_8_error;
wire [1:0] state8_7_error;
wire       branch_enable ;
wire       path_enable ;
wire       memory_enable ;
wire [5:0] mem_address_write;
wire [5:0] mem_address_read;
wire [7:0] states_survivors;
reg [5:0] mem_address;
 
wire   [7:0]  RdData;
wire          RdData_VLD;

/*
wire [6:0] state1_acc_error;
wire [6:0] state2_acc_error;
wire [6:0] state3_acc_error;
wire [6:0] state4_acc_error;
wire [6:0] state5_acc_error;
wire [6:0] state6_acc_error;
wire [6:0] state7_acc_error;
wire [6:0] state8_acc_error;
*/
wire memory_read_enable;
wire trace_enable;
wire [2:0] idx_out;




branch_metric bm (
    .clk(Turbo_clk),
    .rst(rst),
    .sys(sys),
    .parity(parity),
    .branch_enable(branch_enable),
    .state1_1_error(state1_1_error) ,
    .state1_2_error(state1_2_error) ,
    .state2_4_error(state2_4_error) ,
    .state2_3_error(state2_3_error) ,
    .state3_5_error(state3_5_error) ,
    .state3_6_error(state3_6_error) ,
    .state4_8_error(state4_8_error) ,
    .state4_7_error(state4_7_error) ,
    .state5_2_error(state5_2_error) ,
    .state5_1_error(state5_1_error) ,
    .state6_3_error(state6_3_error) ,
    .state6_4_error(state6_4_error) ,
    .state7_5_error(state7_5_error) ,
    .state7_6_error(state7_6_error) ,
    .state8_8_error(state8_8_error) ,
    .state8_7_error(state8_7_error) 
);

path_metric pm (
    .rst(rst),
    .clk(Turbo_clk),
    .path_enable(path_enable),
    .state1_1_error(state1_1_error) ,
    .state1_2_error(state1_2_error) ,
    .state2_3_error(state2_3_error) ,
    .state2_4_error(state2_4_error) ,
    .state3_5_error(state3_5_error) ,
    .state3_6_error(state3_6_error) ,
    .state4_7_error(state4_7_error) ,
    .state4_8_error(state4_8_error) ,
    .state5_1_error(state5_1_error) ,
    .state5_2_error(state5_2_error) ,
    .state6_3_error(state6_3_error) ,
    .state6_4_error(state6_4_error) ,
    .state7_5_error(state7_5_error) ,
    .state7_6_error(state7_6_error) ,
    .state8_7_error(state8_7_error) ,
    .state8_8_error(state8_8_error) ,
    /*
    .state1_acc_error(state1_acc_error), //based on the fact that max seq is 2560bit
    .state2_acc_error(state2_acc_error),
    .state3_acc_error(state3_acc_error),
    .state4_acc_error(state4_acc_error),
    .state5_acc_error(state5_acc_error),
    .state6_acc_error(state6_acc_error),
    .state7_acc_error(state7_acc_error),
    .state8_acc_error(state8_acc_error),
    */
    .states_survivors(states_survivors),
    .mem_address(mem_address_write),
    .idx_out(idx_out)

);

RegFile #(.WIDTH(8) , .DEPTH(64), .ADDR(6) ) mem

(
    .CLK(Turbo_clk),
    .RST(rst),
    .WrEn(memory_enable),
    .RdEn(memory_read_enable), //modify in trace back
    .Address(mem_address),
    .WrData(states_survivors),
    .RdData(RdData)


);

veterbi_fsm fsm (

    .CLK(Turbo_clk),
    .RST(rst),
    .Data_Valid(Data_Valid), 
    .branch_enable(branch_enable),
    .path_enable(path_enable),
    .memory_enable(memory_enable),
    .trace_enable(trace_enable),
    .memory_read_enable(memory_read_enable)
);

 trace_back trace(
    .clk(Turbo_clk),
    .rst(rst),
    .trace_enable(trace_enable),
    .idx_out(idx_out),
    .read_data(RdData),

    .mem_address_read(mem_address_read),
    .decoded_bit(Hard_out_bits),
	.Turbo_done(Turbo_done)

);

reg first_address_flag;

always @*
begin 
    //if()
    //mem_address = 6'b111111;
    if(memory_read_enable)
    mem_address = mem_address_read;
    else 
    mem_address = mem_address_write;
end




endmodule