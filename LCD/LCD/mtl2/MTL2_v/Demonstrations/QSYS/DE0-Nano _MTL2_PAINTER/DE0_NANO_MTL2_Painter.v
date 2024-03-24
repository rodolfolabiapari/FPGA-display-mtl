
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE0_NANO_MTL2_Painter(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,

	//////////// LED //////////
	output		     [7:0]		LED,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// SW //////////
	input 		     [3:0]		SW,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		     [1:0]		DRAM_DQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_WE_N,

	//////////// EPCS //////////
	output		          		EPCS_ASDO,
	input 		          		EPCS_DATA0,
	output		          		EPCS_DCLK,
	output		          		EPCS_NCSO,

	//////////// Accelerometer and EEPROM //////////
	output		          		G_SENSOR_CS_N,
	input 		          		G_SENSOR_INT,
	output		          		I2C_SCLK,
	inout 		          		I2C_SDAT,

	//////////// ADC //////////
	output		          		ADC_CS_N,
	output		          		ADC_SADDR,
	output		          		ADC_SCLK,
	input 		          		ADC_SDAT,

	//////////// 2x13 GPIO Header //////////
	inout 		    [12:0]		GPIO_2,
	input 		     [2:0]		GPIO_2_IN,

	//////////// GPIO_0, GPIO_0 connect to MTL2 - Multi-Touch LCD Panel //////////
	output		     [7:0]		MTL_B,
	output		          		MTL_DCLK,
	output		     [7:0]		MTL_G,
	output		          		MTL_HSD,
	output		     [7:0]		MTL_R,
	output		          		MTL_TOUCH_I2C_SCL,
	inout 		          		MTL_TOUCH_I2C_SDA,
	input 		          		MTL_TOUCH_INT_n,
	output		          		MTL_VSD
);



//=======================================================
//  REG/WIRE declarations
//=======================================================




//=======================================================
//  Structural coding
//=======================================================



wire video_hs;
wire video_vs;
wire video_clk;
wire [7:0]	video_r;
wire [7:0]	video_g;
wire [7:0]	video_b;

vga_pll pll_inst(
		.areset(1'b0),
		.inclk0( CLOCK_50),   //  refclk.clk
		.c0(video_clk),  // outclk0.clk
		.locked()
	);
	


 MTL2 u0(
		.reset_n(1'b1),                                  //               clk_50_clk_in_reset.reset_n
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
		
		.out_port_from_the_led(LED),                    //           led_external_connection.export
		.in_port_to_the_sw(SW),                        //            sw_external_connection.export
		.in_port_to_the_key(KEY),                       //           key_external_connection.export
		
		.lcd_touch_int_external_connection_export(MTL_TOUCH_INT_n), // lcd_touch_int_external_connection.export
	   .i2c_opencores_0_export_scl_pad_io(MTL_TOUCH_I2C_SCL),        //            i2c_opencores_0_export.scl_pad_io
		.i2c_opencores_0_export_sda_pad_io(MTL_TOUCH_I2C_SDA)         //                                  .sda_pad_io
		
		
	);
	
	
	
// vga
assign {VGA_R, VGA_G, VGA_B} = {video_r, video_g, video_b};
assign VGA_BLANK_N = 1'b1;
assign VGA_SYNC_N = 1'b0;
assign VGA_HS = ~video_hs;
assign VGA_VS = ~video_vs;
assign VGA_CLK = video_clk;


// MTL - display
assign {MTL_R,MTL_G,MTL_B} = {video_r, video_g, video_b};
assign MTL_DCLK = video_clk;
assign MTL_HSD = ~video_hs;
assign MTL_VSD = ~video_vs;





endmodule