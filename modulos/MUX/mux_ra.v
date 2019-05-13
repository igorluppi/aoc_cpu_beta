module mux_ra(opcode, rd, out, regDest);
	
	input [4:0] rt, rd;
	input [1:0] regDest;  
	
	output reg [4:0] out;
	
	always @ (*)
	begin
		case(regDest)
			0: out = rt;
			1: out = rd;
			2: out = 5'b11111;
			default: out = 0;
		endcase
	end
	
endmodule