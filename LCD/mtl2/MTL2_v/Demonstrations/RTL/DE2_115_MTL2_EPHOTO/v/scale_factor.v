module scale_factor	 (	
	iCLK,
	iRSTN,
	iREADY,
	iZOOM_OUT,
	iX1_START,								
	iY1_START,								
	iX2_START,								
	iY2_START,								
	iX1_END,								
	iY1_END,								
	iX2_END,								
	iY2_END,								
	oSCALE_FACTOR,
	oSCALE_WIDTH,
	oX_OFFSET,
	oY_OFFSET
);

parameter	FACTOR_MAX          =	10'b10_0000_0000;
parameter	FACTOR_ONE		      =	10'b00_1000_0000;
parameter	FACTOR_MIN          =	10'b00_0010_0000;
parameter	HOR_WIDTH 	        =	10'd800;
parameter	VER_HEIGHT 	        =	9'd480;
parameter	HOR_OFFSET 	        =	10'd0;
parameter	VER_OFFSET          =	9'd0;

//=======================================================
//  Port declarations
//=======================================================					
input		           iCLK, iRSTN, iREADY, iZOOM_OUT;
input	     [9:0]	 iX1_START, iX2_START, iX1_END, iX2_END;				
input	     [8:0]	 iY1_START, iY2_START, iY1_END, iY2_END;				
output reg [7:0]   oSCALE_FACTOR;
output     [9:0]   oSCALE_WIDTH;
output reg [9:0]   oX_OFFSET;
output reg [8:0]   oY_OFFSET;


//=======================================================
//  REG/WIRE declarations
//=======================================================
reg                ready_d;
wire       [9:0]   x_start_diff, x_end_diff;
wire       [31:0]  x_start_fp, x_end_fp;
wire       [8:0]   y_start_diff, y_end_diff;
wire       [31:0]  y_start_fp, y_end_fp;
wire       [31:0]  x_result, y_result;
wire       [16:0]  x_factor, y_factor;
wire       [9:0]   x_factor_m, y_factor_m;
wire       [9:0]   factor_m_temp, factor_sum, factor_m;
wire       [17:0]  new_factor, new_width, new_x_middle, ori_x_middle;
wire       [16:0]  new_height, new_y_middle, ori_y_middle;
wire       [8:0]   scale_height;
wire               no_zoom;
reg        [7:0]   scale_factor_d;
wire       [10:0]  x_start_sum;
wire       [9:0]   x_start_middle, max_x_offset;
wire       [9:0]   y_start_sum;
wire       [8:0]   y_start_middle, max_y_offset;
wire       [10:0]  new_x_offset;
wire       [9:0]   new_y_offset;


//=======================================================
//  Sub-modules
//=======================================================
int2fp            u_int2fp_xa (
	      .clock(iCLK),
	      .dataa({22'b0, x_start_diff}),
	      .result(x_start_fp) );

int2fp            u_int2fp_xb (
	      .clock(iCLK),
	      .dataa({22'b0, x_end_diff}),
	      .result(x_end_fp) );

div               u_div_x (
	      .clock(iCLK),
	      .dataa(x_start_fp),
	      .datab(x_end_fp),
	      .result(x_result) );

fp2int            u_fp2int_x (
	      .clock(iCLK),
	      .dataa(x_result),
	      .result(x_factor) );
	
int2fp            u_int2fp_ya (
	      .clock(iCLK),
	      .dataa({23'b0, y_start_diff}),
	      .result(y_start_fp) );

int2fp            u_int2fp_yb (
	      .clock(iCLK),
	      .dataa({23'b0, y_end_diff}),
	      .result(y_end_fp) );

div               u_div_y (
	      .clock(iCLK),
	      .dataa(y_start_fp),
	      .datab(y_end_fp),
	      .result(y_result) );

fp2int            u_fp2int_y (
	      .clock(iCLK),
	      .dataa(y_result),
	      .result(y_factor) );

mult_8x10        u_mult_factor (
	      .dataa(oSCALE_FACTOR),
	      .datab(factor_m),
	      .result(new_factor) );

mult_8x10        u_mult_width (
	      .dataa(oSCALE_FACTOR),
	      .datab(HOR_WIDTH),
	      .result(new_width) );

mult_8x9         u_mult_height (
	      .dataa(oSCALE_FACTOR),
	      .datab(VER_HEIGHT),
	      .result(new_height) );

mult_8x10        u_mult_xmiddle (
	      .dataa(oSCALE_FACTOR),
	      .datab(x_start_middle),
	      .result(new_x_middle) );

mult_8x10        u_mult_xori (
	      .dataa(scale_factor_d),
	      .datab(x_start_middle),
	      .result(ori_x_middle) );

mult_8x9         u_mult_ymiddle (
	      .dataa(oSCALE_FACTOR),
	      .datab(y_start_middle),
	      .result(new_y_middle) );
	      
mult_8x9         u_mult_yori (
	      .dataa(scale_factor_d),
	      .datab(y_start_middle),
	      .result(ori_y_middle) );

	
//=======================================================
//  Structural coding
//=======================================================
// scale size
assign oSCALE_WIDTH = new_width[16:7] + |new_width[6:0];
assign scale_height = new_height[15:7] + |new_height[6:0];
// factor
assign x_start_diff = (iX1_START>iX2_START) ? (iX1_START-iX2_START) : (iX2_START-iX1_START); 
assign x_end_diff = (iX1_END>iX2_END) ? (iX1_END-iX2_END) : (iX2_END-iX1_END);
assign y_start_diff = (iY1_START>iY2_START) ? (iY1_START-iY2_START) : (iY2_START-iY1_START); 
assign y_end_diff = (iY1_END>iY2_END) ? (iY1_END-iY2_END) : (iY2_END-iY1_END);
assign x_factor_m = iZOOM_OUT ? (|x_factor[16:9] ? FACTOR_MAX : |x_factor[8:7] ? x_factor[9:0] : FACTOR_ONE) :
                                (|x_factor[16:7] ? FACTOR_ONE : |x_factor[6:5] ? x_factor[9:0] : FACTOR_MIN) ;
assign y_factor_m = iZOOM_OUT ? (|y_factor[16:9] ? FACTOR_MAX : |y_factor[8:7] ? y_factor[9:0] : FACTOR_ONE) :
                                (|y_factor[16:7] ? FACTOR_ONE : |y_factor[6:5] ? y_factor[9:0] : FACTOR_MIN) ;
assign factor_m_temp = iZOOM_OUT ? (x_factor_m<y_factor_m ? x_factor_m : y_factor_m) : 
                                   (x_factor_m>y_factor_m ? x_factor_m : y_factor_m);
assign factor_sum = iZOOM_OUT ? (factor_m_temp + 10'h8) : (factor_m_temp - 10'h8);
assign factor_m = (factor_m_temp==FACTOR_ONE) ? factor_sum : factor_m_temp;
// offset
assign no_zoom = oSCALE_FACTOR == scale_factor_d;
assign x_start_sum = iX1_START + iX2_START;
assign x_start_middle = x_start_sum[10:1];
assign y_start_sum = iY1_START + iY2_START;
assign y_start_middle = y_start_sum[9:1];
assign max_x_offset = HOR_WIDTH - oSCALE_WIDTH;
assign max_y_offset = VER_HEIGHT - scale_height;
assign new_x_offset = {1'b0, oX_OFFSET} + {1'b0, ori_x_middle[16:7]} - {1'b0, new_x_middle[16:7]};
assign new_y_offset = {1'b0, oY_OFFSET} + {1'b0, ori_y_middle[15:7]} - {1'b0, new_y_middle[15:7]};


always@(posedge iCLK or negedge iRSTN)
    if (!iRSTN)
    begin
    	ready_d <= 1'b0;	
    	scale_factor_d <= FACTOR_ONE[7:0];
      oSCALE_FACTOR <= FACTOR_ONE[7:0];
	    oX_OFFSET <= HOR_OFFSET;
	    oY_OFFSET <= VER_OFFSET;
    end
    else
    begin
    	ready_d <= iREADY;	
    	scale_factor_d <= oSCALE_FACTOR;

      if (iREADY)
      begin
      	if (|new_factor[17:14])
          oSCALE_FACTOR <= FACTOR_ONE[7:0];
        else if (|new_factor[13:12])
          oSCALE_FACTOR <= new_factor[14:7];        	
        else
        	oSCALE_FACTOR <= FACTOR_MIN[7:0];
      end
        	
      if (ready_d && !no_zoom)
      begin
        if (new_x_offset[10] || oSCALE_FACTOR[7])
        	oX_OFFSET <= HOR_OFFSET;
        else if (new_x_offset[9:1] < max_x_offset[9:1])
        	oX_OFFSET <= {new_x_offset[9:1],1'b0};
        else
        	oX_OFFSET <= {max_x_offset[9:1],1'b0};

        	
        if (new_y_offset[9] || oSCALE_FACTOR[7])
        	oY_OFFSET <= VER_OFFSET;
        else if (new_y_offset[8:1] < max_y_offset[8:1])
        	oY_OFFSET <= {new_y_offset[8:1],1'b0};
        else
        	oY_OFFSET <= {max_y_offset[8:1],1'b0};      
      end
    end

endmodule