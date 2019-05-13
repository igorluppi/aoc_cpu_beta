module mux_4(in_1, in_2, in_3, in_4, out, flag);
	
	input [31:0] in_1, in_2, in_3, in_4;
	input [1:0] flag;  
	
	output reg [31:0] out;
	
	always @ (*)
	begin
		case(flag)
			0: out = in_1;
			1: out = in_2;
			2: out = in_3;
			3: out = in_4;
		endcase
	end
	
endmodule