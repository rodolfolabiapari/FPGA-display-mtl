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

parameter	ADDR_MAX_WR	 =	11'd1599;

//===========================================================================
// PORT declarations
//===========================================================================
input 		        iRST, iCLK_W, iCLK_R;
input             iEN_W, iEN_R, iEN_PERIOD, iREQ_CLR;
input      [9:0]  iREG_SCALE_WIDTH;
input      [6:0]  iREG_SCALE_OFFSET;
output reg [10:0] oADDR_W;
output reg [9:0]  oADDR_R;
output reg        oREQ_W;


///////////////////////////////////////////////////////////////////
//=============================================================================
// REG/WIRE declarations
//=============================================================================
wire       [9:0]  addr_max_rd, addr1_rd, addr2_rd, addr3_rd, addr4_rd;
wire       [9:0]  addr5_rd, addr6_rd, addr7_rd, addr8_rd, addr9_rd;
wire              wr_addr_max;
wire              rd_addr_max;
wire              rd_addr1, rd_addr2, rd_addr3, rd_addr4;
wire              rd_addr5, rd_addr6, rd_addr7, rd_addr8, rd_addr9;
reg               wr_trig;
reg        [2:0]  wr_trig_d;


//=============================================================================
// Structural coding
//=============================================================================
assign addr_max_rd = iREG_SCALE_WIDTH - 10'b1;
assign addr1_rd = 10'b0;
assign addr2_rd = {4'b0, iREG_SCALE_WIDTH[9:4]} + {5'b0, iREG_SCALE_WIDTH[9:5]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr3_rd = {3'b0, iREG_SCALE_WIDTH[9:3]} + {4'b0, iREG_SCALE_WIDTH[9:4]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr4_rd = {2'b0, iREG_SCALE_WIDTH[9:2]} + {5'b0, iREG_SCALE_WIDTH[9:5]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr5_rd = {2'b0, iREG_SCALE_WIDTH[9:2]} + {3'b0, iREG_SCALE_WIDTH[9:3]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr6_rd = {1'b0, iREG_SCALE_WIDTH[9:1]} - {5'b0, iREG_SCALE_WIDTH[9:5]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr7_rd = {1'b0, iREG_SCALE_WIDTH[9:1]} + {4'b0, iREG_SCALE_WIDTH[9:4]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr8_rd = {1'b0, iREG_SCALE_WIDTH[9:1]} + {3'b0, iREG_SCALE_WIDTH[9:3]} + {5'b0, iREG_SCALE_WIDTH[9:5]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign addr9_rd = {1'b0, iREG_SCALE_WIDTH[9:1]} + {2'b0, iREG_SCALE_WIDTH[9:2]} + {2'b0, iREG_SCALE_OFFSET, 1'b0};
assign wr_addr_max = oADDR_W == ADDR_MAX_WR;
assign rd_addr_max = oADDR_R == addr_max_rd;
assign rd_addr1 = oADDR_R == addr1_rd;
assign rd_addr2 = oADDR_R == addr2_rd;
assign rd_addr3 = oADDR_R == addr3_rd;
assign rd_addr4 = oADDR_R == addr4_rd;
assign rd_addr5 = oADDR_R == addr5_rd;
assign rd_addr6 = oADDR_R == addr6_rd;
assign rd_addr7 = oADDR_R == addr7_rd;
assign rd_addr8 = oADDR_R == addr8_rd;
assign rd_addr9 = oADDR_R == addr9_rd;


always@(posedge iCLK_W or posedge iRST)
	if(iRST)
	begin
		wr_trig_d <= 3'b0;
	  oADDR_W <= 11'd0;
	  oREQ_W <= 1'b0;
	end
	else
	begin
		wr_trig_d <= {wr_trig_d[1:0], wr_trig};
 
	  if (iEN_W)
	  begin
		  if (wr_addr_max)
		    oADDR_W <= 11'd0;
		  else
		    oADDR_W <= oADDR_W + 11'd1;
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
	  	  
	  	if (rd_addr_max || rd_addr1 || rd_addr2 || rd_addr3 || rd_addr4 ||
	  		  rd_addr5 || rd_addr6 || rd_addr7 || rd_addr8 || rd_addr9)
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