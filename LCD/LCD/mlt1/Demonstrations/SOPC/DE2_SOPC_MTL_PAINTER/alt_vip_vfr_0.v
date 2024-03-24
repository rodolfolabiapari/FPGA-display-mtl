// alt_vip_vfr_0.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module alt_vip_vfr_0 (
		input  wire        clock,                //             clock_reset.clk
		input  wire        reset,                //       clock_reset_reset.reset
		input  wire        master_clock,         //            clock_master.clk
		input  wire        master_reset,         //      clock_master_reset.reset
		input  wire [4:0]  slave_address,        //            avalon_slave.address
		input  wire        slave_write,          //                        .write
		input  wire [31:0] slave_writedata,      //                        .writedata
		input  wire        slave_read,           //                        .read
		output wire [31:0] slave_readdata,       //                        .readdata
		output wire        slave_irq,            //        interrupt_sender.irq
		output wire [23:0] dout_data,            // avalon_streaming_source.data
		output wire        dout_valid,           //                        .valid
		input  wire        dout_ready,           //                        .ready
		output wire        dout_startofpacket,   //                        .startofpacket
		output wire        dout_endofpacket,     //                        .endofpacket
		output wire [31:0] master_address,       //           avalon_master.address
		output wire [5:0]  master_burstcount,    //                        .burstcount
		input  wire [31:0] master_readdata,      //                        .readdata
		output wire        master_read,          //                        .read
		input  wire        master_readdatavalid, //                        .readdatavalid
		input  wire        master_waitrequest    //                        .waitrequest
	);

	alt_vipvfr101_vfr #(
		.BITS_PER_PIXEL_PER_COLOR_PLANE (8),
		.NUMBER_OF_CHANNELS_IN_PARALLEL (3),
		.NUMBER_OF_CHANNELS_IN_SEQUENCE (1),
		.MAX_IMAGE_WIDTH                (800),
		.MAX_IMAGE_HEIGHT               (480),
		.MEM_PORT_WIDTH                 (32),
		.RMASTER_FIFO_DEPTH             (128),
		.RMASTER_BURST_TARGET           (32),
		.CLOCKS_ARE_SEPARATE            (0)
	) alt_vip_vfr_0 (
		.clock                (clock),                //             clock_reset.clk
		.reset                (reset),                //       clock_reset_reset.reset
		.master_clock         (master_clock),         //            clock_master.clk
		.master_reset         (master_reset),         //      clock_master_reset.reset
		.slave_address        (slave_address),        //            avalon_slave.address
		.slave_write          (slave_write),          //                        .write
		.slave_writedata      (slave_writedata),      //                        .writedata
		.slave_read           (slave_read),           //                        .read
		.slave_readdata       (slave_readdata),       //                        .readdata
		.slave_irq            (slave_irq),            //        interrupt_sender.irq
		.dout_data            (dout_data),            // avalon_streaming_source.data
		.dout_valid           (dout_valid),           //                        .valid
		.dout_ready           (dout_ready),           //                        .ready
		.dout_startofpacket   (dout_startofpacket),   //                        .startofpacket
		.dout_endofpacket     (dout_endofpacket),     //                        .endofpacket
		.master_address       (master_address),       //           avalon_master.address
		.master_burstcount    (master_burstcount),    //                        .burstcount
		.master_readdata      (master_readdata),      //                        .readdata
		.master_read          (master_read),          //                        .read
		.master_readdatavalid (master_readdatavalid), //                        .readdatavalid
		.master_waitrequest   (master_waitrequest)    //                        .waitrequest
	);

endmodule
