module hard_disk(write_clock, read_clock, reset, trilha, setor, data, dataOut, hdWrite, hdRead);

	parameter DATA_WIDTH = 32; // X bits
	parameter HD_TRILHAS_BITS = 4;
	parameter HD_SETORES_BITS = 4;
	
	localparam HD_TRILHAS_SIZE = 2**HD_TRILHAS_BITS; 
	localparam HD_SETORES_SIZE = 2**HD_SETORES_BITS; 
	
	input [DATA_WIDTH-1:0] data;
	input [HD_TRILHAS_BITS-1:0] trilha;
	input [HD_SETORES_BITS-1:0] setor;
	input reset, hdWrite, hdRead, write_clock, read_clock;
	
	output [DATA_WIDTH-1:0] dataOut;
	
	reg [DATA_WIDTH-1:0] dataRead;
	reg [DATA_WIDTH-1:0] HD [HD_TRILHAS_SIZE-1:0][HD_SETORES_SIZE-1:0]; // HD_SIZE words of 32-bit memory
	
	
	initial 
	begin : INIT
		HD[0][0] = 32'b000101_00000_00010_0000000011001000; // li 2 200
		HD[0][1] = 32'b001010_00010_00000_0000000000000000; // out 2
		HD[0][2] = 32'b11111111111111111111111111111111; // halt
		HD[1][0] = 32'b001010_00010_00000_0000000000000000; // out 2
		HD[2][0] = 32'b11111111111111111111111111111111; // halt
	end 
	
	always @ (posedge write_clock)
	begin
		if (hdWrite == 1'b1) begin
			HD[trilha][setor] <= data;
		end
	end
	
	always @ (posedge read_clock)
	begin
		dataRead <= HD[trilha][setor];
	end
	
	assign dataOut = (hdRead == 1'b1) ? dataRead : 0;
	
	/*initial begin
		HD[0][0] <= 32'b000101_00000_00010_0000000011001000; // li 2 200
		HD[0][1] <= 32'b001010_00010_00000_0000000000000000; // out 2
		HD[0][2] <= 32'b11111111111111111111111111111111; // halt
	end*/
	
endmodule 