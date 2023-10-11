module hamming_distance (
    input wire sys,
    input wire parity,
    input wire [1:0] poosible_codeword ,
    output reg [1:0] num_errors 
);

always @*
    begin
        case ({poosible_codeword,parity,sys})
           4'b0000 : num_errors = 0;
           4'b0001 : num_errors = 1;
           4'b0010 : num_errors = 1;
           4'b0011 : num_errors = 2;
           4'b0100 : num_errors = 1;
           4'b0101 : num_errors = 0;
           4'b0110 : num_errors = 2;
           4'b0111 : num_errors = 1;
           4'b1000 : num_errors = 1;
           4'b1001 : num_errors = 2;
           4'b1010 : num_errors = 0;
           4'b1011 : num_errors = 1;
           4'b1100 : num_errors = 2;
           4'b1101 : num_errors = 1;
           4'b1110 : num_errors = 1;
           4'b1111 : num_errors = 0;

            default: num_errors =0;
        endcase
    end
endmodule

