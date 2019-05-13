module serial_communication(
	//////////// CLOCK //////////
	input                      CLOCK_50,
	input                      reset,

	//////////// GPIO, GPIO connect to RFS - RF and Sensor //////////
	input                      UART_RX,
	output                     UART_TX,
	
	//////////// DATA //////////
	input       [7:0]          in,
	output reg  [7:0]          out,
	
	//////////// CONTROL //////////
	input                      receive_flag,
	input                      send_flag
);

//=======================================================
//  REG/WIRE declarations
//=======================================================

assign  UART_TX = txd;
assign  rxd  = UART_RX;
assign  uart_data = uart_data_read;
assign  uart_data_write = in;

wire 				rts; // request to send		  
wire 				cts; // clear to send
wire 				rxd;
wire 				txd;
wire	 [7:0]   uart_data;
wire	 [7:0]   uart_data_read;
wire	 [7:0]   uart_data_write;
wire	         rdempty;
wire	         write;
wire	         data_available;
reg	         read;
reg	         cnt;
//=======================================================
//  Structural coding
//=======================================================

// UART Controller
uart_control UART0(

	.clk(CLOCK_50),
	.reset_n(~reset),
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
assign  write = (read & (~rdempty)) & send_flag; // indica quando pode-se escrever o dado no canal de comunicacao.

always@(posedge CLOCK_50)
begin

  if (data_available && receive_flag) begin
    out <= uart_data; // atribui o buffer a saida
  end
  else begin
    out <= 8'b0;
  end
	 
end

always@(posedge CLOCK_50) 
begin
	cnt <= cnt + 1; // bit inversor 
end

endmodule