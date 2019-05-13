module display (d, y);
	parameter TYPE = 0;
	input [3:0] d;
	output reg [6:0] y;
	
	always@(*)
		begin
			case(d)
				0: y = 7'b1000000;
				1: y = 7'b1111001;
				2: y = 7'b0100100;
				3: y = 7'b0110000;
				4: y = 7'b0011001;
				5: y = 7'b0010010;
				6: y = 7'b0000010;
				7: y = 7'b1111000;
				8: y = 7'b0000000;
				9: y = 7'b0010000;
				10: y = 7'b0111111; // negative
				default: y = 7'b1111111;
			endcase
			
			if(TYPE) begin
				y = ~y;
			end
		end
endmodule