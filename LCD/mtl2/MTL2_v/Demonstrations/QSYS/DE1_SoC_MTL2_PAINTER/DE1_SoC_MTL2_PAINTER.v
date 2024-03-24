// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
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
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Thu Jul 11 11:26:45 2013
// ============================================================================

//`define ENABLE_HPS
//`define ENABLE_USB

module DE1_SoC_MTL2_PAINTER(

      ///////// ADC /////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM /////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO /////////
      inout     [35:0]   GPIO_0,
		
		///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      input              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY /////////
      input       [3:0]  KEY,

      ///////// LEDR /////////
      output      [9:0]  LEDR,

      ///////// PS2 /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW /////////
      input       [9:0]  SW,

      ///////// TD /////////
      input              TD_CLK27,
      input      [7:0]   TD_DATA,
      input              TD_HS,
      output             TD_RESET_N,
      input              TD_VS,

`ifdef ENABLE_USB
      ///////// USB /////////
      input              USB_B2_CLK,
      inout       [7:0]  USB_B2_DATA,
      output             USB_EMPTY,
      output             USB_FULL,
      input              USB_OE_N,
      input              USB_RD_N,
      input              USB_RESET_N,
      inout              USB_SCL,
      inout              USB_SDA,
      input              USB_WR_N,
`endif /*ENABLE_USB*/

      ///////// VGA /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS,

//////////// GPIO, GPIO1 connect to MTL2 - Multi-Touch LCD Panel //////////		
		output		[7:0]  MTL2_B,
      output		       MTL2_DCLK,
      output		[7:0]  MTL2_G,
      output		       MTL2_HSD,
      output		[7:0]  MTL2_R,
      output		       MTL2_TOUCH_I2C_SCL,
      inout 		       MTL2_TOUCH_I2C_SDA,
      input 		       MTL2_TOUCH_INT_n,
      output		       MTL2_VSD

);


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire video_hs;
wire video_vs;
wire video_clk;
wire [7:0]	video_r;
wire [7:0]	video_g;
wire [7:0]	video_b;

vga_pll pll_inst(
		.refclk( CLOCK2_50),   //  refclk.clk
		.rst(1'b0),      //   reset.reset
		.outclk_0(video_clk)  // outclk0.clk
	);

 MTL2 u0(
		.reset_n(KEY[1]),                                  //               clk_50_clk_in_reset.reset_n
		.clk_50(CLOCK_50),                                   //                     clk_50_clk_in.clk
		.pll_sdram_clk(DRAM_CLK),                             //                         pll_sdram.clk
		
		.zs_addr_from_the_sdram(DRAM_ADDR),                   //                        sdram_wire.addr
		.zs_ba_from_the_sdram(DRAM_BA),                     //                                  .ba
		.zs_cas_n_from_the_sdram(DRAM_CAS_N),                  //                                  .cas_n
		.zs_cke_from_the_sdram(DRAM_CKE),                    //                                  .cke
		.zs_cs_n_from_the_sdram(DRAM_CS_N),                   //                                  .cs_n
		.zs_dq_to_and_from_the_sdram(DRAM_DQ),              //                                  .dq
		.zs_dqm_from_the_sdram({DRAM_UDQM,DRAM_LDQM}),                    //                                  .dqm
		.zs_ras_n_from_the_sdram(DRAM_RAS_N),                  //                                  .ras_n
		.zs_we_n_from_the_sdram(DRAM_WE_N),                   //                                  .we_n
		
		.vid_clk_to_the_alt_vip_itc_0(video_clk),             //       alt_vip_itc_0_clocked_video.vid_clk
		.vid_data_from_the_alt_vip_itc_0({video_r, video_g, video_b}),          //                                  .vid_data
		.underflow_from_the_alt_vip_itc_0(),         //                                  .underflow
		.vid_datavalid_from_the_alt_vip_itc_0(),     //                                  .vid_datavalid
		.vid_v_sync_from_the_alt_vip_itc_0(video_vs),        //                                  .vid_v_sync
		.vid_h_sync_from_the_alt_vip_itc_0(video_hs),        //                                  .vid_h_sync
		.vid_f_from_the_alt_vip_itc_0(),             //                                  .vid_f
		.vid_h_from_the_alt_vip_itc_0(),             //                                  .vid_h
		.vid_v_from_the_alt_vip_itc_0(),             //                                  .vid_v
		
		.out_port_from_the_led(LEDR),                    //           led_external_connection.export
		.in_port_to_the_sw(SW),                        //            sw_external_connection.export
		.in_port_to_the_key(KEY),                       //           key_external_connection.export
		
		.lcd_touch_int_external_connection_export(MTL2_TOUCH_INT_n), // lcd_touch_int_external_connection.export
	   .i2c_opencores_0_export_scl_pad_io(MTL2_TOUCH_I2C_SCL),        //            i2c_opencores_0_export.scl_pad_io
		.i2c_opencores_0_export_sda_pad_io(MTL2_TOUCH_I2C_SDA)         //                                  .sda_pad_io
		
		
	);
	
	
	
// vga
assign {VGA_R, VGA_G, VGA_B} = {video_r, video_g, video_b};
assign VGA_BLANK_N = 1'b1;
assign VGA_SYNC_N = 1'b0;
assign VGA_HS = ~video_hs;
assign VGA_VS = ~video_vs;
assign VGA_CLK = video_clk;


// MTL - display
assign {MTL2_R,MTL2_G,MTL2_B} = {video_r, video_g, video_b};
assign MTL2_DCLK = video_clk;
assign MTL2_HSD = ~video_hs;
assign MTL2_VSD = ~video_vs;






endmodule
