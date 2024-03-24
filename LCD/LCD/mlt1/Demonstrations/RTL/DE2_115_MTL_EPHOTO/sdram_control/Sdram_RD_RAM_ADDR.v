module Sdram_RD_RAM_ADDR (
	iRST,
	iCLK_W,
	iCLK_R,
	iEN_W,
	iEN_R,
	iEN_PERIOD,
	iREQ_CLR,
	iREG_SCALE_WIDTH,
	iREG_SCALE_OFFSET,					
	oADDR_W,
	oADDR_R,
	oREQ_W
);

parameter	ADDR_MAX_WR	 =	10'd799;

//===========================================================================
// PORT declarations
//===========================================================================
input 		        iRST, iCLK_W, iCLK_R;
input             iEN_W, iEN_R, iEN_PERIOD, iREQ_CLR;
input      [9:0]  iREG_SCALE_WIDTH;
input      [6:0]  iREG_SCALE_OFFSET;
output reg [9:0]  oADDR_W;
output reg [9:0]  oADDR_R;
output reg        oREQ_W;


///////////////////////////////////////////////////////////////////
//=============================================================================
// REG/WIRE declarations
//=============================================================================
wire       [9:0]  addr_max_rd, addr1_rd, addr2_rd, addr3_rd, addr4_rd;
wire              wr_addr_max;
wire              rd_addr_max;
wire              rd_addr1, rd_addr2, rd_addr3, rd_addr4;
reg               wr_trig;
reg        [2:0]  wr_trig_d;


//=============================================================================
// Structural coding
//=============================================================================
assign addr_max_rd = iREG_SCALE_WIDTH - 10'b1;
assign addr1_rd = {3'b0, iREG_SCALE_WIDTH[9:3]} + {2'b0, iREG_SCALE_OFFSET, 1'b0} - 10'b1;
assign addr2_rd = {2'b0, iREG_SCALE_WIDTH[9:2]} + {2'b0, iREG_SCALE_OFFSET, 1'b0} - 10'b1;
assign addr3_rd = {3'b0, iREG_SCALE_WIDTH[9:3]} + {2'b0, iREG_SCALE_WIDTH[9:2]} + {2'b0, iREG_SCALE_OFFSET, 1'b0} - 10'b1;
assign addr4_rd = {1'b0, iREG_SCALE_WIDTH[9:1]} + {2'b0, iREG_SCALE_OFFSET, 1'b0} - 10'b1;
assign wr_addr_max = oADDR_W == ADDR_MAX_WR;
assign rd_addr_max = oADDR_R == addr_max_rd;
assign rd_addr1 = oADDR_R == addr1_rd;
assign rd_addr2 = oADDR_R == addr2_rd;
assign rd_addr3 = oADDR_R == addr3_rd;
assign rd_addr4 = oADDR_R == addr4_rd;


always@(posedge iCLK_W or posedge iRST)
	if(iRST)
	begin
		wr_trig_d <= 3'b0;
	  oADDR_W <= 10'd0;
	  oREQ_W <= 1'b0;
	end
	else
	begin
		wr_trig_d <= {wr_trig_d[1:0], wr_trig};
 
	  if (iEN_W)
	  begin
		  if (wr_addr_max)
		    oADDR_W <= 10'd0;
		  else
		    oADDR_W <= oADDR_W + 10'd1;
	  end
	  
	  if (!wr_trig_d[1] && wr_trig_d[2])
	    oREQ_W <= 1'b1;
	  else if (iREQ_CLR)
	    oREQ_W <= 1'b0;	  	
	end

always@(posedge iCLK_R or posedge iRST)
	if(iRST)
	begin
		wr_trig <= 1'b1;
	  oADDR_R <= {2'b0, iREG_SCALE_OFFSET, 1'b0};
	end 
	else if (iEN_PERIOD)
	begin 
    if (iEN_R)
    begin
	  	oADDR_R <= oADDR_R + 10'd1;
	  	  
	  	if (rd_addr_max || rd_addr1 || rd_addr2 || rd_addr3 || rd_addr4)
    	  wr_trig <= 1'b1;
    	else
    		wr_trig <= 1'b0;
	  end
    else  	
    	wr_trig <= 1'b0;
  end
  else
  begin
  	wr_trig <= 1'b0;
  	oADDR_R <= {2'b0, iREG_SCALE_OFFSET, 1'b0};
  end

endmodule