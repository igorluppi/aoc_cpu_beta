module stack_data(write_clock, read_clock, stackPointer, data, dataOut, stackOp);

	parameter DATA_WIDTH = 32; // X bits
	parameter STACK_BITS = 12;
	localparam STACK_SIZE = 2**STACK_BITS; // X instructions
    
	
	input [DATA_WIDTH-1:0] data;
	input [DATA_WIDTH-1:0] stackPointer;
	input [1:0] stackOp;
	input write_clock, read_clock;
	output [DATA_WIDTH-1:0] dataOut;
	
	reg [DATA_WIDTH-1:0] dataRead;
	reg [DATA_WIDTH-1:0] STACK [STACK_SIZE:0]; // RAM_SIZE words of 32-bit memory
	
	always @ (posedge write_clock)
	begin
		
		if (stackOp == 2'b01) begin
			STACK[stackPointer] <= data;
		end
	
	end
	
	always @ (posedge read_clock)
	begin
		
		dataRead <= STACK[stackPointer-1];
	
	end
	
	assign dataOut = (stackOp != 2'b10 || stackPointer == 0) ? 0 : dataRead;
	
endmodule
