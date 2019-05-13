module lcd(CLOCK_50,LCD_ON,LCD_BLON,LCD_RW,LCD_EN,LCD_RS,LCD_DATA,position,word);

	input CLOCK_50;    		//50 MHz clock
	//input [3:0] KEY,      	//Pushbutton[3:0]
	//input [17:0] SW,    		//Toggle Switch[17:0]
	//    LCD Module 16X2
	output LCD_ON;    // LCD Power ON/OFF
	output LCD_BLON;    // LCD Back Light ON/OFF
	output LCD_RW;    // LCD Read/Write Select, 0 = Write, 1 = Read
	output LCD_EN;    // LCD Enable
	output LCD_RS;    // LCD Command/Data Select, 0 = Command, 1 = Data
	inout [7:0] LCD_DATA;    // LCD Data bus 8 bits
	
	output [4:0] position;
	input [7:0] word;
	//input [5:0] opcode;


	//wire [3:0] KEY;
	//assign KEY = 4'b0000;

	//wire [6:0] myclock;
	//wire RST;
	//assign RST = KEY[0];

	// reset delay gives some time for peripherals to initialize
	wire DLY_RST;
	Reset_Delay r0(.iCLK(CLOCK_50),.oRESET(DLY_RST));

	// Send switches to red leds 
	//assign LEDR = SW;

	// turn LCD ON
	assign LCD_ON    =  1'b1;
	assign LCD_BLON  =  1'b1;
	
	

	
//lcd_control lcdcontrol(opcode,flag);

LCD_Display u1(
	// Host Side
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
	.position(position),
	.word(word),
	// LCD Side
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
);


endmodule
