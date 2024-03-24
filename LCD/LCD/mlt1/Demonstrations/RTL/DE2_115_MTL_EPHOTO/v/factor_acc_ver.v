module factor_acc_ver (
	iRSTN,
	iCLK,					
	iEN,
	iFACTOR,
	oLATCH,
	oEN0,
	oEN1,
	oWEIGHT
);

//===========================================================================
// PORT declarations
//===========================================================================
input 		        iRSTN, iCLK;
input      [2:0]  iEN;
input      [7:0]  iFACTOR;
output            oLATCH;
output            oEN0, oEN1;
output reg [6:0]  oWEIGHT;


///////////////////////////////////////////////////////////////////
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg        [1:0]  en_d;
wire       [7:0]  factor_acc_temp;
reg        [7:0]  factor_acc;
reg               new;
reg        [4:0]  latch_d;

//=============================================================================
// Structural coding
//=============================================================================
assign oLATCH = !iEN[2]&&iEN[0] || new;
assign oEN0 = latch_d[1];
assign oEN1 = latch_d[4];
assign factor_acc_temp = factor_acc + iFACTOR;


always@(posedge iCLK or negedge iRSTN)
	if(!iRSTN)
	begin
		en_d <= 2'b0;
		latch_d <= 5'b0;
	  factor_acc <= 8'b0;
	  new <= 1'b0;
	end
	else
	begin
		en_d <= iEN[1:0];
		latch_d <= {latch_d[3:0], oLATCH};
		
		if (!iEN[1] && en_d[1])
		begin
	    oWEIGHT <= factor_acc;
			if (en_d[0])
		  begin
		    factor_acc <= {1'b0, factor_acc_temp[6:0]};
		    new <= factor_acc_temp[7];
		  end
	    else
		  begin
		    factor_acc <= 7'b0;
		    new <= 1'b0;
		  end
		end			
	end

endmodule