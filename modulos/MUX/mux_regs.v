module mux_regs(rt, rd, out, regDest);
	
	input [4:0] rt, rd;
	input [2:0] regDest;  
	
	output reg [4:0] out;
	
	localparam RA = 5'b11111, RA_OS = 5'b10111, PC_BACK = 5'b11010;
	
	always @ (*)
	begin
		case(regDest)
			0: out = rt;
			1: out = rd;
			2: out = RA;
			3: out = RA_OS;
			4: out = PC_BACK;
			default: out = 0;
		endcase
	end
	
endmodule
