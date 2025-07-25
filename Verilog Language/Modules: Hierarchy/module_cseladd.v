module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] muxa;
    wire [15:0] muxb;
    wire [15:0] sum_lower;
    wire [31:16] sum_upper;
    wire cout;
    
    add16 add1(.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(cout), .sum(sum_lower));
    add16 add2(.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .cout(1'b0), .sum(muxa));
    add16 add3(.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .cout(1'b0), .sum(muxb));
    sixteen_bit_2t1_mux mux1(.a(muxa), .b(muxb), .sel(cout), .out(sum_upper));
    assign sum = {sum_upper, sum_lower};

endmodule

module sixteen_bit_2t1_mux(
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] out
);
    always@(*)
        begin
            case(sel)
                1'b0: out = a;
                1'b1: out = b;
            endcase
        end
endmodule
