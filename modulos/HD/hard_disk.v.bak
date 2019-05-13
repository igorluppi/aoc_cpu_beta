module ram_data(write_clock, read_clock, memAddress, data, dataOut, memWrite, memRead);

	parameter DATA_WIDTH = 32; // X bits
	parameter RAM_BITS = 14;
	localparam RAM_SIZE = 2**RAM_BITS; // X instructions
	
	input [DATA_WIDTH-1:0] data;
	input [DATA_WIDTH-1:0] memAddress;
	input memWrite, memRead, write_clock, read_clock;
	
	output [DATA_WIDTH-1:0] dataOut;
	
	reg [DATA_WIDTH-1:0] dataRead;
	reg [DATA_WIDTH-1:0] RAM [RAM_SIZE-1:0]; // RAM_SIZE words of 32-bit memory
	
	always @ (posedge write_clock)
	begin
		
		if (memWrite) begin
			RAM[memAddress] <= data;
		end
	
	end
	
	always @ (posedge read_clock)
	begin
		
		dataRead <= RAM[memAddress];
	
	end
	
	assign dataOut = (memRead == 1'b1) ? dataRead : 0;
	
endmodule 