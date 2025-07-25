module top_module( 
    input [254:0] in,
    output [7:0] out );
    
    integer i;
    reg [7:0] temp_sum;
    always@(*)
        begin
            out = 8'b0;
            for (i = 0; i < 255; i = i + 1)
                begin
                    temp_sum = in[i] ? 8'h01 : 8'h00;
                    out = out + temp_sum;
                end
        end
endmodule
