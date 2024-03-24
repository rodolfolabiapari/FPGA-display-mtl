
module MTL2 (
	reset_n,
	clk_50,
	zs_addr_from_the_sdram,
	zs_ba_from_the_sdram,
	zs_cas_n_from_the_sdram,
	zs_cke_from_the_sdram,
	zs_cs_n_from_the_sdram,
	zs_dq_to_and_from_the_sdram,
	zs_dqm_from_the_sdram,
	zs_ras_n_from_the_sdram,
	zs_we_n_from_the_sdram,
	vid_clk_to_the_alt_vip_itc_0,
	vid_data_from_the_alt_vip_itc_0,
	underflow_from_the_alt_vip_itc_0,
	vid_datavalid_from_the_alt_vip_itc_0,
	vid_v_sync_from_the_alt_vip_itc_0,
	vid_h_sync_from_the_alt_vip_itc_0,
	vid_f_from_the_alt_vip_itc_0,
	vid_h_from_the_alt_vip_itc_0,
	vid_v_from_the_alt_vip_itc_0,
	out_port_from_the_led,
	in_port_to_the_sw,
	in_port_to_the_key,
	lcd_touch_int_external_connection_export,
	i2c_opencores_0_export_scl_pad_io,
	i2c_opencores_0_export_sda_pad_io,
	pll_sdram_clk);	

	input		reset_n;
	input		clk_50;
	output	[12:0]	zs_addr_from_the_sdram;
	output	[1:0]	zs_ba_from_the_sdram;
	output		zs_cas_n_from_the_sdram;
	output		zs_cke_from_the_sdram;
	output		zs_cs_n_from_the_sdram;
	inout	[15:0]	zs_dq_to_and_from_the_sdram;
	output	[1:0]	zs_dqm_from_the_sdram;
	output		zs_ras_n_from_the_sdram;
	output		zs_we_n_from_the_sdram;
	input		vid_clk_to_the_alt_vip_itc_0;
	output	[23:0]	vid_data_from_the_alt_vip_itc_0;
	output		underflow_from_the_alt_vip_itc_0;
	output		vid_datavalid_from_the_alt_vip_itc_0;
	output		vid_v_sync_from_the_alt_vip_itc_0;
	output		vid_h_sync_from_the_alt_vip_itc_0;
	output		vid_f_from_the_alt_vip_itc_0;
	output		vid_h_from_the_alt_vip_itc_0;
	output		vid_v_from_the_alt_vip_itc_0;
	output	[9:0]	out_port_from_the_led;
	input	[9:0]	in_port_to_the_sw;
	input	[3:0]	in_port_to_the_key;
	input		lcd_touch_int_external_connection_export;
	inout		i2c_opencores_0_export_scl_pad_io;
	inout		i2c_opencores_0_export_sda_pad_io;
	output		pll_sdram_clk;
endmodule
