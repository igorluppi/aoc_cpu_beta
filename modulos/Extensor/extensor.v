module extensor(in, out, extSide, twoComplement);
	parameter tamIn = 16;
	parameter tamOp = 32;
	localparam tamN = tamOp-tamIn;	// Can not be modified

	input [tamIn-1:0] in;
	input extSide, twoComplement; 	// Flags; <-- (0); --> (1)
	output reg [tamOp-1:0] out;


	always@(*)
	begin
		if(twoComplement && in[tamIn-1:tamIn-1]) begin
			if(!extSide) begin
				out = {{tamN{1'b1}},in};
			end
			else begin
				out = {in,{tamN{1'b0}}};
			end
		end
		else begin
			if(!extSide) begin
				out = {{tamN{1'b0}},in};
			end
			else begin
				out = {in,{tamN{1'b0}}};
			end
		end
	end
endmodule
