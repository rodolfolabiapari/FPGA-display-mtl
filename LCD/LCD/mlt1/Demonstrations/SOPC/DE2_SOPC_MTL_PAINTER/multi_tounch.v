// multi_tounch.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.

module multi_tounch (
		input  wire        clk,           //            clock.clk
		input  wire        reset_n,       //            reset.reset_n
		input  wire        s_cs,          //     avalon_slave.chipselect
		input  wire [4:0]  s_address,     //                 .address
		input  wire        s_read,        //                 .read
		output wire [15:0] s_readdata,    //                 .readdata
		input  wire        s_write,       //                 .write
		input  wire [15:0] s_writedata,   //                 .writedata
		inout  wire        TOUCH_I2C_SDA, //      conduit_end.export
		output wire        TOUCH_I2C_SCL, //                 .export
		input  wire        TOUCH_INT_n,   //                 .export
		output wire        irq_n          // interrupt_sender.irq_n
	);

	TERASIC_MULTI_TOUCH multi_tounch (
		.clk           (clk),           //            clock.clk
		.reset_n       (reset_n),       //            reset.reset_n
		.s_cs          (s_cs),          //     avalon_slave.chipselect
		.s_address     (s_address),     //                 .address
		.s_read        (s_read),        //                 .read
		.s_readdata    (s_readdata),    //                 .readdata
		.s_write       (s_write),       //                 .write
		.s_writedata   (s_writedata),   //                 .writedata
		.TOUCH_I2C_SDA (TOUCH_I2C_SDA), //      conduit_end.export
		.TOUCH_I2C_SCL (TOUCH_I2C_SCL), //                 .export
		.TOUCH_INT_n   (TOUCH_INT_n),   //                 .export
		.irq_n         (irq_n)          // interrupt_sender.irq_n
	);

endmodule
