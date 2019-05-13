module branch_control(PC, nextPC, immediate, branchOut, branchCondition);
	
	input branchCondition;
	input [31:0] PC, nextPC, immediate;
	output reg [31:0] branchOut;

	always @(*)
	begin
		if(branchCondition) begin
			branchOut = PC + $signed(immediate);
		end
		else begin
			branchOut = nextPC;
		end
		
		
	end
endmodule
