module mux_jump(PC, regs, address, jumpOut, jumpOp);
	
	input [1:0] jumpOp;
	input [25:0] address;
	input [31:0] PC, regs;
	output reg [31:0] jumpOut;


	always@(*)
	begin
		case(jumpOp)
			1: jumpOut = {PC[31:26],address};
			2: jumpOut = {address,6'b000000};
			3: jumpOut = regs;
			default: jumpOut = 0;
		endcase
	end
endmodule
