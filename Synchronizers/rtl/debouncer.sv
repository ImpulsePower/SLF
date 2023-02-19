module debouncer
# (	
	parameter WIDTH = 4
) (
	input  logic clk,
	input  logic reset,
	input  logic indata,
	output logic dbncdata
);	

logic             dbncdata_d;    
logic [WIDTH-1:0] cnt;  
logic [WIDTH+1:0] dbcnt;

parameter DBNC_VALUE_01 = 2 ** (WIDTH + 1);
parameter DBNC_VALUE_10 = 2 ** (WIDTH + 1);

typedef enum logic [2:0] {
    ZERO        = 3'h0,
    ONE         = 3'h1,
    CONFIRM0    = 3'h2,
    CONFIRM1    = 3'h3,
    DBN_IDLE    = 3'h4
}   statetype;
statetype STATE;

assign dbnclk = !(| cnt);

always_ff @(posedge clk, posedge reset)
    if(reset)
        cnt <= WIDTH + 1;
    else
        cnt <= (cnt) ? cnt - 1 : WIDTH + 1;

assign dbncdata_d = ((STATE == ONE) | (STATE == ZERO)) ? STATE : dbncdata;

always_ff @(posedge dbnclk, posedge reset)

	if(reset) begin
	    STATE    <= DBN_IDLE;
	    dbcnt    <= 0;
	end
	
	else begin
	    dbncdata <= dbncdata_d;
	    case (STATE)

	        ZERO: begin
	            dbcnt <= DBNC_VALUE_01 - 1;
	            if (indata)
	               STATE <= CONFIRM1;
	            else
	               STATE <= ZERO;
	        end

	        CONFIRM1:
	        	if (dbcnt) begin
	                dbcnt <= dbcnt - 1;
	                STATE <= CONFIRM1;
	            end
	            else begin
	            	dbcnt <= DBNC_VALUE_10 - 1;
	            	STATE <= indata ? ONE : ZERO;
	        	end

	        ONE: begin
	            dbcnt <= DBNC_VALUE_10 - 1;
	            if (!indata)
	                STATE <= CONFIRM0;
	            else
	                STATE <= ONE;
	        end
	           
	        CONFIRM0:
	            if (dbcnt) begin
	                dbcnt <= dbcnt - 1;
	                STATE <= CONFIRM0;
	            end
	            else begin
	                dbcnt <= DBNC_VALUE_01 - 1;
	                STATE <= indata ? ONE : ZERO;
	            end

	        default:STATE <= indata ? ONE : ZERO;

	    endcase 
	end
	       
endmodule