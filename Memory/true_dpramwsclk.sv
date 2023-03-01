module true_dpramwsclk
# ( 
	parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 5
) (
	input  logic [DATA_WIDTH-1:0] data_a, data_b,
	input  logic [ADDR_WIDTH-1:0] addr_a, addr_b,
	input  logic we_a, we_b, clk,
	output logic [DATA_WIDTH-1:0] q_a, q_b
);

	logic [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
	
	// Port A
	always_ff @ (posedge clk)
		if (we_a) begin
			ram[addr_a] <= data_a;
			q_a 		<= data_a;
		end
		else 
			q_a <= ram[addr_a];
	
	// Port B
	always_ff @ (posedge clk)
		if (we_b) begin
			ram[addr_b] <= data_b;
			q_b 		<= data_b;
		end
		else
			q_b <= ram[addr_b];
	
endmodule
