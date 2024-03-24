// alt_vip_itc_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module alt_vip_itc_0 (
		input  wire        is_clk,        //       is_clk_rst.clk
		input  wire        rst,           // is_clk_rst_reset.reset
		input  wire [23:0] is_data,       //              din.data
		input  wire        is_valid,      //                 .valid
		output wire        is_ready,      //                 .ready
		input  wire        is_sop,        //                 .startofpacket
		input  wire        is_eop,        //                 .endofpacket
		input  wire        vid_clk,       //    clocked_video.export
		output wire [23:0] vid_data,      //                 .export
		output wire        underflow,     //                 .export
		output wire        vid_datavalid, //                 .export
		output wire        vid_v_sync,    //                 .export
		output wire        vid_h_sync,    //                 .export
		output wire        vid_f,         //                 .export
		output wire        vid_h,         //                 .export
		output wire        vid_v          //                 .export
	);

	alt_vipitc101_IS2Vid #(
		.NUMBER_OF_COLOUR_PLANES       (3),
		.COLOUR_PLANES_ARE_IN_PARALLEL (1),
		.BPS                           (8),
		.INTERLACED                    (0),
		.H_ACTIVE_PIXELS               (800),
		.V_ACTIVE_LINES                (480),
		.ACCEPT_COLOURS_IN_SEQ         (0),
		.FIFO_DEPTH                    (800),
		.CLOCKS_ARE_SAME               (0),
		.USE_CONTROL                   (0),
		.NO_OF_MODES                   (1),
		.THRESHOLD                     (799),
		.STD_WIDTH                     (1),
		.GENERATE_SYNC                 (0),
		.USE_EMBEDDED_SYNCS            (0),
		.AP_LINE                       (0),
		.V_BLANK                       (0),
		.H_BLANK                       (0),
		.H_SYNC_LENGTH                 (30),
		.H_FRONT_PORCH                 (210),
		.H_BACK_PORCH                  (16),
		.V_SYNC_LENGTH                 (13),
		.V_FRONT_PORCH                 (22),
		.V_BACK_PORCH                  (10),
		.F_RISING_EDGE                 (0),
		.F_FALLING_EDGE                (0),
		.FIELD0_V_RISING_EDGE          (0),
		.FIELD0_V_BLANK                (0),
		.FIELD0_V_SYNC_LENGTH          (0),
		.FIELD0_V_FRONT_PORCH          (0),
		.FIELD0_V_BACK_PORCH           (0),
		.ANC_LINE                      (0),
		.FIELD0_ANC_LINE               (0)
	) alt_vip_itc_0 (
		.is_clk        (is_clk),        //       is_clk_rst.clk
		.rst           (rst),           // is_clk_rst_reset.reset
		.is_data       (is_data),       //              din.data
		.is_valid      (is_valid),      //                 .valid
		.is_ready      (is_ready),      //                 .ready
		.is_sop        (is_sop),        //                 .startofpacket
		.is_eop        (is_eop),        //                 .endofpacket
		.vid_clk       (vid_clk),       //    clocked_video.export
		.vid_data      (vid_data),      //                 .export
		.underflow     (underflow),     //                 .export
		.vid_datavalid (vid_datavalid), //                 .export
		.vid_v_sync    (vid_v_sync),    //                 .export
		.vid_h_sync    (vid_h_sync),    //                 .export
		.vid_f         (vid_f),         //                 .export
		.vid_h         (vid_h),         //                 .export
		.vid_v         (vid_v)          //                 .export
	);

endmodule
