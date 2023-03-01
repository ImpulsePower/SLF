module single_port_ram
# ( 
	parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 5
) (
	input  logic [DATA_WIDTH-1:0] data,
	input  logic [ADDR_WIDTH-1:0] addr,
	input  logic we, clk,
	output logic [DATA_WIDTH-1:0] q
);

	logic [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];	
	logic [ADDR_WIDTH-1:0] addr_reg;
	
	always_ff @ (posedge clk) begin
		if (we)
			ram[addr] <= data;		
		addr_reg <= addr;	
	end

	assign q = ram[addr_reg];
	
endmodule
