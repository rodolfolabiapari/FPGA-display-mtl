module flash_controller (
    iRSTN,
		iCLK,
		iRY,
		iDATA,
		oCE_N,
		oOE_N,
		oADDR,
		oDATA,
		oDVALID
);

//============================================================================
// PARAMETER declarations
//============================================================================
parameter FILE_SIZE = 22'h34BC00;

//===========================================================================
// PORT declarations
//===========================================================================
input             iRSTN;
input		          iCLK;
input		          iRY;
input		    [7:0] iDATA;
output   		      oCE_N;
output   		      oOE_N;
output reg [21:0] oADDR;
output reg [31:0] oDATA;
output reg        oDVALID;
	
//=============================================================================
// Signal declarations
//=============================================================================
reg         [1:0] rstn_dly;
reg         [1:0] data_sel_count;
wire              data_sel_count_clr;
wire              addr_max;
wire              read_en;

//=============================================================================
// Structural coding
//=============================================================================
assign oCE_N = !rstn_dly[1] || addr_max;
assign oOE_N = !rstn_dly[1] || addr_max;
assign data_sel_count_clr = data_sel_count == 2'b10;
assign addr_max = oADDR == FILE_SIZE;
assign read_en = rstn_dly[1] && !addr_max && iRY;

always @ (posedge iCLK or negedge iRSTN)
begin
	if (!iRSTN)
	begin
  	rstn_dly <= 2'b0;
  	data_sel_count <= 2'b0;
  	oADDR <= 22'h0;
  	oDVALID <= 1'b0;
    oDATA[31:24] <= 8'b0;
  end
  else
  begin
  	rstn_dly <= {rstn_dly[0], 1'b1};
  
  	if (read_en)
  	begin 		
  		oADDR <= oADDR + 22'h1;
  		oDVALID <= data_sel_count_clr;
  		
  		if (data_sel_count_clr)
        data_sel_count <= 2'b0;
      else
      	data_sel_count <= data_sel_count + 2'b1;
   	
    	if (data_sel_count[1])
          oDATA[23:16] <= iDATA[7:0];
      else if (data_sel_count[0])
          oDATA[15:8] <= iDATA[7:0];
        else
          oDATA[7:0] <= iDATA[7:0];
    end
    else
    	oDVALID <= 1'b0;
  end
end
	
endmodule