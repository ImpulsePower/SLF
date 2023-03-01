module unsig_altmult_accum
# ( 
	parameter DATA_WIDTH = 8,
) (
	input  logic [DATA_WIDTH-1:0] dataa, datab,
	input  logic clk, aclr, clken, sload,
	output logic [2*DATA_WIDTH-1:0] adder_out
);

	logic [2*DATA_WIDTH-1:0] dataa_reg, datab_reg;
	logic sload_reg;
	logic [2*DATA_WIDTH-1:0] old_result;
	logic [2*DATA_WIDTH-1:0] multa;
	
	// Store the results of the operations on the current data
	assign multa = dataa_reg * datab_reg;
	
	// Store the value of the accumulation (or clear it)
	always @ (adder_out, sload_reg)
		if (sload_reg)
			old_result <= '0;
		else
			old_result <= adder_out;
	
	// Clear or update data, as appropriate
	always_ff @ (posedge clk or posedge aclr)
		if (aclr) begin
			dataa_reg <= '0;
			datab_reg <= '0;
			sload_reg <= '0;
			adder_out <= '0;
		end
		else if (clken) begin
			dataa_reg <= dataa;
			datab_reg <= datab;
			sload_reg <= sload;
			adder_out <= old_result + multa;
		end

endmodule
