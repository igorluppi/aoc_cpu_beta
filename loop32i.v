module loop32i(clock, n_reset, n_button_in, n_button_out, switchSide, switchUnsigned, switches, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, in_on, out_on, isHDOP, LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS, LCD_DATA, UART_RX, UART_TX, input_sig_send, input_sig_recv, output_sig_send, output_sig_recv);
	
	input clock, n_reset, n_button_in, n_button_out, switchSide, switchUnsigned;
	input [15:0] switches;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	output in_on, out_on;
	output isHDOP;
	
	output LCD_ON,LCD_BLON,LCD_RW,LCD_EN,LCD_RS;
	inout [7:0] LCD_DATA;
	
	input UART_RX;
	output UART_TX;
	input input_sig_send, input_sig_recv;
	output output_sig_send, output_sig_recv;
	
	wire reset, clock_cpu;
	wire n_button_in_db, n_button_out_db;
	wire button_in_db, button_out_db, button_in_pulse, button_out_pulse;
	
	
	assign button_in_db = ~n_button_in_db;
	assign button_out_db = ~n_button_out_db;
	assign reset = ~n_reset;
	
	DeBounce debounce1(clock, n_reset, n_button_in, n_button_in_db);
	DeBounce debounce2(clock, n_reset, n_button_out, n_button_out_db);
	
	
	oneshot pulser1(clock_cpu, button_in_db, button_in_pulse);
	oneshot pulser2(clock_cpu, button_out_db, button_out_pulse);
	
	
	temporizador temp(clock, clock_cpu);
	
	
	cpu cpu_core(clock_cpu, clock, reset, button_in_pulse, button_out_pulse, switchSide, switchUnsigned, switches, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, in_on, out_on, isHDOP, LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS, LCD_DATA, UART_RX, UART_TX, input_sig_send, input_sig_recv, output_sig_send, output_sig_recv);
	
	
endmodule