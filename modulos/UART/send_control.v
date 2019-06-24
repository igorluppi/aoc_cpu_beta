module send_control(clock, opcode, input_sig_snd, output_sig_snd, snd_flag);

parameter OPCODE_SND = 6'b010001; // opcode padrao do send

input clock, input_sig_snd;
input [5:0] opcode;
output snd_flag, output_sig_snd;
//reg sig;

oneshot pulser(clock, input_sig_snd, snd_flag); // trata o sinal para permitir somente um send por receive

/*always@(*) begin
if (output_sig_snd == 1'b0 && input_sig_snd == 1'b1) begin
  if (sig)
    sig <= 1'b1;
  else
    sig <= 1'b0; 
end
else if (output_sig_snd == 1'b1 && input_sig_snd == 1'b1)
  sig <= 1'b1;
else
  sig <= 1'b0;
end*/

assign output_sig_snd = (opcode == OPCODE_SND) ? 1'b1 : 1'b0; // verifica se a instrucao atual e de send.
endmodule
