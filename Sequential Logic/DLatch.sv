module DLatch (
    input  logic d, 
    input  logic enable,
    output logic q
);

    always_comb
        if (enable) q = d;
        
endmodule
