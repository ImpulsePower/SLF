module mux_2to1( 
    input  logic [99:0] a, b,
    input  logic sel,
    output logic [99:0] out 
);

    assign out = (sel) ? b[99:0] : a[99:0];

endmodule
