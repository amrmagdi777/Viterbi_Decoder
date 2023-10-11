module trace_back(
    input wire  clk,
    input wire  rst,
    input wire trace_enable,
    input wire [2:0] idx_out,
    input wire [7:0] read_data,

    output reg [5:0] mem_address_read,
    output reg       decoded_bit,
	output reg Turbo_done

);

//wire [2:0] index_start 
//address counter 
reg [2:0] next_idx,current_idx;
reg start_flag;
reg trace_enable_reg;

//reg wasted_flag;
//reg [5:0] next_mem_address_read;

always @ (posedge clk or negedge rst)
 begin
  if(!rst)
   begin
    mem_address_read  <= 6'b111111 ;
    //next_mem_address_read <=6'b000000;
   end
  else if(trace_enable)
   begin
        mem_address_read =  mem_address_read-1;

   end
 end

always @ (posedge clk or negedge rst)
 begin
  if(!rst)
   begin
    decoded_bit  <= 1'b0;
    start_flag <=1'b1;
	Turbo_done <= 1'b0;
    //wasted_flag <=1'b1;
   end
  else if(trace_enable)  
   begin
    if(start_flag)begin

        start_flag <=0;
        current_idx <=idx_out;
		Turbo_done <= 1'b1;
		
    end
    else
    begin
        current_idx <= next_idx;
		Turbo_done <= 1'b1;
    end
   
   end
 end

 always @(posedge clk,negedge rst ) begin
    if(!rst)
    trace_enable_reg <= 0;
    else
    trace_enable_reg <= trace_enable;
 end

 always @*
begin

if(trace_enable_reg) 
begin
decoded_bit = read_data[current_idx];
case (current_idx)
    0: next_idx = (decoded_bit)? 1:0 ;
    1: next_idx = (decoded_bit)? 2:3 ; 
    2: next_idx = (decoded_bit)? 5:4 ;
    3: next_idx = (decoded_bit)? 6:7 ;
    4: next_idx = (decoded_bit)? 0:1 ;
    5: next_idx = (decoded_bit)? 3:2 ;
    6: next_idx = (decoded_bit)? 4:5 ;
    7: next_idx = (decoded_bit)? 7:6 ; 
endcase
end
end

endmodule
