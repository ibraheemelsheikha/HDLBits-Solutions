module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] lower_add;
    wire [31:16] upper_add;
    wire cout;
    
    add16 a1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(lower_add), .cout(cout));
    add16 a2(.a(a[31:16]), .b(b[31:16]), .cin(cout), .sum(upper_add), .cout(1'b0));
    assign sum = {upper_add, lower_add};

endmodule
