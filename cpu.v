module cpu(clock, clock_max, reset, button_in, button_out, switchSide, switchUnsigned, switches, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, in_on, out_on, isHDOP, LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS, LCD_DATA, UART_RX, UART_TX, input_sig_send, input_sig_recv, output_sig_recv);
	
	/*Controle*/
	wire [2:0] regDest;
	wire regWrite, extSide, twoComplement, regAlu, memWrite, memRead;
	wire [1:0] jumpOp, PCDest, outputControl;
	wire [3:0] resultDest;
   wire [1:0] stackOp;
	wire [1:0] owner;
	wire hdWrite, hdRead, instWrite, hd_ready;
	wire biosReset, resetPC;
	wire [1:0] lcdWrite;
	
	/*Controle*/
	
	input clock, clock_max, reset, button_in, button_out, switchSide, switchUnsigned;
	input [15:0] switches;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	output in_on, out_on;
	output isHDOP;
	
	input UART_RX, UART_TX;
	input input_sig_send, input_sig_recv;
	output output_sig_recv;
	
	output LCD_ON,LCD_BLON,LCD_RW,LCD_EN,LCD_RS;
	inout [7:0] LCD_DATA;
	wire [7:0] dataLcdRead, dataLcdWrite;
	wire [4:0] lcdPosRead, lcdPosWrite;
	
	wire intr;
	
	wire [7:0]  dataUARTOut;
	wire receive_flag, send_flag;
	
	wire [31:0] PCin, PCout, nextPC;
	wire [31:0] instrucao, instrucaoMEM, instrucaoBIOS, instrucaoMEM_INTR;
	wire [4:0]  rd;
	wire [31:0] dataReg, regs1, regs2, regs3;
	wire [31:0] imediatoExt;
	wire [31:0] dataMemOut, dataHDOut;
   wire [31:0] dataStackOut;
	wire [31:0] aluIn2, aluOut;
	wire [5:0]  funct;
	wire branchCondition;
	wire [31:0] jumpOut;
	wire [31:0] branchOut;
	wire [15:0] switchesOut;
	wire [31:0] switchesOutExt;
	wire [31:0] switchesExt;
	wire [31:0] binaryOut;
	
	
	pc_reset PCReset(reset, biosReset, resetPC);
	
	program_counter PC(clock, resetPC, PCin, PCout, nextPC);
	
	ram_inst ramInstrucoes(clock, clock_max, reset, instWrite, regs3, dataHDOut, PCout, instrucaoMEM);
	// instrucao[31:26] instrucao[25:21] instrucao[20:16]
	bios biosInstrucoes(clock, clock_max, reset, PCout, instrucaoBIOS);
	
	bios_control biosControl(clock, reset, biosReset, instrucaoBIOS, instrucaoMEM_INTR, instrucao);
	
	mux_regs muxRegs(instrucao[20:16], instrucao[15:11], rd, regDest);
	
	registers regs(clock, reset, instrucao[25:21], instrucao[20:16], rd, dataReg, regs1, regs2, regs3, regWrite, stackOp);
	
	extensor ext(instrucao[15:0], imediatoExt, extSide, twoComplement);
	
	alu_control AluControl(instrucao[31:26], instrucao[5:0], funct);
	
	mux_2 muxAlu(regs2, imediatoExt, aluIn2, regAlu);
	
	alu Alu(regs1, aluIn2, aluOut, instrucao[10:6], funct, branchCondition);

   stack_data stack(clock, clock_max, regs1, regs2, dataStackOut, stackOp);
	
	ram_data ram(clock, clock_max, aluOut, regs2, dataMemOut, memWrite, memRead);
	
	hd_timer hdTimer(1'b1, instrucao[31:26], clock, hd_ready, isHDOP);
	
	hard_disk hd(clock, clock_max, reset, regs1, regs2, regs3, dataHDOut, hdWrite, hdRead); ///
	
	mux_jump muxJump(PCout, regs1, instrucao[25:0], jumpOut, jumpOp);
	
	branch_control branchControl(PCout, nextPC, imediatoExt, branchOut, branchCondition);
	
	mux_4 muxPC(nextPC, PCout, branchOut, jumpOut, PCin, PCDest);
	
	in_module moduleIN(switches, button_in, switchSide, switchUnsigned, switchesExt, switchesOutExt);
	
	out_module_control outControl(switchesExt, regs1, binaryOut, outputControl, in_on, out_on);
	
	out_module moduleOut(binaryOut, in_on, out_on, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	
	mux_9 muxRS(aluOut, imediatoExt, dataMemOut, switchesOutExt, nextPC, dataStackOut, dataHDOut, PCout, {24'b0,dataUARTOut}, dataReg, resultDest);
	
	control_unit UC(instrucao[31:26], instrucao[5:0], button_in, button_out, switchSide, hd_ready, regDest, regWrite, extSide, twoComplement, regAlu, memWrite, memRead, jumpOp, PCDest, outputControl, resultDest, stackOp, owner, hdWrite, hdRead, instWrite, lcdWrite, receive_flag, send_flag);
	
	lcd LCDmodule(clock_max, LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS, LCD_DATA, lcdPosRead, dataLcdRead);

	lcd_ram LCDram(clock, clock_max, reset, lcdPosWrite, lcdPosRead, dataLcdWrite, lcdWrite, dataLcdRead);
	
	interruptor moduleIntr(clock, reset, PCout, PCDest, instrucaoMEM, isHDOP, outputControl, instrucaoMEM_INTR, intr);
	
	//interruptor_control intrControl(clock, reset, instrucaoMEM[31:26], intr, state_intr);
	
	lcd_control LCDcontrol(instrucao[25:21], regs1[4:0], instrucao[7:0], regs2[7:0], lcdPosWrite, dataLcdWrite, instrucao[12:11]);
	
	serial_communication SerialComm(clock_max, reset, UART_RX, UART_TX, regs1[7:0], dataUARTOut, receive_flag, send_flag);
	
	send_control sendControl(clock, instrucao[31:26], input_sig_send, send_flag);
	
	recv_control recvControl(clock, instrucao[31:26], input_sig_recv, output_sig_recv, receive_flag);
	
endmodule
