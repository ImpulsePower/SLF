module uart_pll (
    input   logic inclk0,
    output  logic c0,
    output  logic c1
);

assign c0 = !inclk0;
logic [1:0] cnt;

always_ff @( posedge inclk0 ) begin : blockName
    if (cnt == 2'b11) c1 <= 1'b1;
    else begin
        cnt <= cnt + 1;
        c1 <= 1'b0;
    end
        
end
endmodule