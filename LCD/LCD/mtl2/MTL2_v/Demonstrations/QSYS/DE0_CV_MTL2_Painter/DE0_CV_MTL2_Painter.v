
module DE0_CV_MTL2_Painter(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,

	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// KEY //////////
	input 		     [3:0]		KEY,
	input 		          		RESET_N,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// microSD Card //////////
	output		          		SD_CLK,
	output		          		SD_CMD,
	inout 		     [3:0]		SD_DATA,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// UART //////////
	input 		          		UART_RX,
	output		          		UART_TX,

	//////////// VGA //////////
	output		     [7:0]		VGA_B,
	output		          		VGA_BLANK_N,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,

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

//VGA _PLL
vga_pll pll_inst(
		.areset(1'b0),
		.inclk0( CLOCK2_50 ),   //  refclk.clk
		.c0(video_clk),         //  outclk0.clk
		.locked()
	);	
	
//VGA
assign {VGA_R[7:0], VGA_G[7:0], VGA_B[7:0]} = {video_r[7:0], video_g[7:0], video_b[7:0]};
assign VGA_BLANK_N = 1'b1;
assign VGA_SYNC_N  = 1'b0;
assign VGA_HS      = ~video_hs;
assign VGA_VS      = ~video_vs;
assign VGA_CLK     = ~video_clk;


//MTL - display
assign {MTL_R[7:0],MTL_G[7:0],MTL_B[7:0]} = {video_r[7:0], video_g[7:0], video_b[7:0]};
assign MTL_DCLK = video_clk;
assign MTL_HSD = ~video_hs;
assign MTL_VSD = ~video_vs;

//SOPC
MTL2 u0(
		.reset_n      (1'b1),                              //                   clk_50_clk_in_reset.reset_n
		.clk_50       (CLOCK_50),                         	//                   clk_50_clk_in.clk
		.pll_sdram_clk(DRAM_CLK),                       	//                   pll_sdram.clk
		
		.zs_addr_from_the_sdram     (DRAM_ADDR[12:0]),             //                        sdram_wire.addr
		.zs_ba_from_the_sdram       (DRAM_BA[1:0]),                //                                  .ba
		.zs_cas_n_from_the_sdram    (DRAM_CAS_N),                  //                                  .cas_n
		.zs_cke_from_the_sdram      (DRAM_CKE),                    //                                  .cke
		.zs_cs_n_from_the_sdram     (DRAM_CS_N),                   //                                  .cs_n
		.zs_dq_to_and_from_the_sdram(DRAM_DQ[15:0]),               //                                  .dq
		.zs_dqm_from_the_sdram      ({DRAM_UDQM,DRAM_LDQM}),       //                                  .dqm
		.zs_ras_n_from_the_sdram    (DRAM_RAS_N),                  //                                  .ras_n
		.zs_we_n_from_the_sdram     (DRAM_WE_N),                   //                                  .we_n
		
		
		.vid_clk_to_the_alt_vip_itc_0(video_clk),                   // alt_vip_itc_0_clocked_video.vid_clk
		.vid_data_from_the_alt_vip_itc_0({video_r[7:0], video_g[7:0], video_b[7:0]}), //.vid_data
		.underflow_from_the_alt_vip_itc_0(),         											//.underflow
		.vid_datavalid_from_the_alt_vip_itc_0(),     											//.vid_datavalid
		.vid_v_sync_from_the_alt_vip_itc_0(video_vs),        //.vid_v_sync
		.vid_h_sync_from_the_alt_vip_itc_0(video_hs),        //.vid_h_sync
		.vid_f_from_the_alt_vip_itc_0(),             //                                  .vid_f
		.vid_h_from_the_alt_vip_itc_0(),             //                                  .vid_h
		.vid_v_from_the_alt_vip_itc_0(),             //                                  .vid_v
		
		.out_port_from_the_led(LEDR[9:0]),                      //           led_external_connection.export
		.in_port_to_the_sw    (SW[9:0]),                        //           sw_external_connection.export
		.in_port_to_the_key   (KEY[3:0]),                       //           key_external_connection.export
		
		.lcd_touch_int_external_connection_export(MTL_TOUCH_INT_n), // lcd_touch_int_external_connection.export
	   .i2c_opencores_0_export_scl_pad_io(MTL_TOUCH_I2C_SCL),      // i2c_opencores_0_export.scl_pad_io
		.i2c_opencores_0_export_sda_pad_io(MTL_TOUCH_I2C_SDA)       // .sda_pad_io
				
	);
	

endmodule
