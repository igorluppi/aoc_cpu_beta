module alu_control(opcode, funct, functOut);
	
	input [5:0] opcode, funct;
	output reg [5:0] functOut;


	always@(*)
	begin
		case(opcode)
			6'b000000: // r-type
				begin
					case(funct[5:1])
						5'b01010: functOut = 6'b111111; // JumpReg, JumpRegLink
						default: functOut = funct;
					endcase
				end
			6'b000001: functOut = 6'b000101; // load word
			6'b000010: functOut = 6'b000101; // store word
			6'b000011: functOut = 6'b000101; // addi
			6'b000100: functOut = 6'b000110; // subi
			6'b000111: functOut = 6'b010011; // beq
			6'b001000: functOut = 6'b010100; // bne
			default:	functOut = 6'b111111;	// do nothing
		endcase
	end
endmodule
