module out_module(binaryS, in_on, out_on, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	
	//input clock, reset;
	input [31:0] binaryS;
	input in_on, out_on;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

	
	wire [31:0] binary;
	wire sign, turnOff;
	
	wire [3:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, signBCD;
	wire [3:0] x0f, x1f, x2f, x3f, x4f, x5f, x6f, signBCDf;
	
	assign turnOff = in_on ~^ out_on;
	
	two_complement_conversor TCconversor(binaryS, binary, sign);
	
	assign signBCD = (sign == 1) ? 4'b1010 : 4'b1111;
	
	bcd_conversor BCDconcersor(binary, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9);
	
	assign x0f = (turnOff == 0) ? x0 : 4'b1111;
	assign x1f = (turnOff == 0) ? x1 : 4'b1111;
	assign x2f = (turnOff == 0) ? x2 : 4'b1111;
	assign x3f = (turnOff == 0) ? x3 : 4'b1111;
	assign x4f = (turnOff == 0) ? x4 : 4'b1111;
	assign x5f = (turnOff == 0) ? x5 : 4'b1111;
	assign x6f = (turnOff == 0) ? x6 : 4'b1111;
	assign signBCDf = (turnOff == 0) ? signBCD : 4'b1111;
	
	display H0(x0f, HEX0);
	display H1(x1f, HEX1);
	display H2(x2f, HEX2);
	display H3(x3f, HEX3);
	display H4(x4f, HEX4);
	display H5(x5f, HEX5);
	display H6(x6f, HEX6);
	display H7(signBCDf, HEX7);
	
	
	
endmodule