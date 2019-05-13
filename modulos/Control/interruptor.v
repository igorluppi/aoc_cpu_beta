module interruptor(clk, reset, PCout, PCDest, inst_mem, isHDOP, isIO, inst_out, intr);
	parameter ADDRESS_SIZE = 32;
	parameter QUANTUM_COUNT = 8;
	localparam QUANTUM_COUNT_M1 = QUANTUM_COUNT - 1;
	localparam QUANTUM = 2**QUANTUM_COUNT; 
	parameter PREEMP_INST = 32'b101001_00000000000000000000010010; /*jump label(3)*/
	
	localparam OFF = 1'b0, ON = 1'b1;
	localparam INTR_ON = 6'b101010, INTR_OFF = 6'b101011, HALT = 6'b111111, RETURN = 6'b101100, SYSCALL = 6'b101101;
	
	input clk, reset;
	input [1:0] PCDest;
	input [ADDRESS_SIZE-1:0] PCout, inst_mem;
	
	input isHDOP;
	input [1:0] isIO;
	
	output [ADDRESS_SIZE-1:0] inst_out;
	
	output reg intr;
	reg [QUANTUM_COUNT-1:0] count;
	
	reg state;
	
	
	
	always@(posedge clk)
		begin
		
			if(reset || intr) begin
				state <= OFF;
			end
			else begin
				case(inst_mem[31:26]) /*memInst[31:26]*/
					INTR_ON: begin
						state <= ON;
					end
					INTR_OFF: begin
						state <= OFF;
					end
					HALT: begin
						state <= OFF;
					end
					RETURN: begin
						state <= OFF;
					end
					SYSCALL: begin
						if(state == ON) begin
							if(count[QUANTUM_COUNT-1:2] == 6'b000000) begin
								count = 0;
							end
							else begin
								count = count - 8'b100; //QUANTUM_COUNT
							end
						end
					end
				endcase
			end
		
			if (reset || state == OFF) begin 
				count  <= 0;
				intr   <= OFF;
			end
			else begin
				
				if(count == QUANTUM - 1) begin
					intr = ON;
				end
				else begin
					intr = OFF;
				end
				
				if (PCDest != 2'b01 && isHDOP == 1'b0 && isIO == 2'b00) begin
					count = count + {{QUANTUM_COUNT_M1{1'b0}},1'b1}; /* quantum count*/
				end
				
			end
		end
	
	
	assign inst_out = (intr == OFF) ? inst_mem : PREEMP_INST;
	
endmodule 