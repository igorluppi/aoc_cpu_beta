module lcd_control(positionIm, positionReg, dataIm, dataReg, positionOut, dataOut, flags);
	
	input [4:0] positionIm, positionReg;
	input [7:0] dataIm, dataReg;
	input [1:0] flags;
	
	output [4:0] positionOut;
	output [7:0] dataOut;

	assign positionOut = (flags[0] == 1'b0) ? positionIm : positionReg;
	assign dataOut     = (flags[1] == 1'b0) ? dataIm     : dataReg;
	

endmodule
