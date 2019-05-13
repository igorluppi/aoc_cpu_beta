module oneshot(input clk, input trigger_in, output reg pulse_out);
	reg delay;

	always @ (posedge clk)
	begin
		if (trigger_in && !delay) begin
			pulse_out <= 1'b1;
		end
		else begin 
			pulse_out <= 1'b0;
		end
		delay <= trigger_in;
	end 
endmodule
