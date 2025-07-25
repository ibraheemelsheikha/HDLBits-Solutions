module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] carry;
    
    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : BCD_ADD_LOOP
            if (i == 0) begin : GEN_0
                bcd_fadd a0(
                    .a (a[3:0]),
                    .b (b[3:0]),
                    .cin (cin),
                    .cout (carry[0]),
                    .sum (sum[3:0])
                );
            end else begin : GEN_REST
                bcd_fadd a1(
                    .a (a[((4 * i) + 3):(4 * i)]),
                    .b (b[((4 * i) + 3):(4 * i)]),
                    .cin (carry[i - 1]),
                    .cout (carry[i]),
                    .sum (sum[((4 * i) + 3):(4 * i)])
                );
            end
        end
    endgenerate
    
    assign cout = carry[99];
endmodule
