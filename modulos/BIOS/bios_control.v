module bios_control(clock, reset, resetPC, biosInst, memInst, out);
	
	parameter DATA_WIDTH = 32;
	
	localparam BIOS = 1'b0, MEMORY = 1'b1;
	localparam UPBIOS = 6'b100001, UPMEM = 6'b100010;
	
	input clock, reset;
	input [DATA_WIDTH-1:0] biosInst, memInst;	
	
	output [DATA_WIDTH-1:0] out;		
	output reg resetPC;
	
	reg state;
	
	
	
	always @ (posedge clock) begin
		if(reset) begin
			state <= BIOS;
			resetPC <= 1'b1;
		end
		else if (state == BIOS) begin
			case(biosInst[31:26])
				UPMEM: begin
					state <= MEMORY;
					resetPC <= 1'b1;
				end
				UPBIOS: begin
					state <= BIOS;
					resetPC <= 1'b1;
				end
				default:	begin
					resetPC <= 1'b0;
				end
			endcase
		end else begin
			case(memInst[31:26])
				UPMEM: begin
					state <= MEMORY;
					resetPC <= 1'b1;
				end
				UPBIOS: begin
					state <= BIOS;
					resetPC <= 1'b1;
				end
				default:	begin
					resetPC <= 1'b0;
				end
			endcase
		end
	end
	
	assign out = (state == BIOS) ? biosInst : memInst;
	
endmodule