module hd_timer(isAct, opcode, clk, hd_ready, isHDOP);
	
	parameter DIVISOR_BITS = 2; // 2**14 = 16384
	localparam DIVISOR = 2**DIVISOR_BITS;
	
	localparam HDTOINST = 6'b100011, HDTOREG = 6'b100100, REGTOHD = 6'b100101;
	
	input clk, isAct;
	input [5:0] opcode;
	output reg hd_ready;
	output isHDOP;
	
	reg [DIVISOR_BITS-1:0] estado = 0;
	
	always@(posedge clk)
	begin
		if (isAct) begin
			if(estado == DIVISOR - 1) begin
				hd_ready = 1'b1;
			end
			else begin
				hd_ready = 1'b0;
			end
		
			if (isHDOP) begin
				estado = estado + 1;
			end
			else begin
				estado = 0;
			end
		end
		else begin
			hd_ready <= 1'b1;
			estado <= 0;
		end

	end
	
	assign isHDOP = (opcode == HDTOINST || opcode == HDTOREG || opcode == REGTOHD);
	
	
endmodule 