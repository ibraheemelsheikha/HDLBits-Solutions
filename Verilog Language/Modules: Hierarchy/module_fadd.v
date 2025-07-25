module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout;
    wire [15:0] sum_lower;
    wire [31:16] sum_upper;
    
    add16 a1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(cout), .sum(sum_lower));
    add16 a2(.a(a[31:16]), .b(b[31:16]), .cin(cout), .cout(1'b0), .sum(sum_upper));
    assign sum = {sum_upper, sum_lower};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

// Full adder module here

endmodule
