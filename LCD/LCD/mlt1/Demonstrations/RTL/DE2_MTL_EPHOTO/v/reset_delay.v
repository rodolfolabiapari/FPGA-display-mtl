module	reset_delay(iRSTN, iCLK, oRSTN, oRD_RST, oRST);
input		    iRSTN;
input		    iCLK;
output  reg oRSTN;
output  reg oRD_RST;
output  reg oRST;
     
reg  [26:0] cont;


always @(posedge iCLK or negedge iRSTN)
  if (!iRSTN) 
  begin
    cont     <= 27'b0;
  end
  else
  begin 
  	if (!cont[26])    
      cont     <= cont + 27'b1;
      
    oRSTN <= |cont[26:20]; 
    oRD_RST <= cont[26:25] == 2'b01;      
    oRST <= !cont[26];  	
  end
endmodule