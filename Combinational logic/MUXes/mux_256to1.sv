module mux_256to1
( 
    input  logic [255:0] in,
    input  logic [7:0] sel,
    output logic out 
);


    integer i;

    always_comb begin
        for (i = 0; i < 255; i = i + 1) begin
            out = in[sel];   
        end
    end
    
endmodule
