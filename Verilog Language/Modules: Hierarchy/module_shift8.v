module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] temp1;
    wire [7:0] temp2;
    wire [7:0] temp3;
    
    my_dff8 dff1(.clk(clk), .d(d), .q(temp1));
    my_dff8 dff2(.clk(clk), .d(temp1), .q(temp2));
    my_dff8 dff3(.clk(clk), .d(temp2), .q(temp3));
    eight_bit_4t1_mux mux1(.a(d), .b(temp1), .c(temp2), .d(temp3), .sel(sel), .out(q));
    
    
endmodule

module eight_bit_4t1_mux(
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] out
);
    always@(*)
        begin
            case(sel)
                2'b00: out = a;
                2'b01: out = b;
                2'b10: out = c;
                2'b11: out = d;
            endcase
        end
endmodule
