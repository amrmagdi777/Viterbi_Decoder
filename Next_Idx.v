module next_idx(
    input decoded_bit,
    input current_idx,
    output reg next_idx
);

always @*
begin
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

endmodule