module min_8 (
  input [6:0] state1_acc_error,
  input [6:0] state2_acc_error,
  input [6:0] state3_acc_error,
  input [6:0] state4_acc_error,
  input [6:0] state5_acc_error,
  input [6:0] state6_acc_error,
  input [6:0] state7_acc_error,
  input [6:0] state8_acc_error,
  input enable,
  output reg [2:0] less_error_idx
);
reg [6:0] min_val;

always @* begin
  
  min_val = state1_acc_error;
  less_error_idx =0;
  if(enable) begin
    if (state2_acc_error < min_val) 
    begin
      min_val = state2_acc_error;
      less_error_idx = 1;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end

    if (state3_acc_error < min_val) 
    begin
      min_val = state3_acc_error;
      less_error_idx = 2;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end

    if (state4_acc_error < min_val) 
    begin
      min_val = state4_acc_error;
      less_error_idx = 3;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end

    if (state5_acc_error < min_val) 
    begin
      min_val = state5_acc_error;
      less_error_idx = 4;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end

    if (state6_acc_error < min_val) 
    begin
      min_val = state6_acc_error;
      less_error_idx = 5;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end

    if (state7_acc_error < min_val) 
    begin
      min_val = state7_acc_error;
      less_error_idx = 6;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end

    if (state8_acc_error < min_val) 
    begin
      min_val = state8_acc_error;
      less_error_idx = 7;
      end
    else
    begin
    min_val = min_val;
    less_error_idx = less_error_idx;
    end
  end
end

endmodule