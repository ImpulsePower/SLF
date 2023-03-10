module DFFwSR (
    input  logic clk,
    input  logic reset,            // Synchronous reset
    input  logic [7:0] d,
    output logic [7:0] q
);
    always @(posedge clk) begin
        if (reset) begin
            q = 8'b0;
        end
        else q = d;
    end
endmodule
