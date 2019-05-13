module program_counter(clock, reset, PCin, PCout, nextPC);
	parameter ADDRESS_SIZE = 32;
	parameter ADDRESS_INCREMENT= 1'b1;
	
	input [ADDRESS_SIZE-1:0] PCin;
	input clock, reset;
	
	reg [ADDRESS_SIZE-1:0] PC;
	
	output reg [ADDRESS_SIZE-1:0] PCout, nextPC;
	
	
	always @ (posedge clock)
	begin
		if(reset) begin
			PC = 0;
		end
		else begin
			PC = PCin;
		end
		PCout = PC;
		nextPC = PC + ADDRESS_INCREMENT;

	end
	
endmodule