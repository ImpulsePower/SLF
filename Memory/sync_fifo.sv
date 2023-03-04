module fifo
# ( 
	parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 8
) (
    input  logic clk,
    input  logic [DATA_WIDTH-1:0] data_in,
    input  logic wr, rd,
    output logic full, empty,
    output logic [DATA_WIDTH-1:0] data_out
);

logic [DATA_WIDTH-1:0] fifo_mem [0:(1<<ADDR_WIDTH)-1];
logic [ADDR_WIDTH:0] wr_addr, rd_addr, fill;

// Write Pointer
initial wr_addr = '0;
always_ff @ (posedge clk)
    if (wr)
        wr_addr <= wr_addr + 1;

always_ff @ (posedge clk)
    if (wr)
        fifo_mem [wr_addr] <= data_in;

// Read Pointer
initial rd_addr = '0;
always_ff @ (posedge clk)
    if (rd)
        rd_addr <= rd_addr + 1;
assign data_out = fifo_mem [rd_addr];

always_comb begin : empty_full
    fill  = wr_addr - rd_addr;
    empty = (fill == 0);
    full  = (fill == { 1'b1, {(ADDR_WIDTH){1'b0}}});
end

endmodule