module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] xor_out;
    wire cout;
    wire [15:0] sum_upper;
    wire [31:16] sum_lower;
    
    thirty_two_bit_xor xor1(.a(b), .b(sub), .out(xor_out));
    add16 add1(.a(a[15:0]), .b(xor_out[15:0]), .cin(sub), .cout(cout), .sum(sum_lower));
    add16 add2(.a(a[31:16]), .b(xor_out[31:16]), .cin(cout), .cout(1'b0), .sum(sum_upper));
    assign sum = {sum_upper, sum_lower};
endmodule

module thirty_two_bit_xor(
    input [31:0] a,
    input b,
    output [31:0] out
);
    assign out = a ^ {32{b}};
endmodule
