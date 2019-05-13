module pc_reset(hardReset, BiosReset, reset);

	input hardReset, BiosReset;
	
	output reset;
	
	assign reset = hardReset | BiosReset;
	
endmodule