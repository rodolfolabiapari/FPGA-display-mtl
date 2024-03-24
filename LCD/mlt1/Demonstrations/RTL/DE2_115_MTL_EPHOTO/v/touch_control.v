module touch_control	 (	
	iCLK,
	iRSTN,
	iREADY,
	iREG_X1,								
	iREG_Y1,								
	iREG_X2,								
	iREG_Y2,								
	iREG_TOUCH_COUNT,								
	iREG_GESTURE,
	oSCALE_FACTOR,
	oSCALE_WIDTH,
  oX_OFFSET,
  oY_OFFSET,
  oRD_ADDR					
);

parameter	IDLE		             =	1'b0;
parameter	TOUCH		             =	1'b1;
parameter	BUFFER_SIZE          =	19'h5DC00; // 800*480

//=======================================================
//  Port declarations
//=======================================================					
input		           iCLK;
input		           iRSTN, iREADY;
input	     [9:0]	 iREG_X1;				
input	     [8:0]	 iREG_Y1;				
input	     [9:0]	 iREG_X2;				
input	     [8:0]	 iREG_Y2;				
input	     [1:0]	 iREG_TOUCH_COUNT;	
input	     [7:0]	 iREG_GESTURE;
output     [7:0]   oSCALE_FACTOR;
output     [9:0]   oSCALE_WIDTH;
output     [9:0]   oX_OFFSET;
output     [8:0]   oY_OFFSET;
output reg [22:0]  oRD_ADDR;				

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg	         [2:0] ready_d;
reg                touch_state;
reg          [8:0] wait_count;
reg          [9:0] x1_start, x2_start, x1_end, x2_end;
reg          [8:0] y1_start, y2_start, y1_end, y2_end;
wire               no_gesture_code;
wire               read_next_code, read_prev_code;
wire               zoom_code; //scale
reg                read_next, read_prev;
reg                zoom, zoom_out; // scale
wire               zoom_reset, state_reset, set_trig;
wire               read_next_trig, read_prev_trig;
wire         [9:0] new_x_offset;
wire         [8:0] new_x_quotient;
wire         [6:0] new_x_remain;
reg          [1:0] rd_addr_index;
reg                factor_rstn;
wire               max_rd_index, non_min_rd_index;
wire        [22:0] address;


//=======================================================
//  Sub-modules
//=======================================================
scale_factor	    u_scale_factor (	
	          .iCLK(iCLK),
	          .iRSTN(iRSTN && factor_rstn),
	          .iREADY(set_trig && zoom),
	          .iZOOM_OUT(zoom_out),
	          .iX1_START(x1_start),								
	          .iY1_START(y1_start),								
	          .iX2_START(x2_start),								
	          .iY2_START(y2_start),								
	          .iX1_END(x1_end),								
	          .iY1_END(y1_end),								
	          .iX2_END(x2_end),								
	          .iY2_END(y2_end),								
	          .oSCALE_FACTOR(oSCALE_FACTOR),
	          .oSCALE_WIDTH(oSCALE_WIDTH),
	          .oX_OFFSET(new_x_offset),
	          .oY_OFFSET(oY_OFFSET) );

divide_9d7        u_divide_9d7 (
	          .denom(7'd80),
	          .numer(new_x_offset[9:1]),
	          .quotient(new_x_quotient),
	          .remain(new_x_remain) );	
	          

//=======================================================
//  Structural coding
//=======================================================
assign oX_OFFSET = {new_x_quotient[2:0], new_x_remain};
assign no_gesture_code = iREG_GESTURE==8'h0;
assign zoom_code = iREG_GESTURE[6:3]==4'b1001;
assign read_next_code = iREG_GESTURE==8'h1C; 
assign read_prev_code = iREG_GESTURE==8'h14;
assign zoom_reset = iREADY&&no_gesture_code&&zoom;
assign state_reset = wait_count[8] || zoom_reset;
assign set_trig = touch_state && state_reset;
assign read_next_trig = set_trig && read_next;
assign read_prev_trig = set_trig && read_prev;
assign max_rd_index = rd_addr_index[1];
assign non_min_rd_index = |rd_addr_index;
assign address = rd_addr_index[1] ? {3'b0,BUFFER_SIZE,1'b0} : rd_addr_index[0] ? {4'b0,BUFFER_SIZE} : 23'h0;


always@(posedge iCLK or negedge iRSTN)
    if (!iRSTN)
    begin
	    rd_addr_index <= 2'b01;
      factor_rstn <= 1'b1;
    end
    else
    begin 
      if (read_prev_trig && non_min_rd_index)
      begin
      	rd_addr_index <= rd_addr_index - 5'b1;
      	factor_rstn <= 1'b0;
      end	
      else if (read_next_trig && !max_rd_index)
      begin
      	rd_addr_index <= rd_addr_index + 5'b1;      	     	
        factor_rstn <= 1'b0;
      end
      else
      	factor_rstn <= 1'b1;

	    oRD_ADDR <= address;
    end      

always@(posedge iCLK or negedge iRSTN)
	if (!iRSTN)
	begin
		ready_d <= 3'b0;
		touch_state	<= IDLE;
		wait_count <= 9'b0;
    read_next <= 1'b0;
    read_prev <= 1'b0;
    zoom <= 1'b0;
    zoom_out <= 1'b0;
	end
  else
  begin 
  	ready_d <= {ready_d[1:0], iREADY};

		case (touch_state)
			IDLE : begin
				  if (!ready_d[2] && ready_d[1])
				  begin
 					  touch_state	<= TOUCH;
 					  wait_count <= 9'b0;
 					end
 					
          read_next <= 1'b0;
          read_prev <= 1'b0;
          zoom <= 1'b0;
          zoom_out <= 1'b0;
			end
			TOUCH : begin
					if (state_reset)
						touch_state	<= IDLE;
						
					if (ready_d[2] && !ready_d[1])
            wait_count <= 9'b0;
          else
            wait_count <= wait_count + 9'b1;
         	
          if (!ready_d[2] && ready_d[1])
          begin
          	if (zoom)
            	read_next <= 1'b0;
            else if (read_next_code)
            	read_next <= 1'b1;

          	if (zoom)
            	read_prev <= 1'b0;
            else if (read_prev_code) 
              read_prev <= 1'b1;

            if (zoom)
            begin
            	if (zoom_code)
            	begin
                x1_end <= iREG_X1;
                x2_end <= iREG_X2;
                y1_end <= iREG_Y1;
                y2_end <= iREG_Y2;
              end
            end
            else
            begin
            	x1_start <= iREG_X1;
            	x2_start <= iREG_X2;
            	y1_start <= iREG_Y1;
            	y2_start <= iREG_Y2;
            end
          	
            if (zoom_code)
            begin
              zoom <= 1'b1;
              zoom_out <= iREG_GESTURE[0];
            end
          end
			end
		endcase
  end
  
endmodule
