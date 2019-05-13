module teste(clk, switches, button_in, saida);
	
	input clk, button_in;
	input [15:0] switches;
	output saida;
	wire [15:0] switchesOut;
	wire [31:0] switchesOutExt;
	wire [31:0] switchesExt;
	
	in_module moduleIN(switches,switchesOut, button_in);
	
	extensor ext2(switches, switchesExt, 1'b0, 1'b1);
	extensor ext3(switchesOut, switchesOutExt, 1'b0, 1'b1);
	
	mux_2 mx(0,switchesOutExt,saida,button_in);
	
	
	
	
endmodule
//extensor #(tam) ext(in, out, flag, tc);