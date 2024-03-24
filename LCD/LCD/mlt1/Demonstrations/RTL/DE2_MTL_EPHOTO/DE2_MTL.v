// --------------------------------------------------------------------
// Copyright (c) 2011 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE2_MTL Picture Viewer 
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Vic chang         :| 08/22/11  :| Initial Revision
// --------------------------------------------------------------------

module DE2_MTL
	(
		////////////////////	Clock Input	 	////////////////////	 
		OSC_27,							//	27 MHz
		OSC_50,							//	50 MHz
		EXT_CLOCK,					//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							  //	Button[3:0]
		////////////////////	DPDT Switch		////////////////////
		DPDT_SW,						//	DPDT Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							  //	Seven Segment Digital 0
		HEX1,							  //	Seven Segment Digital 1
		HEX2,							  //	Seven Segment Digital 2
		HEX3,							  //	Seven Segment Digital 3
		HEX4,							  //	Seven Segment Digital 4
		HEX5,							  //	Seven Segment Digital 5
		HEX6,							  //	Seven Segment Digital 6
		HEX7,							  //	Seven Segment Digital 7
		////////////////////////	LED		////////////////////////
		LED_GREEN,					//	LED Green[8:0]
		LED_RED,						//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		UART_TXD,						//	UART Transmitter
		UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		IRDA_TXD,						//	IRDA Transmitter
		IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,					//	SDRAM Address bus 12 Bits
		DRAM_LDQM,					//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,					//	SDRAM High-byte Data Mask
		DRAM_WE_N,					//	SDRAM Write Enable
		DRAM_CAS_N,					//	SDRAM Column Address Strobe
		DRAM_RAS_N,					//	SDRAM Row Address Strobe
		DRAM_CS_N,					//	SDRAM Chip Select
		DRAM_BA_0,					//	SDRAM Bank Address 0
		DRAM_BA_1,					//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,					//	SRAM Adress bus 18 Bits
		SRAM_UB_N,					//	SRAM High-byte Data Mask 
		SRAM_LB_N,					//	SRAM Low-byte Data Mask 
		SRAM_WE_N,					//	SRAM Write Enable
		SRAM_CE_N,					//	SRAM Chip Enable
		SRAM_OE_N,					//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,					//	ISP1362 Reset
		OTG_FSPEED,					//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,					//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,					//	ISP1362 DMA Request 0
		OTG_DREQ1,					//	ISP1362 DMA Request 1
		OTG_DACK0_N,				//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,				//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		SD_DAT,							//	SD Card Data
		SD_DAT3,						//	SD Card Data 3
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	    TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   					//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,					//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,					//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,					//	DM9000A Chip Select
		ENET_WR_N,					//	DM9000A Write
		ENET_RD_N,					//	DM9000A Read
		ENET_RST_N,					//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,				//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,					//	Audio CODEC ADC Data
		AUD_DACLRCK,				//	Audio CODEC DAC LR Clock
		AUD_DACDAT,					//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    				//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		TD_CLK,							//	TV Decoder Line Locked Clock
	  //////////// GPIO_0, GPIO connect to MTL - Multi-Touch Panel //////////
	  B,
	  DCLK,
	  G,
	  HSD,
	  I2CSCL,
	  I2CSDA,
	  INT_n,
	  R,
	  VSD
);

//=======================================================
//  PORT declarations
//=======================================================
////////////////////////	Clock Input	 	////////////////////////
input			    OSC_27;			
input			    OSC_50;			
input			    EXT_CLOCK;	
////////////////////////	Push Button		////////////////////////
input 	[3:0]	KEY;		
////////////////////////	DPDT Switch		////////////////////////
input	 [17:0]	DPDT_SW; 
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;	
output	[6:0]	HEX1;	
output	[6:0]	HEX2;	
output	[6:0]	HEX3;	
output	[6:0]	HEX4;	
output	[6:0]	HEX5;	
output	[6:0]	HEX6;	
output	[6:0]	HEX7;	
////////////////////////////	LED		////////////////////////////
output	[8:0]	LED_GREEN; 
output [17:0] LED_RED;   
////////////////////////////	UART	////////////////////////////
output			  UART_TXD;	
input			    UART_RXD;	
////////////////////////////	IRDA	////////////////////////////
output			  IRDA_TXD;	
input			    IRDA_RXD;	
///////////////////////		SDRAM Interface	////////////////////////
inout	 [15:0]	DRAM_DQ;		
output [11:0]	DRAM_ADDR;	
output			  DRAM_LDQM;	
output			  DRAM_UDQM;	
output			  DRAM_WE_N;	
output			  DRAM_CAS_N;	
output			  DRAM_RAS_N;	
output			  DRAM_CS_N;	
output			  DRAM_BA_0;	
output			  DRAM_BA_1;	
output			  DRAM_CLK;		
output			  DRAM_CKE;		
////////////////////////	Flash Interface	////////////////////////
inout	 [7:0]	FL_DQ;			
output [21:0]	FL_ADDR;		
output	   		FL_WE_N;		
output			  FL_RST_N;		
output			  FL_OE_N;		
output			  FL_CE_N;		
////////////////////////	SRAM Interface	////////////////////////
inout	 [15:0]	SRAM_DQ;		
output [17:0]	SRAM_ADDR;	
output			  SRAM_UB_N;	
output			  SRAM_LB_N;	
output			  SRAM_WE_N;	
output			  SRAM_CE_N;	
output			  SRAM_OE_N;	
////////////////////	ISP1362 Interface	////////////////////////
inout	 [15:0]	OTG_DATA;		
output	[1:0]	OTG_ADDR;		
output			  OTG_CS_N;		
output			  OTG_RD_N;		
output			  OTG_WR_N;		
output			  OTG_RST_N;	
output			  OTG_FSPEED;	
output			  OTG_LSPEED;	
input			    OTG_INT0;		
input			    OTG_INT1;		
input			    OTG_DREQ0;	
input			    OTG_DREQ1;	
output			  OTG_DACK0_N;
output			  OTG_DACK1_N;
////////////////////	LCD Module 16X2	////////////////////////////
inout	  [7:0]	LCD_DATA;	
output 			  LCD_ON;		
output 			  LCD_BLON;	
output 			  LCD_RW;		
output 			  LCD_EN;		
output 			  LCD_RS;		
////////////////////	SD Card Interface	////////////////////////
inout			    SD_DAT;		
inout			    SD_DAT3;	
inout			    SD_CMD;		
output			  SD_CLK;		
////////////////////////	I2C		////////////////////////////////
inout			    I2C_SDAT;		
output			  I2C_SCLK;		
////////////////////////	PS2		////////////////////////////////
input		 	    PS2_DAT;	
input			    PS2_CLK;	
////////////////////	USB JTAG link	////////////////////////////
input  			  TDI;		
input  			  TCK;		
input  			  TCS;		
output 			  TDO;		
////////////////////////	VGA			////////////////////////////
output			  VGA_CLK;   
output			  VGA_HS;			
output			  VGA_VS;			
output			  VGA_BLANK;	
output			  VGA_SYNC;		
output	[9:0]	VGA_R;   		
output	[9:0]	VGA_G;	 		
output	[9:0]	VGA_B;   		
////////////////	Ethernet Interface	////////////////////////////
inout	 [15:0]	ENET_DATA;	
output			  ENET_CMD;		
output			  ENET_CS_N;	
output			  ENET_WR_N;	
output			  ENET_RD_N;	
output			  ENET_RST_N;	
input			    ENET_INT;		
output			  ENET_CLK;		
////////////////////	Audio CODEC		////////////////////////////
inout			    AUD_ADCLRCK;	
input			    AUD_ADCDAT;		
inout			    AUD_DACLRCK;	
output			  AUD_DACDAT;		
inout			    AUD_BCLK;			
output			  AUD_XCK;			
////////////////////	TV Devoder		////////////////////////////
input	  [7:0]	TD_DATA;    	
input			    TD_HS;				
input			    TD_VS;				
output			  TD_RESET;			
input			    TD_CLK;				
//////////// GPIO_1, GPIO connect to MTL - Multi-Touch Panel //////////
output	[7:0]	B;
output	     	DCLK;
output	[7:0]	G;
output	     	HSD;
output	     	I2CSCL;
inout 	     	I2CSDA;
input 	     	INT_n;
output	[7:0]	R;
output	     	VSD;


picture_controller  u_controller
(
	//Clock Input
	.OSC_27(OSC_27),			
	.OSC_50(OSC_50),		
	//Push Button	
	.KEY(KEY),
	//SDRAM Interface
	.DRAM_DQ(DRAM_DQ),		
	.DRAM_ADDR(DRAM_ADDR),	
	.DRAM_DQM({DRAM_UDQM,DRAM_LDQM}),		
	.DRAM_WE_N(DRAM_WE_N),	
	.DRAM_CAS_N(DRAM_CAS_N),	
	.DRAM_RAS_N(DRAM_RAS_N),	
	.DRAM_CS_N(DRAM_CS_N),	
	.DRAM_BA({DRAM_BA_1,DRAM_BA_0}),	
	.DRAM_CLK(DRAM_CLK),	
	.DRAM_CKE(DRAM_CKE),	
	//Flash Interface
	.FL_DQ(FL_DQ),			
	.FL_ADDR(FL_ADDR),		
	.FL_OE_N(FL_OE_N),		
	.FL_CE_N(FL_CE_N),	
	//VGA
	.VGA_B(B),
	.VGA_CLK(DCLK),
	.VGA_G(G),
	.VGA_HS(HSD),
	.VGA_R(R),
	.VGA_VS(VSD),
	//TOUCH
	.TOUCH_I2CSCL(I2CSCL),
	.TOUCH_I2CSDA(I2CSDA),
	.TOUCH_INT_n(INT_n)
);
 
assign TD_RESET = 1'b1;
// FLASH
assign FL_RST_N = 1'b1;
assign FL_WE_N = 1'b1;

// VGA
assign VGA_BLANK_N = 1'b1;
assign VGA_SYNC_N = 1'b0;

// LCD
assign LCD_BLON = 1'b1;
assign LCD_ON = 1'b1;

endmodule
