`timescale 1 ns / 100 ps

`include "enable_sync.sv"

module tb ();

logic clk;
logic reset;
logic enable_in;


enable_sync DUT (
    .clk (clk),
    .reset (reset),
    .enable_in (enable_in)
);

initial
    begin 
        clk = 0;
        #15.625 
        forever 
        #15.625 clk = !clk;
    end

initial
    begin
        reset = 0;
        repeat (5) @(posedge clk);
        reset = 1;
        repeat (5) @(posedge clk);
        reset = 0;
    end

initial
    begin
        #3000
        enable_in = 0;
        repeat (50) @(posedge clk);
        enable_in = 1;
        repeat (50) @(posedge clk);
        enable_in = 0;
    end

initial 
    begin
        // 500 microsec
        #30000
        $finish;
    end

initial begin
    $dumpfile("tb_reclocker.vcd");
    $dumpvars(0, DUT);
end

endmodule