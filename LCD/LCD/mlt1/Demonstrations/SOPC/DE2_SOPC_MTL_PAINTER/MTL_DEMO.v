// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
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
module MTL_DEMO(

	//////////// CLOCK //////////
	CLOCK_27,
	CLOCK_50,

	//////////// Sma //////////
	EXT_CLOCK,

	//////////// LED //////////
	LEDG,
	LEDR,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SEG7 //////////
	HEX0_D,
	HEX1_D,
	HEX2_D,
	HEX3_D,
	HEX4_D,
	HEX5_D,
	HEX6_D,
	HEX7_D,

	//////////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////////// RS232 //////////
	UART_RXD,
	UART_TXD,

	//////////// PS2 //////////
	PS2_CLK,
	PS2_DAT,

	//////////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_DAT3,

	//////////// VGA //////////
	VGA_B,
	VGA_BLANK,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC,
	VGA_VS,

	//////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////////// I2C for Audioand Tv-Decode //////////
	I2C_SCLK,
	I2C_SDAT,

	//////////// Ethernet //////////
	ENET_CLK,
	ENET_CMD,
	ENET_CS_N,
	ENET_DATA,
	ENET_INT,
	ENET_RD_N,
	ENET_RST_N,
	ENET_WR_N,

	//////////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET,
	TD_VS,

	//////////// USB OTG //////////
	OTG_ADDR,
	OTG_CS_N,
	OTG_DACK_N,
	OTG_DATA,
	OTG_DREQ,
	OTG_FSPEED,
	OTG_INT,
	OTG_LSPEED,
	OTG_RD_N,
	OTG_RST_N,
	OTG_WR_N,

	//////////// IR //////////
	IRDA_RXD,
	IRDA_TXD,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_LDQM,
	DRAM_RAS_N,
	DRAM_UDQM,
	DRAM_WE_N,

	//////////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////////// Flash //////////
	FL_ADDR,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_WE_N,
	FL_CE_N,
	

	//////////// GPIO_0, GPIO_0 connect to MTL - Multi-Touch Panel //////////
	MTL_B,
	MTL_DCLK,
	MTL_G,
	MTL_HSD,
	MTL_R,
	MTL_TOUCH_I2C_SCL,
	MTL_TOUCH_I2C_SDA,
	MTL_TOUCH_INT_n,
	MTL_VSD 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_27;
input 		          		CLOCK_50;

//////////// Sma //////////
input 		          		EXT_CLOCK;

//////////// LED //////////
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
input 		     [3:0]		KEY;

//////////// SW //////////
input 		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0_D;
output		     [6:0]		HEX1_D;
output		     [6:0]		HEX2_D;
output		     [6:0]		HEX3_D;
output		     [6:0]		HEX4_D;
output		     [6:0]		HEX5_D;
output		     [6:0]		HEX6_D;
output		     [6:0]		HEX7_D;

//////////// LCD //////////
output		          		LCD_BLON;
inout 		     [7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// RS232 //////////
input 		          		UART_RXD;
output		          		UART_TXD;

//////////// PS2 //////////
inout 		          		PS2_CLK;
inout 		          		PS2_DAT;

//////////// SDCARD //////////
output		          		SD_CLK;
inout 		          		SD_CMD;
inout 		          		SD_DAT;
inout 		          		SD_DAT3;

//////////// VGA //////////
output		     [9:0]		VGA_B;
output		          		VGA_BLANK;
output		          		VGA_CLK;
output		     [9:0]		VGA_G;
output		          		VGA_HS;
output		     [9:0]		VGA_R;
output		          		VGA_SYNC;
output		          		VGA_VS;

//////////// Audio //////////
input 		          		AUD_ADCDAT;
inout 		          		AUD_ADCLRCK;
inout 		          		AUD_BCLK;
output		          		AUD_DACDAT;
inout 		          		AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for Audioand Tv-Decode //////////
output		          		I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// Ethernet //////////
output		          		ENET_CLK;
output		          		ENET_CMD;
output		          		ENET_CS_N;
inout 		    [15:0]		ENET_DATA;
input 		          		ENET_INT;
output		          		ENET_RD_N;
output		          		ENET_RST_N;
output		          		ENET_WR_N;

//////////// TV Decoder //////////
input 		          		TD_CLK27;
input 		     [7:0]		TD_DATA;
input 		          		TD_HS;
output		          		TD_RESET;
input 		          		TD_VS;

//////////// USB OTG //////////
output		     [1:0]		OTG_ADDR;
output		          		OTG_CS_N;
output		     [1:0]		OTG_DACK_N;
inout 		    [15:0]		OTG_DATA;
input 		     [1:0]		OTG_DREQ;
inout 		          		OTG_FSPEED;
input 		     [1:0]		OTG_INT;
inout 		          		OTG_LSPEED;
output		          		OTG_RD_N;
output		          		OTG_RST_N;
output		          		OTG_WR_N;

//////////// IR //////////
input 		          		IRDA_RXD;
output		          		IRDA_TXD;

//////////// SDRAM //////////
output		    [11:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [15:0]		DRAM_DQ;
output		          		DRAM_LDQM;
output		          		DRAM_RAS_N;
output		          		DRAM_UDQM;
output		          		DRAM_WE_N;

//////////// SRAM //////////
output		    [17:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout 		    [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;

//////////// Flash //////////
output		    [21:0]		FL_ADDR;
inout 		     [7:0]		FL_DQ;
output		          		FL_OE_N;
output		          		FL_RST_N;
output		          		FL_WE_N;
output							FL_CE_N;


//////////// GPIO_0, GPIO_0 connect to MTL - Multi-Touch Panel //////////
output		     [7:0]		MTL_B;
output		          		MTL_DCLK;
output		     [7:0]		MTL_G;
output		          		MTL_HSD;
output		     [7:0]		MTL_R;
output		          		MTL_TOUCH_I2C_SCL;
inout 		          		MTL_TOUCH_I2C_SDA;
input 		          		MTL_TOUCH_INT_n;
output		          		MTL_VSD;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire reset_n;
wire video_hs;
wire video_vs;
wire video_clk;
wire [7:0]	video_r;
wire [7:0]	video_g;
wire [7:0]	video_b;


//=======================================================
//  Structural coding
//=======================================================

vga_pll vga_pll_inst(
	.areset(1'b0),
	.inclk0(CLOCK_27),
	.c0(video_clk),
	.locked(reset_n));

	
MTL_SOPC MTL_SOPC_inst(
                  // 1) global signals:
                   .altpll_io(),
                   .altpll_sdram(DRAM_CLK),
                   .altpll_sys(),
                   .altpll_touch(),
                   .clk_50(CLOCK_50),
                   .reset_n(reset_n),
						 

                  // the_sw
                   .in_port_to_the_sw(SW),

                  // the_lcd
                   .LCD_E_from_the_lcd(LCD_EN),
                   .LCD_RS_from_the_lcd(LCD_RS),
                   .LCD_RW_from_the_lcd(LCD_RW),
                   .LCD_data_to_and_from_the_lcd(LCD_DATA),
						 

                  // the_alt_vip_itc_0
                   .underflow_from_the_alt_vip_itc_0(),
                   .vid_clk_to_the_alt_vip_itc_0(video_clk),
                   .vid_data_from_the_alt_vip_itc_0({video_r, video_g, video_b}),
                   .vid_datavalid_from_the_alt_vip_itc_0(),
                   .vid_f_from_the_alt_vip_itc_0(),
                   .vid_h_from_the_alt_vip_itc_0(),
                   .vid_h_sync_from_the_alt_vip_itc_0(video_hs),
                   .vid_v_from_the_alt_vip_itc_0(),
                   .vid_v_sync_from_the_alt_vip_itc_0(video_vs),

                  // the_altpll_0
                   .locked_from_the_altpll_0(),
                   .phasedone_from_the_altpll_0(),

                  // the_key
                   .in_port_to_the_key(KEY),

                  // the_led
                   .out_port_from_the_led({LEDR, LEDG}),

                  // the_multi_touch
                   .TOUCH_I2C_SCL_from_the_multi_touch(MTL_TOUCH_I2C_SCL),
                   .TOUCH_I2C_SDA_to_and_from_the_multi_touch(MTL_TOUCH_I2C_SDA),
                   .TOUCH_INT_n_to_the_multi_touch(MTL_TOUCH_INT_n),
						 
					 

                  // the_sdram
                       .zs_addr_from_the_sdram(DRAM_ADDR),
                       .zs_ba_from_the_sdram(DRAM_BA),
                       .zs_cas_n_from_the_sdram(DRAM_CAS_N),
                       .zs_cke_from_the_sdram(DRAM_CKE),
                       .zs_cs_n_from_the_sdram(DRAM_CS_N),
                       .zs_dq_to_and_from_the_sdram(DRAM_DQ),
                       .zs_dqm_from_the_sdram({DRAM_UDQM, DRAM_LDQM}),
                       .zs_ras_n_from_the_sdram(DRAM_RAS_N),
                       .zs_we_n_from_the_sdram(DRAM_WE_N),
							  
							  
                  // the_sram
                   .SRAM_ADDR_from_the_sram(SRAM_ADDR),
                   .SRAM_CE_n_from_the_sram(SRAM_CE_N),
                   .SRAM_DQ_to_and_from_the_sram(SRAM_DQ),
                   .SRAM_LB_n_from_the_sram(SRAM_LB_N),
                   .SRAM_OE_n_from_the_sram(SRAM_OE_N),
                   .SRAM_UB_n_from_the_sram(SRAM_UB_N),
                   .SRAM_WE_n_from_the_sram(SRAM_WE_N),
						 
                  // the_tri_state_bridge_flash_avalon_slave
                   .address_to_the_cfi_flash(FL_ADDR),
                   .data_to_and_from_the_cfi_flash(FL_DQ),
                   .read_n_to_the_cfi_flash(FL_OE_N),
                   .select_n_to_the_cfi_flash(FL_CE_N),
                   .write_n_to_the_cfi_flash(FL_WE_N)						 

							  
                );

// MTL - display
assign {MTL_R,MTL_G,MTL_B} = {video_r, video_g, video_b};
assign MTL_DCLK = video_clk;
assign MTL_HSD = ~video_hs;
assign MTL_VSD = ~video_vs;					 
	
// flash
assign FL_RST_N = reset_n;

// LCD
assign LCD_BLON = 1'b1;
assign LCD_ON = 1'b1;

//TV
assign TD_RESET = 1'b1;

endmodule
