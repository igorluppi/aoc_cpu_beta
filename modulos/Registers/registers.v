module registers(clock, reset, rs, rt, rd, data, out1, out2, out3, regWrite, stackOp);
	
	parameter SP = 30;    

	input [4:0] rs, rt, rd;
	input [31:0] data;
	input regWrite, clock, reset;
	input [1:0] stackOp;

	output [31:0] out1, out2, out3;
	wire [31:0] stackValue;

	reg [31:0] registers[0:31];

	integer i;

	assign stackValue = registers[rs];
	
	always @ (posedge clock) begin
		if (reset) begin
			for (i=0; i<32; i=i+1) begin
				registers[i] = 0;
			end
		end
		
		if (regWrite) begin
			registers[rd] = data;
		end

		if(stackOp == 2'b01) begin //push
			registers[rs] = stackValue + 1;
		end
		else if(stackOp == 2'b10) begin //pop
			registers[rs] = (stackValue == 0) ? 0 : stackValue - 1;
		end
		
		registers[0] = 0;
		
	end

	assign out1 = registers[rs];
	assign out2 = registers[rt];
	assign out3 = registers[rd];
	
	
	
endmodule
