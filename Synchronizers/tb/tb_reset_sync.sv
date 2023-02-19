`timescale 1 ns / 100 ps

`include "reset_sync.sv"

module tb ();

logic clk;
logic reset;

reset_sync DUT (
    .clk   (clk),
    .reset (reset)
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

// initial
//     begin
//         #3000
//         clk_en = 0;
//         repeat (50) @(posedge clk);
//         clk_en = 1;
//         repeat (50) @(posedge clk);
//         clk_en = 0;
//     end

initial 
    begin
        // 500 microsec
        #5000
        $finish;
    end

initial begin
    $dumpfile("tb_sync.vcd");
    $dumpvars(0, DUT);
end

endmodule