module mux_3(in_1, in_2, in_3, out, flag);
	
	input [31:0] in_1, in_2, in_3;
	input [1:0] flag;  
	
	output reg [31:0] out;
	
	always @ (in_1, in_2, in_3, flag)
	begin
		case(flag)
			0: out = in_1;
			1: out = in_2;
			2: out = in_3;
			default: out = 0;
		endcase
	end
	
endmodule