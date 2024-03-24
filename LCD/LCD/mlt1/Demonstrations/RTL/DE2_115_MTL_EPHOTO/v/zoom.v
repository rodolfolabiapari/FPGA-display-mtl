module zoom ( // 2T	
	iRSTN,
	iRSTN_HOR,
	iRSTN_VER,
	iCLK,					
	iEN,
	iFACTOR,
	iR,
	iG,
	iB,
	oREAD,
	oEN,
	oR,
	oG,
	oB
);


//===========================================================================
// PORT declarations
//===========================================================================
input 		        iRSTN, iCLK;
input             iRSTN_HOR, iRSTN_VER;
input      [2:0]  iEN;
input      [7:0]  iFACTOR;
input      [7:0]  iR, iG, iB;
output            oREAD, oEN;
output reg [7:0]  oR, oG, oB;


///////////////////////////////////////////////////////////////////
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg               en1_d;
reg        [1:0]  en2_d;
wire              hor_latch, ver_latch;
reg               data_latch;
reg        [23:0] data0, data1; // pre, lat
wire       [8:0]  r1_r0_diff, g1_g0_diff, b1_b0_diff;
wire       [8:0]  ver_r_diff, ver_g_diff, ver_b_diff;
wire              hor_en, ver0_en, ver1_en; 
wire              buffer0_wen, buffer1_wen;
wire       [6:0]  hor_weight, ver_weight;
wire       [15:0] r_hor_weight_data, g_hor_weight_data, b_hor_weight_data;
wire       [15:0] r_weight_data, g_weight_data, b_weight_data;
wire       [8:0]  hor_new_r, hor_new_g, hor_new_b;
wire       [8:0]  ver_new_r, ver_new_g, ver_new_b;
reg        [9:0]  buffer1_wr_addr, buffer1_rd_addr;
reg        [9:0]  buffer0_wr_addr, buffer0_rd_addr;
wire       [23:0] buffer0_data, buffer1_data; // pre, lat


//=======================================================
//  Sub-modules
//=======================================================
factor_acc_hor    u_factor_acc_hor (
	          .iRSTN(iRSTN && iRSTN_HOR),
	          .iCLK(iCLK),					
	          .iEN(iEN[0]),
	          .iFACTOR(iFACTOR),
	          .oLATCH(hor_latch),
	          .oEN(hor_en),
	          .oWEIGHT(hor_weight) );
	          
mult_signed       u_horr_new (
	          .dataa(r1_r0_diff),
	          .datab({1'b0, hor_weight}),
	          .result(r_hor_weight_data) );

mult_signed       u_horg_new (
	          .dataa(g1_g0_diff),
	          .datab({1'b0, hor_weight}),
	          .result(g_hor_weight_data) );

mult_signed       u_horb_new (
	          .dataa(b1_b0_diff),
	          .datab({1'b0, hor_weight}),
	          .result(b_hor_weight_data) );

scale_buffer      u_scale_buffer1 (
	          .clock(iCLK),
	          .data({hor_new_r[7:0],hor_new_g[7:0],hor_new_b[7:0]}),
	          .rdaddress(buffer1_rd_addr),
	          .wraddress(buffer1_wr_addr),
	          .wren(buffer1_wen),
	          .q(buffer1_data) );

scale_buffer      u_scale_buffer0 (
	          .clock(iCLK),
	          .data(buffer1_data),
	          .rdaddress(buffer0_rd_addr),
	          .wraddress(buffer0_wr_addr),
	          .wren(buffer0_wen),
	          .q(buffer0_data) );

factor_acc_ver    u_factor_acc_ver (
	          .iRSTN(iRSTN && iRSTN_VER),
	          .iCLK(iCLK),					
	          .iEN(iEN),
	          .iFACTOR(iFACTOR),
	          .oLATCH(ver_latch),
	          .oEN0(ver0_en),
	          .oEN1(ver1_en),
	          .oWEIGHT(ver_weight) );

mult_signed       u_verr_new (
	          .dataa(ver_r_diff),
	          .datab({1'b0, ver_weight}),
	          .result(r_weight_data) );

mult_signed       u_verg_new (
	          .dataa(ver_g_diff),
	          .datab({1'b0, ver_weight}),
	          .result(g_weight_data) );

mult_signed       u_verb_new (
	          .dataa(ver_b_diff),
	          .datab({1'b0, ver_weight}),
	          .result(b_weight_data) );


//=============================================================================
// Structural coding
//=============================================================================
assign oREAD = ver_latch && hor_latch;
assign oEN = en2_d[1];
assign buffer0_wen = ver0_en && en1_d;
assign buffer1_wen = ver1_en && hor_en;
assign r1_r0_diff = {1'b0, data1[23:16]} - {1'b0, data0[23:16]};
assign g1_g0_diff = {1'b0, data1[15:8]} - {1'b0, data0[15:8]};
assign b1_b0_diff = {1'b0, data1[7:0]} - {1'b0, data0[7:0]};
assign hor_new_r = {1'b0, data0[23:16]} + r_hor_weight_data[15:7];
assign hor_new_g = {1'b0, data0[15:8]} + g_hor_weight_data[15:7];
assign hor_new_b = {1'b0, data0[7:0]} + b_hor_weight_data[15:7];
assign ver_r_diff = {1'b0, buffer1_data[23:16]} - {1'b0, buffer0_data[23:16]}; 
assign ver_g_diff = {1'b0, buffer1_data[15:8]} - {1'b0, buffer0_data[15:8]}; 
assign ver_b_diff = {1'b0, buffer1_data[7:0]} - {1'b0, buffer0_data[7:0]};
assign ver_new_r = {1'b0, buffer0_data[23:16]} + r_weight_data[15:7] + r_weight_data[6];
assign ver_new_g = {1'b0, buffer0_data[15:8]} + g_weight_data[15:7] + g_weight_data[6];
assign ver_new_b = {1'b0, buffer0_data[7:0]} + b_weight_data[15:7] + b_weight_data[6];


always@(posedge iCLK or negedge iRSTN)
	if(!iRSTN)
	begin
		data_latch <= 1'b0;
		en1_d <= 1'b0;
		en2_d <= 2'b0;
    buffer1_wr_addr <= 10'b0;
	end
	else
	begin
    oR <= ver_new_r[7:0];
    oG <= ver_new_g[7:0];
    oB <= ver_new_b[7:0];
    data_latch <= oREAD;
		en1_d <= iEN[1];
		en2_d <= {en2_d[0], iEN[2]};
		
		if (data_latch)
		begin
      data0 <= data1;
      data1 <= {iR, iG, iB};
		end
		
		if (buffer1_wen)
			buffer1_wr_addr <= buffer1_wr_addr + 10'b1;
	  else
	  	buffer1_wr_addr <= 10'b0;

		if (|iEN[2:1])
			buffer1_rd_addr <= buffer1_rd_addr + 10'b1;
	  else
	  	buffer1_rd_addr <= 10'b0;

		if (buffer0_wen)
			buffer0_wr_addr <= buffer0_wr_addr + 10'b1;
	  else
	  	buffer0_wr_addr <= 10'b0;

		if (iEN[2])
			buffer0_rd_addr <= buffer0_rd_addr + 10'b1;
	  else
	  	buffer0_rd_addr <= 10'b0;
	end

endmodule