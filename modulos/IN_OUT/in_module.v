module in_module(switches, button_in, switchSide, switchUnsigned, switchesExt, switchesOutExt);
	
	input [15:0] switches;
	input button_in, switchSide, switchUnsigned;
	output [31:0] switchesExt;
	output [31:0] switchesOutExt;
	reg [15:0] switchesOut;
	
	
	always@(*)
	begin
		if(button_in) begin
			switchesOut = switches;
		end
		else begin
			switchesOut = 0;
		end
	end
	
	extensor ext1(switches, switchesExt, switchSide, ~switchUnsigned);
	extensor ext2(switchesOut, switchesOutExt, switchSide, ~switchUnsigned);

	
endmodule
