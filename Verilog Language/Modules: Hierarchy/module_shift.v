module top_module ( input clk, input d, output q );
	wire temp1, temp2;
    
    my_dff dff1(.clk(clk), .d(d), .q(temp1));
    my_dff dff2(.clk(clk), .d(temp1), .q(temp2));
    my_dff dff3(.clk(clk), .d(temp2), .q(q));
    
endmodule
