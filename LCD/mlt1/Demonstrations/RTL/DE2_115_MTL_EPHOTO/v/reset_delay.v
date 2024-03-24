module	reset_delay(iRSTN, iCLK, oRSTN, oRD_RST, oRST);
input		    iRSTN;
input		    iCLK;
output      oRSTN;
output      oRD_RST;
output      oRST;
     
reg  [26:0] cont;

assign oRSTN = |cont[26:20]; 
assign oRD_RST = cont[26:25] == 2'b01;      
assign oRST = !cont[26];  	

always @(posedge iCLK or negedge iRSTN)
  if (!iRSTN) 
    cont     <= 27'b0;
  else if (!cont[26]) 
    cont     <= cont + 27'b1;
  
endmodule