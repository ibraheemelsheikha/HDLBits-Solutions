module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
	wire and_topleft;
    wire and_bottomleft;
    wire and_topright;
    wire and_bottomright;
    
    assign and_topleft = p2a & p2b;
    assign and_bottomleft = p2c & p2d;
    assign and_topright = p1a & p1b & p1c;
    assign and_bottomright = p1d & p1e & p1f;
    
    assign p2y = and_topleft | and_bottomleft;
    assign p1y = and_topright | and_bottomright;

endmodule
