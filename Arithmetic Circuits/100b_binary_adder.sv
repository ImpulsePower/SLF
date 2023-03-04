module 100b_binary_adder( 
    input logic [99:0] a, b,
    input logic cin,

    output logic cout,
    output logic [99:0] sum );

    genvar i;
    logic [98:0] q;

    FA inst1 (a[0],b[0],cin,q[0],sum[0]);
    FA inst2 (a[99],b[99],q[98],cout,sum[99]);

    generate
        for (i = 1; i< 99; i = i + 1) begin: adder
            FA inst (a[i],b[i],q[i - 1], q[i], sum[i]);
        end
    endgenerate

endmodule

module FA (
    input  logic a, b, cin,
    output logic cout, sum
);
    assign sum = a + b + cin;
    assign cout = (a & cin) | (b & cin) | (a & b); 
endmodule