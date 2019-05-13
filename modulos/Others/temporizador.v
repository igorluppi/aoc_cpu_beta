module temporizador (clk, clk_out);
	parameter DIVISOR = 1000;
	parameter DIVISOR_BITS = 10; // 2**14 = 16384, 2**10=1024
	
	input clk;
	output reg clk_out;
	
	reg [DIVISOR_BITS-1:0] estado = 0;
	
	always@(posedge clk)
		begin
			estado = estado + 1;
			
			case(estado)
				(DIVISOR/2): 
					begin
						clk_out <= 1;
					end
				(DIVISOR): 
					begin
						clk_out <= 0;
						estado <= 0;
					end
			endcase

		end
	
	
endmodule 