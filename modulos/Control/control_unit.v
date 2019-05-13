module control_unit (opcode, funct, button_in, button_out, switchSide, hd_ready, regDest, regWrite, extSide, twoComplement, regAlu, memWrite, memRead, jumpOp, PCDest, outputControl, resultDest, stackOp, owner, hdWrite, hdRead, instWrite, lcdWrite, recv_flag, send_flag);
	
	input [5:0] opcode, funct;
	input button_in, button_out, switchSide;
	input recv_flag, send_flag;
	//input reset;
	
	output reg [2:0] regDest;
	output reg regWrite, extSide, twoComplement, regAlu, memWrite, memRead;
	output reg [1:0] jumpOp, PCDest, outputControl;
	output reg [3:0] resultDest;
   output reg [1:0] stackOp;
	output reg [1:0] lcdWrite;
	
	/*Control*/
   output reg [1:0] owner; // bios or mem --> obsolete
	output reg hdWrite, hdRead, instWrite;
	input hd_ready;


	
	
	always@(*)
	begin
		
		
		
		case(opcode)
			6'b000000: begin
				
				case(funct)
					6'b000000: begin //sll
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000001: begin //srl
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000010: begin //sra
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000011: begin //csl
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000100: begin //csr
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000101: begin // add
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000110: begin // sub
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b000111: begin // mult
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001000: begin // div
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001001: begin // inc
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001010: begin // dec
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
						 
					end
					
					6'b001011: begin // mod
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001100: begin // and
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001101: begin // or
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001110: begin // not
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b001111: begin // xor
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b010000: begin // move
						regDest = 3'b000;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b010001: begin // slt
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b010010: begin // sgt
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b010011: begin // set
						regDest = 3'b001;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'b0;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'b00;
						outputControl = 2'b00;
						resultDest = 4'b0000;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b010100: begin // jr
						regDest = 3'bxxx;
						regWrite = 1'b0;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b11;
						PCDest = 2'b11;
						outputControl = 2'b00;
						resultDest = 4'bxxxx;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					6'b010101: begin // jalr
						regDest = 3'b010;
						regWrite = 1'b1;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b11;
						PCDest = 2'b11;
						outputControl = 2'b00;
						resultDest = 4'b0100;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
					default: begin
						regDest = 3'bxxx;
						regWrite = 1'b0;
						extSide = 1'bx;
						twoComplement = 1'bx;
						regAlu = 1'bx;
						memWrite = 1'b0;
						memRead = 1'b0;
						jumpOp = 2'b00;
						PCDest = 2'bxx;
						outputControl = 2'b00;
						resultDest = 4'bxxxx;
						stackOp = 2'b00;
						owner = 2'b00;
						hdWrite = 1'b0;
						hdRead = 1'b0;
						instWrite = 1'b0;
						lcdWrite = 2'b00;
						 
					end
					
				endcase
				
			end
			
			6'b000001: begin // lw
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'b1;
				memWrite = 1'b0;
				memRead = 1'b1;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'b0010;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b000010: begin // sw
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'b1;
				memWrite = 1'b1;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b000011: begin // addi
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = 1'b0;
				twoComplement = 1'b1;
				regAlu = 1'b1;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'b0000;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b000100: begin // subi
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = 1'b0;
				twoComplement = 1'b1;
				regAlu = 1'b1;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'b0000;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b000101: begin // li
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = 1'b0;
				twoComplement = 1'b1;
				regAlu = 1'b1;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'b0001;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b000110: begin // lui
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = 1'b1;
				twoComplement = 1'b1;
				regAlu = 1'b1;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'b0001;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b000111: begin // beq
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b1;
				regAlu = 1'b0;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b10;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001000: begin // bnq
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b1;
				regAlu = 1'b0;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b10;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001001: begin // in
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = switchSide;
				twoComplement = 1'b1;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~button_in};
				outputControl = 2'b01;
				resultDest = 4'b0011;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001010: begin // out
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~button_out};
				outputControl = 2'b10;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001011: begin // j
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b01;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001100: begin // jal
				regDest = 3'b010;
				regWrite = 1'b1;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b01;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'b0100;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001101: begin // ju
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b10;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b001110: begin // jual
				regDest = 3'b010;
				regWrite = 1'b1;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b10;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'b0100;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end

			6'b001111: begin // push
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b01;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end

			6'b010000: begin // pop
				regDest = 3'b000;
				regWrite = 1'b1;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'b0101;
			   stackOp = 2'b10;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b010001: begin // send
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~send_flag};
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
			end
			
			6'b010010: begin // receive (recv)
				regDest = 3'b000;
				regWrite = recv_flag;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~recv_flag};
				outputControl = 2'b00;
				resultDest = 4'b1000;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
			end
			
			6'b111111: begin // halt
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'bxx;
				PCDest = 2'b01;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b100001: begin // upbios
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b01;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b100010: begin // upmem
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b10;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b100011: begin // hdtoinst
				regDest = 3'b001;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~hd_ready};
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = hd_ready;
				instWrite = hd_ready;
				lcdWrite = 2'b00;
				 
			end
			
			6'b100100: begin // hdtoreg
				regDest = 3'b001;
				regWrite = hd_ready;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~hd_ready};
				outputControl = 2'b00;
				resultDest = 4'b0110;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = hd_ready;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b100101: begin // regtohd
				regDest = 3'b001;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = {1'b0,~hd_ready};
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = hd_ready;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b100110: begin // lcdclean
				regDest = 3'b000;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b10;
				 
			end
			
			6'b100111: begin // lcdwrite
				regDest = 3'b000;
				regWrite = 1'b0;
				extSide = 1'b0;
				twoComplement = 1'b0;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b01;
				 
			end
			
			6'b101000: begin // jalos
				regDest = 3'b011;
				regWrite = 1'b1;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b01;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'b0100;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b101001: begin // preemp
				regDest = 3'b100;
				regWrite = 1'b1;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b01;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'b0111;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b101010: begin // intr_on
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b101011: begin // intr_off
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b00;
				PCDest = 2'b00;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b101100: begin // return
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b01;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			6'b101101: begin // syscall
				regDest = 3'b100;
				regWrite = 1'b1;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'b01;
				PCDest = 2'b11;
				outputControl = 2'b00;
				resultDest = 4'b0100;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
				 
			end
			
			default: begin // ~halt
				regDest = 3'bxxx;
				regWrite = 1'b0;
				extSide = 1'bx;
				twoComplement = 1'bx;
				regAlu = 1'bx;
				memWrite = 1'b0;
				memRead = 1'b0;
				jumpOp = 2'bxx;
				PCDest = 2'b01;
				outputControl = 2'b00;
				resultDest = 4'bxxxx;
			   stackOp = 2'b00;
				owner = 2'b00;
				hdWrite = 1'b0;
				hdRead = 1'b0;
				instWrite = 1'b0;
				lcdWrite = 2'b00;
			end
		endcase
		
		/*if (reset == 1'b1) begin
			owner = 1'b0; //reset system
		end*/
		
	end
endmodule
