module out_module_control(in, regs, binary, outputControl, in_on, out_on);
	
	input [31:0] in, regs;
	input [1:0] outputControl;
	output reg [31:0] binary;
	output reg in_on, out_on;
	
	always @ (*) begin
		case(outputControl)
			1: 
			begin
				binary = in;
				in_on = 1;
				out_on = 0;
			end
			2:
			begin
				binary = regs;
				in_on = 0;
				out_on = 1;
			end
			default:
			begin
				binary = 32'b0;
				in_on = 0;
				out_on = 0;
			end
		endcase
			
	end
	
endmodule