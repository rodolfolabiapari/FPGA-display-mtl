// megafunction wizard: %ALTFP_CONVERT%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: ALTFP_CONVERT 

// ============================================================
// File Name: fp2int.v
// Megafunction Name(s):
// 			ALTFP_CONVERT
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 10.1 Build 197 01/19/2011 SP 1 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2011 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altfp_convert CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone IV E" OPERATION="FLOAT2FIXED" ROUNDING="TO_NEAREST" WIDTH_DATA=32 WIDTH_EXP_INPUT=8 WIDTH_EXP_OUTPUT=8 WIDTH_INT=10 WIDTH_MAN_INPUT=23 WIDTH_MAN_OUTPUT=23 WIDTH_RESULT=17 clock dataa result
//VERSION_BEGIN 10.1SP1 cbx_altbarrel_shift 2011:01:19:21:13:40:SJ cbx_altfp_convert 2011:01:19:21:13:40:SJ cbx_altpriority_encoder 2011:01:19:21:13:40:SJ cbx_altsyncram 2011:01:19:21:13:40:SJ cbx_cycloneii 2011:01:19:21:13:40:SJ cbx_lpm_abs 2011:01:19:21:13:40:SJ cbx_lpm_add_sub 2011:01:19:21:13:40:SJ cbx_lpm_compare 2011:01:19:21:13:40:SJ cbx_lpm_decode 2011:01:19:21:13:40:SJ cbx_lpm_divide 2011:01:19:21:13:40:SJ cbx_lpm_mux 2011:01:19:21:13:40:SJ cbx_mgl 2011:01:19:21:15:40:SJ cbx_stratix 2011:01:19:21:13:40:SJ cbx_stratixii 2011:01:19:21:13:40:SJ cbx_stratixiii 2011:01:19:21:13:40:SJ cbx_stratixv 2011:01:19:21:13:40:SJ cbx_util_mgl 2011:01:19:21:13:40:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



//altbarrel_shift CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone IV E" PIPELINE=2 SHIFTDIR="VARIABLE" SHIFTTYPE="LOGICAL" WIDTH=39 WIDTHDIST=6 aclr clk_en clock data direction distance result
//VERSION_BEGIN 10.1SP1 cbx_altbarrel_shift 2011:01:19:21:13:40:SJ cbx_mgl 2011:01:19:21:15:40:SJ  VERSION_END

//synthesis_resources = reg 83 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fp2int_altbarrel_shift_1ch
	( 
	aclr,
	clk_en,
	clock,
	data,
	direction,
	distance,
	result) ;
	input   aclr;
	input   clk_en;
	input   clock;
	input   [38:0]  data;
	input   direction;
	input   [5:0]  distance;
	output   [38:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr;
	tri1   clk_en;
	tri0   clock;
	tri0   direction;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[1:0]	dir_pipe;
	reg	[38:0]	sbit_piper1d;
	reg	[38:0]	sbit_piper2d;
	reg	sel_pipec3r1d;
	reg	sel_pipec4r1d;
	reg	sel_pipec5r1d;
	wire  [6:0]  dir_w;
	wire  direction_w;
	wire  [31:0]  pad_w;
	wire  [272:0]  sbit_w;
	wire  [5:0]  sel_w;
	wire  [233:0]  smux_w;

	// synopsys translate_off
	initial
		dir_pipe = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dir_pipe <= 2'b0;
		else if  (clk_en == 1'b1)   dir_pipe <= {dir_w[5], dir_w[2]};
	// synopsys translate_off
	initial
		sbit_piper1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper1d <= 39'b0;
		else if  (clk_en == 1'b1)   sbit_piper1d <= smux_w[116:78];
	// synopsys translate_off
	initial
		sbit_piper2d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sbit_piper2d <= 39'b0;
		else if  (clk_en == 1'b1)   sbit_piper2d <= smux_w[233:195];
	// synopsys translate_off
	initial
		sel_pipec3r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec3r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec3r1d <= distance[3];
	// synopsys translate_off
	initial
		sel_pipec4r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec4r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec4r1d <= distance[4];
	// synopsys translate_off
	initial
		sel_pipec5r1d = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sel_pipec5r1d <= 1'b0;
		else if  (clk_en == 1'b1)   sel_pipec5r1d <= distance[5];
	assign
		dir_w = {dir_pipe[1], dir_w[4:3], dir_pipe[0], dir_w[1:0], direction_w},
		direction_w = direction,
		pad_w = {32{1'b0}},
		result = sbit_w[272:234],
		sbit_w = {sbit_piper2d, smux_w[194:117], sbit_piper1d, smux_w[77:0], data},
		sel_w = {sel_pipec5r1d, sel_pipec4r1d, sel_pipec3r1d, distance[2:0]},
		smux_w = {((({39{(sel_w[5] & (~ dir_w[5]))}} & {sbit_w[201:195], pad_w[31:0]}) | ({39{(sel_w[5] & dir_w[5])}} & {pad_w[31:0], sbit_w[233:227]})) | ({39{(~ sel_w[5])}} & sbit_w[233:195])), ((({39{(sel_w[4] & (~ dir_w[4]))}} & {sbit_w[178:156], pad_w[15:0]}) | ({39{(sel_w[4] & dir_w[4])}} & {pad_w[15:0], sbit_w[194:172]})) | ({39{(~ sel_w[4])}} & sbit_w[194:156])), ((({39{(sel_w[3] & (~ dir_w[3]))}} & {sbit_w[147:117], pad_w[7:0]}) | ({39{(sel_w[3] & dir_w[3])}} & {pad_w[7:0], sbit_w[155:125]})) | ({39{(~ sel_w[3])}} & sbit_w[155:117])), ((({39{(sel_w[2] & (~ dir_w[2]))}} & {sbit_w[112:78], pad_w[3:0]}) | ({39{(sel_w[2] & dir_w[2])}} & {pad_w[3:0], sbit_w[116:82]})) | ({39{(~ sel_w[2])}} & sbit_w[116:78])), ((({39{(sel_w[1] & (~ dir_w[1]))}} & {sbit_w[75:39], pad_w[1:0]}) | ({39{(sel_w[1] & dir_w[1])}} & {pad_w[1:0], sbit_w[77:41]})) | ({39{(~ sel_w[1])}} & sbit_w[77:39])), ((({39{(sel_w[0] & (~ dir_w[0]))}} & {sbit_w[37:0], pad_w[0]}) | ({39{(sel_w[0] & dir_w[0])}} & {pad_w[0], sbit_w[38:1]})) | ({39{(~ sel_w[0])}} & sbit_w[38:0]))};
endmodule //fp2int_altbarrel_shift_1ch

//synthesis_resources = lpm_add_sub 6 lpm_compare 4 reg 222 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  fp2int_altfp_convert_p7n
	( 
	clock,
	dataa,
	result) ;
	input   clock;
	input   [31:0]  dataa;
	output   [16:0]  result;

	wire  [38:0]   wire_altbarrel_shift2_result;
	reg	[5:0]	added_power2_reg;
	reg	barrel_direction_negative_reg;
	reg	below_lower_limit3_reg1;
	reg	below_lower_limit3_reg2;
	reg	below_lower_limit3_reg3;
	reg	below_lower_limit3_reg4;
	reg	border_lower_limit_reg1;
	reg	border_lower_limit_reg2;
	reg	border_lower_limit_reg3;
	reg	border_lower_limit_reg4;
	reg	[31:0]	dataa_reg;
	reg	equal_upper_limit_reg1;
	reg	equal_upper_limit_reg2;
	reg	equal_upper_limit_reg3;
	reg	exceed_upper_limit_reg1;
	reg	exceed_upper_limit_reg2;
	reg	exceed_upper_limit_reg3;
	reg	exceed_upper_limit_reg4;
	reg	exp_and_reg1;
	reg	exp_and_reg2;
	reg	exp_and_reg3;
	reg	exp_and_reg4;
	reg	exp_or_reg1;
	reg	exp_or_reg2;
	reg	exp_or_reg3;
	reg	exp_or_reg4;
	reg	int_or1_reg1;
	reg	int_or2_reg1;
	reg	int_or_reg2;
	reg	int_or_reg3;
	reg	[16:0]	integer_result_reg;
	reg	[15:0]	integer_rounded_reg;
	reg	man_or1_reg1;
	reg	man_or2_reg1;
	reg	man_or_reg2;
	reg	man_or_reg3;
	reg	man_or_reg4;
	reg	[22:0]	mantissa_input_reg;
	reg	max_shift_exceeder_reg;
	reg	max_shift_reg;
	reg	[5:0]	power2_value_reg;
	reg	sign_input_reg1;
	reg	sign_input_reg2;
	reg	sign_input_reg3;
	reg	sign_input_reg4;
	wire  wire_add_1_adder_cout;
	wire  [15:0]   wire_add_1_adder_result;
	wire  [5:0]   wire_add_sub1_result;
	wire  wire_add_sub3_cout;
	wire  [7:0]   wire_add_sub3_result;
	wire  [7:0]   wire_add_sub4_result;
	wire  [5:0]   wire_barrel_direction_invert_result;
	wire  wire_power2_value_overflow;
	wire  [7:0]   wire_power2_value_result;
	wire  wire_below_lower_limit1_aeb;
	wire  wire_below_lower_limit2_aeb;
	wire  wire_exceed_upper_limit_aeb;
	wire  wire_exceed_upper_limit_agb;
	wire  wire_max_shift_compare_agb;
	wire aclr;
	wire  add_1_cout_w;
	wire  add_1_w;
	wire  [16:0]  all_zeroes_w;
	wire  barrel_direction_negative;
	wire  [38:0]  barrel_mantissa_input;
	wire  [14:0]  barrel_zero_padding_w;
	wire  below_limit_exceeders;
	wire  [16:0]  below_limit_integer;
	wire  [7:0]  below_lower_limit3_anding;
	wire  [1:0]  below_lower_limit3_oring;
	wire  below_lower_limit3_w;
	wire  [7:0]  bias_value_less_1_w;
	wire clk_en;
	wire  [7:0]  const_bias_value_add_width_res_w;
	wire  denormal_input_w;
	wire  equal_upper_limit_w;
	wire  exceed_limit_exceeders;
	wire  [16:0]  exceed_limit_integer;
	wire  exceed_upper_limit_w;
	wire  [7:0]  exp_and;
	wire  exp_and_w;
	wire  [7:0]  exp_bus;
	wire  [7:0]  exp_or;
	wire  exp_or_w;
	wire  [7:0]  exponent_input;
	wire  guard_bit_w;
	wire  [23:0]  implied_mantissa_input;
	wire  infinity_input_w;
	wire  [16:0]  infinity_value_w;
	wire  int_or1_w;
	wire  int_or2_w;
	wire  [16:0]  integer_output;
	wire  [15:0]  integer_post_round;
	wire  [15:0]  integer_pre_round;
	wire  [16:0]  integer_result;
	wire  [15:0]  integer_rounded;
	wire  [15:0]  integer_rounded_tmp;
	wire  [15:0]  integer_tmp_output;
	wire  [7:0]  inv_add_1_adder1_w;
	wire  [7:0]  inv_add_1_adder2_w;
	wire  [15:0]  inv_integer;
	wire  [38:0]  lbarrel_shift_result_w;
	wire  [15:0]  lbarrel_shift_w;
	wire  lowest_integer_selector;
	wire  [15:0]  lowest_integer_value;
	wire  [10:0]  man_bus1;
	wire  [11:0]  man_bus2;
	wire  [10:0]  man_or1;
	wire  man_or1_w;
	wire  [11:0]  man_or2;
	wire  man_or2_w;
	wire  man_or_w;
	wire  [22:0]  mantissa_input;
	wire  max_shift_reg_w;
	wire  [5:0]  max_shift_w;
	wire  more_than_max_shift_w;
	wire  nan_input_w;
	wire  [16:0]  neg_infi_w;
	wire  [7:0]  padded_exponent_input;
	wire  [16:0]  pos_infi_w;
	wire  power2_value_overflow_w;
	wire  [5:0]  power2_value_w;
	wire  [16:0]  result_w;
	wire  round_bit_w;
	wire  [7:0]  shift_value_w;
	wire  sign_input;
	wire  sign_input_w;
	wire  [15:0]  signed_integer;
	wire  sticky_bit_w;
	wire  [21:0]  sticky_bus;
	wire  [21:0]  sticky_or;
	wire  [15:0]  unsigned_integer;
	wire  upper_limit_w;
	wire  zero_input_w;

	fp2int_altbarrel_shift_1ch   altbarrel_shift2
	( 
	.aclr(aclr),
	.clk_en(clk_en),
	.clock(clock),
	.data(barrel_mantissa_input),
	.direction(barrel_direction_negative),
	.distance((({6{barrel_direction_negative}} & wire_barrel_direction_invert_result) | ({6{(~ barrel_direction_negative)}} & power2_value_reg))),
	.result(wire_altbarrel_shift2_result));
	// synopsys translate_off
	initial
		added_power2_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) added_power2_reg <= 6'b0;
		else if  (clk_en == 1'b1)   added_power2_reg <= wire_add_sub1_result;
	// synopsys translate_off
	initial
		barrel_direction_negative_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) barrel_direction_negative_reg <= 1'b0;
		else if  (clk_en == 1'b1)   barrel_direction_negative_reg <= wire_power2_value_result[7];
	// synopsys translate_off
	initial
		below_lower_limit3_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit3_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit3_reg1 <= below_lower_limit3_w;
	// synopsys translate_off
	initial
		below_lower_limit3_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit3_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit3_reg2 <= below_lower_limit3_reg1;
	// synopsys translate_off
	initial
		below_lower_limit3_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit3_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit3_reg3 <= below_lower_limit3_reg2;
	// synopsys translate_off
	initial
		below_lower_limit3_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) below_lower_limit3_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   below_lower_limit3_reg4 <= below_lower_limit3_reg3;
	// synopsys translate_off
	initial
		border_lower_limit_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) border_lower_limit_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   border_lower_limit_reg1 <= wire_below_lower_limit2_aeb;
	// synopsys translate_off
	initial
		border_lower_limit_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) border_lower_limit_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   border_lower_limit_reg2 <= border_lower_limit_reg1;
	// synopsys translate_off
	initial
		border_lower_limit_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) border_lower_limit_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   border_lower_limit_reg3 <= border_lower_limit_reg2;
	// synopsys translate_off
	initial
		border_lower_limit_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) border_lower_limit_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   border_lower_limit_reg4 <= border_lower_limit_reg3;
	// synopsys translate_off
	initial
		dataa_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) dataa_reg <= 32'b0;
		else if  (clk_en == 1'b1)   dataa_reg <= dataa;
	// synopsys translate_off
	initial
		equal_upper_limit_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) equal_upper_limit_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   equal_upper_limit_reg1 <= equal_upper_limit_w;
	// synopsys translate_off
	initial
		equal_upper_limit_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) equal_upper_limit_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   equal_upper_limit_reg2 <= equal_upper_limit_reg1;
	// synopsys translate_off
	initial
		equal_upper_limit_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) equal_upper_limit_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   equal_upper_limit_reg3 <= equal_upper_limit_reg2;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg1 <= exceed_upper_limit_w;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg2 <= exceed_upper_limit_reg1;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg3 <= exceed_upper_limit_reg2;
	// synopsys translate_off
	initial
		exceed_upper_limit_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exceed_upper_limit_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   exceed_upper_limit_reg4 <= upper_limit_w;
	// synopsys translate_off
	initial
		exp_and_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg1 <= exp_and_w;
	// synopsys translate_off
	initial
		exp_and_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg2 <= exp_and_reg1;
	// synopsys translate_off
	initial
		exp_and_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg3 <= exp_and_reg2;
	// synopsys translate_off
	initial
		exp_and_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_and_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_and_reg4 <= exp_and_reg3;
	// synopsys translate_off
	initial
		exp_or_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg1 <= exp_or_w;
	// synopsys translate_off
	initial
		exp_or_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg2 <= exp_or_reg1;
	// synopsys translate_off
	initial
		exp_or_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg3 <= exp_or_reg2;
	// synopsys translate_off
	initial
		exp_or_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) exp_or_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   exp_or_reg4 <= exp_or_reg3;
	// synopsys translate_off
	initial
		int_or1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or1_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or1_reg1 <= int_or1_w;
	// synopsys translate_off
	initial
		int_or2_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or2_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or2_reg1 <= int_or2_w;
	// synopsys translate_off
	initial
		int_or_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or_reg2 <= (int_or1_reg1 | int_or2_reg1);
	// synopsys translate_off
	initial
		int_or_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) int_or_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   int_or_reg3 <= int_or_reg2;
	// synopsys translate_off
	initial
		integer_result_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) integer_result_reg <= 17'b0;
		else if  (clk_en == 1'b1)   integer_result_reg <= integer_result;
	// synopsys translate_off
	initial
		integer_rounded_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) integer_rounded_reg <= 16'b0;
		else if  (clk_en == 1'b1)   integer_rounded_reg <= integer_rounded;
	// synopsys translate_off
	initial
		man_or1_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or1_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or1_reg1 <= man_or1_w;
	// synopsys translate_off
	initial
		man_or2_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or2_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or2_reg1 <= man_or2_w;
	// synopsys translate_off
	initial
		man_or_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or_reg2 <= man_or_w;
	// synopsys translate_off
	initial
		man_or_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or_reg3 <= man_or_reg2;
	// synopsys translate_off
	initial
		man_or_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) man_or_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   man_or_reg4 <= man_or_reg3;
	// synopsys translate_off
	initial
		mantissa_input_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) mantissa_input_reg <= 23'b0;
		else if  (clk_en == 1'b1)   mantissa_input_reg <= mantissa_input;
	// synopsys translate_off
	initial
		max_shift_exceeder_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) max_shift_exceeder_reg <= 1'b0;
		else if  (clk_en == 1'b1)   max_shift_exceeder_reg <= more_than_max_shift_w;
	// synopsys translate_off
	initial
		max_shift_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) max_shift_reg <= 1'b0;
		else if  (clk_en == 1'b1)   max_shift_reg <= wire_max_shift_compare_agb;
	// synopsys translate_off
	initial
		power2_value_reg = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) power2_value_reg <= 6'b0;
		else if  (clk_en == 1'b1)   power2_value_reg <= power2_value_w;
	// synopsys translate_off
	initial
		sign_input_reg1 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg1 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg1 <= sign_input;
	// synopsys translate_off
	initial
		sign_input_reg2 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg2 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg2 <= sign_input_reg1;
	// synopsys translate_off
	initial
		sign_input_reg3 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg3 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg3 <= sign_input_reg2;
	// synopsys translate_off
	initial
		sign_input_reg4 = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) sign_input_reg4 <= 1'b0;
		else if  (clk_en == 1'b1)   sign_input_reg4 <= sign_input_reg3;
	lpm_add_sub   add_1_adder
	( 
	.cout(wire_add_1_adder_cout),
	.dataa(integer_pre_round),
	.datab(16'b0000000000000001),
	.overflow(),
	.result(wire_add_1_adder_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_1_adder.lpm_direction = "ADD",
		add_1_adder.lpm_width = 16,
		add_1_adder.lpm_type = "lpm_add_sub",
		add_1_adder.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub1
	( 
	.cout(),
	.dataa(power2_value_reg),
	.datab(6'b000001),
	.overflow(),
	.result(wire_add_sub1_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub1.lpm_direction = "ADD",
		add_sub1.lpm_width = 6,
		add_sub1.lpm_type = "lpm_add_sub",
		add_sub1.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub3
	( 
	.cout(wire_add_sub3_cout),
	.dataa(inv_integer[7:0]),
	.datab(8'b00000001),
	.overflow(),
	.result(wire_add_sub3_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub3.lpm_direction = "ADD",
		add_sub3.lpm_width = 8,
		add_sub3.lpm_type = "lpm_add_sub",
		add_sub3.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   add_sub4
	( 
	.cout(),
	.dataa(inv_integer[15:8]),
	.datab(8'b00000001),
	.overflow(),
	.result(wire_add_sub4_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		add_sub4.lpm_direction = "ADD",
		add_sub4.lpm_width = 8,
		add_sub4.lpm_type = "lpm_add_sub",
		add_sub4.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   barrel_direction_invert
	( 
	.cout(),
	.dataa({6{1'b0}}),
	.datab(power2_value_reg),
	.overflow(),
	.result(wire_barrel_direction_invert_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		barrel_direction_invert.lpm_direction = "SUB",
		barrel_direction_invert.lpm_width = 6,
		barrel_direction_invert.lpm_type = "lpm_add_sub",
		barrel_direction_invert.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_add_sub   power2_value
	( 
	.cout(),
	.dataa(exponent_input),
	.datab(shift_value_w),
	.overflow(wire_power2_value_overflow),
	.result(wire_power2_value_result)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.add_sub(1'b1),
	.cin(),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		power2_value.lpm_direction = "SUB",
		power2_value.lpm_representation = "UNSIGNED",
		power2_value.lpm_width = 8,
		power2_value.lpm_type = "lpm_add_sub",
		power2_value.lpm_hint = "ONE_INPUT_IS_CONSTANT=YES";
	lpm_compare   below_lower_limit1
	( 
	.aeb(wire_below_lower_limit1_aeb),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(exponent_input),
	.datab(bias_value_less_1_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		below_lower_limit1.lpm_representation = "UNSIGNED",
		below_lower_limit1.lpm_width = 8,
		below_lower_limit1.lpm_type = "lpm_compare";
	lpm_compare   below_lower_limit2
	( 
	.aeb(wire_below_lower_limit2_aeb),
	.agb(),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(exponent_input),
	.datab(shift_value_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		below_lower_limit2.lpm_representation = "UNSIGNED",
		below_lower_limit2.lpm_width = 8,
		below_lower_limit2.lpm_type = "lpm_compare";
	lpm_compare   exceed_upper_limit
	( 
	.aeb(wire_exceed_upper_limit_aeb),
	.agb(wire_exceed_upper_limit_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(padded_exponent_input),
	.datab(const_bias_value_add_width_res_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		exceed_upper_limit.lpm_representation = "UNSIGNED",
		exceed_upper_limit.lpm_width = 8,
		exceed_upper_limit.lpm_type = "lpm_compare";
	lpm_compare   max_shift_compare
	( 
	.aeb(),
	.agb(wire_max_shift_compare_agb),
	.ageb(),
	.alb(),
	.aleb(),
	.aneb(),
	.dataa(added_power2_reg),
	.datab(max_shift_w)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	.clock(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		max_shift_compare.lpm_representation = "SIGNED",
		max_shift_compare.lpm_width = 6,
		max_shift_compare.lpm_type = "lpm_compare";
	assign
		aclr = 1'b0,
		add_1_cout_w = ((wire_add_1_adder_cout & add_1_w) & (~ sign_input_reg3)),
		add_1_w = (round_bit_w & (guard_bit_w | sticky_bit_w)),
		all_zeroes_w = {1'b0, {16{1'b0}}},
		barrel_direction_negative = barrel_direction_negative_reg,
		barrel_mantissa_input = {barrel_zero_padding_w, implied_mantissa_input},
		barrel_zero_padding_w = {15{1'b0}},
		below_limit_exceeders = ((((denormal_input_w | zero_input_w) | nan_input_w) | below_lower_limit3_reg4) & (~ border_lower_limit_reg4)),
		below_limit_integer = (({17{(~ below_limit_exceeders)}} & integer_output) | ({17{below_limit_exceeders}} & all_zeroes_w)),
		below_lower_limit3_anding = {(below_lower_limit3_anding[6] & wire_power2_value_result[7]), (below_lower_limit3_anding[5] & wire_power2_value_result[6]), (below_lower_limit3_anding[4] & wire_power2_value_result[5]), (below_lower_limit3_anding[3] & wire_power2_value_result[4]), (below_lower_limit3_anding[2] & wire_power2_value_result[3]), (below_lower_limit3_anding[1] & wire_power2_value_result[2]), (below_lower_limit3_anding[0] & wire_power2_value_result[1]), wire_power2_value_result[0]},
		below_lower_limit3_oring = {(below_lower_limit3_oring[0] | wire_power2_value_result[7]), wire_power2_value_result[6]},
		below_lower_limit3_w = (((wire_power2_value_result[7] & below_lower_limit3_oring[1]) | power2_value_overflow_w) & (~ below_lower_limit3_anding[7])),
		bias_value_less_1_w = 8'b01111110,
		clk_en = 1'b1,
		const_bias_value_add_width_res_w = 8'b10001000,
		denormal_input_w = ((~ exp_or_reg4) & man_or_reg4),
		equal_upper_limit_w = wire_exceed_upper_limit_aeb,
		exceed_limit_exceeders = (((infinity_input_w | max_shift_exceeder_reg) | exceed_upper_limit_reg4) & (~ nan_input_w)),
		exceed_limit_integer = (({17{(~ exceed_limit_exceeders)}} & below_limit_integer) | ({17{exceed_limit_exceeders}} & infinity_value_w)),
		exceed_upper_limit_w = wire_exceed_upper_limit_agb,
		exp_and = {(exp_and[6] & exp_bus[7]), (exp_and[5] & exp_bus[6]), (exp_and[4] & exp_bus[5]), (exp_and[3] & exp_bus[4]), (exp_and[2] & exp_bus[3]), (exp_and[1] & exp_bus[2]), (exp_and[0] & exp_bus[1]), exp_bus[0]},
		exp_and_w = exp_and[7],
		exp_bus = exponent_input,
		exp_or = {(exp_or[6] | exp_bus[7]), (exp_or[5] | exp_bus[6]), (exp_or[4] | exp_bus[5]), (exp_or[3] | exp_bus[4]), (exp_or[2] | exp_bus[3]), (exp_or[1] | exp_bus[2]), (exp_or[0] | exp_bus[1]), exp_bus[0]},
		exp_or_w = exp_or[7],
		exponent_input = dataa_reg[30:23],
		guard_bit_w = wire_altbarrel_shift2_result[23],
		implied_mantissa_input = {1'b1, mantissa_input_reg},
		infinity_input_w = (exp_and_reg4 & (~ man_or_reg4)),
		infinity_value_w = (({17{(~ sign_input_w)}} & pos_infi_w) | ({17{sign_input_w}} & neg_infi_w)),
		int_or1_w = man_or2[0],
		int_or2_w = man_or1[7],
		integer_output = {sign_input_w, integer_tmp_output},
		integer_post_round = wire_add_1_adder_result,
		integer_pre_round = lbarrel_shift_w,
		integer_result = exceed_limit_integer,
		integer_rounded = (({16{(~ lowest_integer_selector)}} & integer_rounded_tmp) | ({16{lowest_integer_selector}} & lowest_integer_value)),
		integer_rounded_tmp = (({16{(~ add_1_w)}} & integer_pre_round) | ({16{add_1_w}} & integer_post_round)),
		integer_tmp_output = (({16{(~ sign_input_w)}} & unsigned_integer) | ({16{sign_input_w}} & signed_integer)),
		inv_add_1_adder1_w = wire_add_sub3_result,
		inv_add_1_adder2_w = (({8{(~ wire_add_sub3_cout)}} & inv_integer[15:8]) | ({8{wire_add_sub3_cout}} & wire_add_sub4_result)),
		inv_integer = (~ integer_rounded_reg),
		lbarrel_shift_result_w = wire_altbarrel_shift2_result,
		lbarrel_shift_w = lbarrel_shift_result_w[38:23],
		lowest_integer_selector = 1'b0,
		lowest_integer_value = {barrel_zero_padding_w, 1'b1},
		man_bus1 = mantissa_input[10:0],
		man_bus2 = mantissa_input[22:11],
		man_or1 = {man_bus1[10], (man_or1[10] | man_bus1[9]), (man_or1[9] | man_bus1[8]), (man_or1[8] | man_bus1[7]), (man_or1[7] | man_bus1[6]), (man_or1[6] | man_bus1[5]), (man_or1[5] | man_bus1[4]), (man_or1[4] | man_bus1[3]), (man_or1[3] | man_bus1[2]), (man_or1[2] | man_bus1[1]), (man_or1[1] | man_bus1[0])},
		man_or1_w = man_or1[0],
		man_or2 = {man_bus2[11], (man_or2[11] | man_bus2[10]), (man_or2[10] | man_bus2[9]), (man_or2[9] | man_bus2[8]), (man_or2[8] | man_bus2[7]), (man_or2[7] | man_bus2[6]), (man_or2[6] | man_bus2[5]), (man_or2[5] | man_bus2[4]), (man_or2[4] | man_bus2[3]), (man_or2[3] | man_bus2[2]), (man_or2[2] | man_bus2[1]), (man_or2[1] | man_bus2[0])},
		man_or2_w = man_or2[0],
		man_or_w = (man_or1_reg1 | man_or2_reg1),
		mantissa_input = dataa_reg[22:0],
		max_shift_reg_w = max_shift_reg,
		max_shift_w = 6'b001000,
		more_than_max_shift_w = (max_shift_reg_w & add_1_cout_w),
		nan_input_w = (exp_and_reg4 & man_or_reg4),
		neg_infi_w = {1'b1, {16{1'b0}}},
		padded_exponent_input = exponent_input,
		pos_infi_w = {1'b0, {16{1'b1}}},
		power2_value_overflow_w = wire_power2_value_overflow,
		power2_value_w = wire_power2_value_result[5:0],
		result = result_w,
		result_w = integer_result_reg,
		round_bit_w = wire_altbarrel_shift2_result[22],
		shift_value_w = 8'b01111000,
		sign_input = dataa_reg[31],
		sign_input_w = sign_input_reg4,
		signed_integer = {inv_add_1_adder2_w, inv_add_1_adder1_w},
		sticky_bit_w = sticky_or[21],
		sticky_bus = wire_altbarrel_shift2_result[21:0],
		sticky_or = {(sticky_or[20] | sticky_bus[21]), (sticky_or[19] | sticky_bus[20]), (sticky_or[18] | sticky_bus[19]), (sticky_or[17] | sticky_bus[18]), (sticky_or[16] | sticky_bus[17]), (sticky_or[15] | sticky_bus[16]), (sticky_or[14] | sticky_bus[15]), (sticky_or[13] | sticky_bus[14]), (sticky_or[12] | sticky_bus[13]), (sticky_or[11] | sticky_bus[12]), (sticky_or[10] | sticky_bus[11]), (sticky_or[9] | sticky_bus[10]), (sticky_or[8] | sticky_bus[9]), (sticky_or[7] | sticky_bus[8]), (sticky_or[6] | sticky_bus[7]), (sticky_or[5] | sticky_bus[6]), (sticky_or[4] | sticky_bus[5]), (sticky_or[3] | sticky_bus[4]), (sticky_or[2] | sticky_bus[3]), (sticky_or[1] | sticky_bus[2]), (sticky_or[0] | sticky_bus[1]), sticky_bus[0]},
		unsigned_integer = integer_rounded_reg,
		upper_limit_w = (((~ sign_input_reg3) & (exceed_upper_limit_reg3 | equal_upper_limit_reg3)) | (sign_input_reg3 & (exceed_upper_limit_reg3 | (equal_upper_limit_reg3 & (int_or_reg3 | add_1_w))))),
		zero_input_w = ((~ exp_or_reg4) & (~ man_or_reg4));
endmodule //fp2int_altfp_convert_p7n
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module fp2int (
	clock,
	dataa,
	result);

	input	  clock;
	input	[31:0]  dataa;
	output	[16:0]  result;

	wire [16:0] sub_wire0;
	wire [16:0] result = sub_wire0[16:0];

	fp2int_altfp_convert_p7n	fp2int_altfp_convert_p7n_component (
				.clock (clock),
				.dataa (dataa),
				.result (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: LPM_HINT STRING "UNUSED"
// Retrieval info: CONSTANT: LPM_TYPE STRING "altfp_convert"
// Retrieval info: CONSTANT: OPERATION STRING "FLOAT2FIXED"
// Retrieval info: CONSTANT: ROUNDING STRING "TO_NEAREST"
// Retrieval info: CONSTANT: WIDTH_DATA NUMERIC "32"
// Retrieval info: CONSTANT: WIDTH_EXP_INPUT NUMERIC "8"
// Retrieval info: CONSTANT: WIDTH_EXP_OUTPUT NUMERIC "8"
// Retrieval info: CONSTANT: WIDTH_INT NUMERIC "10"
// Retrieval info: CONSTANT: WIDTH_MAN_INPUT NUMERIC "23"
// Retrieval info: CONSTANT: WIDTH_MAN_OUTPUT NUMERIC "23"
// Retrieval info: CONSTANT: WIDTH_RESULT NUMERIC "17"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: USED_PORT: dataa 0 0 32 0 INPUT NODEFVAL "dataa[31..0]"
// Retrieval info: CONNECT: @dataa 0 0 32 0 dataa 0 0 32 0
// Retrieval info: USED_PORT: result 0 0 17 0 OUTPUT NODEFVAL "result[16..0]"
// Retrieval info: CONNECT: result 0 0 17 0 @result 0 0 17 0
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int.v TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int.qip TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int.bsf FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int_inst.v FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int_bb.v FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int.inc FALSE TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL fp2int.cmp FALSE TRUE
// Retrieval info: LIB_FILE: lpm
