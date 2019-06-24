module recv_control(clock, opcode, input_sig_rcv, output_sig_rcv, rcv_flag);

parameter OPCODE_RCV = 6'b010010; // opcode padrao do receive

input clock, input_sig_rcv;
input [5:0] opcode;
output output_sig_rcv, rcv_flag;

oneshot pulser(clock, input_sig_rcv , rcv_flag); // trata o sinal para permitir somente um receive por send

assign output_sig_rcv = (opcode == OPCODE_RCV) ? 1'b1 : 1'b0; // verifica se a instrucao atual e de receive

endmodule
