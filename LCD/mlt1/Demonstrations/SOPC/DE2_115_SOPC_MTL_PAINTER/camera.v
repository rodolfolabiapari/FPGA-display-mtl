// camera.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module camera (
		input  wire        clk,           //             clock_reset.clk
		input  wire        reset_n,       //       clock_reset_reset.reset_n
		input  wire [11:0] CAMERA_D,      //             conduit_end.export
		input  wire        CAMERA_FVAL,   //                        .export
		input  wire        CAMERA_LVAL,   //                        .export
		input  wire        CAMERA_PIXCLK, //                        .export
		output wire [23:0] st_data,       // avalon_streaming_source.data
		output wire        st_sop,        //                        .startofpacket
		output wire        st_eop,        //                        .endofpacket
		input  wire        st_ready,      //                        .ready
		output wire        st_valid       //                        .valid
	);

	TERASIC_CAMERA #(
		.VIDEO_W (800),
		.VIDEO_H (480)
	) camera (
		.clk           (clk),           //             clock_reset.clk
		.reset_n       (reset_n),       //       clock_reset_reset.reset_n
		.CAMERA_D      (CAMERA_D),      //             conduit_end.export
		.CAMERA_FVAL   (CAMERA_FVAL),   //                        .export
		.CAMERA_LVAL   (CAMERA_LVAL),   //                        .export
		.CAMERA_PIXCLK (CAMERA_PIXCLK), //                        .export
		.st_data       (st_data),       // avalon_streaming_source.data
		.st_sop        (st_sop),        //                        .startofpacket
		.st_eop        (st_eop),        //                        .endofpacket
		.st_ready      (st_ready),      //                        .ready
		.st_valid      (st_valid)       //                        .valid
	);

endmodule
