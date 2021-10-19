module timer(isAct, clk, hd_ready, hasToDo);
	
	parameter DIVISOR_BITS = 7; // 2**14 = 16384
	localparam DIVISOR = 2**DIVISOR_BITS;

	
	input clk, isAct;
	output reg hd_ready, hasToDo;
	
	reg [DIVISOR_BITS-1:0] estado = 0;
	
	always@(posedge clk)
	begin
		if (isAct) begin
		   hasToDo = 1'b1;
		end
		
		if(estado == DIVISOR - 1) begin
			hd_ready = 1'b1;
			hasToDo = 1'b0;
		end else begin
		   hd_ready = 1'b0;
		end
		
		if (hasToDo) begin
			estado = estado + 1;
		end
		else begin
			estado = 0;
		end
		

	end
	
	
	
endmodule 