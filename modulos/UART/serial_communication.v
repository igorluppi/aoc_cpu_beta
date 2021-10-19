module serial_communication(
	//////////// CLOCK //////////
	input                      CLOCK_50,
	input                      reset,

	//////////// GPIO, GPIO connect to RFS - RF and Sensor //////////
	input                      UART_RX,
	output                     UART_TX,
	
	//////////// DATA //////////
	input       [7:0]          in,
	output      [7:0]          out,
	
	//////////// CONTROL //////////
	input                      receive_flag,
	input                      send_flag,
	
	output                     data_available
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

assign  UART_TX = txd;
assign  rxd  = UART_RX;
assign  uart_data = uart_data_read;
assign  uart_data_write = in;
reg	 [7:0]   hold_data;

wire 				rts; // request to send		  
wire 				cts; // clear to send
wire 				rxd;
wire 				txd;
wire	 [7:0]   uart_data;
wire	 [7:0]   uart_data_read;
wire	 [7:0]   uart_data_write;
wire	         rdempty;
wire	         write;
//wire	         data_available;
reg	         read;
reg	         cnt;
//=======================================================
//  Structural coding
//=======================================================

// UART Controller
uart_control UART0(

	.clk(CLOCK_50),
	.reset_n(1'b1),
	// tx
	.write(write),
	.writedata(uart_data_write),

	// rx
	.read(read),
	.readdata(uart_data_read),
	.rdempty(rdempty),
	//
	.uart_clk_25m(cnt),
	.uart_tx(txd),
	.uart_rx(rxd)
	
);	

//read
always@(posedge CLOCK_50)
begin
  if (~rdempty)
		read <= 1;
  else
		read <= 0;
end

assign  data_available = (read & (~rdempty)); // indica se o dado esta disponivel no canal de comunicacao.
assign  write = out_flag; // indica quando pode-se escrever o dado no canal de comunicacao.
//assign  write =  ou1; // indica quando pode-se escrever o dado no canal de comunicacao.
wire out_flag;
oneshot pulsoSend(CLOCK_50, send_flag, out_flag);



always@(posedge CLOCK_50)
begin

  if (data_available) begin
    hold_data <= uart_data; // atribui o buffer a saida
  end
	 
end

assign out = (receive_flag == 1'b1) ? hold_data : 0;

always@(posedge CLOCK_50) 
begin
	cnt <= cnt + 1; // bit inversor 
end

endmodule