module alu (a, b, rs, shift, funct, branch);
	parameter tamOp = 32;

	input [tamOp-1:0] a, b;
	input [4:0] shift;
	input [5:0] funct;
	output reg branch;
	output reg [tamOp-1:0] rs;


	always@(*)
	begin
		rs = 0;
		branch = 0;
		case(funct)
			6'b000000: rs = a << shift;                         //logical left shift of a
         6'b000001: rs = a >> shift;                         //logical right shift of a
         6'b000010: rs = $signed(a) >>> shift;               //arithmetic right shift of a
         6'b000011:                                          //left rotation of a
                  begin
							rs = a << 1;
							rs[0:0] = a[tamOp-1:tamOp-1];
                  end
         6'b000100:                                          //right rotation of a
						begin
                     rs = a >> 1;
							rs[tamOp-1:tamOp-1] = a[0:0];
                  end
			6'b000101: rs = a + b;	                            //add
         6'b000110: rs = a - b;                              //sub
         6'b000111: rs = a * b;                              //mult
         6'b001000: rs = a / b;                              //div
			6'b001001: rs = a + 1;                              //increment data of a
         6'b001010: rs = a - 1;                              //decrement data of a
         6'b001011: rs = a % b;                              //modulo
         6'b001100: rs = a & b;                              //and bitwise
         6'b001101: rs = a | b;	                            //or bitwise
         6'b001110: rs = ~a;	                               //not bitwise
         6'b001111: rs = a ^ b;                              //xor bitwise
			6'b010000: rs = a;                                  //move
         6'b010001: rs = ($signed(a) < $signed(b)) ? 1 : 0;  //slt
			6'b010010: rs = ($signed(a) > $signed(b)) ? 1 : 0;	 //sgt
         6'b010011: 														 //set-beq
						begin 
							rs = (a == b) ? 1 : 0;		  
							branch = rs[0:0];
						end
			6'b010100: branch = (a != b) ? 1'b1 : 1'b0;			 //bne
			default:
						begin
							rs = 0;
							branch = 0;
						end
		endcase
	end
endmodule
