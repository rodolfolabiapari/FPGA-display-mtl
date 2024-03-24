module factor_acc_hor ( // 2T
	iRSTN,
	iCLK,					
	iEN,
	iFACTOR,
	oLATCH,
	oEN,
	oWEIGHT
);

//===========================================================================
// PORT declarations
//===========================================================================
input 		        iRSTN, iCLK, iEN;
input      [7:0]  iFACTOR;
output            oLATCH;
output            oEN;
output reg [6:0]  oWEIGHT;


///////////////////////////////////////////////////////////////////
//=============================================================================
// REG/WIRE declarations
//=============================================================================
reg        [4:0]  en_d;
wire       [7:0]  factor_acc_temp;
reg        [7:0]  factor_acc;
reg        [6:0]  weight_pre3t, weight_pre2t, weight_pre1t;
reg               new;

//=============================================================================
// Structural coding
//=============================================================================
assign oLATCH = (!en_d[1]||new) && iEN;
assign oEN = en_d[4];
assign factor_acc_temp = factor_acc + iFACTOR;


always@(posedge iCLK or negedge iRSTN)
	if(!iRSTN)
	begin
		en_d <= 5'b0;
	  factor_acc <= 8'b0;
	  new <= 1'b0;
	end
	else
	begin
		en_d <= {en_d[3:0],iEN};
	  weight_pre3t <= factor_acc;
	  weight_pre2t <= weight_pre3t;
	  weight_pre1t <= weight_pre2t;
	  oWEIGHT <= weight_pre1t;
		
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

endmodule