module mux_7(in_1, in_2, in_3, in_4, in_5, in_6, in_7, out, flag);
	
	input [31:0] in_1, in_2, in_3, in_4, in_5, in_6, in_7;
	input [2:0] flag;  
	
	output reg [31:0] out;
	
	always @ (*)
	begin
		case(flag)
			0: out = in_1;
			1: out = in_2;
			2: out = in_3;
			3: out = in_4;
			4: out = in_5;
			5: out = in_6;
			6: out = in_7;
			default: out = 0;
		endcase
	end
	
endmodule
