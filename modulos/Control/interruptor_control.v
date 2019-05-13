module interruptor_control(clock, reset, memInstOpcode, intr, state);
	
	parameter DATA_WIDTH = 32;
	
	localparam OFF = 1'b0, ON = 1'b1;
	localparam INTR_ON = 6'b101010, INTR_OFF = 6'b101011, HALT = 6'b111111, RETURN = 6'b101100;
	
	input clock, reset, intr;
	input [5:0] memInstOpcode;	
	
	
	
	output reg state;
	
	
	
	always @ (posedge clock) begin
		if(reset || intr) begin
			state <= OFF;
		end
		else begin
			case(memInstOpcode) /*memInst[31:26]*/
				INTR_ON: begin
					state <= ON;
				end
				INTR_OFF: begin
					state <= OFF;
				end
				HALT: begin
					state <= OFF;
				end
				RETURN: begin
					state <= OFF;
				end
			endcase
		end
	end
	
	
	
endmodule