module Sign_AdderwOF (
    input  logic [7:0] a, b,
    output logic [7:0] s,
    output logic overflow
);
    assign s = a + b;
    assign overflow = a[7] & b[7] & ~s[7] | ~a[7] & ~b[7] & s[7];

endmodule