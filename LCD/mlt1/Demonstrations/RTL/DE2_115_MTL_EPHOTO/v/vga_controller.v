module	vga_controller	(	
		//	Control Signal
		iCLK,
		iRSTN,	
		iR,
		iG,
		iB,
		oREAD,
		oVGA_R,
		oVGA_G,
		oVGA_B,
		oVGA_HS,
		oVGA_VS);
						
//	Control Signal
input				     iCLK;
input				     iRSTN;	
input		   [7:0] iR;
input		   [7:0] iG;
input		   [7:0] iB;
output     [2:0] oREAD;
output     [7:0] oVGA_R;
output     [7:0] oVGA_G;
output     [7:0] oVGA_B;
output reg 			 oVGA_HS;
output reg 			 oVGA_VS;

////////////////////////////////////////////////////////////
//	Horizontal	Parameter
parameter	H_TOTAL	 =	1055; // total-1 : 1056-1
parameter	H_SYNC	 =	29;  // sync-1 : 30-1
parameter	H_START  =	42;  // sync+back-1-1-delay : 30+16-1-3
parameter	H_END	   =	842; // H_START+800 : 42+800
//	Vertical Parameter
parameter	V_TOTAL	 =	524; // total-1 : 525-1
parameter	V_SYNC	 =	12;  // sync-1 : 13-1
parameter	V_START	 =	20;  // sync+back-1 : 13+10-1-2 pre 2 lines
parameter	V_END	   =	500; // V_START+480 : 22+480-2 pre 2 lines
////////////////////////////////////////////////////////////

reg			  [10:0]	h_count;
reg			  [9:0]	  v_count;
reg               h_act;
reg       [2:0]   v_act;
wire              h_max, hs_end, hr_start, hr_end;
wire              v_max, vs_end, vr_start, vr_end;

//=======================================================
//  Structural coding
//=======================================================
assign oVGA_R = iR;
assign oVGA_G = iG;
assign oVGA_B = iB;		    
assign oREAD	=	{v_act[2]&&h_act,	v_act[1]&&h_act, v_act[0]&&h_act};

assign h_max = h_count == H_TOTAL;
assign hs_end = h_count >= H_SYNC;
assign hr_start = h_count == H_START; 
assign hr_end = h_count == H_END;
assign v_max = v_count == V_TOTAL;
assign vs_end = v_count >= V_SYNC;
assign vr_start = v_count == V_START; 
assign vr_end = v_count == V_END;


always @ (posedge iCLK or negedge iRSTN)
	if (!iRSTN)
	begin
		h_count		<=	11'b0;
		oVGA_HS		<=	1'b1;
		h_act	    <=	1'b0;
	end
	else
	begin
    if (h_max)
		  h_count	<=	11'b0;
		else
		  h_count	<= h_count + 11'b1;

		if (hs_end && !h_max)
		  oVGA_HS	<=	1'b1;
		else
		  oVGA_HS	<= 1'b0;

		if (hr_start)
		  h_act	  <=	1'b1;
		else if (hr_end)
		  h_act	  <=	1'b0;
	end

always@(posedge iCLK or negedge iRSTN)
	if(!iRSTN)
	begin
		v_count		<=	10'b0;
		oVGA_VS		<=	1'b1;
		v_act	    <=	3'b0;
	end
	else 
	begin		
		if (h_max)
		begin		  
		  if (v_max)
		    v_count	<=	10'b0;
		  else
		    v_count	<=	v_count + 10'b1;

		  if (vs_end && !v_max)
		    oVGA_VS	<=	1'b1;
		  else
		    oVGA_VS	<=	1'b0;

  		v_act[2:1] <= v_act[1:0];  		
  		if (vr_start)
	  	  v_act[0] <=	1'b1;
		  else if (vr_end)
		    v_act[0] <=	1'b0;
		end
	end

endmodule