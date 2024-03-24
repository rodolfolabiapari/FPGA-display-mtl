	component MTL2 is
		port (
			reset_n                                  : in    std_logic                     := 'X';             -- reset_n
			clk_50                                   : in    std_logic                     := 'X';             -- clk
			zs_addr_from_the_sdram                   : out   std_logic_vector(12 downto 0);                    -- addr
			zs_ba_from_the_sdram                     : out   std_logic_vector(1 downto 0);                     -- ba
			zs_cas_n_from_the_sdram                  : out   std_logic;                                        -- cas_n
			zs_cke_from_the_sdram                    : out   std_logic;                                        -- cke
			zs_cs_n_from_the_sdram                   : out   std_logic;                                        -- cs_n
			zs_dq_to_and_from_the_sdram              : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			zs_dqm_from_the_sdram                    : out   std_logic_vector(1 downto 0);                     -- dqm
			zs_ras_n_from_the_sdram                  : out   std_logic;                                        -- ras_n
			zs_we_n_from_the_sdram                   : out   std_logic;                                        -- we_n
			vid_clk_to_the_alt_vip_itc_0             : in    std_logic                     := 'X';             -- vid_clk
			vid_data_from_the_alt_vip_itc_0          : out   std_logic_vector(23 downto 0);                    -- vid_data
			underflow_from_the_alt_vip_itc_0         : out   std_logic;                                        -- underflow
			vid_datavalid_from_the_alt_vip_itc_0     : out   std_logic;                                        -- vid_datavalid
			vid_v_sync_from_the_alt_vip_itc_0        : out   std_logic;                                        -- vid_v_sync
			vid_h_sync_from_the_alt_vip_itc_0        : out   std_logic;                                        -- vid_h_sync
			vid_f_from_the_alt_vip_itc_0             : out   std_logic;                                        -- vid_f
			vid_h_from_the_alt_vip_itc_0             : out   std_logic;                                        -- vid_h
			vid_v_from_the_alt_vip_itc_0             : out   std_logic;                                        -- vid_v
			out_port_from_the_led                    : out   std_logic_vector(9 downto 0);                     -- export
			in_port_to_the_sw                        : in    std_logic_vector(9 downto 0)  := (others => 'X'); -- export
			in_port_to_the_key                       : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			lcd_touch_int_external_connection_export : in    std_logic                     := 'X';             -- export
			i2c_opencores_0_export_scl_pad_io        : inout std_logic                     := 'X';             -- scl_pad_io
			i2c_opencores_0_export_sda_pad_io        : inout std_logic                     := 'X';             -- sda_pad_io
			pll_sdram_clk                            : out   std_logic                                         -- clk
		);
	end component MTL2;

	u0 : component MTL2
		port map (
			reset_n                                  => CONNECTED_TO_reset_n,                                  --               clk_50_clk_in_reset.reset_n
			clk_50                                   => CONNECTED_TO_clk_50,                                   --                     clk_50_clk_in.clk
			zs_addr_from_the_sdram                   => CONNECTED_TO_zs_addr_from_the_sdram,                   --                        sdram_wire.addr
			zs_ba_from_the_sdram                     => CONNECTED_TO_zs_ba_from_the_sdram,                     --                                  .ba
			zs_cas_n_from_the_sdram                  => CONNECTED_TO_zs_cas_n_from_the_sdram,                  --                                  .cas_n
			zs_cke_from_the_sdram                    => CONNECTED_TO_zs_cke_from_the_sdram,                    --                                  .cke
			zs_cs_n_from_the_sdram                   => CONNECTED_TO_zs_cs_n_from_the_sdram,                   --                                  .cs_n
			zs_dq_to_and_from_the_sdram              => CONNECTED_TO_zs_dq_to_and_from_the_sdram,              --                                  .dq
			zs_dqm_from_the_sdram                    => CONNECTED_TO_zs_dqm_from_the_sdram,                    --                                  .dqm
			zs_ras_n_from_the_sdram                  => CONNECTED_TO_zs_ras_n_from_the_sdram,                  --                                  .ras_n
			zs_we_n_from_the_sdram                   => CONNECTED_TO_zs_we_n_from_the_sdram,                   --                                  .we_n
			vid_clk_to_the_alt_vip_itc_0             => CONNECTED_TO_vid_clk_to_the_alt_vip_itc_0,             --       alt_vip_itc_0_clocked_video.vid_clk
			vid_data_from_the_alt_vip_itc_0          => CONNECTED_TO_vid_data_from_the_alt_vip_itc_0,          --                                  .vid_data
			underflow_from_the_alt_vip_itc_0         => CONNECTED_TO_underflow_from_the_alt_vip_itc_0,         --                                  .underflow
			vid_datavalid_from_the_alt_vip_itc_0     => CONNECTED_TO_vid_datavalid_from_the_alt_vip_itc_0,     --                                  .vid_datavalid
			vid_v_sync_from_the_alt_vip_itc_0        => CONNECTED_TO_vid_v_sync_from_the_alt_vip_itc_0,        --                                  .vid_v_sync
			vid_h_sync_from_the_alt_vip_itc_0        => CONNECTED_TO_vid_h_sync_from_the_alt_vip_itc_0,        --                                  .vid_h_sync
			vid_f_from_the_alt_vip_itc_0             => CONNECTED_TO_vid_f_from_the_alt_vip_itc_0,             --                                  .vid_f
			vid_h_from_the_alt_vip_itc_0             => CONNECTED_TO_vid_h_from_the_alt_vip_itc_0,             --                                  .vid_h
			vid_v_from_the_alt_vip_itc_0             => CONNECTED_TO_vid_v_from_the_alt_vip_itc_0,             --                                  .vid_v
			out_port_from_the_led                    => CONNECTED_TO_out_port_from_the_led,                    --           led_external_connection.export
			in_port_to_the_sw                        => CONNECTED_TO_in_port_to_the_sw,                        --            sw_external_connection.export
			in_port_to_the_key                       => CONNECTED_TO_in_port_to_the_key,                       --           key_external_connection.export
			lcd_touch_int_external_connection_export => CONNECTED_TO_lcd_touch_int_external_connection_export, -- lcd_touch_int_external_connection.export
			i2c_opencores_0_export_scl_pad_io        => CONNECTED_TO_i2c_opencores_0_export_scl_pad_io,        --            i2c_opencores_0_export.scl_pad_io
			i2c_opencores_0_export_sda_pad_io        => CONNECTED_TO_i2c_opencores_0_export_sda_pad_io,        --                                  .sda_pad_io
			pll_sdram_clk                            => CONNECTED_TO_pll_sdram_clk                             --                         pll_sdram.clk
		);

