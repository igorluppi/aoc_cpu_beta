module bcd_conversor (binary, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9) ;
	
	input [31:0] binary;
	
	output reg [3:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9;

	integer i;

	always@(binary) begin
		
		x9 = 4'd0;
		x8 = 4'd0;
		x7 = 4'd0;
		x6 = 4'd0;
		x5 = 4'd0;
		x4 = 4'd0;
		x3 = 4'd0;
		x2 = 4'd0;
		x1 = 4'd0;
		x0 = 4'd0;
		
		for (i=31; i>=0; i=i-1) begin
		
			if (x9 >= 5)
				x9 = x9 + 3;
			if (x8 >= 5)
				x8 = x8 + 3;
			if (x7 >= 5)
				x7 = x7 + 3;
			if (x6 >= 5)
				x6 = x6 + 3;
			if (x5 >= 5)
				x5 = x5 + 3;
			if (x4 >= 5)
				x4 = x4 + 3;
			if (x3 >= 5)
				x3 = x3 + 3;
			if (x2 >= 5)
				x2 = x2 + 3;
			if (x1 >= 5)
				x1 = x1 + 3;
			if (x0 >=5)
				x0 = x0 + 3;
			
			x9 = x9 << 1 ;
			x9[0] = x8[3];
			x8 = x8 << 1 ;
			x8[0] = x7[3];
			x7 = x7 << 1 ;
			x7[0] = x6[3];
			x6 = x6 << 1 ;
			x6[0] = x5[3];
			x5 = x5 << 1 ;
			x5[0] = x4[3];
			x4 = x4 << 1 ;
			x4[0] = x3[3];
			x3 = x3 << 1 ;
			x3[0] = x2[3];
			x2 = x2 << 1 ;
			x2[0] = x1[3];
			x1 = x1 << 1 ;
			x1[0] = x0[3];
			x0 = x0 << 1 ;
			x0[0] = binary[i];
			
		end
	end
endmodule 
