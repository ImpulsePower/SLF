`timescale 1 ns / 100 ps

`include "debouncer.sv"

module tb ();

logic clk;
logic reset;
logic indata;

debouncer DUT (
    .clk    (clk),
    .reset  (reset),
    .indata (indata)
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
        #300
        indata = 1;
        repeat (100) @(posedge clk);
        indata = 0;
        repeat (5000) @(posedge clk);
        indata = 1;
    end

initial 
    begin
        // 500 microsec
        #1000000
        $finish;
    end

initial begin
    $dumpfile("tb_debouncer.vcd");
    $dumpvars(0, DUT);
end

endmodule