module  i2c_touch_config(

 clk_i ,
 rst_i  ,
 
 oREG_X1,
 oREG_Y1,
 oREG_X2,
 oREG_Y2,
 
 oREG_GESTURE,
 oREADY,
 
 I2C_SDAT,
 I2C_SCLK,
 touch_int_n
); 

	input         clk_i;     // master clock input
	input         rst_i;       // asynchronous reset
   
	output [9:0] oREG_X1,oREG_X2;
	output [8:0] oREG_Y1,oREG_Y2;
	
	output [7:0]  oREG_GESTURE;
	output  reg   oREADY;

	input         touch_int_n;
   output        I2C_SCLK;
   inout         I2C_SDAT;	
	
	//////////////////////
   wire   scl_pad_i;
   wire   scl_pad_o;
   wire   scl_padoen_o;

   assign scl_pad_i = I2C_SCLK;
   assign I2C_SCLK = scl_padoen_o ? 1'bZ : scl_pad_o;

   wire   sda_pad_i;
   wire   sda_pad_o;
   wire   sda_padoen_o;

   assign sda_pad_i = I2C_SDAT;
   assign I2C_SDAT = sda_padoen_o ? 1'bZ : sda_pad_o;
	
	// registers
	wire  [15:0] prer; // clock prescale register
	reg  [ 7:0] ctr;  // control register
	reg  [ 7:0] txr;  // transmit register
   wire [ 7:0] rxr;  // receive register
	reg  [ 7:0] cr;   // command register
  // done signal: command completed, clear command register
	wire done;
  // core enable signal
	wire core_en;
  // status register signals
	wire irxack;
	wire i2c_busy;    // bus busy (start signal detected)
	wire i2c_al;      // i2c bus arbitration lost
	reg [7:0] read_data [0:31]/*synthesis noprune*/;
	
	assign prer=16'h18;
   assign core_en = 1'b1;	

  // decode command register
	wire sta  = cr[7];
	wire sto  = cr[6];
	wire rd   = cr[5];
	wire wr   = cr[4];
   wire iack = cr[3];
	wire ack  = cr[0];
	
assign  oREG_GESTURE=read_data[1]/*synthesis keep*/;
	
wire [15:0] X1,Y1,X2,Y2,X3,Y3,X4,Y4,X5,Y5;	
assign  X1={4'b0,read_data[3][3:0],read_data[4]};
assign  Y1={4'b0,read_data[5][3:0],read_data[6]};

assign  X2={4'b0,read_data[9][3:0],read_data[10]};
assign  Y2={4'b0,read_data[11][3:0],read_data[12]};

assign  X3={4'b0,read_data[15][3:0],read_data[16]};
assign  Y3={4'b0,read_data[17][3:0],read_data[18]};

assign  X4={4'b0,read_data[21][3:0],read_data[22]};
assign  Y4={4'b0,read_data[23][3:0],read_data[24]};

assign  X5={4'b0,read_data[27][3:0],read_data[28]};
assign  Y5={4'b0,read_data[29][3:0],read_data[30]};	
	
wire [15:0] mX1,mY1,mX2,mY2,rX1,rY1,rX2,rY2;
assign mY1=Y1<<2;
assign mY2=Y2<<2;
Ydivide divide1(
	.denom(3'd5),
	.numer(mY1),
	.quotient(rY1),
	);
Ydivide divide2(
	.denom(3'd5),
	.numer(mY2),
	.quotient(rY2),
	);
assign oREG_Y1=rY1[8:0];
assign oREG_Y2=rY2[8:0];	

Xmult mult1(
	.dataa(X1),
	.datab(5'd25),
	.result(mX1)
	);	
Xmult mult2(
	.dataa(X2),
	.datab(5'd25),
	.result(mX2)
	);	
assign	rX1=mX1>>5;
assign	rX2=mX2>>5;
assign   oREG_X1=rX1[9:0];
assign   oREG_X2=rX2[9:0];

 

	// hookup byte controller block
	i2c_master_byte_ctrl byte_controller (
		.clk      ( clk_i     ),
		.rst      ( 1'b0         ),
		.nReset   ( rst_i        ),
		.ena      ( core_en      ),
		.clk_cnt  ( prer         ),
		.start    ( sta          ),
		.stop     ( sto          ),
		.read     ( rd           ),
		.write    ( wr           ),
		.ack_in   ( ack          ),
		.din      ( txr          ),
		.cmd_ack  ( done         ),
		.ack_out  ( irxack       ),
		.dout     ( rxr          ),
		.i2c_busy ( i2c_busy     ),
		.i2c_al   ( i2c_al       ),
		.scl_i    ( scl_pad_i    ),
		.scl_o    ( scl_pad_o    ),
		.scl_oen  ( scl_padoen_o ),
		.sda_i    ( sda_pad_i    ),
		.sda_o    ( sda_pad_o    ),
		.sda_oen  ( sda_padoen_o )
	);
	
reg pre_touch_int_n;
wire int_n/*synthesis keep*/;

always @(posedge clk_i or negedge rst_i)
	  if (~rst_i)
	    pre_touch_int_n <=  1'b0;
	  else 
	    pre_touch_int_n <= touch_int_n;

		 
assign 	int_n=({pre_touch_int_n,touch_int_n}==2'b10)?1'b1:1'b0;



	reg [3:0] c_state/*synthesis noprune*/; 
	reg [9:0] cnt;
	reg [5:0] read_cnt; 
	reg       flag;
   reg [7:0] data_reg/*synthesis noprune*/;

	always @(posedge clk_i or negedge rst_i)
	  if (~rst_i)
	    begin
	        c_state  <=  4'b0;
			  cnt<=0;
			  read_cnt<=0;
			  flag<=0;
			  oREADY<=0;
		 end
     else
	    begin
           case (c_state) // synopsys full_case parallel_case
			  
	          0:begin
			        if(int_n)
			           begin
			             cnt<=0;  
			             read_cnt<=0;
				          flag<=1;
				          oREADY<=0;
				        end
				
			         if(flag==1)
			            begin
	                    if (cnt[6]==1)
	                       begin
					              cnt<=0;
					              flag<=0;
					              c_state<=1;
					           end
				           else
					           cnt<=cnt+1; 
		               end 
			      end
					
	          1: begin  //write device_address
				      txr<=8'h70;
						if(done | i2c_al)
					      begin
					        cr[7:1]<=7'h0;
					        c_state<=2;
					      end
					   else
					      cr<=8'h90;
			       end		  
					 
		        2:begin  //wait
				      if (cnt[6]==1)
	                  begin
					         cnt<=0;
					         c_state<=3;
					      end
					   else
					      cnt<=cnt+1;
			       end
					 
				  3:begin   //write sub_address
			         txr<=8'h00;
		            if(done | i2c_al)
					      begin
					        cr[7:1]<=7'h0;
					        c_state<=4;
					      end
					   else
					        cr<=8'h10;
			       end
				  
		        4: begin  //wait
				       if (cnt[6]==1)
	                   begin
					         cnt<=0;
					         c_state<=5;
					       end
					    else
					       cnt<=cnt+1;
		           end	
					  
		        5:	begin   //write address with read bit
				  		  txr<=8'h71;  
                    if(done | i2c_al)
					        begin
					          cr[7:1]<=7'h0;
					          c_state<= 6;
					        end
					     else
					        cr<=8'h90;
			         end			  
		
		        6:begin   //wait
				      if (cnt[5]==1)
	                  begin
					        cnt<=0;
					        if(read_cnt==6'd31)
						        begin
						          c_state<= 8 ;
							       read_cnt<= 0; 
							     end
					        else
					           c_state<=7;
					      end
					   else
					      cnt<=cnt+1;		  
			       end		
		         
				  7: begin   //read data
			           if(done | i2c_al)
					        begin
					           cr[7:1]<=7'h0;
						        read_data[read_cnt] <=rxr; //read
					           c_state<= 6 ;
							     read_cnt<=read_cnt+1; 
					        end
				        else 
					        begin
					           if(read_cnt==6'd30)
					              cr<=8'h21;
					           else
                             cr<=8'h20;
					        end
	              end
					  
	          8:begin   //stop  
          		   if(done | i2c_al)
					      begin
					         cr[7:1]<=7'h0;
					         c_state<= 0;
						      oREADY<=1;
					      end
					   else
					      cr<=8'h40; 
			      end	
			 
		       default:
	               c_state <= 0;

	     endcase
	 end			
			   
endmodule		            
	