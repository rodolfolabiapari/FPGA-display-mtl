module picture_controller
(
	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	//////////// KEY //////////
	input 		     [3:0]		KEY,
	//////////// SDRAM //////////
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [31:0]		DRAM_DQ,
	output		     [3:0]		DRAM_DQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_WE_N,
	//////////// Flash //////////
	output		    [22:0]		FL_ADDR,
	output		          		FL_CE_N,
	inout 		     [7:0]		FL_DQ,
	output		          		FL_OE_N,
	input 		          		FL_RY,
	//////////// VGA //////////
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_VS,
	
	//////////////////////TOUCH///////////////////////////////
	output		          		TOUCH_I2CSCL,
	inout 		          		TOUCH_I2CSDA,
	input 		          		TOUCH_INT_n
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter	BUFFER_SIZE          =	384000; // 800*480
parameter	HOR_SIZE             =	800;
parameter	HOR_PITCH            =	160;
parameter	WR_LENGTH            =	8'd160;
parameter	RD_LENGTH            =	8'd160;

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire		              	dly_rstn, dly_rst, rd_rst;
wire                    sdram_ctrl_clk, clk_10m, clk_vga, clk_touch;
wire           [31:0]   flash_data;
wire                    flash_valid;
wire            [9:0]   reg_x1, reg_x2; 
wire            [8:0]   reg_y1, reg_y2; 
wire            [7:0]		reg_gesture; 
wire            [1:0]   reg_touch_count;
wire                    touch_ready;
wire           [7:0]    reg_scale_factor;
wire           [9:0]    reg_scale_width;
wire           [9:0]    reg_x_offset;    
wire           [8:0]    reg_y_offset;    
wire           [22:0]   reg_rd_addr;
reg            [7:0]    sync_scale_factor;
reg            [9:0]    sync_scale_width;
reg            [9:0]    sync_x_offset;    
reg            [8:0]    sync_y_offset;    
reg            [22:0]   sync_rd_addr;
wire           [22:0]   rd_addr_offset, new_rd_addr;
wire           [2:0]    read;
wire                    read_en;
wire           [31:0]   read_data;
reg             [2:0]   vga_vs_d, vga_hs_d;
wire                    vga_ver_rst, vga_hor_rst;
wire	          [7:0]	  zoom_r, zoom_g, zoom_b;


//=======================================================
//  Sub-modules
//=======================================================
reset_delay		      u_reset_delay (		
							.iRSTN(KEY[0]),
              .iCLK(CLOCK_50),
							.oRSTN(dly_rstn),
							.oRD_RST(rd_rst),
							.oRST(dly_rst) );

sdram_pll 			    u_sdram_pll	(
              .inclk0(CLOCK2_50),
              .c0(sdram_ctrl_clk), //100M ph 0
              .c1(DRAM_CLK),       //100M ph -108
              .c2(clk_10m) );      //10M ph 0

vout_pll 			    u_vout_pll	(
              .inclk0(CLOCK_50),
              .c0(clk_vga),        //33M  ph 0
              .c1(VGA_CLK),        //33M  ph 120
              .c2(clk_touch) );    //2K   ph 0

flash_controller    u_flash_controller (
              .iRSTN(dly_rstn),
		          .iCLK(clk_10m),
		          .iRY(FL_RY),
		          .iDATA(FL_DQ),
		          .oCE_N(FL_CE_N),
		          .oOE_N(FL_OE_N),
		          .oADDR(FL_ADDR),
		          .oDATA(flash_data),
		          .oDVALID(flash_valid) );

sdram_control     u_sdram_control (	
              //	HOST Side						
              .RESET_N(KEY[0]),
              .CLK(sdram_ctrl_clk),
              .REG_SCALE_WIDTH(sync_scale_width),  
              .REG_SCALE_OFFSET(sync_x_offset[6:0]),  
				      .RD_PERIOD(read[0]),
              //	FIFO Write Side 1
							.WR1_DATA(flash_data),
							.WR1(flash_valid),
							.WR1_ADDR(0),
							.WR1_MAX_ADDR(BUFFER_SIZE*3),
							.WR1_LENGTH(WR_LENGTH),
							.WR1_LOAD(!dly_rstn),
							.WR1_CLK(~clk_10m),
							//	FIFO read Side 1
						  .RD1_DATA(read_data),
				      .RD1(read_en),
				      .RD1_ADDR(new_rd_addr),
							.RD1_MAX_ADDR(BUFFER_SIZE),
							.RD1_LENGTH(RD_LENGTH),
							.RD1_LOAD(!dly_rstn || rd_rst || vga_ver_rst),
							.RD1_CLK(clk_vga),
              //	SDRAM Side  
              .SA(DRAM_ADDR),
              .BA(DRAM_BA),
              .CS_N(DRAM_CS_N),
              .CKE(DRAM_CKE),
              .RAS_N(DRAM_RAS_N),
              .CAS_N(DRAM_CAS_N),
              .WE_N(DRAM_WE_N),
              .DQ(DRAM_DQ),
              .DQM(DRAM_DQM) );

						  
i2c_touch_config u_i2c_touch_config(

 .clk_i(CLOCK2_50) ,
 .rst_i (KEY[0]) ,
 
 .oREG_X1(reg_x1),
 .oREG_Y1(reg_y1),
 .oREG_X2(reg_x2),
 .oREG_Y2(reg_y2),
 .oREG_GESTURE(reg_gesture),
 .oREADY(touch_ready),
 
 .I2C_SDAT(TOUCH_I2CSDA),
 .I2C_SCLK(TOUCH_I2CSCL),
 .touch_int_n(TOUCH_INT_n)


);						  

touch_control	    u_touch_control (	
	            .iCLK(clk_touch),
	            .iRSTN(KEY[0]),
	            .iREADY(touch_ready),
	            .iREG_X1(reg_x1),								
	            .iREG_Y1(reg_y1),								
	            .iREG_X2(reg_x2),								
	            .iREG_Y2(reg_y2),								
	            .iREG_TOUCH_COUNT(reg_touch_count),								
	            .iREG_GESTURE(reg_gesture),
	            .oSCALE_FACTOR(reg_scale_factor), 
	            .oSCALE_WIDTH(reg_scale_width),
              .oX_OFFSET(reg_x_offset),
              .oY_OFFSET(reg_y_offset), 
              .oRD_ADDR(reg_rd_addr) );

zoom              u_zoom (
	            .iRSTN(!dly_rst),
	            .iRSTN_HOR(!vga_hor_rst),
	            .iRSTN_VER(!vga_ver_rst),
	            .iCLK(clk_vga),					
	            .iEN(read),
	            .iFACTOR(sync_scale_factor),
	            .iR(read_data[7:0]), 
	            .iG(read_data[15:8]),
	            .iB(read_data[23:16]),
	            .oREAD(read_en),
	            .oEN(),
	            .oR(zoom_r),
	            .oG(zoom_g),
	            .oB(zoom_b) );

vga_controller	  u_vga_controller (	
		          .iCLK(clk_vga),
		          .iRSTN(!dly_rst),	
		          .iR(zoom_r),
		          .iG(zoom_g),
		          .iB(zoom_b),
		          .oREAD(read),
		          .oVGA_R(VGA_R),
		          .oVGA_G(VGA_G),
		          .oVGA_B(VGA_B),
		          .oVGA_HS(VGA_HS),
		          .oVGA_VS(VGA_VS) );

			
//=======================================================
//  Structural coding
//=======================================================
assign vga_ver_rst = !vga_vs_d[2]&&vga_vs_d[1];
assign vga_hor_rst = !vga_hs_d[2]&&vga_hs_d[1];
assign rd_addr_offset = HOR_SIZE*sync_y_offset+HOR_PITCH*sync_x_offset[9:7];
assign new_rd_addr = sync_rd_addr + rd_addr_offset;


always@(posedge clk_vga or negedge dly_rstn)
if (!dly_rstn)
begin	
	vga_vs_d <= 3'b111;
	vga_hs_d <= 3'b111;
  sync_scale_factor <= 8'h80;           
  sync_scale_width <= 10'd800;            
  sync_x_offset <= 9'b0;               
  sync_y_offset <= 9'b0;               
end
else
begin
	vga_vs_d <= {vga_vs_d[1:0], VGA_VS};
	vga_hs_d <= {vga_hs_d[1:0], VGA_HS};
	if (!vga_vs_d[0]&&vga_vs_d[1])
	begin
    sync_scale_factor <= reg_scale_factor;           
    sync_scale_width <= reg_scale_width;            
    sync_x_offset <= reg_x_offset;               
    sync_y_offset <= reg_y_offset;               
    sync_rd_addr <= reg_rd_addr;
	end   		
end


endmodule
