module freq_div10 (clk, clk_out);
	input clk;
	output reg clk_out = 0;
	reg [3:0] estado = 0;

	always@(posedge clk)
		begin
			case(estado)
				0: estado = 1;
				1: estado = 2;
				2: estado = 3;
				3: estado = 4;
				4: 
					begin 
						estado = 5;
						clk_out = 1;
					end
				5: estado = 6;
				6: estado = 7;
				7: estado = 8;
				8: estado = 9;
				default:
					begin 
						estado = 0;
						clk_out = 0;
					end
			endcase
		end
    //wire w1, w2, w3;
	/*freq_div10 inst1(.clk(clk), .clk_out(w1));
	freq_div10 inst2(.clk(w1), .clk_out(w2));
	freq_div10 inst3(.clk(w2), .clk_out(w3));
	freq_div10 inst4(.clk(w3), .clk_out(clk_out));
	
	freq_div10 inst5(.clk(w4), .clk_out(w5));
	freq_div10 inst8(.clk(w5), .clk_out(clk_out));*/
endmodule