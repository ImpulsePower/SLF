module Full_adder ( 
    input  logic a, b, cin,
    output logic cout, sum 
);

    assign sum  = a + b + cin;
    assign cout = (a & cin) | (b & cin) | (a & b);

endmodule
