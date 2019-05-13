module mux_2(in_1, in_2, out, flag);
	
	input [31:0] in_1, in_2;
	input flag;  
	
	output reg [31:0] out;
	
	always @ (*)
	begin
		case(flag)
			0: out = in_1;
			1: out = in_2;
		endcase
	end
	
endmodule