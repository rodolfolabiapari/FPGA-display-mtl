//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module burstcount_fifo_for_MTL_SOPC_burst_0_upstream_module (
                                                              // inputs:
                                                               clear_fifo,
                                                               clk,
                                                               data_in,
                                                               read,
                                                               reset_n,
                                                               sync_reset,
                                                               write,

                                                              // outputs:
                                                               data_out,
                                                               empty,
                                                               fifo_contains_ones_n,
                                                               full
                                                            )
;

  output  [  5: 0] data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input   [  5: 0] data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire    [  5: 0] data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  wire             full_9;
  reg     [  4: 0] how_many_ones;
  wire    [  4: 0] one_count_minus_one;
  wire    [  4: 0] one_count_plus_one;
  wire             p0_full_0;
  wire    [  5: 0] p0_stage_0;
  wire             p1_full_1;
  wire    [  5: 0] p1_stage_1;
  wire             p2_full_2;
  wire    [  5: 0] p2_stage_2;
  wire             p3_full_3;
  wire    [  5: 0] p3_stage_3;
  wire             p4_full_4;
  wire    [  5: 0] p4_stage_4;
  wire             p5_full_5;
  wire    [  5: 0] p5_stage_5;
  wire             p6_full_6;
  wire    [  5: 0] p6_stage_6;
  wire             p7_full_7;
  wire    [  5: 0] p7_stage_7;
  wire             p8_full_8;
  wire    [  5: 0] p8_stage_8;
  reg     [  5: 0] stage_0;
  reg     [  5: 0] stage_1;
  reg     [  5: 0] stage_2;
  reg     [  5: 0] stage_3;
  reg     [  5: 0] stage_4;
  reg     [  5: 0] stage_5;
  reg     [  5: 0] stage_6;
  reg     [  5: 0] stage_7;
  reg     [  5: 0] stage_8;
  wire    [  4: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_8;
  assign empty = !full_0;
  assign full_9 = 0;
  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    0;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_alt_vip_vfr_0_avalon_master_to_MTL_SOPC_burst_0_upstream_module (
                                                                                      // inputs:
                                                                                       clear_fifo,
                                                                                       clk,
                                                                                       data_in,
                                                                                       read,
                                                                                       reset_n,
                                                                                       sync_reset,
                                                                                       write,

                                                                                      // outputs:
                                                                                       data_out,
                                                                                       empty,
                                                                                       fifo_contains_ones_n,
                                                                                       full
                                                                                    )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  wire             full_9;
  reg     [  4: 0] how_many_ones;
  wire    [  4: 0] one_count_minus_one;
  wire    [  4: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  wire    [  4: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_8;
  assign empty = !full_0;
  assign full_9 = 0;
  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    0;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_burst_0_upstream_arbitrator (
                                              // inputs:
                                               MTL_SOPC_burst_0_upstream_readdata,
                                               MTL_SOPC_burst_0_upstream_readdatavalid,
                                               MTL_SOPC_burst_0_upstream_waitrequest,
                                               alt_vip_vfr_0_avalon_master_address_to_slave,
                                               alt_vip_vfr_0_avalon_master_burstcount,
                                               alt_vip_vfr_0_avalon_master_latency_counter,
                                               alt_vip_vfr_0_avalon_master_read,
                                               clk,
                                               reset_n,

                                              // outputs:
                                               MTL_SOPC_burst_0_upstream_address,
                                               MTL_SOPC_burst_0_upstream_burstcount,
                                               MTL_SOPC_burst_0_upstream_byteaddress,
                                               MTL_SOPC_burst_0_upstream_byteenable,
                                               MTL_SOPC_burst_0_upstream_debugaccess,
                                               MTL_SOPC_burst_0_upstream_read,
                                               MTL_SOPC_burst_0_upstream_readdata_from_sa,
                                               MTL_SOPC_burst_0_upstream_waitrequest_from_sa,
                                               MTL_SOPC_burst_0_upstream_write,
                                               alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream,
                                               alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream,
                                               alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream,
                                               alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register,
                                               alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream,
                                               d1_MTL_SOPC_burst_0_upstream_end_xfer
                                            )
;

  output  [ 26: 0] MTL_SOPC_burst_0_upstream_address;
  output  [  5: 0] MTL_SOPC_burst_0_upstream_burstcount;
  output  [ 28: 0] MTL_SOPC_burst_0_upstream_byteaddress;
  output  [  3: 0] MTL_SOPC_burst_0_upstream_byteenable;
  output           MTL_SOPC_burst_0_upstream_debugaccess;
  output           MTL_SOPC_burst_0_upstream_read;
  output  [ 31: 0] MTL_SOPC_burst_0_upstream_readdata_from_sa;
  output           MTL_SOPC_burst_0_upstream_waitrequest_from_sa;
  output           MTL_SOPC_burst_0_upstream_write;
  output           alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream;
  output           alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream;
  output           alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream;
  output           alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register;
  output           alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream;
  output           d1_MTL_SOPC_burst_0_upstream_end_xfer;
  input   [ 31: 0] MTL_SOPC_burst_0_upstream_readdata;
  input            MTL_SOPC_burst_0_upstream_readdatavalid;
  input            MTL_SOPC_burst_0_upstream_waitrequest;
  input   [ 31: 0] alt_vip_vfr_0_avalon_master_address_to_slave;
  input   [  5: 0] alt_vip_vfr_0_avalon_master_burstcount;
  input            alt_vip_vfr_0_avalon_master_latency_counter;
  input            alt_vip_vfr_0_avalon_master_read;
  input            clk;
  input            reset_n;

  wire    [ 26: 0] MTL_SOPC_burst_0_upstream_address;
  wire             MTL_SOPC_burst_0_upstream_allgrants;
  wire             MTL_SOPC_burst_0_upstream_allow_new_arb_cycle;
  wire             MTL_SOPC_burst_0_upstream_any_bursting_master_saved_grant;
  wire             MTL_SOPC_burst_0_upstream_any_continuerequest;
  wire             MTL_SOPC_burst_0_upstream_arb_counter_enable;
  reg     [  5: 0] MTL_SOPC_burst_0_upstream_arb_share_counter;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_arb_share_counter_next_value;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_arb_share_set_values;
  reg     [  4: 0] MTL_SOPC_burst_0_upstream_bbt_burstcounter;
  wire             MTL_SOPC_burst_0_upstream_beginbursttransfer_internal;
  wire             MTL_SOPC_burst_0_upstream_begins_xfer;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_burstcount;
  wire             MTL_SOPC_burst_0_upstream_burstcount_fifo_empty;
  wire    [ 28: 0] MTL_SOPC_burst_0_upstream_byteaddress;
  wire    [  3: 0] MTL_SOPC_burst_0_upstream_byteenable;
  reg     [  5: 0] MTL_SOPC_burst_0_upstream_current_burst;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_current_burst_minus_one;
  wire             MTL_SOPC_burst_0_upstream_debugaccess;
  wire             MTL_SOPC_burst_0_upstream_end_xfer;
  wire             MTL_SOPC_burst_0_upstream_firsttransfer;
  wire             MTL_SOPC_burst_0_upstream_grant_vector;
  wire             MTL_SOPC_burst_0_upstream_in_a_read_cycle;
  wire             MTL_SOPC_burst_0_upstream_in_a_write_cycle;
  reg              MTL_SOPC_burst_0_upstream_load_fifo;
  wire             MTL_SOPC_burst_0_upstream_master_qreq_vector;
  wire             MTL_SOPC_burst_0_upstream_move_on_to_next_transaction;
  wire    [  4: 0] MTL_SOPC_burst_0_upstream_next_bbt_burstcount;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_next_burst_count;
  wire             MTL_SOPC_burst_0_upstream_non_bursting_master_requests;
  wire             MTL_SOPC_burst_0_upstream_read;
  wire    [ 31: 0] MTL_SOPC_burst_0_upstream_readdata_from_sa;
  wire             MTL_SOPC_burst_0_upstream_readdatavalid_from_sa;
  reg              MTL_SOPC_burst_0_upstream_reg_firsttransfer;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_selected_burstcount;
  reg              MTL_SOPC_burst_0_upstream_slavearbiterlockenable;
  wire             MTL_SOPC_burst_0_upstream_slavearbiterlockenable2;
  wire             MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_transaction_burst_count;
  wire             MTL_SOPC_burst_0_upstream_unreg_firsttransfer;
  wire             MTL_SOPC_burst_0_upstream_waitrequest_from_sa;
  wire             MTL_SOPC_burst_0_upstream_waits_for_read;
  wire             MTL_SOPC_burst_0_upstream_waits_for_write;
  wire             MTL_SOPC_burst_0_upstream_write;
  wire             alt_vip_vfr_0_avalon_master_arbiterlock;
  wire             alt_vip_vfr_0_avalon_master_arbiterlock2;
  wire             alt_vip_vfr_0_avalon_master_continuerequest;
  wire             alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_rdv_fifo_empty_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_rdv_fifo_output_from_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register;
  wire             alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_saved_grant_MTL_SOPC_burst_0_upstream;
  reg              d1_MTL_SOPC_burst_0_upstream_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p0_MTL_SOPC_burst_0_upstream_load_fifo;
  wire             wait_for_MTL_SOPC_burst_0_upstream_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~MTL_SOPC_burst_0_upstream_end_xfer;
    end


  assign MTL_SOPC_burst_0_upstream_begins_xfer = ~d1_reasons_to_wait & ((alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream));
  //assign MTL_SOPC_burst_0_upstream_readdata_from_sa = MTL_SOPC_burst_0_upstream_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_readdata_from_sa = MTL_SOPC_burst_0_upstream_readdata;

  assign alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream = (({alt_vip_vfr_0_avalon_master_address_to_slave[31 : 27] , 27'b0} == 32'h8000000) & (alt_vip_vfr_0_avalon_master_read)) & alt_vip_vfr_0_avalon_master_read;
  //assign MTL_SOPC_burst_0_upstream_waitrequest_from_sa = MTL_SOPC_burst_0_upstream_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_waitrequest_from_sa = MTL_SOPC_burst_0_upstream_waitrequest;

  //assign MTL_SOPC_burst_0_upstream_readdatavalid_from_sa = MTL_SOPC_burst_0_upstream_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_readdatavalid_from_sa = MTL_SOPC_burst_0_upstream_readdatavalid;

  //MTL_SOPC_burst_0_upstream_arb_share_counter set values, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_arb_share_set_values = 1;

  //MTL_SOPC_burst_0_upstream_non_bursting_master_requests mux, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_non_bursting_master_requests = 0;

  //MTL_SOPC_burst_0_upstream_any_bursting_master_saved_grant mux, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_any_bursting_master_saved_grant = alt_vip_vfr_0_avalon_master_saved_grant_MTL_SOPC_burst_0_upstream;

  //MTL_SOPC_burst_0_upstream_arb_share_counter_next_value assignment, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_arb_share_counter_next_value = MTL_SOPC_burst_0_upstream_firsttransfer ? (MTL_SOPC_burst_0_upstream_arb_share_set_values - 1) : |MTL_SOPC_burst_0_upstream_arb_share_counter ? (MTL_SOPC_burst_0_upstream_arb_share_counter - 1) : 0;

  //MTL_SOPC_burst_0_upstream_allgrants all slave grants, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_allgrants = |MTL_SOPC_burst_0_upstream_grant_vector;

  //MTL_SOPC_burst_0_upstream_end_xfer assignment, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_end_xfer = ~(MTL_SOPC_burst_0_upstream_waits_for_read | MTL_SOPC_burst_0_upstream_waits_for_write);

  //end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream = MTL_SOPC_burst_0_upstream_end_xfer & (~MTL_SOPC_burst_0_upstream_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //MTL_SOPC_burst_0_upstream_arb_share_counter arbitration counter enable, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_arb_counter_enable = (end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream & MTL_SOPC_burst_0_upstream_allgrants) | (end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream & ~MTL_SOPC_burst_0_upstream_non_bursting_master_requests);

  //MTL_SOPC_burst_0_upstream_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_upstream_arb_share_counter <= 0;
      else if (MTL_SOPC_burst_0_upstream_arb_counter_enable)
          MTL_SOPC_burst_0_upstream_arb_share_counter <= MTL_SOPC_burst_0_upstream_arb_share_counter_next_value;
    end


  //MTL_SOPC_burst_0_upstream_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_upstream_slavearbiterlockenable <= 0;
      else if ((|MTL_SOPC_burst_0_upstream_master_qreq_vector & end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream) | (end_xfer_arb_share_counter_term_MTL_SOPC_burst_0_upstream & ~MTL_SOPC_burst_0_upstream_non_bursting_master_requests))
          MTL_SOPC_burst_0_upstream_slavearbiterlockenable <= |MTL_SOPC_burst_0_upstream_arb_share_counter_next_value;
    end


  //alt_vip_vfr_0/avalon_master MTL_SOPC_burst_0/upstream arbiterlock, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_arbiterlock = MTL_SOPC_burst_0_upstream_slavearbiterlockenable & alt_vip_vfr_0_avalon_master_continuerequest;

  //MTL_SOPC_burst_0_upstream_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_slavearbiterlockenable2 = |MTL_SOPC_burst_0_upstream_arb_share_counter_next_value;

  //alt_vip_vfr_0/avalon_master MTL_SOPC_burst_0/upstream arbiterlock2, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_arbiterlock2 = MTL_SOPC_burst_0_upstream_slavearbiterlockenable2 & alt_vip_vfr_0_avalon_master_continuerequest;

  //MTL_SOPC_burst_0_upstream_any_continuerequest at least one master continues requesting, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_any_continuerequest = 1;

  //alt_vip_vfr_0_avalon_master_continuerequest continued request, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_continuerequest = 1;

  assign alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream = alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream & ~((alt_vip_vfr_0_avalon_master_read & ((alt_vip_vfr_0_avalon_master_latency_counter != 0) | (1 < alt_vip_vfr_0_avalon_master_latency_counter))));
  //unique name for MTL_SOPC_burst_0_upstream_move_on_to_next_transaction, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_move_on_to_next_transaction = MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst & MTL_SOPC_burst_0_upstream_load_fifo;

  //the currently selected burstcount for MTL_SOPC_burst_0_upstream, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_selected_burstcount = (alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream)? alt_vip_vfr_0_avalon_master_burstcount :
    1;

  //burstcount_fifo_for_MTL_SOPC_burst_0_upstream, which is an e_fifo_with_registered_outputs
  burstcount_fifo_for_MTL_SOPC_burst_0_upstream_module burstcount_fifo_for_MTL_SOPC_burst_0_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (MTL_SOPC_burst_0_upstream_selected_burstcount),
      .data_out             (MTL_SOPC_burst_0_upstream_transaction_burst_count),
      .empty                (MTL_SOPC_burst_0_upstream_burstcount_fifo_empty),
      .fifo_contains_ones_n (),
      .full                 (),
      .read                 (MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read & MTL_SOPC_burst_0_upstream_load_fifo & ~(MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst & MTL_SOPC_burst_0_upstream_burstcount_fifo_empty))
    );

  //MTL_SOPC_burst_0_upstream current burst minus one, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_current_burst_minus_one = MTL_SOPC_burst_0_upstream_current_burst - 1;

  //what to load in current_burst, for MTL_SOPC_burst_0_upstream, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_next_burst_count = (((in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read) & ~MTL_SOPC_burst_0_upstream_load_fifo))? MTL_SOPC_burst_0_upstream_selected_burstcount :
    ((in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read & MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst & MTL_SOPC_burst_0_upstream_burstcount_fifo_empty))? MTL_SOPC_burst_0_upstream_selected_burstcount :
    (MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst)? MTL_SOPC_burst_0_upstream_transaction_burst_count :
    MTL_SOPC_burst_0_upstream_current_burst_minus_one;

  //the current burst count for MTL_SOPC_burst_0_upstream, to be decremented, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_upstream_current_burst <= 0;
      else if (MTL_SOPC_burst_0_upstream_readdatavalid_from_sa | (~MTL_SOPC_burst_0_upstream_load_fifo & (in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read)))
          MTL_SOPC_burst_0_upstream_current_burst <= MTL_SOPC_burst_0_upstream_next_burst_count;
    end


  //a 1 or burstcount fifo empty, to initialize the counter, which is an e_mux
  assign p0_MTL_SOPC_burst_0_upstream_load_fifo = (~MTL_SOPC_burst_0_upstream_load_fifo)? 1 :
    (((in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read) & MTL_SOPC_burst_0_upstream_load_fifo))? 1 :
    ~MTL_SOPC_burst_0_upstream_burstcount_fifo_empty;

  //whether to load directly to the counter or to the fifo, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_upstream_load_fifo <= 0;
      else if ((in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read) & ~MTL_SOPC_burst_0_upstream_load_fifo | MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst)
          MTL_SOPC_burst_0_upstream_load_fifo <= p0_MTL_SOPC_burst_0_upstream_load_fifo;
    end


  //the last cycle in the burst for MTL_SOPC_burst_0_upstream, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_this_cycle_is_the_last_burst = ~(|MTL_SOPC_burst_0_upstream_current_burst_minus_one) & MTL_SOPC_burst_0_upstream_readdatavalid_from_sa;

  //rdv_fifo_for_alt_vip_vfr_0_avalon_master_to_MTL_SOPC_burst_0_upstream, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_alt_vip_vfr_0_avalon_master_to_MTL_SOPC_burst_0_upstream_module rdv_fifo_for_alt_vip_vfr_0_avalon_master_to_MTL_SOPC_burst_0_upstream
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream),
      .data_out             (alt_vip_vfr_0_avalon_master_rdv_fifo_output_from_MTL_SOPC_burst_0_upstream),
      .empty                (),
      .fifo_contains_ones_n (alt_vip_vfr_0_avalon_master_rdv_fifo_empty_MTL_SOPC_burst_0_upstream),
      .full                 (),
      .read                 (MTL_SOPC_burst_0_upstream_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~MTL_SOPC_burst_0_upstream_waits_for_read)
    );

  assign alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register = ~alt_vip_vfr_0_avalon_master_rdv_fifo_empty_MTL_SOPC_burst_0_upstream;
  //local readdatavalid alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream, which is an e_mux
  assign alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream = MTL_SOPC_burst_0_upstream_readdatavalid_from_sa;

  //byteaddress mux for MTL_SOPC_burst_0/upstream, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_byteaddress = alt_vip_vfr_0_avalon_master_address_to_slave;

  //master is always granted when requested
  assign alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream = alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream;

  //alt_vip_vfr_0/avalon_master saved-grant MTL_SOPC_burst_0/upstream, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_saved_grant_MTL_SOPC_burst_0_upstream = alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream;

  //allow new arb cycle for MTL_SOPC_burst_0/upstream, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign MTL_SOPC_burst_0_upstream_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign MTL_SOPC_burst_0_upstream_master_qreq_vector = 1;

  //MTL_SOPC_burst_0_upstream_firsttransfer first transaction, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_firsttransfer = MTL_SOPC_burst_0_upstream_begins_xfer ? MTL_SOPC_burst_0_upstream_unreg_firsttransfer : MTL_SOPC_burst_0_upstream_reg_firsttransfer;

  //MTL_SOPC_burst_0_upstream_unreg_firsttransfer first transaction, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_unreg_firsttransfer = ~(MTL_SOPC_burst_0_upstream_slavearbiterlockenable & MTL_SOPC_burst_0_upstream_any_continuerequest);

  //MTL_SOPC_burst_0_upstream_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_upstream_reg_firsttransfer <= 1'b1;
      else if (MTL_SOPC_burst_0_upstream_begins_xfer)
          MTL_SOPC_burst_0_upstream_reg_firsttransfer <= MTL_SOPC_burst_0_upstream_unreg_firsttransfer;
    end


  //MTL_SOPC_burst_0_upstream_next_bbt_burstcount next_bbt_burstcount, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_next_bbt_burstcount = ((((MTL_SOPC_burst_0_upstream_write) && (MTL_SOPC_burst_0_upstream_bbt_burstcounter == 0))))? (MTL_SOPC_burst_0_upstream_burstcount - 1) :
    ((((MTL_SOPC_burst_0_upstream_read) && (MTL_SOPC_burst_0_upstream_bbt_burstcounter == 0))))? 0 :
    (MTL_SOPC_burst_0_upstream_bbt_burstcounter - 1);

  //MTL_SOPC_burst_0_upstream_bbt_burstcounter bbt_burstcounter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_upstream_bbt_burstcounter <= 0;
      else if (MTL_SOPC_burst_0_upstream_begins_xfer)
          MTL_SOPC_burst_0_upstream_bbt_burstcounter <= MTL_SOPC_burst_0_upstream_next_bbt_burstcount;
    end


  //MTL_SOPC_burst_0_upstream_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_beginbursttransfer_internal = MTL_SOPC_burst_0_upstream_begins_xfer & (MTL_SOPC_burst_0_upstream_bbt_burstcounter == 0);

  //MTL_SOPC_burst_0_upstream_read assignment, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_read = alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream & alt_vip_vfr_0_avalon_master_read;

  //MTL_SOPC_burst_0_upstream_write assignment, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_write = 0;

  //MTL_SOPC_burst_0_upstream_address mux, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_address = alt_vip_vfr_0_avalon_master_address_to_slave;

  //d1_MTL_SOPC_burst_0_upstream_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_MTL_SOPC_burst_0_upstream_end_xfer <= 1;
      else 
        d1_MTL_SOPC_burst_0_upstream_end_xfer <= MTL_SOPC_burst_0_upstream_end_xfer;
    end


  //MTL_SOPC_burst_0_upstream_waits_for_read in a cycle, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_waits_for_read = MTL_SOPC_burst_0_upstream_in_a_read_cycle & MTL_SOPC_burst_0_upstream_waitrequest_from_sa;

  //MTL_SOPC_burst_0_upstream_in_a_read_cycle assignment, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_in_a_read_cycle = alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream & alt_vip_vfr_0_avalon_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = MTL_SOPC_burst_0_upstream_in_a_read_cycle;

  //MTL_SOPC_burst_0_upstream_waits_for_write in a cycle, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_waits_for_write = MTL_SOPC_burst_0_upstream_in_a_write_cycle & MTL_SOPC_burst_0_upstream_waitrequest_from_sa;

  //MTL_SOPC_burst_0_upstream_in_a_write_cycle assignment, which is an e_assign
  assign MTL_SOPC_burst_0_upstream_in_a_write_cycle = 0;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = MTL_SOPC_burst_0_upstream_in_a_write_cycle;

  assign wait_for_MTL_SOPC_burst_0_upstream_counter = 0;
  //MTL_SOPC_burst_0_upstream_byteenable byte enable port mux, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_byteenable = -1;

  //burstcount mux, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_burstcount = (alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream)? alt_vip_vfr_0_avalon_master_burstcount :
    1;

  //debugaccess mux, which is an e_mux
  assign MTL_SOPC_burst_0_upstream_debugaccess = 0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //MTL_SOPC_burst_0/upstream enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //alt_vip_vfr_0/avalon_master non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream && (alt_vip_vfr_0_avalon_master_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: alt_vip_vfr_0/avalon_master drove 0 on its 'burstcount' port while accessing slave MTL_SOPC_burst_0/upstream", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_burst_0_downstream_arbitrator (
                                                // inputs:
                                                 MTL_SOPC_burst_0_downstream_address,
                                                 MTL_SOPC_burst_0_downstream_burstcount,
                                                 MTL_SOPC_burst_0_downstream_byteenable,
                                                 MTL_SOPC_burst_0_downstream_granted_sdram_s1,
                                                 MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1,
                                                 MTL_SOPC_burst_0_downstream_read,
                                                 MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1,
                                                 MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register,
                                                 MTL_SOPC_burst_0_downstream_requests_sdram_s1,
                                                 MTL_SOPC_burst_0_downstream_write,
                                                 MTL_SOPC_burst_0_downstream_writedata,
                                                 clk,
                                                 d1_sdram_s1_end_xfer,
                                                 reset_n,
                                                 sdram_s1_readdata_from_sa,
                                                 sdram_s1_waitrequest_from_sa,

                                                // outputs:
                                                 MTL_SOPC_burst_0_downstream_address_to_slave,
                                                 MTL_SOPC_burst_0_downstream_latency_counter,
                                                 MTL_SOPC_burst_0_downstream_readdata,
                                                 MTL_SOPC_burst_0_downstream_readdatavalid,
                                                 MTL_SOPC_burst_0_downstream_reset_n,
                                                 MTL_SOPC_burst_0_downstream_waitrequest
                                              )
;

  output  [ 26: 0] MTL_SOPC_burst_0_downstream_address_to_slave;
  output           MTL_SOPC_burst_0_downstream_latency_counter;
  output  [ 31: 0] MTL_SOPC_burst_0_downstream_readdata;
  output           MTL_SOPC_burst_0_downstream_readdatavalid;
  output           MTL_SOPC_burst_0_downstream_reset_n;
  output           MTL_SOPC_burst_0_downstream_waitrequest;
  input   [ 26: 0] MTL_SOPC_burst_0_downstream_address;
  input            MTL_SOPC_burst_0_downstream_burstcount;
  input   [  3: 0] MTL_SOPC_burst_0_downstream_byteenable;
  input            MTL_SOPC_burst_0_downstream_granted_sdram_s1;
  input            MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1;
  input            MTL_SOPC_burst_0_downstream_read;
  input            MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1;
  input            MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register;
  input            MTL_SOPC_burst_0_downstream_requests_sdram_s1;
  input            MTL_SOPC_burst_0_downstream_write;
  input   [ 31: 0] MTL_SOPC_burst_0_downstream_writedata;
  input            clk;
  input            d1_sdram_s1_end_xfer;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;

  reg     [ 26: 0] MTL_SOPC_burst_0_downstream_address_last_time;
  wire    [ 26: 0] MTL_SOPC_burst_0_downstream_address_to_slave;
  reg              MTL_SOPC_burst_0_downstream_burstcount_last_time;
  reg     [  3: 0] MTL_SOPC_burst_0_downstream_byteenable_last_time;
  wire             MTL_SOPC_burst_0_downstream_is_granted_some_slave;
  reg              MTL_SOPC_burst_0_downstream_latency_counter;
  reg              MTL_SOPC_burst_0_downstream_read_but_no_slave_selected;
  reg              MTL_SOPC_burst_0_downstream_read_last_time;
  wire    [ 31: 0] MTL_SOPC_burst_0_downstream_readdata;
  wire             MTL_SOPC_burst_0_downstream_readdatavalid;
  wire             MTL_SOPC_burst_0_downstream_reset_n;
  wire             MTL_SOPC_burst_0_downstream_run;
  wire             MTL_SOPC_burst_0_downstream_waitrequest;
  reg              MTL_SOPC_burst_0_downstream_write_last_time;
  reg     [ 31: 0] MTL_SOPC_burst_0_downstream_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             latency_load_value;
  wire             p1_MTL_SOPC_burst_0_downstream_latency_counter;
  wire             pre_flush_MTL_SOPC_burst_0_downstream_readdatavalid;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1 | ~MTL_SOPC_burst_0_downstream_requests_sdram_s1) & (MTL_SOPC_burst_0_downstream_granted_sdram_s1 | ~MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1) & ((~MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1 | ~(MTL_SOPC_burst_0_downstream_read | MTL_SOPC_burst_0_downstream_write) | (1 & ~sdram_s1_waitrequest_from_sa & (MTL_SOPC_burst_0_downstream_read | MTL_SOPC_burst_0_downstream_write)))) & ((~MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1 | ~(MTL_SOPC_burst_0_downstream_read | MTL_SOPC_burst_0_downstream_write) | (1 & ~sdram_s1_waitrequest_from_sa & (MTL_SOPC_burst_0_downstream_read | MTL_SOPC_burst_0_downstream_write))));

  //cascaded wait assignment, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign MTL_SOPC_burst_0_downstream_address_to_slave = MTL_SOPC_burst_0_downstream_address;

  //MTL_SOPC_burst_0_downstream_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_read_but_no_slave_selected <= 0;
      else 
        MTL_SOPC_burst_0_downstream_read_but_no_slave_selected <= MTL_SOPC_burst_0_downstream_read & MTL_SOPC_burst_0_downstream_run & ~MTL_SOPC_burst_0_downstream_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign MTL_SOPC_burst_0_downstream_is_granted_some_slave = MTL_SOPC_burst_0_downstream_granted_sdram_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_MTL_SOPC_burst_0_downstream_readdatavalid = MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign MTL_SOPC_burst_0_downstream_readdatavalid = MTL_SOPC_burst_0_downstream_read_but_no_slave_selected |
    pre_flush_MTL_SOPC_burst_0_downstream_readdatavalid;

  //MTL_SOPC_burst_0/downstream readdata mux, which is an e_mux
  assign MTL_SOPC_burst_0_downstream_readdata = sdram_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_waitrequest = ~MTL_SOPC_burst_0_downstream_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_latency_counter <= 0;
      else 
        MTL_SOPC_burst_0_downstream_latency_counter <= p1_MTL_SOPC_burst_0_downstream_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_MTL_SOPC_burst_0_downstream_latency_counter = ((MTL_SOPC_burst_0_downstream_run & MTL_SOPC_burst_0_downstream_read))? latency_load_value :
    (MTL_SOPC_burst_0_downstream_latency_counter)? MTL_SOPC_burst_0_downstream_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //MTL_SOPC_burst_0_downstream_reset_n assignment, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //MTL_SOPC_burst_0_downstream_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_address_last_time <= 0;
      else 
        MTL_SOPC_burst_0_downstream_address_last_time <= MTL_SOPC_burst_0_downstream_address;
    end


  //MTL_SOPC_burst_0/downstream waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= MTL_SOPC_burst_0_downstream_waitrequest & (MTL_SOPC_burst_0_downstream_read | MTL_SOPC_burst_0_downstream_write);
    end


  //MTL_SOPC_burst_0_downstream_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_burst_0_downstream_address != MTL_SOPC_burst_0_downstream_address_last_time))
        begin
          $write("%0d ns: MTL_SOPC_burst_0_downstream_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_burst_0_downstream_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_burstcount_last_time <= 0;
      else 
        MTL_SOPC_burst_0_downstream_burstcount_last_time <= MTL_SOPC_burst_0_downstream_burstcount;
    end


  //MTL_SOPC_burst_0_downstream_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_burst_0_downstream_burstcount != MTL_SOPC_burst_0_downstream_burstcount_last_time))
        begin
          $write("%0d ns: MTL_SOPC_burst_0_downstream_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_burst_0_downstream_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_byteenable_last_time <= 0;
      else 
        MTL_SOPC_burst_0_downstream_byteenable_last_time <= MTL_SOPC_burst_0_downstream_byteenable;
    end


  //MTL_SOPC_burst_0_downstream_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_burst_0_downstream_byteenable != MTL_SOPC_burst_0_downstream_byteenable_last_time))
        begin
          $write("%0d ns: MTL_SOPC_burst_0_downstream_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_burst_0_downstream_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_read_last_time <= 0;
      else 
        MTL_SOPC_burst_0_downstream_read_last_time <= MTL_SOPC_burst_0_downstream_read;
    end


  //MTL_SOPC_burst_0_downstream_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_burst_0_downstream_read != MTL_SOPC_burst_0_downstream_read_last_time))
        begin
          $write("%0d ns: MTL_SOPC_burst_0_downstream_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_burst_0_downstream_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_write_last_time <= 0;
      else 
        MTL_SOPC_burst_0_downstream_write_last_time <= MTL_SOPC_burst_0_downstream_write;
    end


  //MTL_SOPC_burst_0_downstream_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_burst_0_downstream_write != MTL_SOPC_burst_0_downstream_write_last_time))
        begin
          $write("%0d ns: MTL_SOPC_burst_0_downstream_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_burst_0_downstream_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_burst_0_downstream_writedata_last_time <= 0;
      else 
        MTL_SOPC_burst_0_downstream_writedata_last_time <= MTL_SOPC_burst_0_downstream_writedata;
    end


  //MTL_SOPC_burst_0_downstream_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_burst_0_downstream_writedata != MTL_SOPC_burst_0_downstream_writedata_last_time) & MTL_SOPC_burst_0_downstream_write)
        begin
          $write("%0d ns: MTL_SOPC_burst_0_downstream_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_clock_0_in_arbitrator (
                                        // inputs:
                                         MTL_SOPC_clock_0_in_endofpacket,
                                         MTL_SOPC_clock_0_in_readdata,
                                         MTL_SOPC_clock_0_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_latency_counter,
                                         cpu_data_master_read,
                                         cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                         cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         MTL_SOPC_clock_0_in_address,
                                         MTL_SOPC_clock_0_in_byteenable,
                                         MTL_SOPC_clock_0_in_endofpacket_from_sa,
                                         MTL_SOPC_clock_0_in_nativeaddress,
                                         MTL_SOPC_clock_0_in_read,
                                         MTL_SOPC_clock_0_in_readdata_from_sa,
                                         MTL_SOPC_clock_0_in_reset_n,
                                         MTL_SOPC_clock_0_in_waitrequest_from_sa,
                                         MTL_SOPC_clock_0_in_write,
                                         MTL_SOPC_clock_0_in_writedata,
                                         cpu_data_master_granted_MTL_SOPC_clock_0_in,
                                         cpu_data_master_qualified_request_MTL_SOPC_clock_0_in,
                                         cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in,
                                         cpu_data_master_requests_MTL_SOPC_clock_0_in,
                                         d1_MTL_SOPC_clock_0_in_end_xfer
                                      )
;

  output  [  3: 0] MTL_SOPC_clock_0_in_address;
  output  [  3: 0] MTL_SOPC_clock_0_in_byteenable;
  output           MTL_SOPC_clock_0_in_endofpacket_from_sa;
  output  [  1: 0] MTL_SOPC_clock_0_in_nativeaddress;
  output           MTL_SOPC_clock_0_in_read;
  output  [ 31: 0] MTL_SOPC_clock_0_in_readdata_from_sa;
  output           MTL_SOPC_clock_0_in_reset_n;
  output           MTL_SOPC_clock_0_in_waitrequest_from_sa;
  output           MTL_SOPC_clock_0_in_write;
  output  [ 31: 0] MTL_SOPC_clock_0_in_writedata;
  output           cpu_data_master_granted_MTL_SOPC_clock_0_in;
  output           cpu_data_master_qualified_request_MTL_SOPC_clock_0_in;
  output           cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in;
  output           cpu_data_master_requests_MTL_SOPC_clock_0_in;
  output           d1_MTL_SOPC_clock_0_in_end_xfer;
  input            MTL_SOPC_clock_0_in_endofpacket;
  input   [ 31: 0] MTL_SOPC_clock_0_in_readdata;
  input            MTL_SOPC_clock_0_in_waitrequest;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  3: 0] MTL_SOPC_clock_0_in_address;
  wire             MTL_SOPC_clock_0_in_allgrants;
  wire             MTL_SOPC_clock_0_in_allow_new_arb_cycle;
  wire             MTL_SOPC_clock_0_in_any_bursting_master_saved_grant;
  wire             MTL_SOPC_clock_0_in_any_continuerequest;
  wire             MTL_SOPC_clock_0_in_arb_counter_enable;
  reg     [  2: 0] MTL_SOPC_clock_0_in_arb_share_counter;
  wire    [  2: 0] MTL_SOPC_clock_0_in_arb_share_counter_next_value;
  wire    [  2: 0] MTL_SOPC_clock_0_in_arb_share_set_values;
  wire             MTL_SOPC_clock_0_in_beginbursttransfer_internal;
  wire             MTL_SOPC_clock_0_in_begins_xfer;
  wire    [  3: 0] MTL_SOPC_clock_0_in_byteenable;
  wire             MTL_SOPC_clock_0_in_end_xfer;
  wire             MTL_SOPC_clock_0_in_endofpacket_from_sa;
  wire             MTL_SOPC_clock_0_in_firsttransfer;
  wire             MTL_SOPC_clock_0_in_grant_vector;
  wire             MTL_SOPC_clock_0_in_in_a_read_cycle;
  wire             MTL_SOPC_clock_0_in_in_a_write_cycle;
  wire             MTL_SOPC_clock_0_in_master_qreq_vector;
  wire    [  1: 0] MTL_SOPC_clock_0_in_nativeaddress;
  wire             MTL_SOPC_clock_0_in_non_bursting_master_requests;
  wire             MTL_SOPC_clock_0_in_read;
  wire    [ 31: 0] MTL_SOPC_clock_0_in_readdata_from_sa;
  reg              MTL_SOPC_clock_0_in_reg_firsttransfer;
  wire             MTL_SOPC_clock_0_in_reset_n;
  reg              MTL_SOPC_clock_0_in_slavearbiterlockenable;
  wire             MTL_SOPC_clock_0_in_slavearbiterlockenable2;
  wire             MTL_SOPC_clock_0_in_unreg_firsttransfer;
  wire             MTL_SOPC_clock_0_in_waitrequest_from_sa;
  wire             MTL_SOPC_clock_0_in_waits_for_read;
  wire             MTL_SOPC_clock_0_in_waits_for_write;
  wire             MTL_SOPC_clock_0_in_write;
  wire    [ 31: 0] MTL_SOPC_clock_0_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_qualified_request_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_requests_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_saved_grant_MTL_SOPC_clock_0_in;
  reg              d1_MTL_SOPC_clock_0_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             wait_for_MTL_SOPC_clock_0_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~MTL_SOPC_clock_0_in_end_xfer;
    end


  assign MTL_SOPC_clock_0_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_MTL_SOPC_clock_0_in));
  //assign MTL_SOPC_clock_0_in_readdata_from_sa = MTL_SOPC_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_clock_0_in_readdata_from_sa = MTL_SOPC_clock_0_in_readdata;

  assign cpu_data_master_requests_MTL_SOPC_clock_0_in = ({cpu_data_master_address_to_slave[27 : 4] , 4'b0} == 28'h1900) & (cpu_data_master_read | cpu_data_master_write);
  //assign MTL_SOPC_clock_0_in_waitrequest_from_sa = MTL_SOPC_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_clock_0_in_waitrequest_from_sa = MTL_SOPC_clock_0_in_waitrequest;

  //MTL_SOPC_clock_0_in_arb_share_counter set values, which is an e_mux
  assign MTL_SOPC_clock_0_in_arb_share_set_values = 1;

  //MTL_SOPC_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  assign MTL_SOPC_clock_0_in_non_bursting_master_requests = cpu_data_master_requests_MTL_SOPC_clock_0_in;

  //MTL_SOPC_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign MTL_SOPC_clock_0_in_any_bursting_master_saved_grant = 0;

  //MTL_SOPC_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  assign MTL_SOPC_clock_0_in_arb_share_counter_next_value = MTL_SOPC_clock_0_in_firsttransfer ? (MTL_SOPC_clock_0_in_arb_share_set_values - 1) : |MTL_SOPC_clock_0_in_arb_share_counter ? (MTL_SOPC_clock_0_in_arb_share_counter - 1) : 0;

  //MTL_SOPC_clock_0_in_allgrants all slave grants, which is an e_mux
  assign MTL_SOPC_clock_0_in_allgrants = |MTL_SOPC_clock_0_in_grant_vector;

  //MTL_SOPC_clock_0_in_end_xfer assignment, which is an e_assign
  assign MTL_SOPC_clock_0_in_end_xfer = ~(MTL_SOPC_clock_0_in_waits_for_read | MTL_SOPC_clock_0_in_waits_for_write);

  //end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in = MTL_SOPC_clock_0_in_end_xfer & (~MTL_SOPC_clock_0_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //MTL_SOPC_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign MTL_SOPC_clock_0_in_arb_counter_enable = (end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in & MTL_SOPC_clock_0_in_allgrants) | (end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in & ~MTL_SOPC_clock_0_in_non_bursting_master_requests);

  //MTL_SOPC_clock_0_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_in_arb_share_counter <= 0;
      else if (MTL_SOPC_clock_0_in_arb_counter_enable)
          MTL_SOPC_clock_0_in_arb_share_counter <= MTL_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //MTL_SOPC_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_in_slavearbiterlockenable <= 0;
      else if ((|MTL_SOPC_clock_0_in_master_qreq_vector & end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in) | (end_xfer_arb_share_counter_term_MTL_SOPC_clock_0_in & ~MTL_SOPC_clock_0_in_non_bursting_master_requests))
          MTL_SOPC_clock_0_in_slavearbiterlockenable <= |MTL_SOPC_clock_0_in_arb_share_counter_next_value;
    end


  //cpu/data_master MTL_SOPC_clock_0/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = MTL_SOPC_clock_0_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //MTL_SOPC_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign MTL_SOPC_clock_0_in_slavearbiterlockenable2 = |MTL_SOPC_clock_0_in_arb_share_counter_next_value;

  //cpu/data_master MTL_SOPC_clock_0/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = MTL_SOPC_clock_0_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //MTL_SOPC_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign MTL_SOPC_clock_0_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_MTL_SOPC_clock_0_in = cpu_data_master_requests_MTL_SOPC_clock_0_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in, which is an e_mux
  assign cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in = cpu_data_master_granted_MTL_SOPC_clock_0_in & cpu_data_master_read & ~MTL_SOPC_clock_0_in_waits_for_read;

  //MTL_SOPC_clock_0_in_writedata mux, which is an e_mux
  assign MTL_SOPC_clock_0_in_writedata = cpu_data_master_writedata;

  //assign MTL_SOPC_clock_0_in_endofpacket_from_sa = MTL_SOPC_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_clock_0_in_endofpacket_from_sa = MTL_SOPC_clock_0_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_MTL_SOPC_clock_0_in = cpu_data_master_qualified_request_MTL_SOPC_clock_0_in;

  //cpu/data_master saved-grant MTL_SOPC_clock_0/in, which is an e_assign
  assign cpu_data_master_saved_grant_MTL_SOPC_clock_0_in = cpu_data_master_requests_MTL_SOPC_clock_0_in;

  //allow new arb cycle for MTL_SOPC_clock_0/in, which is an e_assign
  assign MTL_SOPC_clock_0_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign MTL_SOPC_clock_0_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign MTL_SOPC_clock_0_in_master_qreq_vector = 1;

  //MTL_SOPC_clock_0_in_reset_n assignment, which is an e_assign
  assign MTL_SOPC_clock_0_in_reset_n = reset_n;

  //MTL_SOPC_clock_0_in_firsttransfer first transaction, which is an e_assign
  assign MTL_SOPC_clock_0_in_firsttransfer = MTL_SOPC_clock_0_in_begins_xfer ? MTL_SOPC_clock_0_in_unreg_firsttransfer : MTL_SOPC_clock_0_in_reg_firsttransfer;

  //MTL_SOPC_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  assign MTL_SOPC_clock_0_in_unreg_firsttransfer = ~(MTL_SOPC_clock_0_in_slavearbiterlockenable & MTL_SOPC_clock_0_in_any_continuerequest);

  //MTL_SOPC_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_in_reg_firsttransfer <= 1'b1;
      else if (MTL_SOPC_clock_0_in_begins_xfer)
          MTL_SOPC_clock_0_in_reg_firsttransfer <= MTL_SOPC_clock_0_in_unreg_firsttransfer;
    end


  //MTL_SOPC_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign MTL_SOPC_clock_0_in_beginbursttransfer_internal = MTL_SOPC_clock_0_in_begins_xfer;

  //MTL_SOPC_clock_0_in_read assignment, which is an e_mux
  assign MTL_SOPC_clock_0_in_read = cpu_data_master_granted_MTL_SOPC_clock_0_in & cpu_data_master_read;

  //MTL_SOPC_clock_0_in_write assignment, which is an e_mux
  assign MTL_SOPC_clock_0_in_write = cpu_data_master_granted_MTL_SOPC_clock_0_in & cpu_data_master_write;

  //MTL_SOPC_clock_0_in_address mux, which is an e_mux
  assign MTL_SOPC_clock_0_in_address = cpu_data_master_address_to_slave;

  //slaveid MTL_SOPC_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  assign MTL_SOPC_clock_0_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_MTL_SOPC_clock_0_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_MTL_SOPC_clock_0_in_end_xfer <= 1;
      else 
        d1_MTL_SOPC_clock_0_in_end_xfer <= MTL_SOPC_clock_0_in_end_xfer;
    end


  //MTL_SOPC_clock_0_in_waits_for_read in a cycle, which is an e_mux
  assign MTL_SOPC_clock_0_in_waits_for_read = MTL_SOPC_clock_0_in_in_a_read_cycle & MTL_SOPC_clock_0_in_waitrequest_from_sa;

  //MTL_SOPC_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  assign MTL_SOPC_clock_0_in_in_a_read_cycle = cpu_data_master_granted_MTL_SOPC_clock_0_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = MTL_SOPC_clock_0_in_in_a_read_cycle;

  //MTL_SOPC_clock_0_in_waits_for_write in a cycle, which is an e_mux
  assign MTL_SOPC_clock_0_in_waits_for_write = MTL_SOPC_clock_0_in_in_a_write_cycle & MTL_SOPC_clock_0_in_waitrequest_from_sa;

  //MTL_SOPC_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  assign MTL_SOPC_clock_0_in_in_a_write_cycle = cpu_data_master_granted_MTL_SOPC_clock_0_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = MTL_SOPC_clock_0_in_in_a_write_cycle;

  assign wait_for_MTL_SOPC_clock_0_in_counter = 0;
  //MTL_SOPC_clock_0_in_byteenable byte enable port mux, which is an e_mux
  assign MTL_SOPC_clock_0_in_byteenable = (cpu_data_master_granted_MTL_SOPC_clock_0_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //MTL_SOPC_clock_0/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_clock_0_out_arbitrator (
                                         // inputs:
                                          MTL_SOPC_clock_0_out_address,
                                          MTL_SOPC_clock_0_out_byteenable,
                                          MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_read,
                                          MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_write,
                                          MTL_SOPC_clock_0_out_writedata,
                                          altpll_sys_pll_slave_readdata_from_sa,
                                          clk,
                                          d1_altpll_sys_pll_slave_end_xfer,
                                          reset_n,

                                         // outputs:
                                          MTL_SOPC_clock_0_out_address_to_slave,
                                          MTL_SOPC_clock_0_out_readdata,
                                          MTL_SOPC_clock_0_out_reset_n,
                                          MTL_SOPC_clock_0_out_waitrequest
                                       )
;

  output  [  3: 0] MTL_SOPC_clock_0_out_address_to_slave;
  output  [ 31: 0] MTL_SOPC_clock_0_out_readdata;
  output           MTL_SOPC_clock_0_out_reset_n;
  output           MTL_SOPC_clock_0_out_waitrequest;
  input   [  3: 0] MTL_SOPC_clock_0_out_address;
  input   [  3: 0] MTL_SOPC_clock_0_out_byteenable;
  input            MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave;
  input            MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave;
  input            MTL_SOPC_clock_0_out_read;
  input            MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave;
  input            MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;
  input            MTL_SOPC_clock_0_out_write;
  input   [ 31: 0] MTL_SOPC_clock_0_out_writedata;
  input   [ 31: 0] altpll_sys_pll_slave_readdata_from_sa;
  input            clk;
  input            d1_altpll_sys_pll_slave_end_xfer;
  input            reset_n;

  reg     [  3: 0] MTL_SOPC_clock_0_out_address_last_time;
  wire    [  3: 0] MTL_SOPC_clock_0_out_address_to_slave;
  reg     [  3: 0] MTL_SOPC_clock_0_out_byteenable_last_time;
  reg              MTL_SOPC_clock_0_out_read_last_time;
  wire    [ 31: 0] MTL_SOPC_clock_0_out_readdata;
  wire             MTL_SOPC_clock_0_out_reset_n;
  wire             MTL_SOPC_clock_0_out_run;
  wire             MTL_SOPC_clock_0_out_waitrequest;
  reg              MTL_SOPC_clock_0_out_write_last_time;
  reg     [ 31: 0] MTL_SOPC_clock_0_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & ((~MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave | ~(MTL_SOPC_clock_0_out_read | MTL_SOPC_clock_0_out_write) | (1 & (MTL_SOPC_clock_0_out_read | MTL_SOPC_clock_0_out_write)))) & ((~MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave | ~(MTL_SOPC_clock_0_out_read | MTL_SOPC_clock_0_out_write) | (1 & (MTL_SOPC_clock_0_out_read | MTL_SOPC_clock_0_out_write))));

  //cascaded wait assignment, which is an e_assign
  assign MTL_SOPC_clock_0_out_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign MTL_SOPC_clock_0_out_address_to_slave = MTL_SOPC_clock_0_out_address;

  //MTL_SOPC_clock_0/out readdata mux, which is an e_mux
  assign MTL_SOPC_clock_0_out_readdata = altpll_sys_pll_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign MTL_SOPC_clock_0_out_waitrequest = ~MTL_SOPC_clock_0_out_run;

  //MTL_SOPC_clock_0_out_reset_n assignment, which is an e_assign
  assign MTL_SOPC_clock_0_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //MTL_SOPC_clock_0_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_out_address_last_time <= 0;
      else 
        MTL_SOPC_clock_0_out_address_last_time <= MTL_SOPC_clock_0_out_address;
    end


  //MTL_SOPC_clock_0/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= MTL_SOPC_clock_0_out_waitrequest & (MTL_SOPC_clock_0_out_read | MTL_SOPC_clock_0_out_write);
    end


  //MTL_SOPC_clock_0_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_0_out_address != MTL_SOPC_clock_0_out_address_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_0_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_0_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_out_byteenable_last_time <= 0;
      else 
        MTL_SOPC_clock_0_out_byteenable_last_time <= MTL_SOPC_clock_0_out_byteenable;
    end


  //MTL_SOPC_clock_0_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_0_out_byteenable != MTL_SOPC_clock_0_out_byteenable_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_0_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_0_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_out_read_last_time <= 0;
      else 
        MTL_SOPC_clock_0_out_read_last_time <= MTL_SOPC_clock_0_out_read;
    end


  //MTL_SOPC_clock_0_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_0_out_read != MTL_SOPC_clock_0_out_read_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_0_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_0_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_out_write_last_time <= 0;
      else 
        MTL_SOPC_clock_0_out_write_last_time <= MTL_SOPC_clock_0_out_write;
    end


  //MTL_SOPC_clock_0_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_0_out_write != MTL_SOPC_clock_0_out_write_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_0_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_0_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_0_out_writedata_last_time <= 0;
      else 
        MTL_SOPC_clock_0_out_writedata_last_time <= MTL_SOPC_clock_0_out_writedata;
    end


  //MTL_SOPC_clock_0_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_0_out_writedata != MTL_SOPC_clock_0_out_writedata_last_time) & MTL_SOPC_clock_0_out_write)
        begin
          $write("%0d ns: MTL_SOPC_clock_0_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_clock_1_in_arbitrator (
                                        // inputs:
                                         MTL_SOPC_clock_1_in_endofpacket,
                                         MTL_SOPC_clock_1_in_readdata,
                                         MTL_SOPC_clock_1_in_waitrequest,
                                         clk,
                                         cpu_data_master_address_to_slave,
                                         cpu_data_master_byteenable,
                                         cpu_data_master_latency_counter,
                                         cpu_data_master_read,
                                         cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                         cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                         cpu_data_master_write,
                                         cpu_data_master_writedata,
                                         reset_n,

                                        // outputs:
                                         MTL_SOPC_clock_1_in_address,
                                         MTL_SOPC_clock_1_in_byteenable,
                                         MTL_SOPC_clock_1_in_endofpacket_from_sa,
                                         MTL_SOPC_clock_1_in_nativeaddress,
                                         MTL_SOPC_clock_1_in_read,
                                         MTL_SOPC_clock_1_in_readdata_from_sa,
                                         MTL_SOPC_clock_1_in_reset_n,
                                         MTL_SOPC_clock_1_in_waitrequest_from_sa,
                                         MTL_SOPC_clock_1_in_write,
                                         MTL_SOPC_clock_1_in_writedata,
                                         cpu_data_master_granted_MTL_SOPC_clock_1_in,
                                         cpu_data_master_qualified_request_MTL_SOPC_clock_1_in,
                                         cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in,
                                         cpu_data_master_requests_MTL_SOPC_clock_1_in,
                                         d1_MTL_SOPC_clock_1_in_end_xfer
                                      )
;

  output  [  5: 0] MTL_SOPC_clock_1_in_address;
  output  [  1: 0] MTL_SOPC_clock_1_in_byteenable;
  output           MTL_SOPC_clock_1_in_endofpacket_from_sa;
  output  [  4: 0] MTL_SOPC_clock_1_in_nativeaddress;
  output           MTL_SOPC_clock_1_in_read;
  output  [ 15: 0] MTL_SOPC_clock_1_in_readdata_from_sa;
  output           MTL_SOPC_clock_1_in_reset_n;
  output           MTL_SOPC_clock_1_in_waitrequest_from_sa;
  output           MTL_SOPC_clock_1_in_write;
  output  [ 15: 0] MTL_SOPC_clock_1_in_writedata;
  output           cpu_data_master_granted_MTL_SOPC_clock_1_in;
  output           cpu_data_master_qualified_request_MTL_SOPC_clock_1_in;
  output           cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in;
  output           cpu_data_master_requests_MTL_SOPC_clock_1_in;
  output           d1_MTL_SOPC_clock_1_in_end_xfer;
  input            MTL_SOPC_clock_1_in_endofpacket;
  input   [ 15: 0] MTL_SOPC_clock_1_in_readdata;
  input            MTL_SOPC_clock_1_in_waitrequest;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  5: 0] MTL_SOPC_clock_1_in_address;
  wire             MTL_SOPC_clock_1_in_allgrants;
  wire             MTL_SOPC_clock_1_in_allow_new_arb_cycle;
  wire             MTL_SOPC_clock_1_in_any_bursting_master_saved_grant;
  wire             MTL_SOPC_clock_1_in_any_continuerequest;
  wire             MTL_SOPC_clock_1_in_arb_counter_enable;
  reg     [  2: 0] MTL_SOPC_clock_1_in_arb_share_counter;
  wire    [  2: 0] MTL_SOPC_clock_1_in_arb_share_counter_next_value;
  wire    [  2: 0] MTL_SOPC_clock_1_in_arb_share_set_values;
  wire             MTL_SOPC_clock_1_in_beginbursttransfer_internal;
  wire             MTL_SOPC_clock_1_in_begins_xfer;
  wire    [  1: 0] MTL_SOPC_clock_1_in_byteenable;
  wire             MTL_SOPC_clock_1_in_end_xfer;
  wire             MTL_SOPC_clock_1_in_endofpacket_from_sa;
  wire             MTL_SOPC_clock_1_in_firsttransfer;
  wire             MTL_SOPC_clock_1_in_grant_vector;
  wire             MTL_SOPC_clock_1_in_in_a_read_cycle;
  wire             MTL_SOPC_clock_1_in_in_a_write_cycle;
  wire             MTL_SOPC_clock_1_in_master_qreq_vector;
  wire    [  4: 0] MTL_SOPC_clock_1_in_nativeaddress;
  wire             MTL_SOPC_clock_1_in_non_bursting_master_requests;
  wire             MTL_SOPC_clock_1_in_read;
  wire    [ 15: 0] MTL_SOPC_clock_1_in_readdata_from_sa;
  reg              MTL_SOPC_clock_1_in_reg_firsttransfer;
  wire             MTL_SOPC_clock_1_in_reset_n;
  reg              MTL_SOPC_clock_1_in_slavearbiterlockenable;
  wire             MTL_SOPC_clock_1_in_slavearbiterlockenable2;
  wire             MTL_SOPC_clock_1_in_unreg_firsttransfer;
  wire             MTL_SOPC_clock_1_in_waitrequest_from_sa;
  wire             MTL_SOPC_clock_1_in_waits_for_read;
  wire             MTL_SOPC_clock_1_in_waits_for_write;
  wire             MTL_SOPC_clock_1_in_write;
  wire    [ 15: 0] MTL_SOPC_clock_1_in_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_qualified_request_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_requests_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_saved_grant_MTL_SOPC_clock_1_in;
  reg              d1_MTL_SOPC_clock_1_in_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_MTL_SOPC_clock_1_in_from_cpu_data_master;
  wire             wait_for_MTL_SOPC_clock_1_in_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~MTL_SOPC_clock_1_in_end_xfer;
    end


  assign MTL_SOPC_clock_1_in_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_MTL_SOPC_clock_1_in));
  //assign MTL_SOPC_clock_1_in_readdata_from_sa = MTL_SOPC_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_clock_1_in_readdata_from_sa = MTL_SOPC_clock_1_in_readdata;

  assign cpu_data_master_requests_MTL_SOPC_clock_1_in = ({cpu_data_master_address_to_slave[27 : 7] , 7'b0} == 28'h1880) & (cpu_data_master_read | cpu_data_master_write);
  //assign MTL_SOPC_clock_1_in_waitrequest_from_sa = MTL_SOPC_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_clock_1_in_waitrequest_from_sa = MTL_SOPC_clock_1_in_waitrequest;

  //MTL_SOPC_clock_1_in_arb_share_counter set values, which is an e_mux
  assign MTL_SOPC_clock_1_in_arb_share_set_values = 1;

  //MTL_SOPC_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  assign MTL_SOPC_clock_1_in_non_bursting_master_requests = cpu_data_master_requests_MTL_SOPC_clock_1_in;

  //MTL_SOPC_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  assign MTL_SOPC_clock_1_in_any_bursting_master_saved_grant = 0;

  //MTL_SOPC_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  assign MTL_SOPC_clock_1_in_arb_share_counter_next_value = MTL_SOPC_clock_1_in_firsttransfer ? (MTL_SOPC_clock_1_in_arb_share_set_values - 1) : |MTL_SOPC_clock_1_in_arb_share_counter ? (MTL_SOPC_clock_1_in_arb_share_counter - 1) : 0;

  //MTL_SOPC_clock_1_in_allgrants all slave grants, which is an e_mux
  assign MTL_SOPC_clock_1_in_allgrants = |MTL_SOPC_clock_1_in_grant_vector;

  //MTL_SOPC_clock_1_in_end_xfer assignment, which is an e_assign
  assign MTL_SOPC_clock_1_in_end_xfer = ~(MTL_SOPC_clock_1_in_waits_for_read | MTL_SOPC_clock_1_in_waits_for_write);

  //end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in = MTL_SOPC_clock_1_in_end_xfer & (~MTL_SOPC_clock_1_in_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //MTL_SOPC_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  assign MTL_SOPC_clock_1_in_arb_counter_enable = (end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in & MTL_SOPC_clock_1_in_allgrants) | (end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in & ~MTL_SOPC_clock_1_in_non_bursting_master_requests);

  //MTL_SOPC_clock_1_in_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_in_arb_share_counter <= 0;
      else if (MTL_SOPC_clock_1_in_arb_counter_enable)
          MTL_SOPC_clock_1_in_arb_share_counter <= MTL_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //MTL_SOPC_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_in_slavearbiterlockenable <= 0;
      else if ((|MTL_SOPC_clock_1_in_master_qreq_vector & end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in) | (end_xfer_arb_share_counter_term_MTL_SOPC_clock_1_in & ~MTL_SOPC_clock_1_in_non_bursting_master_requests))
          MTL_SOPC_clock_1_in_slavearbiterlockenable <= |MTL_SOPC_clock_1_in_arb_share_counter_next_value;
    end


  //cpu/data_master MTL_SOPC_clock_1/in arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = MTL_SOPC_clock_1_in_slavearbiterlockenable & cpu_data_master_continuerequest;

  //MTL_SOPC_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign MTL_SOPC_clock_1_in_slavearbiterlockenable2 = |MTL_SOPC_clock_1_in_arb_share_counter_next_value;

  //cpu/data_master MTL_SOPC_clock_1/in arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = MTL_SOPC_clock_1_in_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //MTL_SOPC_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  assign MTL_SOPC_clock_1_in_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_MTL_SOPC_clock_1_in = cpu_data_master_requests_MTL_SOPC_clock_1_in & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in, which is an e_mux
  assign cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in = cpu_data_master_granted_MTL_SOPC_clock_1_in & cpu_data_master_read & ~MTL_SOPC_clock_1_in_waits_for_read;

  //MTL_SOPC_clock_1_in_writedata mux, which is an e_mux
  assign MTL_SOPC_clock_1_in_writedata = cpu_data_master_writedata;

  //assign MTL_SOPC_clock_1_in_endofpacket_from_sa = MTL_SOPC_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign MTL_SOPC_clock_1_in_endofpacket_from_sa = MTL_SOPC_clock_1_in_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_MTL_SOPC_clock_1_in = cpu_data_master_qualified_request_MTL_SOPC_clock_1_in;

  //cpu/data_master saved-grant MTL_SOPC_clock_1/in, which is an e_assign
  assign cpu_data_master_saved_grant_MTL_SOPC_clock_1_in = cpu_data_master_requests_MTL_SOPC_clock_1_in;

  //allow new arb cycle for MTL_SOPC_clock_1/in, which is an e_assign
  assign MTL_SOPC_clock_1_in_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign MTL_SOPC_clock_1_in_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign MTL_SOPC_clock_1_in_master_qreq_vector = 1;

  //MTL_SOPC_clock_1_in_reset_n assignment, which is an e_assign
  assign MTL_SOPC_clock_1_in_reset_n = reset_n;

  //MTL_SOPC_clock_1_in_firsttransfer first transaction, which is an e_assign
  assign MTL_SOPC_clock_1_in_firsttransfer = MTL_SOPC_clock_1_in_begins_xfer ? MTL_SOPC_clock_1_in_unreg_firsttransfer : MTL_SOPC_clock_1_in_reg_firsttransfer;

  //MTL_SOPC_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  assign MTL_SOPC_clock_1_in_unreg_firsttransfer = ~(MTL_SOPC_clock_1_in_slavearbiterlockenable & MTL_SOPC_clock_1_in_any_continuerequest);

  //MTL_SOPC_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_in_reg_firsttransfer <= 1'b1;
      else if (MTL_SOPC_clock_1_in_begins_xfer)
          MTL_SOPC_clock_1_in_reg_firsttransfer <= MTL_SOPC_clock_1_in_unreg_firsttransfer;
    end


  //MTL_SOPC_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign MTL_SOPC_clock_1_in_beginbursttransfer_internal = MTL_SOPC_clock_1_in_begins_xfer;

  //MTL_SOPC_clock_1_in_read assignment, which is an e_mux
  assign MTL_SOPC_clock_1_in_read = cpu_data_master_granted_MTL_SOPC_clock_1_in & cpu_data_master_read;

  //MTL_SOPC_clock_1_in_write assignment, which is an e_mux
  assign MTL_SOPC_clock_1_in_write = cpu_data_master_granted_MTL_SOPC_clock_1_in & cpu_data_master_write;

  assign shifted_address_to_MTL_SOPC_clock_1_in_from_cpu_data_master = cpu_data_master_address_to_slave;
  //MTL_SOPC_clock_1_in_address mux, which is an e_mux
  assign MTL_SOPC_clock_1_in_address = shifted_address_to_MTL_SOPC_clock_1_in_from_cpu_data_master >> 2;

  //slaveid MTL_SOPC_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  assign MTL_SOPC_clock_1_in_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_MTL_SOPC_clock_1_in_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_MTL_SOPC_clock_1_in_end_xfer <= 1;
      else 
        d1_MTL_SOPC_clock_1_in_end_xfer <= MTL_SOPC_clock_1_in_end_xfer;
    end


  //MTL_SOPC_clock_1_in_waits_for_read in a cycle, which is an e_mux
  assign MTL_SOPC_clock_1_in_waits_for_read = MTL_SOPC_clock_1_in_in_a_read_cycle & MTL_SOPC_clock_1_in_waitrequest_from_sa;

  //MTL_SOPC_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  assign MTL_SOPC_clock_1_in_in_a_read_cycle = cpu_data_master_granted_MTL_SOPC_clock_1_in & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = MTL_SOPC_clock_1_in_in_a_read_cycle;

  //MTL_SOPC_clock_1_in_waits_for_write in a cycle, which is an e_mux
  assign MTL_SOPC_clock_1_in_waits_for_write = MTL_SOPC_clock_1_in_in_a_write_cycle & MTL_SOPC_clock_1_in_waitrequest_from_sa;

  //MTL_SOPC_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  assign MTL_SOPC_clock_1_in_in_a_write_cycle = cpu_data_master_granted_MTL_SOPC_clock_1_in & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = MTL_SOPC_clock_1_in_in_a_write_cycle;

  assign wait_for_MTL_SOPC_clock_1_in_counter = 0;
  //MTL_SOPC_clock_1_in_byteenable byte enable port mux, which is an e_mux
  assign MTL_SOPC_clock_1_in_byteenable = (cpu_data_master_granted_MTL_SOPC_clock_1_in)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //MTL_SOPC_clock_1/in enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_clock_1_out_arbitrator (
                                         // inputs:
                                          MTL_SOPC_clock_1_out_address,
                                          MTL_SOPC_clock_1_out_byteenable,
                                          MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave,
                                          MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave,
                                          MTL_SOPC_clock_1_out_read,
                                          MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave,
                                          MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave,
                                          MTL_SOPC_clock_1_out_write,
                                          MTL_SOPC_clock_1_out_writedata,
                                          clk,
                                          d1_multi_touch_avalon_slave_end_xfer,
                                          multi_touch_avalon_slave_readdata_from_sa,
                                          reset_n,

                                         // outputs:
                                          MTL_SOPC_clock_1_out_address_to_slave,
                                          MTL_SOPC_clock_1_out_readdata,
                                          MTL_SOPC_clock_1_out_reset_n,
                                          MTL_SOPC_clock_1_out_waitrequest
                                       )
;

  output  [  5: 0] MTL_SOPC_clock_1_out_address_to_slave;
  output  [ 15: 0] MTL_SOPC_clock_1_out_readdata;
  output           MTL_SOPC_clock_1_out_reset_n;
  output           MTL_SOPC_clock_1_out_waitrequest;
  input   [  5: 0] MTL_SOPC_clock_1_out_address;
  input   [  1: 0] MTL_SOPC_clock_1_out_byteenable;
  input            MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave;
  input            MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave;
  input            MTL_SOPC_clock_1_out_read;
  input            MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave;
  input            MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;
  input            MTL_SOPC_clock_1_out_write;
  input   [ 15: 0] MTL_SOPC_clock_1_out_writedata;
  input            clk;
  input            d1_multi_touch_avalon_slave_end_xfer;
  input   [ 15: 0] multi_touch_avalon_slave_readdata_from_sa;
  input            reset_n;

  reg     [  5: 0] MTL_SOPC_clock_1_out_address_last_time;
  wire    [  5: 0] MTL_SOPC_clock_1_out_address_to_slave;
  reg     [  1: 0] MTL_SOPC_clock_1_out_byteenable_last_time;
  reg              MTL_SOPC_clock_1_out_read_last_time;
  wire    [ 15: 0] MTL_SOPC_clock_1_out_readdata;
  wire             MTL_SOPC_clock_1_out_reset_n;
  wire             MTL_SOPC_clock_1_out_run;
  wire             MTL_SOPC_clock_1_out_waitrequest;
  reg              MTL_SOPC_clock_1_out_write_last_time;
  reg     [ 15: 0] MTL_SOPC_clock_1_out_writedata_last_time;
  reg              active_and_waiting_last_time;
  wire             r_1;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & ((~MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave | ~MTL_SOPC_clock_1_out_read | (1 & ~d1_multi_touch_avalon_slave_end_xfer & MTL_SOPC_clock_1_out_read))) & ((~MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave | ~MTL_SOPC_clock_1_out_write | (1 & MTL_SOPC_clock_1_out_write)));

  //cascaded wait assignment, which is an e_assign
  assign MTL_SOPC_clock_1_out_run = r_1;

  //optimize select-logic by passing only those address bits which matter.
  assign MTL_SOPC_clock_1_out_address_to_slave = MTL_SOPC_clock_1_out_address;

  //MTL_SOPC_clock_1/out readdata mux, which is an e_mux
  assign MTL_SOPC_clock_1_out_readdata = multi_touch_avalon_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign MTL_SOPC_clock_1_out_waitrequest = ~MTL_SOPC_clock_1_out_run;

  //MTL_SOPC_clock_1_out_reset_n assignment, which is an e_assign
  assign MTL_SOPC_clock_1_out_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //MTL_SOPC_clock_1_out_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_out_address_last_time <= 0;
      else 
        MTL_SOPC_clock_1_out_address_last_time <= MTL_SOPC_clock_1_out_address;
    end


  //MTL_SOPC_clock_1/out waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= MTL_SOPC_clock_1_out_waitrequest & (MTL_SOPC_clock_1_out_read | MTL_SOPC_clock_1_out_write);
    end


  //MTL_SOPC_clock_1_out_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_1_out_address != MTL_SOPC_clock_1_out_address_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_1_out_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_1_out_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_out_byteenable_last_time <= 0;
      else 
        MTL_SOPC_clock_1_out_byteenable_last_time <= MTL_SOPC_clock_1_out_byteenable;
    end


  //MTL_SOPC_clock_1_out_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_1_out_byteenable != MTL_SOPC_clock_1_out_byteenable_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_1_out_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_1_out_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_out_read_last_time <= 0;
      else 
        MTL_SOPC_clock_1_out_read_last_time <= MTL_SOPC_clock_1_out_read;
    end


  //MTL_SOPC_clock_1_out_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_1_out_read != MTL_SOPC_clock_1_out_read_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_1_out_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_1_out_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_out_write_last_time <= 0;
      else 
        MTL_SOPC_clock_1_out_write_last_time <= MTL_SOPC_clock_1_out_write;
    end


  //MTL_SOPC_clock_1_out_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_1_out_write != MTL_SOPC_clock_1_out_write_last_time))
        begin
          $write("%0d ns: MTL_SOPC_clock_1_out_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //MTL_SOPC_clock_1_out_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          MTL_SOPC_clock_1_out_writedata_last_time <= 0;
      else 
        MTL_SOPC_clock_1_out_writedata_last_time <= MTL_SOPC_clock_1_out_writedata;
    end


  //MTL_SOPC_clock_1_out_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (MTL_SOPC_clock_1_out_writedata != MTL_SOPC_clock_1_out_writedata_last_time) & MTL_SOPC_clock_1_out_write)
        begin
          $write("%0d ns: MTL_SOPC_clock_1_out_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module alt_vip_itc_0_din_arbitrator (
                                      // inputs:
                                       alt_vip_itc_0_din_ready,
                                       alt_vip_vfr_0_avalon_streaming_source_data,
                                       alt_vip_vfr_0_avalon_streaming_source_endofpacket,
                                       alt_vip_vfr_0_avalon_streaming_source_startofpacket,
                                       alt_vip_vfr_0_avalon_streaming_source_valid,
                                       clk,
                                       reset_n,

                                      // outputs:
                                       alt_vip_itc_0_din_data,
                                       alt_vip_itc_0_din_endofpacket,
                                       alt_vip_itc_0_din_ready_from_sa,
                                       alt_vip_itc_0_din_reset,
                                       alt_vip_itc_0_din_startofpacket,
                                       alt_vip_itc_0_din_valid
                                    )
;

  output  [ 23: 0] alt_vip_itc_0_din_data;
  output           alt_vip_itc_0_din_endofpacket;
  output           alt_vip_itc_0_din_ready_from_sa;
  output           alt_vip_itc_0_din_reset;
  output           alt_vip_itc_0_din_startofpacket;
  output           alt_vip_itc_0_din_valid;
  input            alt_vip_itc_0_din_ready;
  input   [ 23: 0] alt_vip_vfr_0_avalon_streaming_source_data;
  input            alt_vip_vfr_0_avalon_streaming_source_endofpacket;
  input            alt_vip_vfr_0_avalon_streaming_source_startofpacket;
  input            alt_vip_vfr_0_avalon_streaming_source_valid;
  input            clk;
  input            reset_n;

  wire    [ 23: 0] alt_vip_itc_0_din_data;
  wire             alt_vip_itc_0_din_endofpacket;
  wire             alt_vip_itc_0_din_ready_from_sa;
  wire             alt_vip_itc_0_din_reset;
  wire             alt_vip_itc_0_din_startofpacket;
  wire             alt_vip_itc_0_din_valid;
  //mux alt_vip_itc_0_din_data, which is an e_mux
  assign alt_vip_itc_0_din_data = alt_vip_vfr_0_avalon_streaming_source_data;

  //mux alt_vip_itc_0_din_endofpacket, which is an e_mux
  assign alt_vip_itc_0_din_endofpacket = alt_vip_vfr_0_avalon_streaming_source_endofpacket;

  //assign alt_vip_itc_0_din_ready_from_sa = alt_vip_itc_0_din_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign alt_vip_itc_0_din_ready_from_sa = alt_vip_itc_0_din_ready;

  //mux alt_vip_itc_0_din_startofpacket, which is an e_mux
  assign alt_vip_itc_0_din_startofpacket = alt_vip_vfr_0_avalon_streaming_source_startofpacket;

  //mux alt_vip_itc_0_din_valid, which is an e_mux
  assign alt_vip_itc_0_din_valid = alt_vip_vfr_0_avalon_streaming_source_valid;

  //~alt_vip_itc_0_din_reset assignment, which is an e_assign
  assign alt_vip_itc_0_din_reset = ~reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module alt_vip_vfr_0_avalon_slave_arbitrator (
                                               // inputs:
                                                alt_vip_vfr_0_avalon_slave_irq,
                                                alt_vip_vfr_0_avalon_slave_readdata,
                                                clk,
                                                cpu_data_master_address_to_slave,
                                                cpu_data_master_latency_counter,
                                                cpu_data_master_read,
                                                cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                                cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                cpu_data_master_write,
                                                cpu_data_master_writedata,
                                                reset_n,

                                               // outputs:
                                                alt_vip_vfr_0_avalon_slave_address,
                                                alt_vip_vfr_0_avalon_slave_irq_from_sa,
                                                alt_vip_vfr_0_avalon_slave_read,
                                                alt_vip_vfr_0_avalon_slave_readdata_from_sa,
                                                alt_vip_vfr_0_avalon_slave_reset,
                                                alt_vip_vfr_0_avalon_slave_write,
                                                alt_vip_vfr_0_avalon_slave_writedata,
                                                cpu_data_master_granted_alt_vip_vfr_0_avalon_slave,
                                                cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave,
                                                cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave,
                                                cpu_data_master_requests_alt_vip_vfr_0_avalon_slave,
                                                d1_alt_vip_vfr_0_avalon_slave_end_xfer
                                             )
;

  output  [  4: 0] alt_vip_vfr_0_avalon_slave_address;
  output           alt_vip_vfr_0_avalon_slave_irq_from_sa;
  output           alt_vip_vfr_0_avalon_slave_read;
  output  [ 31: 0] alt_vip_vfr_0_avalon_slave_readdata_from_sa;
  output           alt_vip_vfr_0_avalon_slave_reset;
  output           alt_vip_vfr_0_avalon_slave_write;
  output  [ 31: 0] alt_vip_vfr_0_avalon_slave_writedata;
  output           cpu_data_master_granted_alt_vip_vfr_0_avalon_slave;
  output           cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave;
  output           cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave;
  output           cpu_data_master_requests_alt_vip_vfr_0_avalon_slave;
  output           d1_alt_vip_vfr_0_avalon_slave_end_xfer;
  input            alt_vip_vfr_0_avalon_slave_irq;
  input   [ 31: 0] alt_vip_vfr_0_avalon_slave_readdata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  4: 0] alt_vip_vfr_0_avalon_slave_address;
  wire             alt_vip_vfr_0_avalon_slave_allgrants;
  wire             alt_vip_vfr_0_avalon_slave_allow_new_arb_cycle;
  wire             alt_vip_vfr_0_avalon_slave_any_bursting_master_saved_grant;
  wire             alt_vip_vfr_0_avalon_slave_any_continuerequest;
  wire             alt_vip_vfr_0_avalon_slave_arb_counter_enable;
  reg     [  2: 0] alt_vip_vfr_0_avalon_slave_arb_share_counter;
  wire    [  2: 0] alt_vip_vfr_0_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] alt_vip_vfr_0_avalon_slave_arb_share_set_values;
  wire             alt_vip_vfr_0_avalon_slave_beginbursttransfer_internal;
  wire             alt_vip_vfr_0_avalon_slave_begins_xfer;
  wire             alt_vip_vfr_0_avalon_slave_end_xfer;
  wire             alt_vip_vfr_0_avalon_slave_firsttransfer;
  wire             alt_vip_vfr_0_avalon_slave_grant_vector;
  wire             alt_vip_vfr_0_avalon_slave_in_a_read_cycle;
  wire             alt_vip_vfr_0_avalon_slave_in_a_write_cycle;
  wire             alt_vip_vfr_0_avalon_slave_irq_from_sa;
  wire             alt_vip_vfr_0_avalon_slave_master_qreq_vector;
  wire             alt_vip_vfr_0_avalon_slave_non_bursting_master_requests;
  wire             alt_vip_vfr_0_avalon_slave_read;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_slave_readdata_from_sa;
  reg              alt_vip_vfr_0_avalon_slave_reg_firsttransfer;
  wire             alt_vip_vfr_0_avalon_slave_reset;
  reg              alt_vip_vfr_0_avalon_slave_slavearbiterlockenable;
  wire             alt_vip_vfr_0_avalon_slave_slavearbiterlockenable2;
  wire             alt_vip_vfr_0_avalon_slave_unreg_firsttransfer;
  wire             alt_vip_vfr_0_avalon_slave_waits_for_read;
  wire             alt_vip_vfr_0_avalon_slave_waits_for_write;
  wire             alt_vip_vfr_0_avalon_slave_write;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_slave_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave;
  reg              cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register;
  wire             cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register_in;
  wire             cpu_data_master_requests_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_saved_grant_alt_vip_vfr_0_avalon_slave;
  reg              d1_alt_vip_vfr_0_avalon_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register;
  wire    [ 27: 0] shifted_address_to_alt_vip_vfr_0_avalon_slave_from_cpu_data_master;
  wire             wait_for_alt_vip_vfr_0_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~alt_vip_vfr_0_avalon_slave_end_xfer;
    end


  assign alt_vip_vfr_0_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave));
  //assign alt_vip_vfr_0_avalon_slave_readdata_from_sa = alt_vip_vfr_0_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_readdata_from_sa = alt_vip_vfr_0_avalon_slave_readdata;

  assign cpu_data_master_requests_alt_vip_vfr_0_avalon_slave = ({cpu_data_master_address_to_slave[27 : 7] , 7'b0} == 28'h1800) & (cpu_data_master_read | cpu_data_master_write);
  //alt_vip_vfr_0_avalon_slave_arb_share_counter set values, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_arb_share_set_values = 1;

  //alt_vip_vfr_0_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_alt_vip_vfr_0_avalon_slave;

  //alt_vip_vfr_0_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_any_bursting_master_saved_grant = 0;

  //alt_vip_vfr_0_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_arb_share_counter_next_value = alt_vip_vfr_0_avalon_slave_firsttransfer ? (alt_vip_vfr_0_avalon_slave_arb_share_set_values - 1) : |alt_vip_vfr_0_avalon_slave_arb_share_counter ? (alt_vip_vfr_0_avalon_slave_arb_share_counter - 1) : 0;

  //alt_vip_vfr_0_avalon_slave_allgrants all slave grants, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_allgrants = |alt_vip_vfr_0_avalon_slave_grant_vector;

  //alt_vip_vfr_0_avalon_slave_end_xfer assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_end_xfer = ~(alt_vip_vfr_0_avalon_slave_waits_for_read | alt_vip_vfr_0_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave = alt_vip_vfr_0_avalon_slave_end_xfer & (~alt_vip_vfr_0_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //alt_vip_vfr_0_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave & alt_vip_vfr_0_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave & ~alt_vip_vfr_0_avalon_slave_non_bursting_master_requests);

  //alt_vip_vfr_0_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          alt_vip_vfr_0_avalon_slave_arb_share_counter <= 0;
      else if (alt_vip_vfr_0_avalon_slave_arb_counter_enable)
          alt_vip_vfr_0_avalon_slave_arb_share_counter <= alt_vip_vfr_0_avalon_slave_arb_share_counter_next_value;
    end


  //alt_vip_vfr_0_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          alt_vip_vfr_0_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|alt_vip_vfr_0_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave) | (end_xfer_arb_share_counter_term_alt_vip_vfr_0_avalon_slave & ~alt_vip_vfr_0_avalon_slave_non_bursting_master_requests))
          alt_vip_vfr_0_avalon_slave_slavearbiterlockenable <= |alt_vip_vfr_0_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master alt_vip_vfr_0/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = alt_vip_vfr_0_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //alt_vip_vfr_0_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_slavearbiterlockenable2 = |alt_vip_vfr_0_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master alt_vip_vfr_0/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = alt_vip_vfr_0_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //alt_vip_vfr_0_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave = cpu_data_master_requests_alt_vip_vfr_0_avalon_slave & ~((cpu_data_master_read & ((1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register_in = cpu_data_master_granted_alt_vip_vfr_0_avalon_slave & cpu_data_master_read & ~alt_vip_vfr_0_avalon_slave_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register = {cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register, cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register_in};

  //cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register <= p1_cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave = cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave_shift_register;

  //alt_vip_vfr_0_avalon_slave_writedata mux, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_alt_vip_vfr_0_avalon_slave = cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave;

  //cpu/data_master saved-grant alt_vip_vfr_0/avalon_slave, which is an e_assign
  assign cpu_data_master_saved_grant_alt_vip_vfr_0_avalon_slave = cpu_data_master_requests_alt_vip_vfr_0_avalon_slave;

  //allow new arb cycle for alt_vip_vfr_0/avalon_slave, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign alt_vip_vfr_0_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign alt_vip_vfr_0_avalon_slave_master_qreq_vector = 1;

  //~alt_vip_vfr_0_avalon_slave_reset assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_reset = ~reset_n;

  //alt_vip_vfr_0_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_firsttransfer = alt_vip_vfr_0_avalon_slave_begins_xfer ? alt_vip_vfr_0_avalon_slave_unreg_firsttransfer : alt_vip_vfr_0_avalon_slave_reg_firsttransfer;

  //alt_vip_vfr_0_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_unreg_firsttransfer = ~(alt_vip_vfr_0_avalon_slave_slavearbiterlockenable & alt_vip_vfr_0_avalon_slave_any_continuerequest);

  //alt_vip_vfr_0_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          alt_vip_vfr_0_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (alt_vip_vfr_0_avalon_slave_begins_xfer)
          alt_vip_vfr_0_avalon_slave_reg_firsttransfer <= alt_vip_vfr_0_avalon_slave_unreg_firsttransfer;
    end


  //alt_vip_vfr_0_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_beginbursttransfer_internal = alt_vip_vfr_0_avalon_slave_begins_xfer;

  //alt_vip_vfr_0_avalon_slave_read assignment, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_read = cpu_data_master_granted_alt_vip_vfr_0_avalon_slave & cpu_data_master_read;

  //alt_vip_vfr_0_avalon_slave_write assignment, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_write = cpu_data_master_granted_alt_vip_vfr_0_avalon_slave & cpu_data_master_write;

  assign shifted_address_to_alt_vip_vfr_0_avalon_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //alt_vip_vfr_0_avalon_slave_address mux, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_address = shifted_address_to_alt_vip_vfr_0_avalon_slave_from_cpu_data_master >> 2;

  //d1_alt_vip_vfr_0_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_alt_vip_vfr_0_avalon_slave_end_xfer <= 1;
      else 
        d1_alt_vip_vfr_0_avalon_slave_end_xfer <= alt_vip_vfr_0_avalon_slave_end_xfer;
    end


  //alt_vip_vfr_0_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_waits_for_read = alt_vip_vfr_0_avalon_slave_in_a_read_cycle & 0;

  //alt_vip_vfr_0_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_in_a_read_cycle = cpu_data_master_granted_alt_vip_vfr_0_avalon_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = alt_vip_vfr_0_avalon_slave_in_a_read_cycle;

  //alt_vip_vfr_0_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign alt_vip_vfr_0_avalon_slave_waits_for_write = alt_vip_vfr_0_avalon_slave_in_a_write_cycle & 0;

  //alt_vip_vfr_0_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_in_a_write_cycle = cpu_data_master_granted_alt_vip_vfr_0_avalon_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = alt_vip_vfr_0_avalon_slave_in_a_write_cycle;

  assign wait_for_alt_vip_vfr_0_avalon_slave_counter = 0;
  //assign alt_vip_vfr_0_avalon_slave_irq_from_sa = alt_vip_vfr_0_avalon_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign alt_vip_vfr_0_avalon_slave_irq_from_sa = alt_vip_vfr_0_avalon_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //alt_vip_vfr_0/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module alt_vip_vfr_0_avalon_master_arbitrator (
                                                // inputs:
                                                 MTL_SOPC_burst_0_upstream_readdata_from_sa,
                                                 MTL_SOPC_burst_0_upstream_waitrequest_from_sa,
                                                 alt_vip_vfr_0_avalon_master_address,
                                                 alt_vip_vfr_0_avalon_master_burstcount,
                                                 alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream,
                                                 alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream,
                                                 alt_vip_vfr_0_avalon_master_read,
                                                 alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream,
                                                 alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register,
                                                 alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream,
                                                 clk,
                                                 d1_MTL_SOPC_burst_0_upstream_end_xfer,
                                                 reset_n,

                                                // outputs:
                                                 alt_vip_vfr_0_avalon_master_address_to_slave,
                                                 alt_vip_vfr_0_avalon_master_latency_counter,
                                                 alt_vip_vfr_0_avalon_master_readdata,
                                                 alt_vip_vfr_0_avalon_master_readdatavalid,
                                                 alt_vip_vfr_0_avalon_master_reset,
                                                 alt_vip_vfr_0_avalon_master_waitrequest
                                              )
;

  output  [ 31: 0] alt_vip_vfr_0_avalon_master_address_to_slave;
  output           alt_vip_vfr_0_avalon_master_latency_counter;
  output  [ 31: 0] alt_vip_vfr_0_avalon_master_readdata;
  output           alt_vip_vfr_0_avalon_master_readdatavalid;
  output           alt_vip_vfr_0_avalon_master_reset;
  output           alt_vip_vfr_0_avalon_master_waitrequest;
  input   [ 31: 0] MTL_SOPC_burst_0_upstream_readdata_from_sa;
  input            MTL_SOPC_burst_0_upstream_waitrequest_from_sa;
  input   [ 31: 0] alt_vip_vfr_0_avalon_master_address;
  input   [  5: 0] alt_vip_vfr_0_avalon_master_burstcount;
  input            alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream;
  input            alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream;
  input            alt_vip_vfr_0_avalon_master_read;
  input            alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream;
  input            alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register;
  input            alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream;
  input            clk;
  input            d1_MTL_SOPC_burst_0_upstream_end_xfer;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 31: 0] alt_vip_vfr_0_avalon_master_address_last_time;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_master_address_to_slave;
  reg     [  5: 0] alt_vip_vfr_0_avalon_master_burstcount_last_time;
  wire             alt_vip_vfr_0_avalon_master_latency_counter;
  reg              alt_vip_vfr_0_avalon_master_read_last_time;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_master_readdata;
  wire             alt_vip_vfr_0_avalon_master_readdatavalid;
  wire             alt_vip_vfr_0_avalon_master_reset;
  wire             alt_vip_vfr_0_avalon_master_run;
  wire             alt_vip_vfr_0_avalon_master_waitrequest;
  wire             pre_flush_alt_vip_vfr_0_avalon_master_readdatavalid;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream | ~alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream) & ((~alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream | ~(alt_vip_vfr_0_avalon_master_read) | (1 & ~MTL_SOPC_burst_0_upstream_waitrequest_from_sa & (alt_vip_vfr_0_avalon_master_read))));

  //cascaded wait assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign alt_vip_vfr_0_avalon_master_address_to_slave = {5'b1,
    alt_vip_vfr_0_avalon_master_address[26 : 0]};

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_alt_vip_vfr_0_avalon_master_readdatavalid = alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign alt_vip_vfr_0_avalon_master_readdatavalid = 0 |
    pre_flush_alt_vip_vfr_0_avalon_master_readdatavalid;

  //alt_vip_vfr_0/avalon_master readdata mux, which is an e_mux
  assign alt_vip_vfr_0_avalon_master_readdata = MTL_SOPC_burst_0_upstream_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_waitrequest = ~alt_vip_vfr_0_avalon_master_run;

  //latent max counter, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_latency_counter = 0;

  //~alt_vip_vfr_0_avalon_master_reset assignment, which is an e_assign
  assign alt_vip_vfr_0_avalon_master_reset = ~reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //alt_vip_vfr_0_avalon_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          alt_vip_vfr_0_avalon_master_address_last_time <= 0;
      else 
        alt_vip_vfr_0_avalon_master_address_last_time <= alt_vip_vfr_0_avalon_master_address;
    end


  //alt_vip_vfr_0/avalon_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= alt_vip_vfr_0_avalon_master_waitrequest & (alt_vip_vfr_0_avalon_master_read);
    end


  //alt_vip_vfr_0_avalon_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (alt_vip_vfr_0_avalon_master_address != alt_vip_vfr_0_avalon_master_address_last_time))
        begin
          $write("%0d ns: alt_vip_vfr_0_avalon_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //alt_vip_vfr_0_avalon_master_burstcount check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          alt_vip_vfr_0_avalon_master_burstcount_last_time <= 0;
      else 
        alt_vip_vfr_0_avalon_master_burstcount_last_time <= alt_vip_vfr_0_avalon_master_burstcount;
    end


  //alt_vip_vfr_0_avalon_master_burstcount matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (alt_vip_vfr_0_avalon_master_burstcount != alt_vip_vfr_0_avalon_master_burstcount_last_time))
        begin
          $write("%0d ns: alt_vip_vfr_0_avalon_master_burstcount did not heed wait!!!", $time);
          $stop;
        end
    end


  //alt_vip_vfr_0_avalon_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          alt_vip_vfr_0_avalon_master_read_last_time <= 0;
      else 
        alt_vip_vfr_0_avalon_master_read_last_time <= alt_vip_vfr_0_avalon_master_read;
    end


  //alt_vip_vfr_0_avalon_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (alt_vip_vfr_0_avalon_master_read != alt_vip_vfr_0_avalon_master_read_last_time))
        begin
          $write("%0d ns: alt_vip_vfr_0_avalon_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module alt_vip_vfr_0_avalon_streaming_source_arbitrator (
                                                          // inputs:
                                                           alt_vip_itc_0_din_ready_from_sa,
                                                           alt_vip_vfr_0_avalon_streaming_source_data,
                                                           alt_vip_vfr_0_avalon_streaming_source_endofpacket,
                                                           alt_vip_vfr_0_avalon_streaming_source_startofpacket,
                                                           alt_vip_vfr_0_avalon_streaming_source_valid,
                                                           clk,
                                                           reset_n,

                                                          // outputs:
                                                           alt_vip_vfr_0_avalon_streaming_source_ready
                                                        )
;

  output           alt_vip_vfr_0_avalon_streaming_source_ready;
  input            alt_vip_itc_0_din_ready_from_sa;
  input   [ 23: 0] alt_vip_vfr_0_avalon_streaming_source_data;
  input            alt_vip_vfr_0_avalon_streaming_source_endofpacket;
  input            alt_vip_vfr_0_avalon_streaming_source_startofpacket;
  input            alt_vip_vfr_0_avalon_streaming_source_valid;
  input            clk;
  input            reset_n;

  wire             alt_vip_vfr_0_avalon_streaming_source_ready;
  //mux alt_vip_vfr_0_avalon_streaming_source_ready, which is an e_mux
  assign alt_vip_vfr_0_avalon_streaming_source_ready = alt_vip_itc_0_din_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altpll_sys_pll_slave_arbitrator (
                                         // inputs:
                                          MTL_SOPC_clock_0_out_address_to_slave,
                                          MTL_SOPC_clock_0_out_read,
                                          MTL_SOPC_clock_0_out_write,
                                          MTL_SOPC_clock_0_out_writedata,
                                          altpll_sys_pll_slave_readdata,
                                          clk,
                                          reset_n,

                                         // outputs:
                                          MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave,
                                          MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave,
                                          altpll_sys_pll_slave_address,
                                          altpll_sys_pll_slave_read,
                                          altpll_sys_pll_slave_readdata_from_sa,
                                          altpll_sys_pll_slave_reset,
                                          altpll_sys_pll_slave_write,
                                          altpll_sys_pll_slave_writedata,
                                          d1_altpll_sys_pll_slave_end_xfer
                                       )
;

  output           MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave;
  output           MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave;
  output           MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave;
  output           MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;
  output  [  1: 0] altpll_sys_pll_slave_address;
  output           altpll_sys_pll_slave_read;
  output  [ 31: 0] altpll_sys_pll_slave_readdata_from_sa;
  output           altpll_sys_pll_slave_reset;
  output           altpll_sys_pll_slave_write;
  output  [ 31: 0] altpll_sys_pll_slave_writedata;
  output           d1_altpll_sys_pll_slave_end_xfer;
  input   [  3: 0] MTL_SOPC_clock_0_out_address_to_slave;
  input            MTL_SOPC_clock_0_out_read;
  input            MTL_SOPC_clock_0_out_write;
  input   [ 31: 0] MTL_SOPC_clock_0_out_writedata;
  input   [ 31: 0] altpll_sys_pll_slave_readdata;
  input            clk;
  input            reset_n;

  wire             MTL_SOPC_clock_0_out_arbiterlock;
  wire             MTL_SOPC_clock_0_out_arbiterlock2;
  wire             MTL_SOPC_clock_0_out_continuerequest;
  wire             MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave;
  wire             MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave;
  wire             MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave;
  wire             MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;
  wire             MTL_SOPC_clock_0_out_saved_grant_altpll_sys_pll_slave;
  wire    [  1: 0] altpll_sys_pll_slave_address;
  wire             altpll_sys_pll_slave_allgrants;
  wire             altpll_sys_pll_slave_allow_new_arb_cycle;
  wire             altpll_sys_pll_slave_any_bursting_master_saved_grant;
  wire             altpll_sys_pll_slave_any_continuerequest;
  wire             altpll_sys_pll_slave_arb_counter_enable;
  reg              altpll_sys_pll_slave_arb_share_counter;
  wire             altpll_sys_pll_slave_arb_share_counter_next_value;
  wire             altpll_sys_pll_slave_arb_share_set_values;
  wire             altpll_sys_pll_slave_beginbursttransfer_internal;
  wire             altpll_sys_pll_slave_begins_xfer;
  wire             altpll_sys_pll_slave_end_xfer;
  wire             altpll_sys_pll_slave_firsttransfer;
  wire             altpll_sys_pll_slave_grant_vector;
  wire             altpll_sys_pll_slave_in_a_read_cycle;
  wire             altpll_sys_pll_slave_in_a_write_cycle;
  wire             altpll_sys_pll_slave_master_qreq_vector;
  wire             altpll_sys_pll_slave_non_bursting_master_requests;
  wire             altpll_sys_pll_slave_read;
  wire    [ 31: 0] altpll_sys_pll_slave_readdata_from_sa;
  reg              altpll_sys_pll_slave_reg_firsttransfer;
  wire             altpll_sys_pll_slave_reset;
  reg              altpll_sys_pll_slave_slavearbiterlockenable;
  wire             altpll_sys_pll_slave_slavearbiterlockenable2;
  wire             altpll_sys_pll_slave_unreg_firsttransfer;
  wire             altpll_sys_pll_slave_waits_for_read;
  wire             altpll_sys_pll_slave_waits_for_write;
  wire             altpll_sys_pll_slave_write;
  wire    [ 31: 0] altpll_sys_pll_slave_writedata;
  reg              d1_altpll_sys_pll_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_altpll_sys_pll_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  3: 0] shifted_address_to_altpll_sys_pll_slave_from_MTL_SOPC_clock_0_out;
  wire             wait_for_altpll_sys_pll_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~altpll_sys_pll_slave_end_xfer;
    end


  assign altpll_sys_pll_slave_begins_xfer = ~d1_reasons_to_wait & ((MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave));
  //assign altpll_sys_pll_slave_readdata_from_sa = altpll_sys_pll_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign altpll_sys_pll_slave_readdata_from_sa = altpll_sys_pll_slave_readdata;

  assign MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave = (1) & (MTL_SOPC_clock_0_out_read | MTL_SOPC_clock_0_out_write);
  //altpll_sys_pll_slave_arb_share_counter set values, which is an e_mux
  assign altpll_sys_pll_slave_arb_share_set_values = 1;

  //altpll_sys_pll_slave_non_bursting_master_requests mux, which is an e_mux
  assign altpll_sys_pll_slave_non_bursting_master_requests = MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;

  //altpll_sys_pll_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign altpll_sys_pll_slave_any_bursting_master_saved_grant = 0;

  //altpll_sys_pll_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign altpll_sys_pll_slave_arb_share_counter_next_value = altpll_sys_pll_slave_firsttransfer ? (altpll_sys_pll_slave_arb_share_set_values - 1) : |altpll_sys_pll_slave_arb_share_counter ? (altpll_sys_pll_slave_arb_share_counter - 1) : 0;

  //altpll_sys_pll_slave_allgrants all slave grants, which is an e_mux
  assign altpll_sys_pll_slave_allgrants = |altpll_sys_pll_slave_grant_vector;

  //altpll_sys_pll_slave_end_xfer assignment, which is an e_assign
  assign altpll_sys_pll_slave_end_xfer = ~(altpll_sys_pll_slave_waits_for_read | altpll_sys_pll_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_altpll_sys_pll_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_altpll_sys_pll_slave = altpll_sys_pll_slave_end_xfer & (~altpll_sys_pll_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //altpll_sys_pll_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign altpll_sys_pll_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_altpll_sys_pll_slave & altpll_sys_pll_slave_allgrants) | (end_xfer_arb_share_counter_term_altpll_sys_pll_slave & ~altpll_sys_pll_slave_non_bursting_master_requests);

  //altpll_sys_pll_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_sys_pll_slave_arb_share_counter <= 0;
      else if (altpll_sys_pll_slave_arb_counter_enable)
          altpll_sys_pll_slave_arb_share_counter <= altpll_sys_pll_slave_arb_share_counter_next_value;
    end


  //altpll_sys_pll_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_sys_pll_slave_slavearbiterlockenable <= 0;
      else if ((|altpll_sys_pll_slave_master_qreq_vector & end_xfer_arb_share_counter_term_altpll_sys_pll_slave) | (end_xfer_arb_share_counter_term_altpll_sys_pll_slave & ~altpll_sys_pll_slave_non_bursting_master_requests))
          altpll_sys_pll_slave_slavearbiterlockenable <= |altpll_sys_pll_slave_arb_share_counter_next_value;
    end


  //MTL_SOPC_clock_0/out altpll_sys/pll_slave arbiterlock, which is an e_assign
  assign MTL_SOPC_clock_0_out_arbiterlock = altpll_sys_pll_slave_slavearbiterlockenable & MTL_SOPC_clock_0_out_continuerequest;

  //altpll_sys_pll_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign altpll_sys_pll_slave_slavearbiterlockenable2 = |altpll_sys_pll_slave_arb_share_counter_next_value;

  //MTL_SOPC_clock_0/out altpll_sys/pll_slave arbiterlock2, which is an e_assign
  assign MTL_SOPC_clock_0_out_arbiterlock2 = altpll_sys_pll_slave_slavearbiterlockenable2 & MTL_SOPC_clock_0_out_continuerequest;

  //altpll_sys_pll_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign altpll_sys_pll_slave_any_continuerequest = 1;

  //MTL_SOPC_clock_0_out_continuerequest continued request, which is an e_assign
  assign MTL_SOPC_clock_0_out_continuerequest = 1;

  assign MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave = MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;
  //altpll_sys_pll_slave_writedata mux, which is an e_mux
  assign altpll_sys_pll_slave_writedata = MTL_SOPC_clock_0_out_writedata;

  //master is always granted when requested
  assign MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave = MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave;

  //MTL_SOPC_clock_0/out saved-grant altpll_sys/pll_slave, which is an e_assign
  assign MTL_SOPC_clock_0_out_saved_grant_altpll_sys_pll_slave = MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;

  //allow new arb cycle for altpll_sys/pll_slave, which is an e_assign
  assign altpll_sys_pll_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign altpll_sys_pll_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign altpll_sys_pll_slave_master_qreq_vector = 1;

  //~altpll_sys_pll_slave_reset assignment, which is an e_assign
  assign altpll_sys_pll_slave_reset = ~reset_n;

  //altpll_sys_pll_slave_firsttransfer first transaction, which is an e_assign
  assign altpll_sys_pll_slave_firsttransfer = altpll_sys_pll_slave_begins_xfer ? altpll_sys_pll_slave_unreg_firsttransfer : altpll_sys_pll_slave_reg_firsttransfer;

  //altpll_sys_pll_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign altpll_sys_pll_slave_unreg_firsttransfer = ~(altpll_sys_pll_slave_slavearbiterlockenable & altpll_sys_pll_slave_any_continuerequest);

  //altpll_sys_pll_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          altpll_sys_pll_slave_reg_firsttransfer <= 1'b1;
      else if (altpll_sys_pll_slave_begins_xfer)
          altpll_sys_pll_slave_reg_firsttransfer <= altpll_sys_pll_slave_unreg_firsttransfer;
    end


  //altpll_sys_pll_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign altpll_sys_pll_slave_beginbursttransfer_internal = altpll_sys_pll_slave_begins_xfer;

  //altpll_sys_pll_slave_read assignment, which is an e_mux
  assign altpll_sys_pll_slave_read = MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave & MTL_SOPC_clock_0_out_read;

  //altpll_sys_pll_slave_write assignment, which is an e_mux
  assign altpll_sys_pll_slave_write = MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave & MTL_SOPC_clock_0_out_write;

  assign shifted_address_to_altpll_sys_pll_slave_from_MTL_SOPC_clock_0_out = MTL_SOPC_clock_0_out_address_to_slave;
  //altpll_sys_pll_slave_address mux, which is an e_mux
  assign altpll_sys_pll_slave_address = shifted_address_to_altpll_sys_pll_slave_from_MTL_SOPC_clock_0_out >> 2;

  //d1_altpll_sys_pll_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_altpll_sys_pll_slave_end_xfer <= 1;
      else 
        d1_altpll_sys_pll_slave_end_xfer <= altpll_sys_pll_slave_end_xfer;
    end


  //altpll_sys_pll_slave_waits_for_read in a cycle, which is an e_mux
  assign altpll_sys_pll_slave_waits_for_read = altpll_sys_pll_slave_in_a_read_cycle & 0;

  //altpll_sys_pll_slave_in_a_read_cycle assignment, which is an e_assign
  assign altpll_sys_pll_slave_in_a_read_cycle = MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave & MTL_SOPC_clock_0_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = altpll_sys_pll_slave_in_a_read_cycle;

  //altpll_sys_pll_slave_waits_for_write in a cycle, which is an e_mux
  assign altpll_sys_pll_slave_waits_for_write = altpll_sys_pll_slave_in_a_write_cycle & 0;

  //altpll_sys_pll_slave_in_a_write_cycle assignment, which is an e_assign
  assign altpll_sys_pll_slave_in_a_write_cycle = MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave & MTL_SOPC_clock_0_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = altpll_sys_pll_slave_in_a_write_cycle;

  assign wait_for_altpll_sys_pll_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //altpll_sys/pll_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_clock_crossing_io_s1_module (
                                                                     // inputs:
                                                                      clear_fifo,
                                                                      clk,
                                                                      data_in,
                                                                      read,
                                                                      reset_n,
                                                                      sync_reset,
                                                                      write,

                                                                     // outputs:
                                                                      data_out,
                                                                      empty,
                                                                      fifo_contains_ones_n,
                                                                      full
                                                                   )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_10;
  reg              full_11;
  reg              full_12;
  reg              full_13;
  reg              full_14;
  reg              full_15;
  reg              full_16;
  reg              full_17;
  reg              full_18;
  reg              full_19;
  reg              full_2;
  reg              full_20;
  reg              full_21;
  reg              full_22;
  reg              full_23;
  reg              full_24;
  reg              full_25;
  reg              full_26;
  reg              full_27;
  reg              full_28;
  reg              full_29;
  reg              full_3;
  reg              full_30;
  reg              full_31;
  wire             full_32;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  reg              full_7;
  reg              full_8;
  reg              full_9;
  reg     [  6: 0] how_many_ones;
  wire    [  6: 0] one_count_minus_one;
  wire    [  6: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p10_full_10;
  wire             p10_stage_10;
  wire             p11_full_11;
  wire             p11_stage_11;
  wire             p12_full_12;
  wire             p12_stage_12;
  wire             p13_full_13;
  wire             p13_stage_13;
  wire             p14_full_14;
  wire             p14_stage_14;
  wire             p15_full_15;
  wire             p15_stage_15;
  wire             p16_full_16;
  wire             p16_stage_16;
  wire             p17_full_17;
  wire             p17_stage_17;
  wire             p18_full_18;
  wire             p18_stage_18;
  wire             p19_full_19;
  wire             p19_stage_19;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p20_full_20;
  wire             p20_stage_20;
  wire             p21_full_21;
  wire             p21_stage_21;
  wire             p22_full_22;
  wire             p22_stage_22;
  wire             p23_full_23;
  wire             p23_stage_23;
  wire             p24_full_24;
  wire             p24_stage_24;
  wire             p25_full_25;
  wire             p25_stage_25;
  wire             p26_full_26;
  wire             p26_stage_26;
  wire             p27_full_27;
  wire             p27_stage_27;
  wire             p28_full_28;
  wire             p28_stage_28;
  wire             p29_full_29;
  wire             p29_stage_29;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p30_full_30;
  wire             p30_stage_30;
  wire             p31_full_31;
  wire             p31_stage_31;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  wire             p7_full_7;
  wire             p7_stage_7;
  wire             p8_full_8;
  wire             p8_stage_8;
  wire             p9_full_9;
  wire             p9_stage_9;
  reg              stage_0;
  reg              stage_1;
  reg              stage_10;
  reg              stage_11;
  reg              stage_12;
  reg              stage_13;
  reg              stage_14;
  reg              stage_15;
  reg              stage_16;
  reg              stage_17;
  reg              stage_18;
  reg              stage_19;
  reg              stage_2;
  reg              stage_20;
  reg              stage_21;
  reg              stage_22;
  reg              stage_23;
  reg              stage_24;
  reg              stage_25;
  reg              stage_26;
  reg              stage_27;
  reg              stage_28;
  reg              stage_29;
  reg              stage_3;
  reg              stage_30;
  reg              stage_31;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  reg              stage_7;
  reg              stage_8;
  reg              stage_9;
  wire    [  6: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_31;
  assign empty = !full_0;
  assign full_32 = 0;
  //data_31, which is an e_mux
  assign p31_stage_31 = ((full_32 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_31 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_31))
          if (sync_reset & full_31 & !((full_32 == 0) & read & write))
              stage_31 <= 0;
          else 
            stage_31 <= p31_stage_31;
    end


  //control_31, which is an e_mux
  assign p31_full_31 = ((read & !write) == 0)? full_30 :
    0;

  //control_reg_31, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_31 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_31 <= 0;
          else 
            full_31 <= p31_full_31;
    end


  //data_30, which is an e_mux
  assign p30_stage_30 = ((full_31 & ~clear_fifo) == 0)? data_in :
    stage_31;

  //data_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_30 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_30))
          if (sync_reset & full_30 & !((full_31 == 0) & read & write))
              stage_30 <= 0;
          else 
            stage_30 <= p30_stage_30;
    end


  //control_30, which is an e_mux
  assign p30_full_30 = ((read & !write) == 0)? full_29 :
    full_31;

  //control_reg_30, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_30 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_30 <= 0;
          else 
            full_30 <= p30_full_30;
    end


  //data_29, which is an e_mux
  assign p29_stage_29 = ((full_30 & ~clear_fifo) == 0)? data_in :
    stage_30;

  //data_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_29 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_29))
          if (sync_reset & full_29 & !((full_30 == 0) & read & write))
              stage_29 <= 0;
          else 
            stage_29 <= p29_stage_29;
    end


  //control_29, which is an e_mux
  assign p29_full_29 = ((read & !write) == 0)? full_28 :
    full_30;

  //control_reg_29, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_29 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_29 <= 0;
          else 
            full_29 <= p29_full_29;
    end


  //data_28, which is an e_mux
  assign p28_stage_28 = ((full_29 & ~clear_fifo) == 0)? data_in :
    stage_29;

  //data_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_28 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_28))
          if (sync_reset & full_28 & !((full_29 == 0) & read & write))
              stage_28 <= 0;
          else 
            stage_28 <= p28_stage_28;
    end


  //control_28, which is an e_mux
  assign p28_full_28 = ((read & !write) == 0)? full_27 :
    full_29;

  //control_reg_28, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_28 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_28 <= 0;
          else 
            full_28 <= p28_full_28;
    end


  //data_27, which is an e_mux
  assign p27_stage_27 = ((full_28 & ~clear_fifo) == 0)? data_in :
    stage_28;

  //data_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_27 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_27))
          if (sync_reset & full_27 & !((full_28 == 0) & read & write))
              stage_27 <= 0;
          else 
            stage_27 <= p27_stage_27;
    end


  //control_27, which is an e_mux
  assign p27_full_27 = ((read & !write) == 0)? full_26 :
    full_28;

  //control_reg_27, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_27 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_27 <= 0;
          else 
            full_27 <= p27_full_27;
    end


  //data_26, which is an e_mux
  assign p26_stage_26 = ((full_27 & ~clear_fifo) == 0)? data_in :
    stage_27;

  //data_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_26 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_26))
          if (sync_reset & full_26 & !((full_27 == 0) & read & write))
              stage_26 <= 0;
          else 
            stage_26 <= p26_stage_26;
    end


  //control_26, which is an e_mux
  assign p26_full_26 = ((read & !write) == 0)? full_25 :
    full_27;

  //control_reg_26, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_26 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_26 <= 0;
          else 
            full_26 <= p26_full_26;
    end


  //data_25, which is an e_mux
  assign p25_stage_25 = ((full_26 & ~clear_fifo) == 0)? data_in :
    stage_26;

  //data_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_25 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_25))
          if (sync_reset & full_25 & !((full_26 == 0) & read & write))
              stage_25 <= 0;
          else 
            stage_25 <= p25_stage_25;
    end


  //control_25, which is an e_mux
  assign p25_full_25 = ((read & !write) == 0)? full_24 :
    full_26;

  //control_reg_25, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_25 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_25 <= 0;
          else 
            full_25 <= p25_full_25;
    end


  //data_24, which is an e_mux
  assign p24_stage_24 = ((full_25 & ~clear_fifo) == 0)? data_in :
    stage_25;

  //data_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_24 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_24))
          if (sync_reset & full_24 & !((full_25 == 0) & read & write))
              stage_24 <= 0;
          else 
            stage_24 <= p24_stage_24;
    end


  //control_24, which is an e_mux
  assign p24_full_24 = ((read & !write) == 0)? full_23 :
    full_25;

  //control_reg_24, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_24 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_24 <= 0;
          else 
            full_24 <= p24_full_24;
    end


  //data_23, which is an e_mux
  assign p23_stage_23 = ((full_24 & ~clear_fifo) == 0)? data_in :
    stage_24;

  //data_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_23 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_23))
          if (sync_reset & full_23 & !((full_24 == 0) & read & write))
              stage_23 <= 0;
          else 
            stage_23 <= p23_stage_23;
    end


  //control_23, which is an e_mux
  assign p23_full_23 = ((read & !write) == 0)? full_22 :
    full_24;

  //control_reg_23, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_23 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_23 <= 0;
          else 
            full_23 <= p23_full_23;
    end


  //data_22, which is an e_mux
  assign p22_stage_22 = ((full_23 & ~clear_fifo) == 0)? data_in :
    stage_23;

  //data_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_22 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_22))
          if (sync_reset & full_22 & !((full_23 == 0) & read & write))
              stage_22 <= 0;
          else 
            stage_22 <= p22_stage_22;
    end


  //control_22, which is an e_mux
  assign p22_full_22 = ((read & !write) == 0)? full_21 :
    full_23;

  //control_reg_22, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_22 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_22 <= 0;
          else 
            full_22 <= p22_full_22;
    end


  //data_21, which is an e_mux
  assign p21_stage_21 = ((full_22 & ~clear_fifo) == 0)? data_in :
    stage_22;

  //data_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_21 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_21))
          if (sync_reset & full_21 & !((full_22 == 0) & read & write))
              stage_21 <= 0;
          else 
            stage_21 <= p21_stage_21;
    end


  //control_21, which is an e_mux
  assign p21_full_21 = ((read & !write) == 0)? full_20 :
    full_22;

  //control_reg_21, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_21 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_21 <= 0;
          else 
            full_21 <= p21_full_21;
    end


  //data_20, which is an e_mux
  assign p20_stage_20 = ((full_21 & ~clear_fifo) == 0)? data_in :
    stage_21;

  //data_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_20 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_20))
          if (sync_reset & full_20 & !((full_21 == 0) & read & write))
              stage_20 <= 0;
          else 
            stage_20 <= p20_stage_20;
    end


  //control_20, which is an e_mux
  assign p20_full_20 = ((read & !write) == 0)? full_19 :
    full_21;

  //control_reg_20, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_20 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_20 <= 0;
          else 
            full_20 <= p20_full_20;
    end


  //data_19, which is an e_mux
  assign p19_stage_19 = ((full_20 & ~clear_fifo) == 0)? data_in :
    stage_20;

  //data_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_19 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_19))
          if (sync_reset & full_19 & !((full_20 == 0) & read & write))
              stage_19 <= 0;
          else 
            stage_19 <= p19_stage_19;
    end


  //control_19, which is an e_mux
  assign p19_full_19 = ((read & !write) == 0)? full_18 :
    full_20;

  //control_reg_19, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_19 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_19 <= 0;
          else 
            full_19 <= p19_full_19;
    end


  //data_18, which is an e_mux
  assign p18_stage_18 = ((full_19 & ~clear_fifo) == 0)? data_in :
    stage_19;

  //data_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_18 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_18))
          if (sync_reset & full_18 & !((full_19 == 0) & read & write))
              stage_18 <= 0;
          else 
            stage_18 <= p18_stage_18;
    end


  //control_18, which is an e_mux
  assign p18_full_18 = ((read & !write) == 0)? full_17 :
    full_19;

  //control_reg_18, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_18 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_18 <= 0;
          else 
            full_18 <= p18_full_18;
    end


  //data_17, which is an e_mux
  assign p17_stage_17 = ((full_18 & ~clear_fifo) == 0)? data_in :
    stage_18;

  //data_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_17 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_17))
          if (sync_reset & full_17 & !((full_18 == 0) & read & write))
              stage_17 <= 0;
          else 
            stage_17 <= p17_stage_17;
    end


  //control_17, which is an e_mux
  assign p17_full_17 = ((read & !write) == 0)? full_16 :
    full_18;

  //control_reg_17, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_17 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_17 <= 0;
          else 
            full_17 <= p17_full_17;
    end


  //data_16, which is an e_mux
  assign p16_stage_16 = ((full_17 & ~clear_fifo) == 0)? data_in :
    stage_17;

  //data_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_16 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_16))
          if (sync_reset & full_16 & !((full_17 == 0) & read & write))
              stage_16 <= 0;
          else 
            stage_16 <= p16_stage_16;
    end


  //control_16, which is an e_mux
  assign p16_full_16 = ((read & !write) == 0)? full_15 :
    full_17;

  //control_reg_16, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_16 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_16 <= 0;
          else 
            full_16 <= p16_full_16;
    end


  //data_15, which is an e_mux
  assign p15_stage_15 = ((full_16 & ~clear_fifo) == 0)? data_in :
    stage_16;

  //data_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_15 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_15))
          if (sync_reset & full_15 & !((full_16 == 0) & read & write))
              stage_15 <= 0;
          else 
            stage_15 <= p15_stage_15;
    end


  //control_15, which is an e_mux
  assign p15_full_15 = ((read & !write) == 0)? full_14 :
    full_16;

  //control_reg_15, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_15 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_15 <= 0;
          else 
            full_15 <= p15_full_15;
    end


  //data_14, which is an e_mux
  assign p14_stage_14 = ((full_15 & ~clear_fifo) == 0)? data_in :
    stage_15;

  //data_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_14 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_14))
          if (sync_reset & full_14 & !((full_15 == 0) & read & write))
              stage_14 <= 0;
          else 
            stage_14 <= p14_stage_14;
    end


  //control_14, which is an e_mux
  assign p14_full_14 = ((read & !write) == 0)? full_13 :
    full_15;

  //control_reg_14, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_14 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_14 <= 0;
          else 
            full_14 <= p14_full_14;
    end


  //data_13, which is an e_mux
  assign p13_stage_13 = ((full_14 & ~clear_fifo) == 0)? data_in :
    stage_14;

  //data_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_13 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_13))
          if (sync_reset & full_13 & !((full_14 == 0) & read & write))
              stage_13 <= 0;
          else 
            stage_13 <= p13_stage_13;
    end


  //control_13, which is an e_mux
  assign p13_full_13 = ((read & !write) == 0)? full_12 :
    full_14;

  //control_reg_13, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_13 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_13 <= 0;
          else 
            full_13 <= p13_full_13;
    end


  //data_12, which is an e_mux
  assign p12_stage_12 = ((full_13 & ~clear_fifo) == 0)? data_in :
    stage_13;

  //data_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_12 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_12))
          if (sync_reset & full_12 & !((full_13 == 0) & read & write))
              stage_12 <= 0;
          else 
            stage_12 <= p12_stage_12;
    end


  //control_12, which is an e_mux
  assign p12_full_12 = ((read & !write) == 0)? full_11 :
    full_13;

  //control_reg_12, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_12 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_12 <= 0;
          else 
            full_12 <= p12_full_12;
    end


  //data_11, which is an e_mux
  assign p11_stage_11 = ((full_12 & ~clear_fifo) == 0)? data_in :
    stage_12;

  //data_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_11 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_11))
          if (sync_reset & full_11 & !((full_12 == 0) & read & write))
              stage_11 <= 0;
          else 
            stage_11 <= p11_stage_11;
    end


  //control_11, which is an e_mux
  assign p11_full_11 = ((read & !write) == 0)? full_10 :
    full_12;

  //control_reg_11, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_11 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_11 <= 0;
          else 
            full_11 <= p11_full_11;
    end


  //data_10, which is an e_mux
  assign p10_stage_10 = ((full_11 & ~clear_fifo) == 0)? data_in :
    stage_11;

  //data_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_10 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_10))
          if (sync_reset & full_10 & !((full_11 == 0) & read & write))
              stage_10 <= 0;
          else 
            stage_10 <= p10_stage_10;
    end


  //control_10, which is an e_mux
  assign p10_full_10 = ((read & !write) == 0)? full_9 :
    full_11;

  //control_reg_10, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_10 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_10 <= 0;
          else 
            full_10 <= p10_full_10;
    end


  //data_9, which is an e_mux
  assign p9_stage_9 = ((full_10 & ~clear_fifo) == 0)? data_in :
    stage_10;

  //data_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_9 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_9))
          if (sync_reset & full_9 & !((full_10 == 0) & read & write))
              stage_9 <= 0;
          else 
            stage_9 <= p9_stage_9;
    end


  //control_9, which is an e_mux
  assign p9_full_9 = ((read & !write) == 0)? full_8 :
    full_10;

  //control_reg_9, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_9 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_9 <= 0;
          else 
            full_9 <= p9_full_9;
    end


  //data_8, which is an e_mux
  assign p8_stage_8 = ((full_9 & ~clear_fifo) == 0)? data_in :
    stage_9;

  //data_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_8 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_8))
          if (sync_reset & full_8 & !((full_9 == 0) & read & write))
              stage_8 <= 0;
          else 
            stage_8 <= p8_stage_8;
    end


  //control_8, which is an e_mux
  assign p8_full_8 = ((read & !write) == 0)? full_7 :
    full_9;

  //control_reg_8, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_8 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_8 <= 0;
          else 
            full_8 <= p8_full_8;
    end


  //data_7, which is an e_mux
  assign p7_stage_7 = ((full_8 & ~clear_fifo) == 0)? data_in :
    stage_8;

  //data_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_7 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_7))
          if (sync_reset & full_7 & !((full_8 == 0) & read & write))
              stage_7 <= 0;
          else 
            stage_7 <= p7_stage_7;
    end


  //control_7, which is an e_mux
  assign p7_full_7 = ((read & !write) == 0)? full_6 :
    full_8;

  //control_reg_7, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_7 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_7 <= 0;
          else 
            full_7 <= p7_full_7;
    end


  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    stage_7;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    full_7;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_io_s1_arbitrator (
                                         // inputs:
                                          clk,
                                          clock_crossing_io_s1_endofpacket,
                                          clock_crossing_io_s1_readdata,
                                          clock_crossing_io_s1_readdatavalid,
                                          clock_crossing_io_s1_waitrequest,
                                          cpu_data_master_address_to_slave,
                                          cpu_data_master_byteenable,
                                          cpu_data_master_latency_counter,
                                          cpu_data_master_read,
                                          cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                          cpu_data_master_write,
                                          cpu_data_master_writedata,
                                          reset_n,

                                         // outputs:
                                          clock_crossing_io_s1_address,
                                          clock_crossing_io_s1_byteenable,
                                          clock_crossing_io_s1_endofpacket_from_sa,
                                          clock_crossing_io_s1_nativeaddress,
                                          clock_crossing_io_s1_read,
                                          clock_crossing_io_s1_readdata_from_sa,
                                          clock_crossing_io_s1_reset_n,
                                          clock_crossing_io_s1_waitrequest_from_sa,
                                          clock_crossing_io_s1_write,
                                          clock_crossing_io_s1_writedata,
                                          cpu_data_master_granted_clock_crossing_io_s1,
                                          cpu_data_master_qualified_request_clock_crossing_io_s1,
                                          cpu_data_master_read_data_valid_clock_crossing_io_s1,
                                          cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                          cpu_data_master_requests_clock_crossing_io_s1,
                                          d1_clock_crossing_io_s1_end_xfer
                                       )
;

  output  [  4: 0] clock_crossing_io_s1_address;
  output  [  3: 0] clock_crossing_io_s1_byteenable;
  output           clock_crossing_io_s1_endofpacket_from_sa;
  output  [  4: 0] clock_crossing_io_s1_nativeaddress;
  output           clock_crossing_io_s1_read;
  output  [ 31: 0] clock_crossing_io_s1_readdata_from_sa;
  output           clock_crossing_io_s1_reset_n;
  output           clock_crossing_io_s1_waitrequest_from_sa;
  output           clock_crossing_io_s1_write;
  output  [ 31: 0] clock_crossing_io_s1_writedata;
  output           cpu_data_master_granted_clock_crossing_io_s1;
  output           cpu_data_master_qualified_request_clock_crossing_io_s1;
  output           cpu_data_master_read_data_valid_clock_crossing_io_s1;
  output           cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  output           cpu_data_master_requests_clock_crossing_io_s1;
  output           d1_clock_crossing_io_s1_end_xfer;
  input            clk;
  input            clock_crossing_io_s1_endofpacket;
  input   [ 31: 0] clock_crossing_io_s1_readdata;
  input            clock_crossing_io_s1_readdatavalid;
  input            clock_crossing_io_s1_waitrequest;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;

  wire    [  4: 0] clock_crossing_io_s1_address;
  wire             clock_crossing_io_s1_allgrants;
  wire             clock_crossing_io_s1_allow_new_arb_cycle;
  wire             clock_crossing_io_s1_any_bursting_master_saved_grant;
  wire             clock_crossing_io_s1_any_continuerequest;
  wire             clock_crossing_io_s1_arb_counter_enable;
  reg     [  2: 0] clock_crossing_io_s1_arb_share_counter;
  wire    [  2: 0] clock_crossing_io_s1_arb_share_counter_next_value;
  wire    [  2: 0] clock_crossing_io_s1_arb_share_set_values;
  wire             clock_crossing_io_s1_beginbursttransfer_internal;
  wire             clock_crossing_io_s1_begins_xfer;
  wire    [  3: 0] clock_crossing_io_s1_byteenable;
  wire             clock_crossing_io_s1_end_xfer;
  wire             clock_crossing_io_s1_endofpacket_from_sa;
  wire             clock_crossing_io_s1_firsttransfer;
  wire             clock_crossing_io_s1_grant_vector;
  wire             clock_crossing_io_s1_in_a_read_cycle;
  wire             clock_crossing_io_s1_in_a_write_cycle;
  wire             clock_crossing_io_s1_master_qreq_vector;
  wire             clock_crossing_io_s1_move_on_to_next_transaction;
  wire    [  4: 0] clock_crossing_io_s1_nativeaddress;
  wire             clock_crossing_io_s1_non_bursting_master_requests;
  wire             clock_crossing_io_s1_read;
  wire    [ 31: 0] clock_crossing_io_s1_readdata_from_sa;
  wire             clock_crossing_io_s1_readdatavalid_from_sa;
  reg              clock_crossing_io_s1_reg_firsttransfer;
  wire             clock_crossing_io_s1_reset_n;
  reg              clock_crossing_io_s1_slavearbiterlockenable;
  wire             clock_crossing_io_s1_slavearbiterlockenable2;
  wire             clock_crossing_io_s1_unreg_firsttransfer;
  wire             clock_crossing_io_s1_waitrequest_from_sa;
  wire             clock_crossing_io_s1_waits_for_read;
  wire             clock_crossing_io_s1_waits_for_write;
  wire             clock_crossing_io_s1_write;
  wire    [ 31: 0] clock_crossing_io_s1_writedata;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_clock_crossing_io_s1;
  wire             cpu_data_master_qualified_request_clock_crossing_io_s1;
  wire             cpu_data_master_rdv_fifo_empty_clock_crossing_io_s1;
  wire             cpu_data_master_rdv_fifo_output_from_clock_crossing_io_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_io_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  wire             cpu_data_master_requests_clock_crossing_io_s1;
  wire             cpu_data_master_saved_grant_clock_crossing_io_s1;
  reg              d1_clock_crossing_io_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_clock_crossing_io_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 27: 0] shifted_address_to_clock_crossing_io_s1_from_cpu_data_master;
  wire             wait_for_clock_crossing_io_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~clock_crossing_io_s1_end_xfer;
    end


  assign clock_crossing_io_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_clock_crossing_io_s1));
  //assign clock_crossing_io_s1_readdatavalid_from_sa = clock_crossing_io_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_io_s1_readdatavalid_from_sa = clock_crossing_io_s1_readdatavalid;

  //assign clock_crossing_io_s1_readdata_from_sa = clock_crossing_io_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_io_s1_readdata_from_sa = clock_crossing_io_s1_readdata;

  assign cpu_data_master_requests_clock_crossing_io_s1 = ({cpu_data_master_address_to_slave[27 : 7] , 7'b0} == 28'h1000000) & (cpu_data_master_read | cpu_data_master_write);
  //assign clock_crossing_io_s1_waitrequest_from_sa = clock_crossing_io_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_io_s1_waitrequest_from_sa = clock_crossing_io_s1_waitrequest;

  //clock_crossing_io_s1_arb_share_counter set values, which is an e_mux
  assign clock_crossing_io_s1_arb_share_set_values = 1;

  //clock_crossing_io_s1_non_bursting_master_requests mux, which is an e_mux
  assign clock_crossing_io_s1_non_bursting_master_requests = cpu_data_master_requests_clock_crossing_io_s1;

  //clock_crossing_io_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign clock_crossing_io_s1_any_bursting_master_saved_grant = 0;

  //clock_crossing_io_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign clock_crossing_io_s1_arb_share_counter_next_value = clock_crossing_io_s1_firsttransfer ? (clock_crossing_io_s1_arb_share_set_values - 1) : |clock_crossing_io_s1_arb_share_counter ? (clock_crossing_io_s1_arb_share_counter - 1) : 0;

  //clock_crossing_io_s1_allgrants all slave grants, which is an e_mux
  assign clock_crossing_io_s1_allgrants = |clock_crossing_io_s1_grant_vector;

  //clock_crossing_io_s1_end_xfer assignment, which is an e_assign
  assign clock_crossing_io_s1_end_xfer = ~(clock_crossing_io_s1_waits_for_read | clock_crossing_io_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_clock_crossing_io_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_clock_crossing_io_s1 = clock_crossing_io_s1_end_xfer & (~clock_crossing_io_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //clock_crossing_io_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign clock_crossing_io_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_clock_crossing_io_s1 & clock_crossing_io_s1_allgrants) | (end_xfer_arb_share_counter_term_clock_crossing_io_s1 & ~clock_crossing_io_s1_non_bursting_master_requests);

  //clock_crossing_io_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_s1_arb_share_counter <= 0;
      else if (clock_crossing_io_s1_arb_counter_enable)
          clock_crossing_io_s1_arb_share_counter <= clock_crossing_io_s1_arb_share_counter_next_value;
    end


  //clock_crossing_io_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_s1_slavearbiterlockenable <= 0;
      else if ((|clock_crossing_io_s1_master_qreq_vector & end_xfer_arb_share_counter_term_clock_crossing_io_s1) | (end_xfer_arb_share_counter_term_clock_crossing_io_s1 & ~clock_crossing_io_s1_non_bursting_master_requests))
          clock_crossing_io_s1_slavearbiterlockenable <= |clock_crossing_io_s1_arb_share_counter_next_value;
    end


  //cpu/data_master clock_crossing_io/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = clock_crossing_io_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //clock_crossing_io_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign clock_crossing_io_s1_slavearbiterlockenable2 = |clock_crossing_io_s1_arb_share_counter_next_value;

  //cpu/data_master clock_crossing_io/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = clock_crossing_io_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //clock_crossing_io_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign clock_crossing_io_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_clock_crossing_io_s1 = cpu_data_master_requests_clock_crossing_io_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //unique name for clock_crossing_io_s1_move_on_to_next_transaction, which is an e_assign
  assign clock_crossing_io_s1_move_on_to_next_transaction = clock_crossing_io_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_data_master_to_clock_crossing_io_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_clock_crossing_io_s1_module rdv_fifo_for_cpu_data_master_to_clock_crossing_io_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_clock_crossing_io_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_clock_crossing_io_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_clock_crossing_io_s1),
      .full                 (),
      .read                 (clock_crossing_io_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~clock_crossing_io_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_clock_crossing_io_s1;
  //local readdatavalid cpu_data_master_read_data_valid_clock_crossing_io_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_clock_crossing_io_s1 = clock_crossing_io_s1_readdatavalid_from_sa;

  //clock_crossing_io_s1_writedata mux, which is an e_mux
  assign clock_crossing_io_s1_writedata = cpu_data_master_writedata;

  //assign clock_crossing_io_s1_endofpacket_from_sa = clock_crossing_io_s1_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign clock_crossing_io_s1_endofpacket_from_sa = clock_crossing_io_s1_endofpacket;

  //master is always granted when requested
  assign cpu_data_master_granted_clock_crossing_io_s1 = cpu_data_master_qualified_request_clock_crossing_io_s1;

  //cpu/data_master saved-grant clock_crossing_io/s1, which is an e_assign
  assign cpu_data_master_saved_grant_clock_crossing_io_s1 = cpu_data_master_requests_clock_crossing_io_s1;

  //allow new arb cycle for clock_crossing_io/s1, which is an e_assign
  assign clock_crossing_io_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign clock_crossing_io_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign clock_crossing_io_s1_master_qreq_vector = 1;

  //clock_crossing_io_s1_reset_n assignment, which is an e_assign
  assign clock_crossing_io_s1_reset_n = reset_n;

  //clock_crossing_io_s1_firsttransfer first transaction, which is an e_assign
  assign clock_crossing_io_s1_firsttransfer = clock_crossing_io_s1_begins_xfer ? clock_crossing_io_s1_unreg_firsttransfer : clock_crossing_io_s1_reg_firsttransfer;

  //clock_crossing_io_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign clock_crossing_io_s1_unreg_firsttransfer = ~(clock_crossing_io_s1_slavearbiterlockenable & clock_crossing_io_s1_any_continuerequest);

  //clock_crossing_io_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_s1_reg_firsttransfer <= 1'b1;
      else if (clock_crossing_io_s1_begins_xfer)
          clock_crossing_io_s1_reg_firsttransfer <= clock_crossing_io_s1_unreg_firsttransfer;
    end


  //clock_crossing_io_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign clock_crossing_io_s1_beginbursttransfer_internal = clock_crossing_io_s1_begins_xfer;

  //clock_crossing_io_s1_read assignment, which is an e_mux
  assign clock_crossing_io_s1_read = cpu_data_master_granted_clock_crossing_io_s1 & cpu_data_master_read;

  //clock_crossing_io_s1_write assignment, which is an e_mux
  assign clock_crossing_io_s1_write = cpu_data_master_granted_clock_crossing_io_s1 & cpu_data_master_write;

  assign shifted_address_to_clock_crossing_io_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //clock_crossing_io_s1_address mux, which is an e_mux
  assign clock_crossing_io_s1_address = shifted_address_to_clock_crossing_io_s1_from_cpu_data_master >> 2;

  //slaveid clock_crossing_io_s1_nativeaddress nativeaddress mux, which is an e_mux
  assign clock_crossing_io_s1_nativeaddress = cpu_data_master_address_to_slave >> 2;

  //d1_clock_crossing_io_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_clock_crossing_io_s1_end_xfer <= 1;
      else 
        d1_clock_crossing_io_s1_end_xfer <= clock_crossing_io_s1_end_xfer;
    end


  //clock_crossing_io_s1_waits_for_read in a cycle, which is an e_mux
  assign clock_crossing_io_s1_waits_for_read = clock_crossing_io_s1_in_a_read_cycle & clock_crossing_io_s1_waitrequest_from_sa;

  //clock_crossing_io_s1_in_a_read_cycle assignment, which is an e_assign
  assign clock_crossing_io_s1_in_a_read_cycle = cpu_data_master_granted_clock_crossing_io_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = clock_crossing_io_s1_in_a_read_cycle;

  //clock_crossing_io_s1_waits_for_write in a cycle, which is an e_mux
  assign clock_crossing_io_s1_waits_for_write = clock_crossing_io_s1_in_a_write_cycle & clock_crossing_io_s1_waitrequest_from_sa;

  //clock_crossing_io_s1_in_a_write_cycle assignment, which is an e_assign
  assign clock_crossing_io_s1_in_a_write_cycle = cpu_data_master_granted_clock_crossing_io_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = clock_crossing_io_s1_in_a_write_cycle;

  assign wait_for_clock_crossing_io_s1_counter = 0;
  //clock_crossing_io_s1_byteenable byte enable port mux, which is an e_mux
  assign clock_crossing_io_s1_byteenable = (cpu_data_master_granted_clock_crossing_io_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clock_crossing_io/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_io_m1_arbitrator (
                                         // inputs:
                                          clk,
                                          clock_crossing_io_m1_address,
                                          clock_crossing_io_m1_byteenable,
                                          clock_crossing_io_m1_granted_key_s1,
                                          clock_crossing_io_m1_granted_lcd_control_slave,
                                          clock_crossing_io_m1_granted_led_s1,
                                          clock_crossing_io_m1_granted_sw_s1,
                                          clock_crossing_io_m1_granted_sysid_control_slave,
                                          clock_crossing_io_m1_granted_timer_s1,
                                          clock_crossing_io_m1_qualified_request_key_s1,
                                          clock_crossing_io_m1_qualified_request_lcd_control_slave,
                                          clock_crossing_io_m1_qualified_request_led_s1,
                                          clock_crossing_io_m1_qualified_request_sw_s1,
                                          clock_crossing_io_m1_qualified_request_sysid_control_slave,
                                          clock_crossing_io_m1_qualified_request_timer_s1,
                                          clock_crossing_io_m1_read,
                                          clock_crossing_io_m1_read_data_valid_key_s1,
                                          clock_crossing_io_m1_read_data_valid_lcd_control_slave,
                                          clock_crossing_io_m1_read_data_valid_led_s1,
                                          clock_crossing_io_m1_read_data_valid_sw_s1,
                                          clock_crossing_io_m1_read_data_valid_sysid_control_slave,
                                          clock_crossing_io_m1_read_data_valid_timer_s1,
                                          clock_crossing_io_m1_requests_key_s1,
                                          clock_crossing_io_m1_requests_lcd_control_slave,
                                          clock_crossing_io_m1_requests_led_s1,
                                          clock_crossing_io_m1_requests_sw_s1,
                                          clock_crossing_io_m1_requests_sysid_control_slave,
                                          clock_crossing_io_m1_requests_timer_s1,
                                          clock_crossing_io_m1_write,
                                          clock_crossing_io_m1_writedata,
                                          d1_key_s1_end_xfer,
                                          d1_lcd_control_slave_end_xfer,
                                          d1_led_s1_end_xfer,
                                          d1_sw_s1_end_xfer,
                                          d1_sysid_control_slave_end_xfer,
                                          d1_timer_s1_end_xfer,
                                          key_s1_readdata_from_sa,
                                          lcd_control_slave_readdata_from_sa,
                                          lcd_control_slave_wait_counter_eq_0,
                                          led_s1_readdata_from_sa,
                                          reset_n,
                                          sw_s1_readdata_from_sa,
                                          sysid_control_slave_readdata_from_sa,
                                          timer_s1_readdata_from_sa,

                                         // outputs:
                                          clock_crossing_io_m1_address_to_slave,
                                          clock_crossing_io_m1_latency_counter,
                                          clock_crossing_io_m1_readdata,
                                          clock_crossing_io_m1_readdatavalid,
                                          clock_crossing_io_m1_reset_n,
                                          clock_crossing_io_m1_waitrequest
                                       )
;

  output  [  6: 0] clock_crossing_io_m1_address_to_slave;
  output           clock_crossing_io_m1_latency_counter;
  output  [ 31: 0] clock_crossing_io_m1_readdata;
  output           clock_crossing_io_m1_readdatavalid;
  output           clock_crossing_io_m1_reset_n;
  output           clock_crossing_io_m1_waitrequest;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address;
  input   [  3: 0] clock_crossing_io_m1_byteenable;
  input            clock_crossing_io_m1_granted_key_s1;
  input            clock_crossing_io_m1_granted_lcd_control_slave;
  input            clock_crossing_io_m1_granted_led_s1;
  input            clock_crossing_io_m1_granted_sw_s1;
  input            clock_crossing_io_m1_granted_sysid_control_slave;
  input            clock_crossing_io_m1_granted_timer_s1;
  input            clock_crossing_io_m1_qualified_request_key_s1;
  input            clock_crossing_io_m1_qualified_request_lcd_control_slave;
  input            clock_crossing_io_m1_qualified_request_led_s1;
  input            clock_crossing_io_m1_qualified_request_sw_s1;
  input            clock_crossing_io_m1_qualified_request_sysid_control_slave;
  input            clock_crossing_io_m1_qualified_request_timer_s1;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_read_data_valid_key_s1;
  input            clock_crossing_io_m1_read_data_valid_lcd_control_slave;
  input            clock_crossing_io_m1_read_data_valid_led_s1;
  input            clock_crossing_io_m1_read_data_valid_sw_s1;
  input            clock_crossing_io_m1_read_data_valid_sysid_control_slave;
  input            clock_crossing_io_m1_read_data_valid_timer_s1;
  input            clock_crossing_io_m1_requests_key_s1;
  input            clock_crossing_io_m1_requests_lcd_control_slave;
  input            clock_crossing_io_m1_requests_led_s1;
  input            clock_crossing_io_m1_requests_sw_s1;
  input            clock_crossing_io_m1_requests_sysid_control_slave;
  input            clock_crossing_io_m1_requests_timer_s1;
  input            clock_crossing_io_m1_write;
  input   [ 31: 0] clock_crossing_io_m1_writedata;
  input            d1_key_s1_end_xfer;
  input            d1_lcd_control_slave_end_xfer;
  input            d1_led_s1_end_xfer;
  input            d1_sw_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_s1_end_xfer;
  input   [  3: 0] key_s1_readdata_from_sa;
  input   [  7: 0] lcd_control_slave_readdata_from_sa;
  input            lcd_control_slave_wait_counter_eq_0;
  input   [ 26: 0] led_s1_readdata_from_sa;
  input            reset_n;
  input   [ 17: 0] sw_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input   [ 15: 0] timer_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [  6: 0] clock_crossing_io_m1_address_last_time;
  wire    [  6: 0] clock_crossing_io_m1_address_to_slave;
  reg     [  3: 0] clock_crossing_io_m1_byteenable_last_time;
  wire             clock_crossing_io_m1_is_granted_some_slave;
  reg              clock_crossing_io_m1_latency_counter;
  reg              clock_crossing_io_m1_read_but_no_slave_selected;
  reg              clock_crossing_io_m1_read_last_time;
  wire    [ 31: 0] clock_crossing_io_m1_readdata;
  wire             clock_crossing_io_m1_readdatavalid;
  wire             clock_crossing_io_m1_reset_n;
  wire             clock_crossing_io_m1_run;
  wire             clock_crossing_io_m1_waitrequest;
  reg              clock_crossing_io_m1_write_last_time;
  reg     [ 31: 0] clock_crossing_io_m1_writedata_last_time;
  wire             latency_load_value;
  wire             p1_clock_crossing_io_m1_latency_counter;
  wire             pre_flush_clock_crossing_io_m1_readdatavalid;
  wire             r_1;
  wire             r_2;
  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = 1 & (clock_crossing_io_m1_qualified_request_key_s1 | ~clock_crossing_io_m1_requests_key_s1) & ((~clock_crossing_io_m1_qualified_request_key_s1 | ~clock_crossing_io_m1_read | (1 & ~d1_key_s1_end_xfer & clock_crossing_io_m1_read))) & ((~clock_crossing_io_m1_qualified_request_key_s1 | ~clock_crossing_io_m1_write | (1 & clock_crossing_io_m1_write))) & 1 & (clock_crossing_io_m1_qualified_request_lcd_control_slave | ~clock_crossing_io_m1_requests_lcd_control_slave) & ((~clock_crossing_io_m1_qualified_request_lcd_control_slave | ~clock_crossing_io_m1_read | (1 & ((lcd_control_slave_wait_counter_eq_0 & ~d1_lcd_control_slave_end_xfer)) & clock_crossing_io_m1_read))) & ((~clock_crossing_io_m1_qualified_request_lcd_control_slave | ~clock_crossing_io_m1_write | (1 & ((lcd_control_slave_wait_counter_eq_0 & ~d1_lcd_control_slave_end_xfer)) & clock_crossing_io_m1_write))) & 1 & (clock_crossing_io_m1_qualified_request_led_s1 | ~clock_crossing_io_m1_requests_led_s1) & ((~clock_crossing_io_m1_qualified_request_led_s1 | ~clock_crossing_io_m1_read | (1 & ~d1_led_s1_end_xfer & clock_crossing_io_m1_read))) & ((~clock_crossing_io_m1_qualified_request_led_s1 | ~clock_crossing_io_m1_write | (1 & clock_crossing_io_m1_write)));

  //cascaded wait assignment, which is an e_assign
  assign clock_crossing_io_m1_run = r_1 & r_2;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (clock_crossing_io_m1_qualified_request_sw_s1 | ~clock_crossing_io_m1_requests_sw_s1) & ((~clock_crossing_io_m1_qualified_request_sw_s1 | ~clock_crossing_io_m1_read | (1 & ~d1_sw_s1_end_xfer & clock_crossing_io_m1_read))) & ((~clock_crossing_io_m1_qualified_request_sw_s1 | ~clock_crossing_io_m1_write | (1 & clock_crossing_io_m1_write))) & 1 & (clock_crossing_io_m1_qualified_request_sysid_control_slave | ~clock_crossing_io_m1_requests_sysid_control_slave) & ((~clock_crossing_io_m1_qualified_request_sysid_control_slave | ~clock_crossing_io_m1_read | (1 & ~d1_sysid_control_slave_end_xfer & clock_crossing_io_m1_read))) & ((~clock_crossing_io_m1_qualified_request_sysid_control_slave | ~clock_crossing_io_m1_write | (1 & clock_crossing_io_m1_write))) & 1 & (clock_crossing_io_m1_qualified_request_timer_s1 | ~clock_crossing_io_m1_requests_timer_s1) & ((~clock_crossing_io_m1_qualified_request_timer_s1 | ~clock_crossing_io_m1_read | (1 & ~d1_timer_s1_end_xfer & clock_crossing_io_m1_read))) & ((~clock_crossing_io_m1_qualified_request_timer_s1 | ~clock_crossing_io_m1_write | (1 & clock_crossing_io_m1_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign clock_crossing_io_m1_address_to_slave = clock_crossing_io_m1_address[6 : 0];

  //clock_crossing_io_m1_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_read_but_no_slave_selected <= 0;
      else 
        clock_crossing_io_m1_read_but_no_slave_selected <= clock_crossing_io_m1_read & clock_crossing_io_m1_run & ~clock_crossing_io_m1_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign clock_crossing_io_m1_is_granted_some_slave = clock_crossing_io_m1_granted_key_s1 |
    clock_crossing_io_m1_granted_lcd_control_slave |
    clock_crossing_io_m1_granted_led_s1 |
    clock_crossing_io_m1_granted_sw_s1 |
    clock_crossing_io_m1_granted_sysid_control_slave |
    clock_crossing_io_m1_granted_timer_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_clock_crossing_io_m1_readdatavalid = 0;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign clock_crossing_io_m1_readdatavalid = clock_crossing_io_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_io_m1_readdatavalid |
    clock_crossing_io_m1_read_data_valid_key_s1 |
    clock_crossing_io_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_io_m1_readdatavalid |
    clock_crossing_io_m1_read_data_valid_lcd_control_slave |
    clock_crossing_io_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_io_m1_readdatavalid |
    clock_crossing_io_m1_read_data_valid_led_s1 |
    clock_crossing_io_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_io_m1_readdatavalid |
    clock_crossing_io_m1_read_data_valid_sw_s1 |
    clock_crossing_io_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_io_m1_readdatavalid |
    clock_crossing_io_m1_read_data_valid_sysid_control_slave |
    clock_crossing_io_m1_read_but_no_slave_selected |
    pre_flush_clock_crossing_io_m1_readdatavalid |
    clock_crossing_io_m1_read_data_valid_timer_s1;

  //clock_crossing_io/m1 readdata mux, which is an e_mux
  assign clock_crossing_io_m1_readdata = ({32 {~(clock_crossing_io_m1_qualified_request_key_s1 & clock_crossing_io_m1_read)}} | key_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_io_m1_qualified_request_lcd_control_slave & clock_crossing_io_m1_read)}} | lcd_control_slave_readdata_from_sa) &
    ({32 {~(clock_crossing_io_m1_qualified_request_led_s1 & clock_crossing_io_m1_read)}} | led_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_io_m1_qualified_request_sw_s1 & clock_crossing_io_m1_read)}} | sw_s1_readdata_from_sa) &
    ({32 {~(clock_crossing_io_m1_qualified_request_sysid_control_slave & clock_crossing_io_m1_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(clock_crossing_io_m1_qualified_request_timer_s1 & clock_crossing_io_m1_read)}} | timer_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign clock_crossing_io_m1_waitrequest = ~clock_crossing_io_m1_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_latency_counter <= 0;
      else 
        clock_crossing_io_m1_latency_counter <= p1_clock_crossing_io_m1_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_clock_crossing_io_m1_latency_counter = ((clock_crossing_io_m1_run & clock_crossing_io_m1_read))? latency_load_value :
    (clock_crossing_io_m1_latency_counter)? clock_crossing_io_m1_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = 0;

  //clock_crossing_io_m1_reset_n assignment, which is an e_assign
  assign clock_crossing_io_m1_reset_n = reset_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //clock_crossing_io_m1_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_address_last_time <= 0;
      else 
        clock_crossing_io_m1_address_last_time <= clock_crossing_io_m1_address;
    end


  //clock_crossing_io/m1 waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= clock_crossing_io_m1_waitrequest & (clock_crossing_io_m1_read | clock_crossing_io_m1_write);
    end


  //clock_crossing_io_m1_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_io_m1_address != clock_crossing_io_m1_address_last_time))
        begin
          $write("%0d ns: clock_crossing_io_m1_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_io_m1_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_byteenable_last_time <= 0;
      else 
        clock_crossing_io_m1_byteenable_last_time <= clock_crossing_io_m1_byteenable;
    end


  //clock_crossing_io_m1_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_io_m1_byteenable != clock_crossing_io_m1_byteenable_last_time))
        begin
          $write("%0d ns: clock_crossing_io_m1_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_io_m1_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_read_last_time <= 0;
      else 
        clock_crossing_io_m1_read_last_time <= clock_crossing_io_m1_read;
    end


  //clock_crossing_io_m1_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_io_m1_read != clock_crossing_io_m1_read_last_time))
        begin
          $write("%0d ns: clock_crossing_io_m1_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_io_m1_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_write_last_time <= 0;
      else 
        clock_crossing_io_m1_write_last_time <= clock_crossing_io_m1_write;
    end


  //clock_crossing_io_m1_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_io_m1_write != clock_crossing_io_m1_write_last_time))
        begin
          $write("%0d ns: clock_crossing_io_m1_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //clock_crossing_io_m1_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          clock_crossing_io_m1_writedata_last_time <= 0;
      else 
        clock_crossing_io_m1_writedata_last_time <= clock_crossing_io_m1_writedata;
    end


  //clock_crossing_io_m1_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (clock_crossing_io_m1_writedata != clock_crossing_io_m1_writedata_last_time) & clock_crossing_io_m1_write)
        begin
          $write("%0d ns: clock_crossing_io_m1_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module clock_crossing_io_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_latency_counter,
                                           cpu_data_master_read,
                                           cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                           cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_latency_counter,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg     [  2: 0] cpu_jtag_debug_module_arb_share_counter;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_counter_next_value;
  wire    [  2: 0] cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 27: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h1000) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_data_master_read_data_valid_cpu_jtag_debug_module = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[25 : 11] , 11'b0} == 26'h1000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_cpu_jtag_debug_module, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cpu_jtag_debug_module = cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read & ~cpu_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module key_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                  // inputs:
                                                                   clk,
                                                                   data_in,
                                                                   reset_n,

                                                                  // outputs:
                                                                   data_out
                                                                )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module multi_touch_avalon_slave_irq_n_from_sa_clock_crossing_cpu_data_master_module (
                                                                                      // inputs:
                                                                                       clk,
                                                                                       data_in,
                                                                                       reset_n,

                                                                                      // outputs:
                                                                                       data_out
                                                                                    )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module (
                                                                    // inputs:
                                                                     clk,
                                                                     data_in,
                                                                     reset_n,

                                                                    // outputs:
                                                                     data_out
                                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     MTL_SOPC_clock_0_in_readdata_from_sa,
                                     MTL_SOPC_clock_0_in_waitrequest_from_sa,
                                     MTL_SOPC_clock_1_in_readdata_from_sa,
                                     MTL_SOPC_clock_1_in_waitrequest_from_sa,
                                     alt_vip_vfr_0_avalon_slave_irq_from_sa,
                                     alt_vip_vfr_0_avalon_slave_readdata_from_sa,
                                     altpll_sys,
                                     altpll_sys_reset_n,
                                     cfi_flash_s1_wait_counter_eq_0,
                                     clk,
                                     clock_crossing_io_s1_readdata_from_sa,
                                     clock_crossing_io_s1_waitrequest_from_sa,
                                     cpu_data_master_address,
                                     cpu_data_master_byteenable,
                                     cpu_data_master_byteenable_cfi_flash_s1,
                                     cpu_data_master_byteenable_sram_avalon_slave,
                                     cpu_data_master_granted_MTL_SOPC_clock_0_in,
                                     cpu_data_master_granted_MTL_SOPC_clock_1_in,
                                     cpu_data_master_granted_alt_vip_vfr_0_avalon_slave,
                                     cpu_data_master_granted_cfi_flash_s1,
                                     cpu_data_master_granted_clock_crossing_io_s1,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_epcs_flash_controller_epcs_control_port,
                                     cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_granted_sdram_s1,
                                     cpu_data_master_granted_sram_avalon_slave,
                                     cpu_data_master_qualified_request_MTL_SOPC_clock_0_in,
                                     cpu_data_master_qualified_request_MTL_SOPC_clock_1_in,
                                     cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave,
                                     cpu_data_master_qualified_request_cfi_flash_s1,
                                     cpu_data_master_qualified_request_clock_crossing_io_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port,
                                     cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_qualified_request_sdram_s1,
                                     cpu_data_master_qualified_request_sram_avalon_slave,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in,
                                     cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in,
                                     cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave,
                                     cpu_data_master_read_data_valid_cfi_flash_s1,
                                     cpu_data_master_read_data_valid_clock_crossing_io_s1,
                                     cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port,
                                     cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_read_data_valid_sdram_s1,
                                     cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                     cpu_data_master_read_data_valid_sram_avalon_slave,
                                     cpu_data_master_requests_MTL_SOPC_clock_0_in,
                                     cpu_data_master_requests_MTL_SOPC_clock_1_in,
                                     cpu_data_master_requests_alt_vip_vfr_0_avalon_slave,
                                     cpu_data_master_requests_cfi_flash_s1,
                                     cpu_data_master_requests_clock_crossing_io_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_epcs_flash_controller_epcs_control_port,
                                     cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                     cpu_data_master_requests_sdram_s1,
                                     cpu_data_master_requests_sram_avalon_slave,
                                     cpu_data_master_write,
                                     cpu_data_master_writedata,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_MTL_SOPC_clock_0_in_end_xfer,
                                     d1_MTL_SOPC_clock_1_in_end_xfer,
                                     d1_alt_vip_vfr_0_avalon_slave_end_xfer,
                                     d1_clock_crossing_io_s1_end_xfer,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_epcs_flash_controller_epcs_control_port_end_xfer,
                                     d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                     d1_sdram_s1_end_xfer,
                                     d1_sram_avalon_slave_end_xfer,
                                     d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                     epcs_flash_controller_epcs_control_port_irq_from_sa,
                                     epcs_flash_controller_epcs_control_port_readdata_from_sa,
                                     incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                     jtag_uart_avalon_jtag_slave_irq_from_sa,
                                     jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                     jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                     key_s1_irq_from_sa,
                                     multi_touch_avalon_slave_irq_n_from_sa,
                                     reset_n,
                                     sdram_s1_readdata_from_sa,
                                     sdram_s1_waitrequest_from_sa,
                                     sram_avalon_slave_readdata_from_sa,
                                     sram_avalon_slave_wait_counter_eq_0,
                                     timer_s1_irq_from_sa,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_dbs_address,
                                     cpu_data_master_dbs_write_16,
                                     cpu_data_master_dbs_write_8,
                                     cpu_data_master_irq,
                                     cpu_data_master_latency_counter,
                                     cpu_data_master_readdata,
                                     cpu_data_master_readdatavalid,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 27: 0] cpu_data_master_address_to_slave;
  output  [  1: 0] cpu_data_master_dbs_address;
  output  [ 15: 0] cpu_data_master_dbs_write_16;
  output  [  7: 0] cpu_data_master_dbs_write_8;
  output  [ 31: 0] cpu_data_master_irq;
  output  [  1: 0] cpu_data_master_latency_counter;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_readdatavalid;
  output           cpu_data_master_waitrequest;
  input   [ 31: 0] MTL_SOPC_clock_0_in_readdata_from_sa;
  input            MTL_SOPC_clock_0_in_waitrequest_from_sa;
  input   [ 15: 0] MTL_SOPC_clock_1_in_readdata_from_sa;
  input            MTL_SOPC_clock_1_in_waitrequest_from_sa;
  input            alt_vip_vfr_0_avalon_slave_irq_from_sa;
  input   [ 31: 0] alt_vip_vfr_0_avalon_slave_readdata_from_sa;
  input            altpll_sys;
  input            altpll_sys_reset_n;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 31: 0] clock_crossing_io_s1_readdata_from_sa;
  input            clock_crossing_io_s1_waitrequest_from_sa;
  input   [ 27: 0] cpu_data_master_address;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_byteenable_cfi_flash_s1;
  input   [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  input            cpu_data_master_granted_MTL_SOPC_clock_0_in;
  input            cpu_data_master_granted_MTL_SOPC_clock_1_in;
  input            cpu_data_master_granted_alt_vip_vfr_0_avalon_slave;
  input            cpu_data_master_granted_cfi_flash_s1;
  input            cpu_data_master_granted_clock_crossing_io_s1;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_epcs_flash_controller_epcs_control_port;
  input            cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_granted_sdram_s1;
  input            cpu_data_master_granted_sram_avalon_slave;
  input            cpu_data_master_qualified_request_MTL_SOPC_clock_0_in;
  input            cpu_data_master_qualified_request_MTL_SOPC_clock_1_in;
  input            cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave;
  input            cpu_data_master_qualified_request_cfi_flash_s1;
  input            cpu_data_master_qualified_request_clock_crossing_io_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port;
  input            cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_qualified_request_sdram_s1;
  input            cpu_data_master_qualified_request_sram_avalon_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in;
  input            cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in;
  input            cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave;
  input            cpu_data_master_read_data_valid_cfi_flash_s1;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  input            cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_read_data_valid_sdram_s1;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_read_data_valid_sram_avalon_slave;
  input            cpu_data_master_requests_MTL_SOPC_clock_0_in;
  input            cpu_data_master_requests_MTL_SOPC_clock_1_in;
  input            cpu_data_master_requests_alt_vip_vfr_0_avalon_slave;
  input            cpu_data_master_requests_cfi_flash_s1;
  input            cpu_data_master_requests_clock_crossing_io_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_epcs_flash_controller_epcs_control_port;
  input            cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  input            cpu_data_master_requests_sdram_s1;
  input            cpu_data_master_requests_sram_avalon_slave;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_MTL_SOPC_clock_0_in_end_xfer;
  input            d1_MTL_SOPC_clock_1_in_end_xfer;
  input            d1_alt_vip_vfr_0_avalon_slave_end_xfer;
  input            d1_clock_crossing_io_s1_end_xfer;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_epcs_flash_controller_epcs_control_port_end_xfer;
  input            d1_jtag_uart_avalon_jtag_slave_end_xfer;
  input            d1_sdram_s1_end_xfer;
  input            d1_sram_avalon_slave_end_xfer;
  input            d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  input            epcs_flash_controller_epcs_control_port_irq_from_sa;
  input   [ 31: 0] epcs_flash_controller_epcs_control_port_readdata_from_sa;
  input   [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  input            jtag_uart_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  input            key_s1_irq_from_sa;
  input            multi_touch_avalon_slave_irq_n_from_sa;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata_from_sa;
  input            sdram_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_avalon_slave_readdata_from_sa;
  input            sram_avalon_slave_wait_counter_eq_0;
  input            timer_s1_irq_from_sa;

  reg              active_and_waiting_last_time;
  wire             altpll_sys_key_s1_irq_from_sa;
  wire             altpll_sys_multi_touch_avalon_slave_irq_n_from_sa;
  wire             altpll_sys_timer_s1_irq_from_sa;
  reg     [ 27: 0] cpu_data_master_address_last_time;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  reg     [  3: 0] cpu_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_data_master_dbs_address;
  wire    [  1: 0] cpu_data_master_dbs_increment;
  reg     [  1: 0] cpu_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_is_granted_some_slave;
  reg     [  1: 0] cpu_data_master_latency_counter;
  wire    [  1: 0] cpu_data_master_next_dbs_rdv_counter;
  reg              cpu_data_master_read_but_no_slave_selected;
  reg              cpu_data_master_read_last_time;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_run;
  wire             cpu_data_master_waitrequest;
  reg              cpu_data_master_write_last_time;
  reg     [ 31: 0] cpu_data_master_writedata_last_time;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_MTL_SOPC_clock_0_in | ~cpu_data_master_requests_MTL_SOPC_clock_0_in) & ((~cpu_data_master_qualified_request_MTL_SOPC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~MTL_SOPC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_MTL_SOPC_clock_0_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~MTL_SOPC_clock_0_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_MTL_SOPC_clock_1_in | ~cpu_data_master_requests_MTL_SOPC_clock_1_in) & ((~cpu_data_master_qualified_request_MTL_SOPC_clock_1_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~MTL_SOPC_clock_1_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_MTL_SOPC_clock_1_in | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~MTL_SOPC_clock_1_in_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave | ~cpu_data_master_requests_alt_vip_vfr_0_avalon_slave) & ((~cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_clock_crossing_io_s1 | ~cpu_data_master_requests_clock_crossing_io_s1) & ((~cpu_data_master_qualified_request_clock_crossing_io_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~clock_crossing_io_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_clock_crossing_io_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~clock_crossing_io_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port | ~cpu_data_master_requests_epcs_flash_controller_epcs_control_port) & (cpu_data_master_granted_epcs_flash_controller_epcs_control_port | ~cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port) & ((~cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_epcs_flash_controller_epcs_control_port_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~d1_epcs_flash_controller_epcs_control_port_end_xfer & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~cpu_data_master_requests_jtag_uart_avalon_jtag_slave) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~jtag_uart_avalon_jtag_slave_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sdram_s1 | ~cpu_data_master_requests_sdram_s1) & (cpu_data_master_granted_sdram_s1 | ~cpu_data_master_qualified_request_sdram_s1) & ((~cpu_data_master_qualified_request_sdram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & ((~cpu_data_master_qualified_request_sdram_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & ~sdram_s1_waitrequest_from_sa & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_sram_avalon_slave | (cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_slave & cpu_data_master_dbs_address[1]) | ~cpu_data_master_requests_sram_avalon_slave) & (cpu_data_master_granted_sram_avalon_slave | ~cpu_data_master_qualified_request_sram_avalon_slave) & ((~cpu_data_master_qualified_request_sram_avalon_slave | ~cpu_data_master_read | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_sram_avalon_slave | ~cpu_data_master_write | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1]) & cpu_data_master_write)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & ((cpu_data_master_qualified_request_cfi_flash_s1 | ((cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1 & cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0])) | ~cpu_data_master_requests_cfi_flash_s1)) & (cpu_data_master_granted_cfi_flash_s1 | ~cpu_data_master_qualified_request_cfi_flash_s1) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cfi_flash_s1 | ~cpu_data_master_write | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_data_master_dbs_address[1] & cpu_data_master_dbs_address[0]) & cpu_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[27 : 0];

  //cpu_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_data_master_read_but_no_slave_selected <= cpu_data_master_read & cpu_data_master_run & ~cpu_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_data_master_is_granted_some_slave = cpu_data_master_granted_MTL_SOPC_clock_0_in |
    cpu_data_master_granted_MTL_SOPC_clock_1_in |
    cpu_data_master_granted_alt_vip_vfr_0_avalon_slave |
    cpu_data_master_granted_clock_crossing_io_s1 |
    cpu_data_master_granted_cpu_jtag_debug_module |
    cpu_data_master_granted_epcs_flash_controller_epcs_control_port |
    cpu_data_master_granted_jtag_uart_avalon_jtag_slave |
    cpu_data_master_granted_sdram_s1 |
    cpu_data_master_granted_sram_avalon_slave |
    cpu_data_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_data_master_readdatavalid = cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave |
    cpu_data_master_read_data_valid_clock_crossing_io_s1 |
    cpu_data_master_read_data_valid_sdram_s1 |
    (cpu_data_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_data_master_readdatavalid = cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_cpu_jtag_debug_module |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid |
    (cpu_data_master_read_data_valid_sram_avalon_slave & dbs_counter_overflow) |
    cpu_data_master_read_but_no_slave_selected |
    pre_flush_cpu_data_master_readdatavalid;

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~(cpu_data_master_qualified_request_MTL_SOPC_clock_0_in & cpu_data_master_read)}} | MTL_SOPC_clock_0_in_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_MTL_SOPC_clock_1_in & cpu_data_master_read)}} | MTL_SOPC_clock_1_in_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave}} | alt_vip_vfr_0_avalon_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_clock_crossing_io_s1}} | clock_crossing_io_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_cpu_jtag_debug_module & cpu_data_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port & cpu_data_master_read)}} | epcs_flash_controller_epcs_control_port_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave & cpu_data_master_read)}} | jtag_uart_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~cpu_data_master_read_data_valid_sdram_s1}} | sdram_s1_readdata_from_sa) &
    ({32 {~(cpu_data_master_qualified_request_sram_avalon_slave & cpu_data_master_read)}} | {sram_avalon_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_data_master_read_data_valid_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_data_master_waitrequest = ~cpu_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_latency_counter <= 0;
      else 
        cpu_data_master_latency_counter <= p1_cpu_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_data_master_latency_counter = ((cpu_data_master_run & cpu_data_master_read))? latency_load_value :
    (cpu_data_master_latency_counter)? cpu_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({2 {cpu_data_master_requests_alt_vip_vfr_0_avalon_slave}} & 1) |
    ({2 {cpu_data_master_requests_cfi_flash_s1}} & 2);

  //irq assign, which is an e_assign
  assign cpu_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    epcs_flash_controller_epcs_control_port_irq_from_sa,
    alt_vip_vfr_0_avalon_slave_irq_from_sa,
    altpll_sys_multi_touch_avalon_slave_irq_n_from_sa,
    altpll_sys_key_s1_irq_from_sa,
    altpll_sys_timer_s1_irq_from_sa,
    jtag_uart_avalon_jtag_slave_irq_from_sa};

  //key_s1_irq_from_sa from altpll_io to altpll_sys
  key_s1_irq_from_sa_clock_crossing_cpu_data_master_module key_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (altpll_sys),
      .data_in  (key_s1_irq_from_sa),
      .data_out (altpll_sys_key_s1_irq_from_sa),
      .reset_n  (altpll_sys_reset_n)
    );

  //~multi_touch_avalon_slave_irq_n_from_sa from altpll_touch to altpll_sys
  multi_touch_avalon_slave_irq_n_from_sa_clock_crossing_cpu_data_master_module multi_touch_avalon_slave_irq_n_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (altpll_sys),
      .data_in  (~multi_touch_avalon_slave_irq_n_from_sa),
      .data_out (altpll_sys_multi_touch_avalon_slave_irq_n_from_sa),
      .reset_n  (altpll_sys_reset_n)
    );

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_data_master_requests_sram_avalon_slave & cpu_data_master_write & !cpu_data_master_byteenable_sram_avalon_slave)) |
    ((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    (((~0) & cpu_data_master_requests_cfi_flash_s1 & cpu_data_master_write & !cpu_data_master_byteenable_cfi_flash_s1)) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer}))) |
    ((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer})));

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_avalon_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_data_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_data_master_dbs_write_16 = (cpu_data_master_dbs_address[1])? cpu_data_master_writedata[31 : 16] :
    cpu_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_data_master_dbs_increment = (cpu_data_master_requests_sram_avalon_slave)? 2 :
    (cpu_data_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_data_master_dbs_address + cpu_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_data_master_dbs_address <= next_dbs_address;
    end


  //timer_s1_irq_from_sa from altpll_io to altpll_sys
  timer_s1_irq_from_sa_clock_crossing_cpu_data_master_module timer_s1_irq_from_sa_clock_crossing_cpu_data_master
    (
      .clk      (altpll_sys),
      .data_in  (timer_s1_irq_from_sa),
      .data_out (altpll_sys_timer_s1_irq_from_sa),
      .reset_n  (altpll_sys_reset_n)
    );

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_data_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //mux write dbs 2, which is an e_mux
  assign cpu_data_master_dbs_write_8 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_writedata[7 : 0] :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_writedata[15 : 8] :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_writedata[23 : 16] :
    cpu_data_master_writedata[31 : 24];

  //p1 dbs rdv counter, which is an e_assign
  assign cpu_data_master_next_dbs_rdv_counter = cpu_data_master_dbs_rdv_counter + cpu_data_master_dbs_rdv_counter_inc;

  //cpu_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_data_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_data_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_data_master_dbs_rdv_counter <= cpu_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_data_master_dbs_rdv_counter[1] & ~cpu_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_address_last_time <= 0;
      else 
        cpu_data_master_address_last_time <= cpu_data_master_address;
    end


  //cpu/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_data_master_waitrequest & (cpu_data_master_read | cpu_data_master_write);
    end


  //cpu_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_address != cpu_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_byteenable_last_time <= 0;
      else 
        cpu_data_master_byteenable_last_time <= cpu_data_master_byteenable;
    end


  //cpu_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_byteenable != cpu_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_last_time <= 0;
      else 
        cpu_data_master_read_last_time <= cpu_data_master_read;
    end


  //cpu_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_read != cpu_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_write_last_time <= 0;
      else 
        cpu_data_master_write_last_time <= cpu_data_master_write;
    end


  //cpu_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_write != cpu_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_writedata_last_time <= 0;
      else 
        cpu_data_master_writedata_last_time <= cpu_data_master_writedata;
    end


  //cpu_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_data_master_writedata != cpu_data_master_writedata_last_time) & cpu_data_master_write)
        begin
          $write("%0d ns: cpu_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            cfi_flash_s1_wait_counter_eq_0,
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cfi_flash_s1,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port,
                                            cpu_instruction_master_granted_sram_avalon_slave,
                                            cpu_instruction_master_qualified_request_cfi_flash_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port,
                                            cpu_instruction_master_qualified_request_sram_avalon_slave,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port,
                                            cpu_instruction_master_read_data_valid_sram_avalon_slave,
                                            cpu_instruction_master_requests_cfi_flash_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port,
                                            cpu_instruction_master_requests_sram_avalon_slave,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_epcs_flash_controller_epcs_control_port_end_xfer,
                                            d1_sram_avalon_slave_end_xfer,
                                            d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                            epcs_flash_controller_epcs_control_port_readdata_from_sa,
                                            incoming_data_to_and_from_the_cfi_flash,
                                            reset_n,
                                            sram_avalon_slave_readdata_from_sa,
                                            sram_avalon_slave_wait_counter_eq_0,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_dbs_address,
                                            cpu_instruction_master_latency_counter,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_readdatavalid,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 25: 0] cpu_instruction_master_address_to_slave;
  output  [  1: 0] cpu_instruction_master_dbs_address;
  output  [  1: 0] cpu_instruction_master_latency_counter;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_readdatavalid;
  output           cpu_instruction_master_waitrequest;
  input            cfi_flash_s1_wait_counter_eq_0;
  input            clk;
  input   [ 25: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cfi_flash_s1;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port;
  input            cpu_instruction_master_granted_sram_avalon_slave;
  input            cpu_instruction_master_qualified_request_cfi_flash_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port;
  input            cpu_instruction_master_qualified_request_sram_avalon_slave;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cfi_flash_s1;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  input            cpu_instruction_master_read_data_valid_sram_avalon_slave;
  input            cpu_instruction_master_requests_cfi_flash_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;
  input            cpu_instruction_master_requests_sram_avalon_slave;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_epcs_flash_controller_epcs_control_port_end_xfer;
  input            d1_sram_avalon_slave_end_xfer;
  input            d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  input   [ 31: 0] epcs_flash_controller_epcs_control_port_readdata_from_sa;
  input   [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  input            reset_n;
  input   [ 15: 0] sram_avalon_slave_readdata_from_sa;
  input            sram_avalon_slave_wait_counter_eq_0;

  reg              active_and_waiting_last_time;
  reg     [ 25: 0] cpu_instruction_master_address_last_time;
  wire    [ 25: 0] cpu_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_instruction_master_dbs_address;
  wire    [  1: 0] cpu_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_instruction_master_latency_counter;
  wire    [  1: 0] cpu_instruction_master_next_dbs_rdv_counter;
  reg              cpu_instruction_master_read_but_no_slave_selected;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  reg     [ 15: 0] dbs_16_reg_segment_0;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [  7: 0] dbs_latent_8_reg_segment_0;
  reg     [  7: 0] dbs_latent_8_reg_segment_1;
  reg     [  7: 0] dbs_latent_8_reg_segment_2;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_16_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_0;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_1;
  wire    [  7: 0] p1_dbs_latent_8_reg_segment_2;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module);

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0 & r_1 & r_2;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port | ~cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port) & (cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port | ~cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port) & ((~cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port | ~(cpu_instruction_master_read) | (1 & ~d1_epcs_flash_controller_epcs_control_port_end_xfer & (cpu_instruction_master_read)))) & 1 & (cpu_instruction_master_qualified_request_sram_avalon_slave | ~cpu_instruction_master_requests_sram_avalon_slave) & (cpu_instruction_master_granted_sram_avalon_slave | ~cpu_instruction_master_qualified_request_sram_avalon_slave) & ((~cpu_instruction_master_qualified_request_sram_avalon_slave | ~cpu_instruction_master_read | (1 & ((sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1]) & cpu_instruction_master_read)));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_requests_cfi_flash_s1) & (cpu_instruction_master_granted_cfi_flash_s1 | ~cpu_instruction_master_qualified_request_cfi_flash_s1) & ((~cpu_instruction_master_qualified_request_cfi_flash_s1 | ~cpu_instruction_master_read | (1 & ((cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer)) & (cpu_instruction_master_dbs_address[1] & cpu_instruction_master_dbs_address[0]) & cpu_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = {cpu_instruction_master_address[25],
    2'b0,
    cpu_instruction_master_address[22 : 0]};

  //cpu_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_instruction_master_read_but_no_slave_selected <= cpu_instruction_master_read & cpu_instruction_master_run & ~cpu_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_instruction_master_is_granted_some_slave = cpu_instruction_master_granted_cpu_jtag_debug_module |
    cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port |
    cpu_instruction_master_granted_sram_avalon_slave |
    cpu_instruction_master_granted_cfi_flash_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_instruction_master_readdatavalid = cpu_instruction_master_read_data_valid_cfi_flash_s1 & dbs_rdv_counter_overflow;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_instruction_master_readdatavalid = cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_cpu_jtag_debug_module |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid |
    (cpu_instruction_master_read_data_valid_sram_avalon_slave & dbs_counter_overflow) |
    cpu_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_instruction_master_readdatavalid;

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~(cpu_instruction_master_qualified_request_cpu_jtag_debug_module & cpu_instruction_master_read)}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port & cpu_instruction_master_read)}} | epcs_flash_controller_epcs_control_port_readdata_from_sa) &
    ({32 {~(cpu_instruction_master_qualified_request_sram_avalon_slave & cpu_instruction_master_read)}} | {sram_avalon_slave_readdata_from_sa[15 : 0],
    dbs_16_reg_segment_0}) &
    ({32 {~cpu_instruction_master_read_data_valid_cfi_flash_s1}} | {incoming_data_to_and_from_the_cfi_flash[7 : 0],
    dbs_latent_8_reg_segment_2,
    dbs_latent_8_reg_segment_1,
    dbs_latent_8_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_latency_counter <= 0;
      else 
        cpu_instruction_master_latency_counter <= p1_cpu_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_instruction_master_latency_counter = ((cpu_instruction_master_run & cpu_instruction_master_read))? latency_load_value :
    (cpu_instruction_master_latency_counter)? cpu_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_instruction_master_requests_cfi_flash_s1}} & 2;

  //input to dbs-16 stored 0, which is an e_mux
  assign p1_dbs_16_reg_segment_0 = sram_avalon_slave_readdata_from_sa;

  //dbs register for dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_16_reg_segment_0 <= 0;
      else if (dbs_count_enable & ((cpu_instruction_master_dbs_address[1]) == 0))
          dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_instruction_master_dbs_increment = (cpu_instruction_master_requests_sram_avalon_slave)? 2 :
    (cpu_instruction_master_requests_cfi_flash_s1)? 1 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_instruction_master_dbs_address + cpu_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_instruction_master_dbs_address <= next_dbs_address;
    end


  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = ((cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read & 1 & 1 & ({sram_avalon_slave_wait_counter_eq_0 & ~d1_sram_avalon_slave_end_xfer}))) |
    ((cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & 1 & 1 & ({cfi_flash_s1_wait_counter_eq_0 & ~d1_tri_state_bridge_flash_avalon_slave_end_xfer})));

  //input to latent dbs-8 stored 0, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_0 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-8 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 0))
          dbs_latent_8_reg_segment_0 <= p1_dbs_latent_8_reg_segment_0;
    end


  //input to latent dbs-8 stored 1, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_1 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-8 segment 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_1 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 1))
          dbs_latent_8_reg_segment_1 <= p1_dbs_latent_8_reg_segment_1;
    end


  //input to latent dbs-8 stored 2, which is an e_mux
  assign p1_dbs_latent_8_reg_segment_2 = incoming_data_to_and_from_the_cfi_flash;

  //dbs register for latent dbs-8 segment 2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_8_reg_segment_2 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_instruction_master_dbs_rdv_counter[1 : 0]) == 2))
          dbs_latent_8_reg_segment_2 <= p1_dbs_latent_8_reg_segment_2;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_instruction_master_next_dbs_rdv_counter = cpu_instruction_master_dbs_rdv_counter + cpu_instruction_master_dbs_rdv_counter_inc;

  //cpu_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_instruction_master_dbs_rdv_counter_inc = 1;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_instruction_master_read_data_valid_cfi_flash_s1;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_instruction_master_dbs_rdv_counter <= cpu_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_instruction_master_dbs_rdv_counter[1] & ~cpu_instruction_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module epcs_flash_controller_epcs_control_port_arbitrator (
                                                            // inputs:
                                                             clk,
                                                             cpu_data_master_address_to_slave,
                                                             cpu_data_master_latency_counter,
                                                             cpu_data_master_read,
                                                             cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                                             cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                             cpu_data_master_write,
                                                             cpu_data_master_writedata,
                                                             cpu_instruction_master_address_to_slave,
                                                             cpu_instruction_master_latency_counter,
                                                             cpu_instruction_master_read,
                                                             epcs_flash_controller_epcs_control_port_dataavailable,
                                                             epcs_flash_controller_epcs_control_port_endofpacket,
                                                             epcs_flash_controller_epcs_control_port_irq,
                                                             epcs_flash_controller_epcs_control_port_readdata,
                                                             epcs_flash_controller_epcs_control_port_readyfordata,
                                                             reset_n,

                                                            // outputs:
                                                             cpu_data_master_granted_epcs_flash_controller_epcs_control_port,
                                                             cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port,
                                                             cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port,
                                                             cpu_data_master_requests_epcs_flash_controller_epcs_control_port,
                                                             cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port,
                                                             cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port,
                                                             cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port,
                                                             cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port,
                                                             d1_epcs_flash_controller_epcs_control_port_end_xfer,
                                                             epcs_flash_controller_epcs_control_port_address,
                                                             epcs_flash_controller_epcs_control_port_chipselect,
                                                             epcs_flash_controller_epcs_control_port_dataavailable_from_sa,
                                                             epcs_flash_controller_epcs_control_port_endofpacket_from_sa,
                                                             epcs_flash_controller_epcs_control_port_irq_from_sa,
                                                             epcs_flash_controller_epcs_control_port_read_n,
                                                             epcs_flash_controller_epcs_control_port_readdata_from_sa,
                                                             epcs_flash_controller_epcs_control_port_readyfordata_from_sa,
                                                             epcs_flash_controller_epcs_control_port_reset_n,
                                                             epcs_flash_controller_epcs_control_port_write_n,
                                                             epcs_flash_controller_epcs_control_port_writedata
                                                          )
;

  output           cpu_data_master_granted_epcs_flash_controller_epcs_control_port;
  output           cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port;
  output           cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  output           cpu_data_master_requests_epcs_flash_controller_epcs_control_port;
  output           cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port;
  output           cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port;
  output           cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  output           cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;
  output           d1_epcs_flash_controller_epcs_control_port_end_xfer;
  output  [  8: 0] epcs_flash_controller_epcs_control_port_address;
  output           epcs_flash_controller_epcs_control_port_chipselect;
  output           epcs_flash_controller_epcs_control_port_dataavailable_from_sa;
  output           epcs_flash_controller_epcs_control_port_endofpacket_from_sa;
  output           epcs_flash_controller_epcs_control_port_irq_from_sa;
  output           epcs_flash_controller_epcs_control_port_read_n;
  output  [ 31: 0] epcs_flash_controller_epcs_control_port_readdata_from_sa;
  output           epcs_flash_controller_epcs_control_port_readyfordata_from_sa;
  output           epcs_flash_controller_epcs_control_port_reset_n;
  output           epcs_flash_controller_epcs_control_port_write_n;
  output  [ 31: 0] epcs_flash_controller_epcs_control_port_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            epcs_flash_controller_epcs_control_port_dataavailable;
  input            epcs_flash_controller_epcs_control_port_endofpacket;
  input            epcs_flash_controller_epcs_control_port_irq;
  input   [ 31: 0] epcs_flash_controller_epcs_control_port_readdata;
  input            epcs_flash_controller_epcs_control_port_readyfordata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_requests_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_saved_grant_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_saved_grant_epcs_flash_controller_epcs_control_port;
  reg              d1_epcs_flash_controller_epcs_control_port_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port;
  wire    [  8: 0] epcs_flash_controller_epcs_control_port_address;
  wire             epcs_flash_controller_epcs_control_port_allgrants;
  wire             epcs_flash_controller_epcs_control_port_allow_new_arb_cycle;
  wire             epcs_flash_controller_epcs_control_port_any_bursting_master_saved_grant;
  wire             epcs_flash_controller_epcs_control_port_any_continuerequest;
  reg     [  1: 0] epcs_flash_controller_epcs_control_port_arb_addend;
  wire             epcs_flash_controller_epcs_control_port_arb_counter_enable;
  reg     [  2: 0] epcs_flash_controller_epcs_control_port_arb_share_counter;
  wire    [  2: 0] epcs_flash_controller_epcs_control_port_arb_share_counter_next_value;
  wire    [  2: 0] epcs_flash_controller_epcs_control_port_arb_share_set_values;
  wire    [  1: 0] epcs_flash_controller_epcs_control_port_arb_winner;
  wire             epcs_flash_controller_epcs_control_port_arbitration_holdoff_internal;
  wire             epcs_flash_controller_epcs_control_port_beginbursttransfer_internal;
  wire             epcs_flash_controller_epcs_control_port_begins_xfer;
  wire             epcs_flash_controller_epcs_control_port_chipselect;
  wire    [  3: 0] epcs_flash_controller_epcs_control_port_chosen_master_double_vector;
  wire    [  1: 0] epcs_flash_controller_epcs_control_port_chosen_master_rot_left;
  wire             epcs_flash_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_flash_controller_epcs_control_port_end_xfer;
  wire             epcs_flash_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_flash_controller_epcs_control_port_firsttransfer;
  wire    [  1: 0] epcs_flash_controller_epcs_control_port_grant_vector;
  wire             epcs_flash_controller_epcs_control_port_in_a_read_cycle;
  wire             epcs_flash_controller_epcs_control_port_in_a_write_cycle;
  wire             epcs_flash_controller_epcs_control_port_irq_from_sa;
  wire    [  1: 0] epcs_flash_controller_epcs_control_port_master_qreq_vector;
  wire             epcs_flash_controller_epcs_control_port_non_bursting_master_requests;
  wire             epcs_flash_controller_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_flash_controller_epcs_control_port_readdata_from_sa;
  wire             epcs_flash_controller_epcs_control_port_readyfordata_from_sa;
  reg              epcs_flash_controller_epcs_control_port_reg_firsttransfer;
  wire             epcs_flash_controller_epcs_control_port_reset_n;
  reg     [  1: 0] epcs_flash_controller_epcs_control_port_saved_chosen_master_vector;
  reg              epcs_flash_controller_epcs_control_port_slavearbiterlockenable;
  wire             epcs_flash_controller_epcs_control_port_slavearbiterlockenable2;
  wire             epcs_flash_controller_epcs_control_port_unreg_firsttransfer;
  wire             epcs_flash_controller_epcs_control_port_waits_for_read;
  wire             epcs_flash_controller_epcs_control_port_waits_for_write;
  wire             epcs_flash_controller_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_flash_controller_epcs_control_port_writedata;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_epcs_flash_controller_epcs_control_port;
  reg              last_cycle_cpu_instruction_master_granted_slave_epcs_flash_controller_epcs_control_port;
  wire    [ 27: 0] shifted_address_to_epcs_flash_controller_epcs_control_port_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_epcs_flash_controller_epcs_control_port_from_cpu_instruction_master;
  wire             wait_for_epcs_flash_controller_epcs_control_port_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~epcs_flash_controller_epcs_control_port_end_xfer;
    end


  assign epcs_flash_controller_epcs_control_port_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port | cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port));
  //assign epcs_flash_controller_epcs_control_port_readdata_from_sa = epcs_flash_controller_epcs_control_port_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_readdata_from_sa = epcs_flash_controller_epcs_control_port_readdata;

  assign cpu_data_master_requests_epcs_flash_controller_epcs_control_port = ({cpu_data_master_address_to_slave[27 : 11] , 11'b0} == 28'h0) & (cpu_data_master_read | cpu_data_master_write);
  //assign epcs_flash_controller_epcs_control_port_dataavailable_from_sa = epcs_flash_controller_epcs_control_port_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_dataavailable_from_sa = epcs_flash_controller_epcs_control_port_dataavailable;

  //assign epcs_flash_controller_epcs_control_port_readyfordata_from_sa = epcs_flash_controller_epcs_control_port_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_readyfordata_from_sa = epcs_flash_controller_epcs_control_port_readyfordata;

  //epcs_flash_controller_epcs_control_port_arb_share_counter set values, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_arb_share_set_values = 1;

  //epcs_flash_controller_epcs_control_port_non_bursting_master_requests mux, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_non_bursting_master_requests = cpu_data_master_requests_epcs_flash_controller_epcs_control_port |
    cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port |
    cpu_data_master_requests_epcs_flash_controller_epcs_control_port |
    cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;

  //epcs_flash_controller_epcs_control_port_any_bursting_master_saved_grant mux, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_any_bursting_master_saved_grant = 0;

  //epcs_flash_controller_epcs_control_port_arb_share_counter_next_value assignment, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_arb_share_counter_next_value = epcs_flash_controller_epcs_control_port_firsttransfer ? (epcs_flash_controller_epcs_control_port_arb_share_set_values - 1) : |epcs_flash_controller_epcs_control_port_arb_share_counter ? (epcs_flash_controller_epcs_control_port_arb_share_counter - 1) : 0;

  //epcs_flash_controller_epcs_control_port_allgrants all slave grants, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_allgrants = (|epcs_flash_controller_epcs_control_port_grant_vector) |
    (|epcs_flash_controller_epcs_control_port_grant_vector) |
    (|epcs_flash_controller_epcs_control_port_grant_vector) |
    (|epcs_flash_controller_epcs_control_port_grant_vector);

  //epcs_flash_controller_epcs_control_port_end_xfer assignment, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_end_xfer = ~(epcs_flash_controller_epcs_control_port_waits_for_read | epcs_flash_controller_epcs_control_port_waits_for_write);

  //end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port = epcs_flash_controller_epcs_control_port_end_xfer & (~epcs_flash_controller_epcs_control_port_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //epcs_flash_controller_epcs_control_port_arb_share_counter arbitration counter enable, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_arb_counter_enable = (end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port & epcs_flash_controller_epcs_control_port_allgrants) | (end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port & ~epcs_flash_controller_epcs_control_port_non_bursting_master_requests);

  //epcs_flash_controller_epcs_control_port_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_epcs_control_port_arb_share_counter <= 0;
      else if (epcs_flash_controller_epcs_control_port_arb_counter_enable)
          epcs_flash_controller_epcs_control_port_arb_share_counter <= epcs_flash_controller_epcs_control_port_arb_share_counter_next_value;
    end


  //epcs_flash_controller_epcs_control_port_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_epcs_control_port_slavearbiterlockenable <= 0;
      else if ((|epcs_flash_controller_epcs_control_port_master_qreq_vector & end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port) | (end_xfer_arb_share_counter_term_epcs_flash_controller_epcs_control_port & ~epcs_flash_controller_epcs_control_port_non_bursting_master_requests))
          epcs_flash_controller_epcs_control_port_slavearbiterlockenable <= |epcs_flash_controller_epcs_control_port_arb_share_counter_next_value;
    end


  //cpu/data_master epcs_flash_controller/epcs_control_port arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = epcs_flash_controller_epcs_control_port_slavearbiterlockenable & cpu_data_master_continuerequest;

  //epcs_flash_controller_epcs_control_port_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_slavearbiterlockenable2 = |epcs_flash_controller_epcs_control_port_arb_share_counter_next_value;

  //cpu/data_master epcs_flash_controller/epcs_control_port arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = epcs_flash_controller_epcs_control_port_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master epcs_flash_controller/epcs_control_port arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = epcs_flash_controller_epcs_control_port_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master epcs_flash_controller/epcs_control_port arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = epcs_flash_controller_epcs_control_port_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted epcs_flash_controller/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_epcs_flash_controller_epcs_control_port <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_epcs_flash_controller_epcs_control_port <= cpu_instruction_master_saved_grant_epcs_flash_controller_epcs_control_port ? 1 : (epcs_flash_controller_epcs_control_port_arbitration_holdoff_internal | ~cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port) ? 0 : last_cycle_cpu_instruction_master_granted_slave_epcs_flash_controller_epcs_control_port;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_epcs_flash_controller_epcs_control_port & cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;

  //epcs_flash_controller_epcs_control_port_any_continuerequest at least one master continues requesting, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port = cpu_data_master_requests_epcs_flash_controller_epcs_control_port & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port, which is an e_mux
  assign cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port = cpu_data_master_granted_epcs_flash_controller_epcs_control_port & cpu_data_master_read & ~epcs_flash_controller_epcs_control_port_waits_for_read;

  //epcs_flash_controller_epcs_control_port_writedata mux, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_writedata = cpu_data_master_writedata;

  //assign epcs_flash_controller_epcs_control_port_endofpacket_from_sa = epcs_flash_controller_epcs_control_port_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_endofpacket_from_sa = epcs_flash_controller_epcs_control_port_endofpacket;

  assign cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port = (({cpu_instruction_master_address_to_slave[25 : 11] , 11'b0} == 26'h0) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted epcs_flash_controller/epcs_control_port last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_epcs_flash_controller_epcs_control_port <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_epcs_flash_controller_epcs_control_port <= cpu_data_master_saved_grant_epcs_flash_controller_epcs_control_port ? 1 : (epcs_flash_controller_epcs_control_port_arbitration_holdoff_internal | ~cpu_data_master_requests_epcs_flash_controller_epcs_control_port) ? 0 : last_cycle_cpu_data_master_granted_slave_epcs_flash_controller_epcs_control_port;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_epcs_flash_controller_epcs_control_port & cpu_data_master_requests_epcs_flash_controller_epcs_control_port;

  assign cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port = cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port, which is an e_mux
  assign cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port = cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port & cpu_instruction_master_read & ~epcs_flash_controller_epcs_control_port_waits_for_read;

  //allow new arb cycle for epcs_flash_controller/epcs_control_port, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for epcs_flash_controller/epcs_control_port, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_master_qreq_vector[0] = cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port;

  //cpu/instruction_master grant epcs_flash_controller/epcs_control_port, which is an e_assign
  assign cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port = epcs_flash_controller_epcs_control_port_grant_vector[0];

  //cpu/instruction_master saved-grant epcs_flash_controller/epcs_control_port, which is an e_assign
  assign cpu_instruction_master_saved_grant_epcs_flash_controller_epcs_control_port = epcs_flash_controller_epcs_control_port_arb_winner[0] && cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;

  //cpu/data_master assignment into master qualified-requests vector for epcs_flash_controller/epcs_control_port, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_master_qreq_vector[1] = cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port;

  //cpu/data_master grant epcs_flash_controller/epcs_control_port, which is an e_assign
  assign cpu_data_master_granted_epcs_flash_controller_epcs_control_port = epcs_flash_controller_epcs_control_port_grant_vector[1];

  //cpu/data_master saved-grant epcs_flash_controller/epcs_control_port, which is an e_assign
  assign cpu_data_master_saved_grant_epcs_flash_controller_epcs_control_port = epcs_flash_controller_epcs_control_port_arb_winner[1] && cpu_data_master_requests_epcs_flash_controller_epcs_control_port;

  //epcs_flash_controller/epcs_control_port chosen-master double-vector, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_chosen_master_double_vector = {epcs_flash_controller_epcs_control_port_master_qreq_vector, epcs_flash_controller_epcs_control_port_master_qreq_vector} & ({~epcs_flash_controller_epcs_control_port_master_qreq_vector, ~epcs_flash_controller_epcs_control_port_master_qreq_vector} + epcs_flash_controller_epcs_control_port_arb_addend);

  //stable onehot encoding of arb winner
  assign epcs_flash_controller_epcs_control_port_arb_winner = (epcs_flash_controller_epcs_control_port_allow_new_arb_cycle & | epcs_flash_controller_epcs_control_port_grant_vector) ? epcs_flash_controller_epcs_control_port_grant_vector : epcs_flash_controller_epcs_control_port_saved_chosen_master_vector;

  //saved epcs_flash_controller_epcs_control_port_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_epcs_control_port_saved_chosen_master_vector <= 0;
      else if (epcs_flash_controller_epcs_control_port_allow_new_arb_cycle)
          epcs_flash_controller_epcs_control_port_saved_chosen_master_vector <= |epcs_flash_controller_epcs_control_port_grant_vector ? epcs_flash_controller_epcs_control_port_grant_vector : epcs_flash_controller_epcs_control_port_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign epcs_flash_controller_epcs_control_port_grant_vector = {(epcs_flash_controller_epcs_control_port_chosen_master_double_vector[1] | epcs_flash_controller_epcs_control_port_chosen_master_double_vector[3]),
    (epcs_flash_controller_epcs_control_port_chosen_master_double_vector[0] | epcs_flash_controller_epcs_control_port_chosen_master_double_vector[2])};

  //epcs_flash_controller/epcs_control_port chosen master rotated left, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_chosen_master_rot_left = (epcs_flash_controller_epcs_control_port_arb_winner << 1) ? (epcs_flash_controller_epcs_control_port_arb_winner << 1) : 1;

  //epcs_flash_controller/epcs_control_port's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_epcs_control_port_arb_addend <= 1;
      else if (|epcs_flash_controller_epcs_control_port_grant_vector)
          epcs_flash_controller_epcs_control_port_arb_addend <= epcs_flash_controller_epcs_control_port_end_xfer? epcs_flash_controller_epcs_control_port_chosen_master_rot_left : epcs_flash_controller_epcs_control_port_grant_vector;
    end


  //epcs_flash_controller_epcs_control_port_reset_n assignment, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_reset_n = reset_n;

  assign epcs_flash_controller_epcs_control_port_chipselect = cpu_data_master_granted_epcs_flash_controller_epcs_control_port | cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port;
  //epcs_flash_controller_epcs_control_port_firsttransfer first transaction, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_firsttransfer = epcs_flash_controller_epcs_control_port_begins_xfer ? epcs_flash_controller_epcs_control_port_unreg_firsttransfer : epcs_flash_controller_epcs_control_port_reg_firsttransfer;

  //epcs_flash_controller_epcs_control_port_unreg_firsttransfer first transaction, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_unreg_firsttransfer = ~(epcs_flash_controller_epcs_control_port_slavearbiterlockenable & epcs_flash_controller_epcs_control_port_any_continuerequest);

  //epcs_flash_controller_epcs_control_port_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          epcs_flash_controller_epcs_control_port_reg_firsttransfer <= 1'b1;
      else if (epcs_flash_controller_epcs_control_port_begins_xfer)
          epcs_flash_controller_epcs_control_port_reg_firsttransfer <= epcs_flash_controller_epcs_control_port_unreg_firsttransfer;
    end


  //epcs_flash_controller_epcs_control_port_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_beginbursttransfer_internal = epcs_flash_controller_epcs_control_port_begins_xfer;

  //epcs_flash_controller_epcs_control_port_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_arbitration_holdoff_internal = epcs_flash_controller_epcs_control_port_begins_xfer & epcs_flash_controller_epcs_control_port_firsttransfer;

  //~epcs_flash_controller_epcs_control_port_read_n assignment, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_read_n = ~((cpu_data_master_granted_epcs_flash_controller_epcs_control_port & cpu_data_master_read) | (cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port & cpu_instruction_master_read));

  //~epcs_flash_controller_epcs_control_port_write_n assignment, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_write_n = ~(cpu_data_master_granted_epcs_flash_controller_epcs_control_port & cpu_data_master_write);

  assign shifted_address_to_epcs_flash_controller_epcs_control_port_from_cpu_data_master = cpu_data_master_address_to_slave;
  //epcs_flash_controller_epcs_control_port_address mux, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_address = (cpu_data_master_granted_epcs_flash_controller_epcs_control_port)? (shifted_address_to_epcs_flash_controller_epcs_control_port_from_cpu_data_master >> 2) :
    (shifted_address_to_epcs_flash_controller_epcs_control_port_from_cpu_instruction_master >> 2);

  assign shifted_address_to_epcs_flash_controller_epcs_control_port_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_epcs_flash_controller_epcs_control_port_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_epcs_flash_controller_epcs_control_port_end_xfer <= 1;
      else 
        d1_epcs_flash_controller_epcs_control_port_end_xfer <= epcs_flash_controller_epcs_control_port_end_xfer;
    end


  //epcs_flash_controller_epcs_control_port_waits_for_read in a cycle, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_waits_for_read = epcs_flash_controller_epcs_control_port_in_a_read_cycle & epcs_flash_controller_epcs_control_port_begins_xfer;

  //epcs_flash_controller_epcs_control_port_in_a_read_cycle assignment, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_in_a_read_cycle = (cpu_data_master_granted_epcs_flash_controller_epcs_control_port & cpu_data_master_read) | (cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = epcs_flash_controller_epcs_control_port_in_a_read_cycle;

  //epcs_flash_controller_epcs_control_port_waits_for_write in a cycle, which is an e_mux
  assign epcs_flash_controller_epcs_control_port_waits_for_write = epcs_flash_controller_epcs_control_port_in_a_write_cycle & epcs_flash_controller_epcs_control_port_begins_xfer;

  //epcs_flash_controller_epcs_control_port_in_a_write_cycle assignment, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_in_a_write_cycle = cpu_data_master_granted_epcs_flash_controller_epcs_control_port & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = epcs_flash_controller_epcs_control_port_in_a_write_cycle;

  assign wait_for_epcs_flash_controller_epcs_control_port_counter = 0;
  //assign epcs_flash_controller_epcs_control_port_irq_from_sa = epcs_flash_controller_epcs_control_port_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign epcs_flash_controller_epcs_control_port_irq_from_sa = epcs_flash_controller_epcs_control_port_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //epcs_flash_controller/epcs_control_port enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_epcs_flash_controller_epcs_control_port + cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_epcs_flash_controller_epcs_control_port + cpu_instruction_master_saved_grant_epcs_flash_controller_epcs_control_port > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_avalon_jtag_slave_arbitrator (
                                                // inputs:
                                                 clk,
                                                 cpu_data_master_address_to_slave,
                                                 cpu_data_master_latency_counter,
                                                 cpu_data_master_read,
                                                 cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                                 cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                 cpu_data_master_write,
                                                 cpu_data_master_writedata,
                                                 jtag_uart_avalon_jtag_slave_dataavailable,
                                                 jtag_uart_avalon_jtag_slave_irq,
                                                 jtag_uart_avalon_jtag_slave_readdata,
                                                 jtag_uart_avalon_jtag_slave_readyfordata,
                                                 jtag_uart_avalon_jtag_slave_waitrequest,
                                                 reset_n,

                                                // outputs:
                                                 cpu_data_master_granted_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave,
                                                 cpu_data_master_requests_jtag_uart_avalon_jtag_slave,
                                                 d1_jtag_uart_avalon_jtag_slave_end_xfer,
                                                 jtag_uart_avalon_jtag_slave_address,
                                                 jtag_uart_avalon_jtag_slave_chipselect,
                                                 jtag_uart_avalon_jtag_slave_dataavailable_from_sa,
                                                 jtag_uart_avalon_jtag_slave_irq_from_sa,
                                                 jtag_uart_avalon_jtag_slave_read_n,
                                                 jtag_uart_avalon_jtag_slave_readdata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_readyfordata_from_sa,
                                                 jtag_uart_avalon_jtag_slave_reset_n,
                                                 jtag_uart_avalon_jtag_slave_waitrequest_from_sa,
                                                 jtag_uart_avalon_jtag_slave_write_n,
                                                 jtag_uart_avalon_jtag_slave_writedata
                                              )
;

  output           cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  output           cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  output           d1_jtag_uart_avalon_jtag_slave_end_xfer;
  output           jtag_uart_avalon_jtag_slave_address;
  output           jtag_uart_avalon_jtag_slave_chipselect;
  output           jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_avalon_jtag_slave_reset_n;
  output           jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            jtag_uart_avalon_jtag_slave_dataavailable;
  input            jtag_uart_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  input            jtag_uart_avalon_jtag_slave_readyfordata;
  input            jtag_uart_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave;
  reg              d1_jtag_uart_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_allgrants;
  wire             jtag_uart_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_avalon_jtag_slave_arb_counter_enable;
  reg     [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  2: 0] jtag_uart_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  reg              jtag_uart_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [ 27: 0] shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master;
  wire             wait_for_jtag_uart_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave));
  //assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readdata_from_sa = jtag_uart_avalon_jtag_slave_readdata;

  assign cpu_data_master_requests_jtag_uart_avalon_jtag_slave = ({cpu_data_master_address_to_slave[27 : 3] , 3'b0} == 28'h1910) & (cpu_data_master_read | cpu_data_master_write);
  //assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_avalon_jtag_slave_waitrequest;

  //jtag_uart_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_non_bursting_master_requests = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_avalon_jtag_slave_firsttransfer ? (jtag_uart_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_avalon_jtag_slave_arb_share_counter ? (jtag_uart_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_allgrants = |jtag_uart_avalon_jtag_slave_grant_vector;

  //jtag_uart_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_end_xfer = ~(jtag_uart_avalon_jtag_slave_waits_for_read | jtag_uart_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave = jtag_uart_avalon_jtag_slave_end_xfer & (~jtag_uart_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & jtag_uart_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_avalon_jtag_slave_arb_share_counter <= jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_avalon_jtag_slave & ~jtag_uart_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = jtag_uart_avalon_jtag_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu/data_master jtag_uart/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = jtag_uart_avalon_jtag_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //jtag_uart_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))));
  //local readdatavalid cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read & ~jtag_uart_avalon_jtag_slave_waits_for_read;

  //jtag_uart_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_jtag_uart_avalon_jtag_slave = cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;

  //cpu/data_master saved-grant jtag_uart/avalon_jtag_slave, which is an e_assign
  assign cpu_data_master_saved_grant_jtag_uart_avalon_jtag_slave = cpu_data_master_requests_jtag_uart_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_avalon_jtag_slave_chipselect = cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  //jtag_uart_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_firsttransfer = jtag_uart_avalon_jtag_slave_begins_xfer ? jtag_uart_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_avalon_jtag_slave_begins_xfer)
          jtag_uart_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_read_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read);

  //~jtag_uart_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_write_n = ~(cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write);

  assign shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master = cpu_data_master_address_to_slave;
  //jtag_uart_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_address = shifted_address_to_jtag_uart_avalon_jtag_slave_from_cpu_data_master >> 2;

  //d1_jtag_uart_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_avalon_jtag_slave_end_xfer <= jtag_uart_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_read = jtag_uart_avalon_jtag_slave_in_a_read_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_read_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_avalon_jtag_slave_waits_for_write = jtag_uart_avalon_jtag_slave_in_a_write_cycle & jtag_uart_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_in_a_write_cycle = cpu_data_master_granted_jtag_uart_avalon_jtag_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_avalon_jtag_slave_irq_from_sa = jtag_uart_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module key_s1_arbitrator (
                           // inputs:
                            clk,
                            clock_crossing_io_m1_address_to_slave,
                            clock_crossing_io_m1_latency_counter,
                            clock_crossing_io_m1_nativeaddress,
                            clock_crossing_io_m1_read,
                            clock_crossing_io_m1_write,
                            clock_crossing_io_m1_writedata,
                            key_s1_irq,
                            key_s1_readdata,
                            reset_n,

                           // outputs:
                            clock_crossing_io_m1_granted_key_s1,
                            clock_crossing_io_m1_qualified_request_key_s1,
                            clock_crossing_io_m1_read_data_valid_key_s1,
                            clock_crossing_io_m1_requests_key_s1,
                            d1_key_s1_end_xfer,
                            key_s1_address,
                            key_s1_chipselect,
                            key_s1_irq_from_sa,
                            key_s1_readdata_from_sa,
                            key_s1_reset_n,
                            key_s1_write_n,
                            key_s1_writedata
                         )
;

  output           clock_crossing_io_m1_granted_key_s1;
  output           clock_crossing_io_m1_qualified_request_key_s1;
  output           clock_crossing_io_m1_read_data_valid_key_s1;
  output           clock_crossing_io_m1_requests_key_s1;
  output           d1_key_s1_end_xfer;
  output  [  1: 0] key_s1_address;
  output           key_s1_chipselect;
  output           key_s1_irq_from_sa;
  output  [  3: 0] key_s1_readdata_from_sa;
  output           key_s1_reset_n;
  output           key_s1_write_n;
  output  [  3: 0] key_s1_writedata;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address_to_slave;
  input            clock_crossing_io_m1_latency_counter;
  input   [  4: 0] clock_crossing_io_m1_nativeaddress;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_write;
  input   [ 31: 0] clock_crossing_io_m1_writedata;
  input            key_s1_irq;
  input   [  3: 0] key_s1_readdata;
  input            reset_n;

  wire             clock_crossing_io_m1_arbiterlock;
  wire             clock_crossing_io_m1_arbiterlock2;
  wire             clock_crossing_io_m1_continuerequest;
  wire             clock_crossing_io_m1_granted_key_s1;
  wire             clock_crossing_io_m1_qualified_request_key_s1;
  wire             clock_crossing_io_m1_read_data_valid_key_s1;
  wire             clock_crossing_io_m1_requests_key_s1;
  wire             clock_crossing_io_m1_saved_grant_key_s1;
  reg              d1_key_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_key_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] key_s1_address;
  wire             key_s1_allgrants;
  wire             key_s1_allow_new_arb_cycle;
  wire             key_s1_any_bursting_master_saved_grant;
  wire             key_s1_any_continuerequest;
  wire             key_s1_arb_counter_enable;
  reg              key_s1_arb_share_counter;
  wire             key_s1_arb_share_counter_next_value;
  wire             key_s1_arb_share_set_values;
  wire             key_s1_beginbursttransfer_internal;
  wire             key_s1_begins_xfer;
  wire             key_s1_chipselect;
  wire             key_s1_end_xfer;
  wire             key_s1_firsttransfer;
  wire             key_s1_grant_vector;
  wire             key_s1_in_a_read_cycle;
  wire             key_s1_in_a_write_cycle;
  wire             key_s1_irq_from_sa;
  wire             key_s1_master_qreq_vector;
  wire             key_s1_non_bursting_master_requests;
  wire    [  3: 0] key_s1_readdata_from_sa;
  reg              key_s1_reg_firsttransfer;
  wire             key_s1_reset_n;
  reg              key_s1_slavearbiterlockenable;
  wire             key_s1_slavearbiterlockenable2;
  wire             key_s1_unreg_firsttransfer;
  wire             key_s1_waits_for_read;
  wire             key_s1_waits_for_write;
  wire             key_s1_write_n;
  wire    [  3: 0] key_s1_writedata;
  wire             wait_for_key_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~key_s1_end_xfer;
    end


  assign key_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_io_m1_qualified_request_key_s1));
  //assign key_s1_readdata_from_sa = key_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign key_s1_readdata_from_sa = key_s1_readdata;

  assign clock_crossing_io_m1_requests_key_s1 = ({clock_crossing_io_m1_address_to_slave[6 : 4] , 4'b0} == 7'h50) & (clock_crossing_io_m1_read | clock_crossing_io_m1_write);
  //key_s1_arb_share_counter set values, which is an e_mux
  assign key_s1_arb_share_set_values = 1;

  //key_s1_non_bursting_master_requests mux, which is an e_mux
  assign key_s1_non_bursting_master_requests = clock_crossing_io_m1_requests_key_s1;

  //key_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign key_s1_any_bursting_master_saved_grant = 0;

  //key_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign key_s1_arb_share_counter_next_value = key_s1_firsttransfer ? (key_s1_arb_share_set_values - 1) : |key_s1_arb_share_counter ? (key_s1_arb_share_counter - 1) : 0;

  //key_s1_allgrants all slave grants, which is an e_mux
  assign key_s1_allgrants = |key_s1_grant_vector;

  //key_s1_end_xfer assignment, which is an e_assign
  assign key_s1_end_xfer = ~(key_s1_waits_for_read | key_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_key_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_key_s1 = key_s1_end_xfer & (~key_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //key_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign key_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_key_s1 & key_s1_allgrants) | (end_xfer_arb_share_counter_term_key_s1 & ~key_s1_non_bursting_master_requests);

  //key_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          key_s1_arb_share_counter <= 0;
      else if (key_s1_arb_counter_enable)
          key_s1_arb_share_counter <= key_s1_arb_share_counter_next_value;
    end


  //key_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          key_s1_slavearbiterlockenable <= 0;
      else if ((|key_s1_master_qreq_vector & end_xfer_arb_share_counter_term_key_s1) | (end_xfer_arb_share_counter_term_key_s1 & ~key_s1_non_bursting_master_requests))
          key_s1_slavearbiterlockenable <= |key_s1_arb_share_counter_next_value;
    end


  //clock_crossing_io/m1 key/s1 arbiterlock, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock = key_s1_slavearbiterlockenable & clock_crossing_io_m1_continuerequest;

  //key_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign key_s1_slavearbiterlockenable2 = |key_s1_arb_share_counter_next_value;

  //clock_crossing_io/m1 key/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock2 = key_s1_slavearbiterlockenable2 & clock_crossing_io_m1_continuerequest;

  //key_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign key_s1_any_continuerequest = 1;

  //clock_crossing_io_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_io_m1_continuerequest = 1;

  assign clock_crossing_io_m1_qualified_request_key_s1 = clock_crossing_io_m1_requests_key_s1 & ~((clock_crossing_io_m1_read & ((clock_crossing_io_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_io_m1_read_data_valid_key_s1, which is an e_mux
  assign clock_crossing_io_m1_read_data_valid_key_s1 = clock_crossing_io_m1_granted_key_s1 & clock_crossing_io_m1_read & ~key_s1_waits_for_read;

  //key_s1_writedata mux, which is an e_mux
  assign key_s1_writedata = clock_crossing_io_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_io_m1_granted_key_s1 = clock_crossing_io_m1_qualified_request_key_s1;

  //clock_crossing_io/m1 saved-grant key/s1, which is an e_assign
  assign clock_crossing_io_m1_saved_grant_key_s1 = clock_crossing_io_m1_requests_key_s1;

  //allow new arb cycle for key/s1, which is an e_assign
  assign key_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign key_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign key_s1_master_qreq_vector = 1;

  //key_s1_reset_n assignment, which is an e_assign
  assign key_s1_reset_n = reset_n;

  assign key_s1_chipselect = clock_crossing_io_m1_granted_key_s1;
  //key_s1_firsttransfer first transaction, which is an e_assign
  assign key_s1_firsttransfer = key_s1_begins_xfer ? key_s1_unreg_firsttransfer : key_s1_reg_firsttransfer;

  //key_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign key_s1_unreg_firsttransfer = ~(key_s1_slavearbiterlockenable & key_s1_any_continuerequest);

  //key_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          key_s1_reg_firsttransfer <= 1'b1;
      else if (key_s1_begins_xfer)
          key_s1_reg_firsttransfer <= key_s1_unreg_firsttransfer;
    end


  //key_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign key_s1_beginbursttransfer_internal = key_s1_begins_xfer;

  //~key_s1_write_n assignment, which is an e_mux
  assign key_s1_write_n = ~(clock_crossing_io_m1_granted_key_s1 & clock_crossing_io_m1_write);

  //key_s1_address mux, which is an e_mux
  assign key_s1_address = clock_crossing_io_m1_nativeaddress;

  //d1_key_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_key_s1_end_xfer <= 1;
      else 
        d1_key_s1_end_xfer <= key_s1_end_xfer;
    end


  //key_s1_waits_for_read in a cycle, which is an e_mux
  assign key_s1_waits_for_read = key_s1_in_a_read_cycle & key_s1_begins_xfer;

  //key_s1_in_a_read_cycle assignment, which is an e_assign
  assign key_s1_in_a_read_cycle = clock_crossing_io_m1_granted_key_s1 & clock_crossing_io_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = key_s1_in_a_read_cycle;

  //key_s1_waits_for_write in a cycle, which is an e_mux
  assign key_s1_waits_for_write = key_s1_in_a_write_cycle & 0;

  //key_s1_in_a_write_cycle assignment, which is an e_assign
  assign key_s1_in_a_write_cycle = clock_crossing_io_m1_granted_key_s1 & clock_crossing_io_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = key_s1_in_a_write_cycle;

  assign wait_for_key_s1_counter = 0;
  //assign key_s1_irq_from_sa = key_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign key_s1_irq_from_sa = key_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //key/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_control_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       clock_crossing_io_m1_address_to_slave,
                                       clock_crossing_io_m1_byteenable,
                                       clock_crossing_io_m1_latency_counter,
                                       clock_crossing_io_m1_nativeaddress,
                                       clock_crossing_io_m1_read,
                                       clock_crossing_io_m1_write,
                                       clock_crossing_io_m1_writedata,
                                       lcd_control_slave_readdata,
                                       reset_n,

                                      // outputs:
                                       clock_crossing_io_m1_granted_lcd_control_slave,
                                       clock_crossing_io_m1_qualified_request_lcd_control_slave,
                                       clock_crossing_io_m1_read_data_valid_lcd_control_slave,
                                       clock_crossing_io_m1_requests_lcd_control_slave,
                                       d1_lcd_control_slave_end_xfer,
                                       lcd_control_slave_address,
                                       lcd_control_slave_begintransfer,
                                       lcd_control_slave_read,
                                       lcd_control_slave_readdata_from_sa,
                                       lcd_control_slave_wait_counter_eq_0,
                                       lcd_control_slave_write,
                                       lcd_control_slave_writedata
                                    )
;

  output           clock_crossing_io_m1_granted_lcd_control_slave;
  output           clock_crossing_io_m1_qualified_request_lcd_control_slave;
  output           clock_crossing_io_m1_read_data_valid_lcd_control_slave;
  output           clock_crossing_io_m1_requests_lcd_control_slave;
  output           d1_lcd_control_slave_end_xfer;
  output  [  1: 0] lcd_control_slave_address;
  output           lcd_control_slave_begintransfer;
  output           lcd_control_slave_read;
  output  [  7: 0] lcd_control_slave_readdata_from_sa;
  output           lcd_control_slave_wait_counter_eq_0;
  output           lcd_control_slave_write;
  output  [  7: 0] lcd_control_slave_writedata;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address_to_slave;
  input   [  3: 0] clock_crossing_io_m1_byteenable;
  input            clock_crossing_io_m1_latency_counter;
  input   [  4: 0] clock_crossing_io_m1_nativeaddress;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_write;
  input   [ 31: 0] clock_crossing_io_m1_writedata;
  input   [  7: 0] lcd_control_slave_readdata;
  input            reset_n;

  wire             clock_crossing_io_m1_arbiterlock;
  wire             clock_crossing_io_m1_arbiterlock2;
  wire             clock_crossing_io_m1_continuerequest;
  wire             clock_crossing_io_m1_granted_lcd_control_slave;
  wire             clock_crossing_io_m1_qualified_request_lcd_control_slave;
  wire             clock_crossing_io_m1_read_data_valid_lcd_control_slave;
  wire             clock_crossing_io_m1_requests_lcd_control_slave;
  wire             clock_crossing_io_m1_saved_grant_lcd_control_slave;
  reg              d1_lcd_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_allgrants;
  wire             lcd_control_slave_allow_new_arb_cycle;
  wire             lcd_control_slave_any_bursting_master_saved_grant;
  wire             lcd_control_slave_any_continuerequest;
  wire             lcd_control_slave_arb_counter_enable;
  reg              lcd_control_slave_arb_share_counter;
  wire             lcd_control_slave_arb_share_counter_next_value;
  wire             lcd_control_slave_arb_share_set_values;
  wire             lcd_control_slave_beginbursttransfer_internal;
  wire             lcd_control_slave_begins_xfer;
  wire             lcd_control_slave_begintransfer;
  wire    [  3: 0] lcd_control_slave_counter_load_value;
  wire             lcd_control_slave_end_xfer;
  wire             lcd_control_slave_firsttransfer;
  wire             lcd_control_slave_grant_vector;
  wire             lcd_control_slave_in_a_read_cycle;
  wire             lcd_control_slave_in_a_write_cycle;
  wire             lcd_control_slave_master_qreq_vector;
  wire             lcd_control_slave_non_bursting_master_requests;
  wire             lcd_control_slave_pretend_byte_enable;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  reg              lcd_control_slave_reg_firsttransfer;
  reg              lcd_control_slave_slavearbiterlockenable;
  wire             lcd_control_slave_slavearbiterlockenable2;
  wire             lcd_control_slave_unreg_firsttransfer;
  reg     [  3: 0] lcd_control_slave_wait_counter;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_waits_for_read;
  wire             lcd_control_slave_waits_for_write;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire             wait_for_lcd_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_control_slave_end_xfer;
    end


  assign lcd_control_slave_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_io_m1_qualified_request_lcd_control_slave));
  //assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_control_slave_readdata_from_sa = lcd_control_slave_readdata;

  assign clock_crossing_io_m1_requests_lcd_control_slave = ({clock_crossing_io_m1_address_to_slave[6 : 4] , 4'b0} == 7'h20) & (clock_crossing_io_m1_read | clock_crossing_io_m1_write);
  //lcd_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_control_slave_arb_share_set_values = 1;

  //lcd_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_control_slave_non_bursting_master_requests = clock_crossing_io_m1_requests_lcd_control_slave;

  //lcd_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_control_slave_arb_share_counter_next_value = lcd_control_slave_firsttransfer ? (lcd_control_slave_arb_share_set_values - 1) : |lcd_control_slave_arb_share_counter ? (lcd_control_slave_arb_share_counter - 1) : 0;

  //lcd_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_control_slave_allgrants = |lcd_control_slave_grant_vector;

  //lcd_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_control_slave_end_xfer = ~(lcd_control_slave_waits_for_read | lcd_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_control_slave = lcd_control_slave_end_xfer & (~lcd_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_control_slave & lcd_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests);

  //lcd_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_arb_share_counter <= 0;
      else if (lcd_control_slave_arb_counter_enable)
          lcd_control_slave_arb_share_counter <= lcd_control_slave_arb_share_counter_next_value;
    end


  //lcd_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_control_slave) | (end_xfer_arb_share_counter_term_lcd_control_slave & ~lcd_control_slave_non_bursting_master_requests))
          lcd_control_slave_slavearbiterlockenable <= |lcd_control_slave_arb_share_counter_next_value;
    end


  //clock_crossing_io/m1 lcd/control_slave arbiterlock, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock = lcd_control_slave_slavearbiterlockenable & clock_crossing_io_m1_continuerequest;

  //lcd_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_control_slave_slavearbiterlockenable2 = |lcd_control_slave_arb_share_counter_next_value;

  //clock_crossing_io/m1 lcd/control_slave arbiterlock2, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock2 = lcd_control_slave_slavearbiterlockenable2 & clock_crossing_io_m1_continuerequest;

  //lcd_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_control_slave_any_continuerequest = 1;

  //clock_crossing_io_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_io_m1_continuerequest = 1;

  assign clock_crossing_io_m1_qualified_request_lcd_control_slave = clock_crossing_io_m1_requests_lcd_control_slave & ~((clock_crossing_io_m1_read & ((clock_crossing_io_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_io_m1_read_data_valid_lcd_control_slave, which is an e_mux
  assign clock_crossing_io_m1_read_data_valid_lcd_control_slave = clock_crossing_io_m1_granted_lcd_control_slave & clock_crossing_io_m1_read & ~lcd_control_slave_waits_for_read;

  //lcd_control_slave_writedata mux, which is an e_mux
  assign lcd_control_slave_writedata = clock_crossing_io_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_io_m1_granted_lcd_control_slave = clock_crossing_io_m1_qualified_request_lcd_control_slave;

  //clock_crossing_io/m1 saved-grant lcd/control_slave, which is an e_assign
  assign clock_crossing_io_m1_saved_grant_lcd_control_slave = clock_crossing_io_m1_requests_lcd_control_slave;

  //allow new arb cycle for lcd/control_slave, which is an e_assign
  assign lcd_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_control_slave_master_qreq_vector = 1;

  assign lcd_control_slave_begintransfer = lcd_control_slave_begins_xfer;
  //lcd_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_firsttransfer = lcd_control_slave_begins_xfer ? lcd_control_slave_unreg_firsttransfer : lcd_control_slave_reg_firsttransfer;

  //lcd_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_control_slave_unreg_firsttransfer = ~(lcd_control_slave_slavearbiterlockenable & lcd_control_slave_any_continuerequest);

  //lcd_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_control_slave_begins_xfer)
          lcd_control_slave_reg_firsttransfer <= lcd_control_slave_unreg_firsttransfer;
    end


  //lcd_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_control_slave_beginbursttransfer_internal = lcd_control_slave_begins_xfer;

  //lcd_control_slave_read assignment, which is an e_mux
  assign lcd_control_slave_read = ((clock_crossing_io_m1_granted_lcd_control_slave & clock_crossing_io_m1_read))& ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter < 5);

  //lcd_control_slave_write assignment, which is an e_mux
  assign lcd_control_slave_write = ((clock_crossing_io_m1_granted_lcd_control_slave & clock_crossing_io_m1_write)) & ~lcd_control_slave_begins_xfer & (lcd_control_slave_wait_counter >= 5) & (lcd_control_slave_wait_counter < 10) & lcd_control_slave_pretend_byte_enable;

  //lcd_control_slave_address mux, which is an e_mux
  assign lcd_control_slave_address = clock_crossing_io_m1_nativeaddress;

  //d1_lcd_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_control_slave_end_xfer <= 1;
      else 
        d1_lcd_control_slave_end_xfer <= lcd_control_slave_end_xfer;
    end


  //lcd_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_read = lcd_control_slave_in_a_read_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_read_cycle = clock_crossing_io_m1_granted_lcd_control_slave & clock_crossing_io_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_control_slave_in_a_read_cycle;

  //lcd_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_control_slave_waits_for_write = lcd_control_slave_in_a_write_cycle & wait_for_lcd_control_slave_counter;

  //lcd_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_control_slave_in_a_write_cycle = clock_crossing_io_m1_granted_lcd_control_slave & clock_crossing_io_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_control_slave_in_a_write_cycle;

  assign lcd_control_slave_wait_counter_eq_0 = lcd_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_control_slave_wait_counter <= 0;
      else 
        lcd_control_slave_wait_counter <= lcd_control_slave_counter_load_value;
    end


  assign lcd_control_slave_counter_load_value = ((lcd_control_slave_in_a_read_cycle & lcd_control_slave_begins_xfer))? 8 :
    ((lcd_control_slave_in_a_write_cycle & lcd_control_slave_begins_xfer))? 13 :
    (~lcd_control_slave_wait_counter_eq_0)? lcd_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_control_slave_counter = lcd_control_slave_begins_xfer | ~lcd_control_slave_wait_counter_eq_0;
  //lcd_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_control_slave_pretend_byte_enable = (clock_crossing_io_m1_granted_lcd_control_slave)? clock_crossing_io_m1_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led_s1_arbitrator (
                           // inputs:
                            clk,
                            clock_crossing_io_m1_address_to_slave,
                            clock_crossing_io_m1_latency_counter,
                            clock_crossing_io_m1_nativeaddress,
                            clock_crossing_io_m1_read,
                            clock_crossing_io_m1_write,
                            clock_crossing_io_m1_writedata,
                            led_s1_readdata,
                            reset_n,

                           // outputs:
                            clock_crossing_io_m1_granted_led_s1,
                            clock_crossing_io_m1_qualified_request_led_s1,
                            clock_crossing_io_m1_read_data_valid_led_s1,
                            clock_crossing_io_m1_requests_led_s1,
                            d1_led_s1_end_xfer,
                            led_s1_address,
                            led_s1_chipselect,
                            led_s1_readdata_from_sa,
                            led_s1_reset_n,
                            led_s1_write_n,
                            led_s1_writedata
                         )
;

  output           clock_crossing_io_m1_granted_led_s1;
  output           clock_crossing_io_m1_qualified_request_led_s1;
  output           clock_crossing_io_m1_read_data_valid_led_s1;
  output           clock_crossing_io_m1_requests_led_s1;
  output           d1_led_s1_end_xfer;
  output  [  1: 0] led_s1_address;
  output           led_s1_chipselect;
  output  [ 26: 0] led_s1_readdata_from_sa;
  output           led_s1_reset_n;
  output           led_s1_write_n;
  output  [ 26: 0] led_s1_writedata;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address_to_slave;
  input            clock_crossing_io_m1_latency_counter;
  input   [  4: 0] clock_crossing_io_m1_nativeaddress;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_write;
  input   [ 31: 0] clock_crossing_io_m1_writedata;
  input   [ 26: 0] led_s1_readdata;
  input            reset_n;

  wire             clock_crossing_io_m1_arbiterlock;
  wire             clock_crossing_io_m1_arbiterlock2;
  wire             clock_crossing_io_m1_continuerequest;
  wire             clock_crossing_io_m1_granted_led_s1;
  wire             clock_crossing_io_m1_qualified_request_led_s1;
  wire             clock_crossing_io_m1_read_data_valid_led_s1;
  wire             clock_crossing_io_m1_requests_led_s1;
  wire             clock_crossing_io_m1_saved_grant_led_s1;
  reg              d1_led_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led_s1_address;
  wire             led_s1_allgrants;
  wire             led_s1_allow_new_arb_cycle;
  wire             led_s1_any_bursting_master_saved_grant;
  wire             led_s1_any_continuerequest;
  wire             led_s1_arb_counter_enable;
  reg              led_s1_arb_share_counter;
  wire             led_s1_arb_share_counter_next_value;
  wire             led_s1_arb_share_set_values;
  wire             led_s1_beginbursttransfer_internal;
  wire             led_s1_begins_xfer;
  wire             led_s1_chipselect;
  wire             led_s1_end_xfer;
  wire             led_s1_firsttransfer;
  wire             led_s1_grant_vector;
  wire             led_s1_in_a_read_cycle;
  wire             led_s1_in_a_write_cycle;
  wire             led_s1_master_qreq_vector;
  wire             led_s1_non_bursting_master_requests;
  wire    [ 26: 0] led_s1_readdata_from_sa;
  reg              led_s1_reg_firsttransfer;
  wire             led_s1_reset_n;
  reg              led_s1_slavearbiterlockenable;
  wire             led_s1_slavearbiterlockenable2;
  wire             led_s1_unreg_firsttransfer;
  wire             led_s1_waits_for_read;
  wire             led_s1_waits_for_write;
  wire             led_s1_write_n;
  wire    [ 26: 0] led_s1_writedata;
  wire             wait_for_led_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~led_s1_end_xfer;
    end


  assign led_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_io_m1_qualified_request_led_s1));
  //assign led_s1_readdata_from_sa = led_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign led_s1_readdata_from_sa = led_s1_readdata;

  assign clock_crossing_io_m1_requests_led_s1 = ({clock_crossing_io_m1_address_to_slave[6 : 4] , 4'b0} == 7'h30) & (clock_crossing_io_m1_read | clock_crossing_io_m1_write);
  //led_s1_arb_share_counter set values, which is an e_mux
  assign led_s1_arb_share_set_values = 1;

  //led_s1_non_bursting_master_requests mux, which is an e_mux
  assign led_s1_non_bursting_master_requests = clock_crossing_io_m1_requests_led_s1;

  //led_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led_s1_any_bursting_master_saved_grant = 0;

  //led_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led_s1_arb_share_counter_next_value = led_s1_firsttransfer ? (led_s1_arb_share_set_values - 1) : |led_s1_arb_share_counter ? (led_s1_arb_share_counter - 1) : 0;

  //led_s1_allgrants all slave grants, which is an e_mux
  assign led_s1_allgrants = |led_s1_grant_vector;

  //led_s1_end_xfer assignment, which is an e_assign
  assign led_s1_end_xfer = ~(led_s1_waits_for_read | led_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led_s1 = led_s1_end_xfer & (~led_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led_s1 & led_s1_allgrants) | (end_xfer_arb_share_counter_term_led_s1 & ~led_s1_non_bursting_master_requests);

  //led_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_s1_arb_share_counter <= 0;
      else if (led_s1_arb_counter_enable)
          led_s1_arb_share_counter <= led_s1_arb_share_counter_next_value;
    end


  //led_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_s1_slavearbiterlockenable <= 0;
      else if ((|led_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led_s1) | (end_xfer_arb_share_counter_term_led_s1 & ~led_s1_non_bursting_master_requests))
          led_s1_slavearbiterlockenable <= |led_s1_arb_share_counter_next_value;
    end


  //clock_crossing_io/m1 led/s1 arbiterlock, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock = led_s1_slavearbiterlockenable & clock_crossing_io_m1_continuerequest;

  //led_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led_s1_slavearbiterlockenable2 = |led_s1_arb_share_counter_next_value;

  //clock_crossing_io/m1 led/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock2 = led_s1_slavearbiterlockenable2 & clock_crossing_io_m1_continuerequest;

  //led_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led_s1_any_continuerequest = 1;

  //clock_crossing_io_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_io_m1_continuerequest = 1;

  assign clock_crossing_io_m1_qualified_request_led_s1 = clock_crossing_io_m1_requests_led_s1 & ~((clock_crossing_io_m1_read & ((clock_crossing_io_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_io_m1_read_data_valid_led_s1, which is an e_mux
  assign clock_crossing_io_m1_read_data_valid_led_s1 = clock_crossing_io_m1_granted_led_s1 & clock_crossing_io_m1_read & ~led_s1_waits_for_read;

  //led_s1_writedata mux, which is an e_mux
  assign led_s1_writedata = clock_crossing_io_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_io_m1_granted_led_s1 = clock_crossing_io_m1_qualified_request_led_s1;

  //clock_crossing_io/m1 saved-grant led/s1, which is an e_assign
  assign clock_crossing_io_m1_saved_grant_led_s1 = clock_crossing_io_m1_requests_led_s1;

  //allow new arb cycle for led/s1, which is an e_assign
  assign led_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led_s1_master_qreq_vector = 1;

  //led_s1_reset_n assignment, which is an e_assign
  assign led_s1_reset_n = reset_n;

  assign led_s1_chipselect = clock_crossing_io_m1_granted_led_s1;
  //led_s1_firsttransfer first transaction, which is an e_assign
  assign led_s1_firsttransfer = led_s1_begins_xfer ? led_s1_unreg_firsttransfer : led_s1_reg_firsttransfer;

  //led_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led_s1_unreg_firsttransfer = ~(led_s1_slavearbiterlockenable & led_s1_any_continuerequest);

  //led_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led_s1_reg_firsttransfer <= 1'b1;
      else if (led_s1_begins_xfer)
          led_s1_reg_firsttransfer <= led_s1_unreg_firsttransfer;
    end


  //led_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led_s1_beginbursttransfer_internal = led_s1_begins_xfer;

  //~led_s1_write_n assignment, which is an e_mux
  assign led_s1_write_n = ~(clock_crossing_io_m1_granted_led_s1 & clock_crossing_io_m1_write);

  //led_s1_address mux, which is an e_mux
  assign led_s1_address = clock_crossing_io_m1_nativeaddress;

  //d1_led_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led_s1_end_xfer <= 1;
      else 
        d1_led_s1_end_xfer <= led_s1_end_xfer;
    end


  //led_s1_waits_for_read in a cycle, which is an e_mux
  assign led_s1_waits_for_read = led_s1_in_a_read_cycle & led_s1_begins_xfer;

  //led_s1_in_a_read_cycle assignment, which is an e_assign
  assign led_s1_in_a_read_cycle = clock_crossing_io_m1_granted_led_s1 & clock_crossing_io_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led_s1_in_a_read_cycle;

  //led_s1_waits_for_write in a cycle, which is an e_mux
  assign led_s1_waits_for_write = led_s1_in_a_write_cycle & 0;

  //led_s1_in_a_write_cycle assignment, which is an e_assign
  assign led_s1_in_a_write_cycle = clock_crossing_io_m1_granted_led_s1 & clock_crossing_io_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led_s1_in_a_write_cycle;

  assign wait_for_led_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module multi_touch_avalon_slave_arbitrator (
                                             // inputs:
                                              MTL_SOPC_clock_1_out_address_to_slave,
                                              MTL_SOPC_clock_1_out_nativeaddress,
                                              MTL_SOPC_clock_1_out_read,
                                              MTL_SOPC_clock_1_out_write,
                                              MTL_SOPC_clock_1_out_writedata,
                                              clk,
                                              multi_touch_avalon_slave_irq_n,
                                              multi_touch_avalon_slave_readdata,
                                              reset_n,

                                             // outputs:
                                              MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave,
                                              MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave,
                                              MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave,
                                              MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave,
                                              d1_multi_touch_avalon_slave_end_xfer,
                                              multi_touch_avalon_slave_address,
                                              multi_touch_avalon_slave_chipselect,
                                              multi_touch_avalon_slave_irq_n_from_sa,
                                              multi_touch_avalon_slave_read,
                                              multi_touch_avalon_slave_readdata_from_sa,
                                              multi_touch_avalon_slave_reset_n,
                                              multi_touch_avalon_slave_write,
                                              multi_touch_avalon_slave_writedata
                                           )
;

  output           MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave;
  output           MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave;
  output           MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave;
  output           MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;
  output           d1_multi_touch_avalon_slave_end_xfer;
  output  [  4: 0] multi_touch_avalon_slave_address;
  output           multi_touch_avalon_slave_chipselect;
  output           multi_touch_avalon_slave_irq_n_from_sa;
  output           multi_touch_avalon_slave_read;
  output  [ 15: 0] multi_touch_avalon_slave_readdata_from_sa;
  output           multi_touch_avalon_slave_reset_n;
  output           multi_touch_avalon_slave_write;
  output  [ 15: 0] multi_touch_avalon_slave_writedata;
  input   [  5: 0] MTL_SOPC_clock_1_out_address_to_slave;
  input   [  4: 0] MTL_SOPC_clock_1_out_nativeaddress;
  input            MTL_SOPC_clock_1_out_read;
  input            MTL_SOPC_clock_1_out_write;
  input   [ 15: 0] MTL_SOPC_clock_1_out_writedata;
  input            clk;
  input            multi_touch_avalon_slave_irq_n;
  input   [ 15: 0] multi_touch_avalon_slave_readdata;
  input            reset_n;

  wire             MTL_SOPC_clock_1_out_arbiterlock;
  wire             MTL_SOPC_clock_1_out_arbiterlock2;
  wire             MTL_SOPC_clock_1_out_continuerequest;
  wire             MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave;
  wire             MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave;
  wire             MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave;
  wire             MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;
  wire             MTL_SOPC_clock_1_out_saved_grant_multi_touch_avalon_slave;
  reg              d1_multi_touch_avalon_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_multi_touch_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  4: 0] multi_touch_avalon_slave_address;
  wire             multi_touch_avalon_slave_allgrants;
  wire             multi_touch_avalon_slave_allow_new_arb_cycle;
  wire             multi_touch_avalon_slave_any_bursting_master_saved_grant;
  wire             multi_touch_avalon_slave_any_continuerequest;
  wire             multi_touch_avalon_slave_arb_counter_enable;
  reg              multi_touch_avalon_slave_arb_share_counter;
  wire             multi_touch_avalon_slave_arb_share_counter_next_value;
  wire             multi_touch_avalon_slave_arb_share_set_values;
  wire             multi_touch_avalon_slave_beginbursttransfer_internal;
  wire             multi_touch_avalon_slave_begins_xfer;
  wire             multi_touch_avalon_slave_chipselect;
  wire             multi_touch_avalon_slave_end_xfer;
  wire             multi_touch_avalon_slave_firsttransfer;
  wire             multi_touch_avalon_slave_grant_vector;
  wire             multi_touch_avalon_slave_in_a_read_cycle;
  wire             multi_touch_avalon_slave_in_a_write_cycle;
  wire             multi_touch_avalon_slave_irq_n_from_sa;
  wire             multi_touch_avalon_slave_master_qreq_vector;
  wire             multi_touch_avalon_slave_non_bursting_master_requests;
  wire             multi_touch_avalon_slave_read;
  wire    [ 15: 0] multi_touch_avalon_slave_readdata_from_sa;
  reg              multi_touch_avalon_slave_reg_firsttransfer;
  wire             multi_touch_avalon_slave_reset_n;
  reg              multi_touch_avalon_slave_slavearbiterlockenable;
  wire             multi_touch_avalon_slave_slavearbiterlockenable2;
  wire             multi_touch_avalon_slave_unreg_firsttransfer;
  wire             multi_touch_avalon_slave_waits_for_read;
  wire             multi_touch_avalon_slave_waits_for_write;
  wire             multi_touch_avalon_slave_write;
  wire    [ 15: 0] multi_touch_avalon_slave_writedata;
  wire             wait_for_multi_touch_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~multi_touch_avalon_slave_end_xfer;
    end


  assign multi_touch_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave));
  //assign multi_touch_avalon_slave_readdata_from_sa = multi_touch_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign multi_touch_avalon_slave_readdata_from_sa = multi_touch_avalon_slave_readdata;

  assign MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave = (1) & (MTL_SOPC_clock_1_out_read | MTL_SOPC_clock_1_out_write);
  //multi_touch_avalon_slave_arb_share_counter set values, which is an e_mux
  assign multi_touch_avalon_slave_arb_share_set_values = 1;

  //multi_touch_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign multi_touch_avalon_slave_non_bursting_master_requests = MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;

  //multi_touch_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign multi_touch_avalon_slave_any_bursting_master_saved_grant = 0;

  //multi_touch_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign multi_touch_avalon_slave_arb_share_counter_next_value = multi_touch_avalon_slave_firsttransfer ? (multi_touch_avalon_slave_arb_share_set_values - 1) : |multi_touch_avalon_slave_arb_share_counter ? (multi_touch_avalon_slave_arb_share_counter - 1) : 0;

  //multi_touch_avalon_slave_allgrants all slave grants, which is an e_mux
  assign multi_touch_avalon_slave_allgrants = |multi_touch_avalon_slave_grant_vector;

  //multi_touch_avalon_slave_end_xfer assignment, which is an e_assign
  assign multi_touch_avalon_slave_end_xfer = ~(multi_touch_avalon_slave_waits_for_read | multi_touch_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_multi_touch_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_multi_touch_avalon_slave = multi_touch_avalon_slave_end_xfer & (~multi_touch_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //multi_touch_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign multi_touch_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_multi_touch_avalon_slave & multi_touch_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_multi_touch_avalon_slave & ~multi_touch_avalon_slave_non_bursting_master_requests);

  //multi_touch_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          multi_touch_avalon_slave_arb_share_counter <= 0;
      else if (multi_touch_avalon_slave_arb_counter_enable)
          multi_touch_avalon_slave_arb_share_counter <= multi_touch_avalon_slave_arb_share_counter_next_value;
    end


  //multi_touch_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          multi_touch_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|multi_touch_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_multi_touch_avalon_slave) | (end_xfer_arb_share_counter_term_multi_touch_avalon_slave & ~multi_touch_avalon_slave_non_bursting_master_requests))
          multi_touch_avalon_slave_slavearbiterlockenable <= |multi_touch_avalon_slave_arb_share_counter_next_value;
    end


  //MTL_SOPC_clock_1/out multi_touch/avalon_slave arbiterlock, which is an e_assign
  assign MTL_SOPC_clock_1_out_arbiterlock = multi_touch_avalon_slave_slavearbiterlockenable & MTL_SOPC_clock_1_out_continuerequest;

  //multi_touch_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign multi_touch_avalon_slave_slavearbiterlockenable2 = |multi_touch_avalon_slave_arb_share_counter_next_value;

  //MTL_SOPC_clock_1/out multi_touch/avalon_slave arbiterlock2, which is an e_assign
  assign MTL_SOPC_clock_1_out_arbiterlock2 = multi_touch_avalon_slave_slavearbiterlockenable2 & MTL_SOPC_clock_1_out_continuerequest;

  //multi_touch_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign multi_touch_avalon_slave_any_continuerequest = 1;

  //MTL_SOPC_clock_1_out_continuerequest continued request, which is an e_assign
  assign MTL_SOPC_clock_1_out_continuerequest = 1;

  assign MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave = MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;
  //multi_touch_avalon_slave_writedata mux, which is an e_mux
  assign multi_touch_avalon_slave_writedata = MTL_SOPC_clock_1_out_writedata;

  //master is always granted when requested
  assign MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave = MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave;

  //MTL_SOPC_clock_1/out saved-grant multi_touch/avalon_slave, which is an e_assign
  assign MTL_SOPC_clock_1_out_saved_grant_multi_touch_avalon_slave = MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;

  //allow new arb cycle for multi_touch/avalon_slave, which is an e_assign
  assign multi_touch_avalon_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign multi_touch_avalon_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign multi_touch_avalon_slave_master_qreq_vector = 1;

  //multi_touch_avalon_slave_reset_n assignment, which is an e_assign
  assign multi_touch_avalon_slave_reset_n = reset_n;

  assign multi_touch_avalon_slave_chipselect = MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave;
  //multi_touch_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign multi_touch_avalon_slave_firsttransfer = multi_touch_avalon_slave_begins_xfer ? multi_touch_avalon_slave_unreg_firsttransfer : multi_touch_avalon_slave_reg_firsttransfer;

  //multi_touch_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign multi_touch_avalon_slave_unreg_firsttransfer = ~(multi_touch_avalon_slave_slavearbiterlockenable & multi_touch_avalon_slave_any_continuerequest);

  //multi_touch_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          multi_touch_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (multi_touch_avalon_slave_begins_xfer)
          multi_touch_avalon_slave_reg_firsttransfer <= multi_touch_avalon_slave_unreg_firsttransfer;
    end


  //multi_touch_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign multi_touch_avalon_slave_beginbursttransfer_internal = multi_touch_avalon_slave_begins_xfer;

  //multi_touch_avalon_slave_read assignment, which is an e_mux
  assign multi_touch_avalon_slave_read = MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave & MTL_SOPC_clock_1_out_read;

  //multi_touch_avalon_slave_write assignment, which is an e_mux
  assign multi_touch_avalon_slave_write = MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave & MTL_SOPC_clock_1_out_write;

  //multi_touch_avalon_slave_address mux, which is an e_mux
  assign multi_touch_avalon_slave_address = MTL_SOPC_clock_1_out_nativeaddress;

  //d1_multi_touch_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_multi_touch_avalon_slave_end_xfer <= 1;
      else 
        d1_multi_touch_avalon_slave_end_xfer <= multi_touch_avalon_slave_end_xfer;
    end


  //multi_touch_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign multi_touch_avalon_slave_waits_for_read = multi_touch_avalon_slave_in_a_read_cycle & multi_touch_avalon_slave_begins_xfer;

  //multi_touch_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign multi_touch_avalon_slave_in_a_read_cycle = MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave & MTL_SOPC_clock_1_out_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = multi_touch_avalon_slave_in_a_read_cycle;

  //multi_touch_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign multi_touch_avalon_slave_waits_for_write = multi_touch_avalon_slave_in_a_write_cycle & 0;

  //multi_touch_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign multi_touch_avalon_slave_in_a_write_cycle = MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave & MTL_SOPC_clock_1_out_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = multi_touch_avalon_slave_in_a_write_cycle;

  assign wait_for_multi_touch_avalon_slave_counter = 0;
  //assign multi_touch_avalon_slave_irq_n_from_sa = multi_touch_avalon_slave_irq_n so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign multi_touch_avalon_slave_irq_n_from_sa = multi_touch_avalon_slave_irq_n;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //multi_touch/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_MTL_SOPC_burst_0_downstream_to_sdram_s1_module (
                                                                     // inputs:
                                                                      clear_fifo,
                                                                      clk,
                                                                      data_in,
                                                                      read,
                                                                      reset_n,
                                                                      sync_reset,
                                                                      write,

                                                                     // outputs:
                                                                      data_out,
                                                                      empty,
                                                                      fifo_contains_ones_n,
                                                                      full
                                                                   )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_data_master_to_sdram_s1_module (
                                                         // inputs:
                                                          clear_fifo,
                                                          clk,
                                                          data_in,
                                                          read,
                                                          reset_n,
                                                          sync_reset,
                                                          write,

                                                         // outputs:
                                                          data_out,
                                                          empty,
                                                          fifo_contains_ones_n,
                                                          full
                                                       )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_s1_arbitrator (
                             // inputs:
                              MTL_SOPC_burst_0_downstream_address_to_slave,
                              MTL_SOPC_burst_0_downstream_arbitrationshare,
                              MTL_SOPC_burst_0_downstream_burstcount,
                              MTL_SOPC_burst_0_downstream_byteenable,
                              MTL_SOPC_burst_0_downstream_latency_counter,
                              MTL_SOPC_burst_0_downstream_read,
                              MTL_SOPC_burst_0_downstream_write,
                              MTL_SOPC_burst_0_downstream_writedata,
                              clk,
                              cpu_data_master_address_to_slave,
                              cpu_data_master_byteenable,
                              cpu_data_master_latency_counter,
                              cpu_data_master_read,
                              cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                              cpu_data_master_write,
                              cpu_data_master_writedata,
                              reset_n,
                              sdram_s1_readdata,
                              sdram_s1_readdatavalid,
                              sdram_s1_waitrequest,

                             // outputs:
                              MTL_SOPC_burst_0_downstream_granted_sdram_s1,
                              MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1,
                              MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1,
                              MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register,
                              MTL_SOPC_burst_0_downstream_requests_sdram_s1,
                              cpu_data_master_granted_sdram_s1,
                              cpu_data_master_qualified_request_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1,
                              cpu_data_master_read_data_valid_sdram_s1_shift_register,
                              cpu_data_master_requests_sdram_s1,
                              d1_sdram_s1_end_xfer,
                              sdram_s1_address,
                              sdram_s1_byteenable_n,
                              sdram_s1_chipselect,
                              sdram_s1_read_n,
                              sdram_s1_readdata_from_sa,
                              sdram_s1_reset_n,
                              sdram_s1_waitrequest_from_sa,
                              sdram_s1_write_n,
                              sdram_s1_writedata
                           )
;

  output           MTL_SOPC_burst_0_downstream_granted_sdram_s1;
  output           MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1;
  output           MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1;
  output           MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register;
  output           MTL_SOPC_burst_0_downstream_requests_sdram_s1;
  output           cpu_data_master_granted_sdram_s1;
  output           cpu_data_master_qualified_request_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1;
  output           cpu_data_master_read_data_valid_sdram_s1_shift_register;
  output           cpu_data_master_requests_sdram_s1;
  output           d1_sdram_s1_end_xfer;
  output  [ 24: 0] sdram_s1_address;
  output  [  3: 0] sdram_s1_byteenable_n;
  output           sdram_s1_chipselect;
  output           sdram_s1_read_n;
  output  [ 31: 0] sdram_s1_readdata_from_sa;
  output           sdram_s1_reset_n;
  output           sdram_s1_waitrequest_from_sa;
  output           sdram_s1_write_n;
  output  [ 31: 0] sdram_s1_writedata;
  input   [ 26: 0] MTL_SOPC_burst_0_downstream_address_to_slave;
  input   [  5: 0] MTL_SOPC_burst_0_downstream_arbitrationshare;
  input            MTL_SOPC_burst_0_downstream_burstcount;
  input   [  3: 0] MTL_SOPC_burst_0_downstream_byteenable;
  input            MTL_SOPC_burst_0_downstream_latency_counter;
  input            MTL_SOPC_burst_0_downstream_read;
  input            MTL_SOPC_burst_0_downstream_write;
  input   [ 31: 0] MTL_SOPC_burst_0_downstream_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input            reset_n;
  input   [ 31: 0] sdram_s1_readdata;
  input            sdram_s1_readdatavalid;
  input            sdram_s1_waitrequest;

  wire             MTL_SOPC_burst_0_downstream_arbiterlock;
  wire             MTL_SOPC_burst_0_downstream_arbiterlock2;
  wire             MTL_SOPC_burst_0_downstream_continuerequest;
  wire             MTL_SOPC_burst_0_downstream_granted_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_rdv_fifo_empty_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_rdv_fifo_output_from_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register;
  wire             MTL_SOPC_burst_0_downstream_requests_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_saved_grant_sdram_s1;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_rdv_fifo_empty_sdram_s1;
  wire             cpu_data_master_rdv_fifo_output_from_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_saved_grant_sdram_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_MTL_SOPC_burst_0_downstream_granted_slave_sdram_s1;
  reg              last_cycle_cpu_data_master_granted_slave_sdram_s1;
  wire    [ 24: 0] sdram_s1_address;
  wire             sdram_s1_allgrants;
  wire             sdram_s1_allow_new_arb_cycle;
  wire             sdram_s1_any_bursting_master_saved_grant;
  wire             sdram_s1_any_continuerequest;
  reg     [  1: 0] sdram_s1_arb_addend;
  wire             sdram_s1_arb_counter_enable;
  reg     [  5: 0] sdram_s1_arb_share_counter;
  wire    [  5: 0] sdram_s1_arb_share_counter_next_value;
  wire    [  5: 0] sdram_s1_arb_share_set_values;
  wire    [  1: 0] sdram_s1_arb_winner;
  wire             sdram_s1_arbitration_holdoff_internal;
  wire             sdram_s1_beginbursttransfer_internal;
  wire             sdram_s1_begins_xfer;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire    [  3: 0] sdram_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_s1_chosen_master_rot_left;
  wire             sdram_s1_end_xfer;
  wire             sdram_s1_firsttransfer;
  wire    [  1: 0] sdram_s1_grant_vector;
  wire             sdram_s1_in_a_read_cycle;
  wire             sdram_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_s1_master_qreq_vector;
  wire             sdram_s1_move_on_to_next_transaction;
  wire             sdram_s1_non_bursting_master_requests;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid_from_sa;
  reg              sdram_s1_reg_firsttransfer;
  wire             sdram_s1_reset_n;
  reg     [  1: 0] sdram_s1_saved_chosen_master_vector;
  reg              sdram_s1_slavearbiterlockenable;
  wire             sdram_s1_slavearbiterlockenable2;
  wire             sdram_s1_unreg_firsttransfer;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_waits_for_read;
  wire             sdram_s1_waits_for_write;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire    [ 26: 0] shifted_address_to_sdram_s1_from_MTL_SOPC_burst_0_downstream;
  wire    [ 27: 0] shifted_address_to_sdram_s1_from_cpu_data_master;
  wire             wait_for_sdram_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_s1_end_xfer;
    end


  assign sdram_s1_begins_xfer = ~d1_reasons_to_wait & ((MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1 | cpu_data_master_qualified_request_sdram_s1));
  //assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdatavalid_from_sa = sdram_s1_readdatavalid;

  //assign sdram_s1_readdata_from_sa = sdram_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_readdata_from_sa = sdram_s1_readdata;

  assign MTL_SOPC_burst_0_downstream_requests_sdram_s1 = (1) & (MTL_SOPC_burst_0_downstream_read | MTL_SOPC_burst_0_downstream_write);
  //assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_s1_waitrequest_from_sa = sdram_s1_waitrequest;

  //sdram_s1_arb_share_counter set values, which is an e_mux
  assign sdram_s1_arb_share_set_values = (MTL_SOPC_burst_0_downstream_granted_sdram_s1)? MTL_SOPC_burst_0_downstream_arbitrationshare :
    (MTL_SOPC_burst_0_downstream_granted_sdram_s1)? MTL_SOPC_burst_0_downstream_arbitrationshare :
    1;

  //sdram_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_s1_non_bursting_master_requests = 0 |
    cpu_data_master_requests_sdram_s1 |
    cpu_data_master_requests_sdram_s1;

  //sdram_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_s1_any_bursting_master_saved_grant = MTL_SOPC_burst_0_downstream_saved_grant_sdram_s1 |
    MTL_SOPC_burst_0_downstream_saved_grant_sdram_s1;

  //sdram_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_s1_arb_share_counter_next_value = sdram_s1_firsttransfer ? (sdram_s1_arb_share_set_values - 1) : |sdram_s1_arb_share_counter ? (sdram_s1_arb_share_counter - 1) : 0;

  //sdram_s1_allgrants all slave grants, which is an e_mux
  assign sdram_s1_allgrants = (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector) |
    (|sdram_s1_grant_vector);

  //sdram_s1_end_xfer assignment, which is an e_assign
  assign sdram_s1_end_xfer = ~(sdram_s1_waits_for_read | sdram_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_s1 = sdram_s1_end_xfer & (~sdram_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_s1 & sdram_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests);

  //sdram_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_share_counter <= 0;
      else if (sdram_s1_arb_counter_enable)
          sdram_s1_arb_share_counter <= sdram_s1_arb_share_counter_next_value;
    end


  //sdram_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_s1) | (end_xfer_arb_share_counter_term_sdram_s1 & ~sdram_s1_non_bursting_master_requests))
          sdram_s1_slavearbiterlockenable <= |sdram_s1_arb_share_counter_next_value;
    end


  //MTL_SOPC_burst_0/downstream sdram/s1 arbiterlock, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_arbiterlock = sdram_s1_slavearbiterlockenable & MTL_SOPC_burst_0_downstream_continuerequest;

  //sdram_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_s1_slavearbiterlockenable2 = |sdram_s1_arb_share_counter_next_value;

  //MTL_SOPC_burst_0/downstream sdram/s1 arbiterlock2, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & MTL_SOPC_burst_0_downstream_continuerequest;

  //cpu/data_master sdram/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sdram_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu/data_master sdram/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sdram_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/data_master granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sdram_s1 <= cpu_data_master_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | 0) ? 0 : last_cycle_cpu_data_master_granted_slave_sdram_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_sdram_s1 & cpu_data_master_requests_sdram_s1;

  //sdram_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_s1_any_continuerequest = cpu_data_master_continuerequest |
    MTL_SOPC_burst_0_downstream_continuerequest;

  assign MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1 = MTL_SOPC_burst_0_downstream_requests_sdram_s1 & ~((MTL_SOPC_burst_0_downstream_read & ((MTL_SOPC_burst_0_downstream_latency_counter != 0) | (1 < MTL_SOPC_burst_0_downstream_latency_counter))) | cpu_data_master_arbiterlock);
  //unique name for sdram_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_s1_move_on_to_next_transaction = sdram_s1_readdatavalid_from_sa;

  //rdv_fifo_for_MTL_SOPC_burst_0_downstream_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_MTL_SOPC_burst_0_downstream_to_sdram_s1_module rdv_fifo_for_MTL_SOPC_burst_0_downstream_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (MTL_SOPC_burst_0_downstream_granted_sdram_s1),
      .data_out             (MTL_SOPC_burst_0_downstream_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (MTL_SOPC_burst_0_downstream_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register = ~MTL_SOPC_burst_0_downstream_rdv_fifo_empty_sdram_s1;
  //local readdatavalid MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1, which is an e_mux
  assign MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & MTL_SOPC_burst_0_downstream_rdv_fifo_output_from_sdram_s1) & ~ MTL_SOPC_burst_0_downstream_rdv_fifo_empty_sdram_s1;

  //sdram_s1_writedata mux, which is an e_mux
  assign sdram_s1_writedata = (MTL_SOPC_burst_0_downstream_granted_sdram_s1)? MTL_SOPC_burst_0_downstream_writedata :
    cpu_data_master_writedata;

  assign cpu_data_master_requests_sdram_s1 = ({cpu_data_master_address_to_slave[27] , 27'b0} == 28'h8000000) & (cpu_data_master_read | cpu_data_master_write);
  //MTL_SOPC_burst_0/downstream granted sdram/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_MTL_SOPC_burst_0_downstream_granted_slave_sdram_s1 <= 0;
      else 
        last_cycle_MTL_SOPC_burst_0_downstream_granted_slave_sdram_s1 <= MTL_SOPC_burst_0_downstream_saved_grant_sdram_s1 ? 1 : (sdram_s1_arbitration_holdoff_internal | ~MTL_SOPC_burst_0_downstream_requests_sdram_s1) ? 0 : last_cycle_MTL_SOPC_burst_0_downstream_granted_slave_sdram_s1;
    end


  //MTL_SOPC_burst_0_downstream_continuerequest continued request, which is an e_mux
  assign MTL_SOPC_burst_0_downstream_continuerequest = last_cycle_MTL_SOPC_burst_0_downstream_granted_slave_sdram_s1 & 1;

  assign cpu_data_master_qualified_request_sdram_s1 = cpu_data_master_requests_sdram_s1 & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (1 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register))) | MTL_SOPC_burst_0_downstream_arbiterlock);
  //rdv_fifo_for_cpu_data_master_to_sdram_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_data_master_to_sdram_s1_module rdv_fifo_for_cpu_data_master_to_sdram_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_data_master_granted_sdram_s1),
      .data_out             (cpu_data_master_rdv_fifo_output_from_sdram_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_data_master_rdv_fifo_empty_sdram_s1),
      .full                 (),
      .read                 (sdram_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_s1_waits_for_read)
    );

  assign cpu_data_master_read_data_valid_sdram_s1_shift_register = ~cpu_data_master_rdv_fifo_empty_sdram_s1;
  //local readdatavalid cpu_data_master_read_data_valid_sdram_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_sdram_s1 = (sdram_s1_readdatavalid_from_sa & cpu_data_master_rdv_fifo_output_from_sdram_s1) & ~ cpu_data_master_rdv_fifo_empty_sdram_s1;

  //allow new arb cycle for sdram/s1, which is an e_assign
  assign sdram_s1_allow_new_arb_cycle = ~MTL_SOPC_burst_0_downstream_arbiterlock & ~cpu_data_master_arbiterlock;

  //cpu/data_master assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[0] = cpu_data_master_qualified_request_sdram_s1;

  //cpu/data_master grant sdram/s1, which is an e_assign
  assign cpu_data_master_granted_sdram_s1 = sdram_s1_grant_vector[0];

  //cpu/data_master saved-grant sdram/s1, which is an e_assign
  assign cpu_data_master_saved_grant_sdram_s1 = sdram_s1_arb_winner[0] && cpu_data_master_requests_sdram_s1;

  //MTL_SOPC_burst_0/downstream assignment into master qualified-requests vector for sdram/s1, which is an e_assign
  assign sdram_s1_master_qreq_vector[1] = MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1;

  //MTL_SOPC_burst_0/downstream grant sdram/s1, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_granted_sdram_s1 = sdram_s1_grant_vector[1];

  //MTL_SOPC_burst_0/downstream saved-grant sdram/s1, which is an e_assign
  assign MTL_SOPC_burst_0_downstream_saved_grant_sdram_s1 = sdram_s1_arb_winner[1];

  //sdram/s1 chosen-master double-vector, which is an e_assign
  assign sdram_s1_chosen_master_double_vector = {sdram_s1_master_qreq_vector, sdram_s1_master_qreq_vector} & ({~sdram_s1_master_qreq_vector, ~sdram_s1_master_qreq_vector} + sdram_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_s1_arb_winner = (sdram_s1_allow_new_arb_cycle & | sdram_s1_grant_vector) ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;

  //saved sdram_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_saved_chosen_master_vector <= 0;
      else if (sdram_s1_allow_new_arb_cycle)
          sdram_s1_saved_chosen_master_vector <= |sdram_s1_grant_vector ? sdram_s1_grant_vector : sdram_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_s1_grant_vector = {(sdram_s1_chosen_master_double_vector[1] | sdram_s1_chosen_master_double_vector[3]),
    (sdram_s1_chosen_master_double_vector[0] | sdram_s1_chosen_master_double_vector[2])};

  //sdram/s1 chosen master rotated left, which is an e_assign
  assign sdram_s1_chosen_master_rot_left = (sdram_s1_arb_winner << 1) ? (sdram_s1_arb_winner << 1) : 1;

  //sdram/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_arb_addend <= 1;
      else if (|sdram_s1_grant_vector)
          sdram_s1_arb_addend <= sdram_s1_end_xfer? sdram_s1_chosen_master_rot_left : sdram_s1_grant_vector;
    end


  //sdram_s1_reset_n assignment, which is an e_assign
  assign sdram_s1_reset_n = reset_n;

  assign sdram_s1_chipselect = MTL_SOPC_burst_0_downstream_granted_sdram_s1 | cpu_data_master_granted_sdram_s1;
  //sdram_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_firsttransfer = sdram_s1_begins_xfer ? sdram_s1_unreg_firsttransfer : sdram_s1_reg_firsttransfer;

  //sdram_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_s1_unreg_firsttransfer = ~(sdram_s1_slavearbiterlockenable & sdram_s1_any_continuerequest);

  //sdram_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_s1_begins_xfer)
          sdram_s1_reg_firsttransfer <= sdram_s1_unreg_firsttransfer;
    end


  //sdram_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_s1_beginbursttransfer_internal = sdram_s1_begins_xfer;

  //sdram_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_s1_arbitration_holdoff_internal = sdram_s1_begins_xfer & sdram_s1_firsttransfer;

  //~sdram_s1_read_n assignment, which is an e_mux
  assign sdram_s1_read_n = ~((MTL_SOPC_burst_0_downstream_granted_sdram_s1 & MTL_SOPC_burst_0_downstream_read) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_read));

  //~sdram_s1_write_n assignment, which is an e_mux
  assign sdram_s1_write_n = ~((MTL_SOPC_burst_0_downstream_granted_sdram_s1 & MTL_SOPC_burst_0_downstream_write) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_write));

  assign shifted_address_to_sdram_s1_from_MTL_SOPC_burst_0_downstream = MTL_SOPC_burst_0_downstream_address_to_slave;
  //sdram_s1_address mux, which is an e_mux
  assign sdram_s1_address = (MTL_SOPC_burst_0_downstream_granted_sdram_s1)? (shifted_address_to_sdram_s1_from_MTL_SOPC_burst_0_downstream >> 2) :
    (shifted_address_to_sdram_s1_from_cpu_data_master >> 2);

  assign shifted_address_to_sdram_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //d1_sdram_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_s1_end_xfer <= 1;
      else 
        d1_sdram_s1_end_xfer <= sdram_s1_end_xfer;
    end


  //sdram_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_s1_waits_for_read = sdram_s1_in_a_read_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_read_cycle = (MTL_SOPC_burst_0_downstream_granted_sdram_s1 & MTL_SOPC_burst_0_downstream_read) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_s1_in_a_read_cycle;

  //sdram_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_s1_waits_for_write = sdram_s1_in_a_write_cycle & sdram_s1_waitrequest_from_sa;

  //sdram_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_s1_in_a_write_cycle = (MTL_SOPC_burst_0_downstream_granted_sdram_s1 & MTL_SOPC_burst_0_downstream_write) | (cpu_data_master_granted_sdram_s1 & cpu_data_master_write);

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_s1_in_a_write_cycle;

  assign wait_for_sdram_s1_counter = 0;
  //~sdram_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_s1_byteenable_n = ~((MTL_SOPC_burst_0_downstream_granted_sdram_s1)? MTL_SOPC_burst_0_downstream_byteenable :
    (cpu_data_master_granted_sdram_s1)? cpu_data_master_byteenable :
    -1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //MTL_SOPC_burst_0/downstream non-zero arbitrationshare assertion, which is an e_process
  always @(posedge clk)
    begin
      if (MTL_SOPC_burst_0_downstream_requests_sdram_s1 && (MTL_SOPC_burst_0_downstream_arbitrationshare == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: MTL_SOPC_burst_0/downstream drove 0 on its 'arbitrationshare' port while accessing slave sdram/s1", $time);
          $stop;
        end
    end


  //MTL_SOPC_burst_0/downstream non-zero burstcount assertion, which is an e_process
  always @(posedge clk)
    begin
      if (MTL_SOPC_burst_0_downstream_requests_sdram_s1 && (MTL_SOPC_burst_0_downstream_burstcount == 0) && enable_nonzero_assertions)
        begin
          $write("%0d ns: MTL_SOPC_burst_0/downstream drove 0 on its 'burstcount' port while accessing slave sdram/s1", $time);
          $stop;
        end
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (MTL_SOPC_burst_0_downstream_granted_sdram_s1 + cpu_data_master_granted_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (MTL_SOPC_burst_0_downstream_saved_grant_sdram_s1 + cpu_data_master_saved_grant_sdram_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_avalon_slave_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_data_master_address_to_slave,
                                       cpu_data_master_byteenable,
                                       cpu_data_master_dbs_address,
                                       cpu_data_master_dbs_write_16,
                                       cpu_data_master_latency_counter,
                                       cpu_data_master_read,
                                       cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                       cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                       cpu_data_master_write,
                                       cpu_instruction_master_address_to_slave,
                                       cpu_instruction_master_dbs_address,
                                       cpu_instruction_master_latency_counter,
                                       cpu_instruction_master_read,
                                       reset_n,
                                       sram_avalon_slave_readdata,

                                      // outputs:
                                       cpu_data_master_byteenable_sram_avalon_slave,
                                       cpu_data_master_granted_sram_avalon_slave,
                                       cpu_data_master_qualified_request_sram_avalon_slave,
                                       cpu_data_master_read_data_valid_sram_avalon_slave,
                                       cpu_data_master_requests_sram_avalon_slave,
                                       cpu_instruction_master_granted_sram_avalon_slave,
                                       cpu_instruction_master_qualified_request_sram_avalon_slave,
                                       cpu_instruction_master_read_data_valid_sram_avalon_slave,
                                       cpu_instruction_master_requests_sram_avalon_slave,
                                       d1_sram_avalon_slave_end_xfer,
                                       sram_avalon_slave_address,
                                       sram_avalon_slave_byteenable_n,
                                       sram_avalon_slave_chipselect_n,
                                       sram_avalon_slave_read_n,
                                       sram_avalon_slave_readdata_from_sa,
                                       sram_avalon_slave_reset_n,
                                       sram_avalon_slave_wait_counter_eq_0,
                                       sram_avalon_slave_write_n,
                                       sram_avalon_slave_writedata
                                    )
;

  output  [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  output           cpu_data_master_granted_sram_avalon_slave;
  output           cpu_data_master_qualified_request_sram_avalon_slave;
  output           cpu_data_master_read_data_valid_sram_avalon_slave;
  output           cpu_data_master_requests_sram_avalon_slave;
  output           cpu_instruction_master_granted_sram_avalon_slave;
  output           cpu_instruction_master_qualified_request_sram_avalon_slave;
  output           cpu_instruction_master_read_data_valid_sram_avalon_slave;
  output           cpu_instruction_master_requests_sram_avalon_slave;
  output           d1_sram_avalon_slave_end_xfer;
  output  [ 19: 0] sram_avalon_slave_address;
  output  [  1: 0] sram_avalon_slave_byteenable_n;
  output           sram_avalon_slave_chipselect_n;
  output           sram_avalon_slave_read_n;
  output  [ 15: 0] sram_avalon_slave_readdata_from_sa;
  output           sram_avalon_slave_reset_n;
  output           sram_avalon_slave_wait_counter_eq_0;
  output           sram_avalon_slave_write_n;
  output  [ 15: 0] sram_avalon_slave_writedata;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [ 15: 0] cpu_data_master_dbs_write_16;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sram_avalon_slave_readdata;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave_segment_0;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave_segment_1;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_sram_avalon_slave;
  wire             cpu_data_master_qualified_request_sram_avalon_slave;
  wire             cpu_data_master_read_data_valid_sram_avalon_slave;
  wire             cpu_data_master_requests_sram_avalon_slave;
  wire             cpu_data_master_saved_grant_sram_avalon_slave;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_sram_avalon_slave;
  wire             cpu_instruction_master_qualified_request_sram_avalon_slave;
  wire             cpu_instruction_master_read_data_valid_sram_avalon_slave;
  wire             cpu_instruction_master_requests_sram_avalon_slave;
  wire             cpu_instruction_master_saved_grant_sram_avalon_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sram_avalon_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_sram_avalon_slave;
  reg              last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave;
  wire    [ 27: 0] shifted_address_to_sram_avalon_slave_from_cpu_data_master;
  wire    [ 25: 0] shifted_address_to_sram_avalon_slave_from_cpu_instruction_master;
  wire    [ 19: 0] sram_avalon_slave_address;
  wire             sram_avalon_slave_allgrants;
  wire             sram_avalon_slave_allow_new_arb_cycle;
  wire             sram_avalon_slave_any_bursting_master_saved_grant;
  wire             sram_avalon_slave_any_continuerequest;
  reg     [  1: 0] sram_avalon_slave_arb_addend;
  wire             sram_avalon_slave_arb_counter_enable;
  reg     [  2: 0] sram_avalon_slave_arb_share_counter;
  wire    [  2: 0] sram_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] sram_avalon_slave_arb_share_set_values;
  wire    [  1: 0] sram_avalon_slave_arb_winner;
  wire             sram_avalon_slave_arbitration_holdoff_internal;
  wire             sram_avalon_slave_beginbursttransfer_internal;
  wire             sram_avalon_slave_begins_xfer;
  wire    [  1: 0] sram_avalon_slave_byteenable_n;
  wire             sram_avalon_slave_chipselect_n;
  wire    [  3: 0] sram_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] sram_avalon_slave_chosen_master_rot_left;
  wire    [  2: 0] sram_avalon_slave_counter_load_value;
  wire             sram_avalon_slave_end_xfer;
  wire             sram_avalon_slave_firsttransfer;
  wire    [  1: 0] sram_avalon_slave_grant_vector;
  wire             sram_avalon_slave_in_a_read_cycle;
  wire             sram_avalon_slave_in_a_write_cycle;
  wire    [  1: 0] sram_avalon_slave_master_qreq_vector;
  wire             sram_avalon_slave_non_bursting_master_requests;
  wire             sram_avalon_slave_read_n;
  wire    [ 15: 0] sram_avalon_slave_readdata_from_sa;
  reg              sram_avalon_slave_reg_firsttransfer;
  wire             sram_avalon_slave_reset_n;
  reg     [  1: 0] sram_avalon_slave_saved_chosen_master_vector;
  reg              sram_avalon_slave_slavearbiterlockenable;
  wire             sram_avalon_slave_slavearbiterlockenable2;
  wire             sram_avalon_slave_unreg_firsttransfer;
  reg     [  2: 0] sram_avalon_slave_wait_counter;
  wire             sram_avalon_slave_wait_counter_eq_0;
  wire             sram_avalon_slave_waits_for_read;
  wire             sram_avalon_slave_waits_for_write;
  wire             sram_avalon_slave_write_n;
  wire    [ 15: 0] sram_avalon_slave_writedata;
  wire             wait_for_sram_avalon_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_avalon_slave_end_xfer;
    end


  assign sram_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_sram_avalon_slave | cpu_instruction_master_qualified_request_sram_avalon_slave));
  //assign sram_avalon_slave_readdata_from_sa = sram_avalon_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_avalon_slave_readdata_from_sa = sram_avalon_slave_readdata;

  assign cpu_data_master_requests_sram_avalon_slave = ({cpu_data_master_address_to_slave[27 : 21] , 21'b0} == 28'h400000) & (cpu_data_master_read | cpu_data_master_write);
  //sram_avalon_slave_arb_share_counter set values, which is an e_mux
  assign sram_avalon_slave_arb_share_set_values = (cpu_data_master_granted_sram_avalon_slave)? 2 :
    (cpu_instruction_master_granted_sram_avalon_slave)? 2 :
    (cpu_data_master_granted_sram_avalon_slave)? 2 :
    (cpu_instruction_master_granted_sram_avalon_slave)? 2 :
    1;

  //sram_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign sram_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_sram_avalon_slave |
    cpu_instruction_master_requests_sram_avalon_slave |
    cpu_data_master_requests_sram_avalon_slave |
    cpu_instruction_master_requests_sram_avalon_slave;

  //sram_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_avalon_slave_any_bursting_master_saved_grant = 0;

  //sram_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_avalon_slave_arb_share_counter_next_value = sram_avalon_slave_firsttransfer ? (sram_avalon_slave_arb_share_set_values - 1) : |sram_avalon_slave_arb_share_counter ? (sram_avalon_slave_arb_share_counter - 1) : 0;

  //sram_avalon_slave_allgrants all slave grants, which is an e_mux
  assign sram_avalon_slave_allgrants = (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector) |
    (|sram_avalon_slave_grant_vector);

  //sram_avalon_slave_end_xfer assignment, which is an e_assign
  assign sram_avalon_slave_end_xfer = ~(sram_avalon_slave_waits_for_read | sram_avalon_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_avalon_slave = sram_avalon_slave_end_xfer & (~sram_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_avalon_slave & sram_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_sram_avalon_slave & ~sram_avalon_slave_non_bursting_master_requests);

  //sram_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_arb_share_counter <= 0;
      else if (sram_avalon_slave_arb_counter_enable)
          sram_avalon_slave_arb_share_counter <= sram_avalon_slave_arb_share_counter_next_value;
    end


  //sram_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|sram_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sram_avalon_slave) | (end_xfer_arb_share_counter_term_sram_avalon_slave & ~sram_avalon_slave_non_bursting_master_requests))
          sram_avalon_slave_slavearbiterlockenable <= |sram_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master sram/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = sram_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //sram_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_avalon_slave_slavearbiterlockenable2 = |sram_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master sram/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = sram_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master sram/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = sram_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master sram/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = sram_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted sram/avalon_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave <= cpu_instruction_master_saved_grant_sram_avalon_slave ? 1 : (sram_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_sram_avalon_slave) ? 0 : last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_sram_avalon_slave & cpu_instruction_master_requests_sram_avalon_slave;

  //sram_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_sram_avalon_slave = cpu_data_master_requests_sram_avalon_slave & ~((cpu_data_master_read & ((cpu_data_master_latency_counter != 0) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((!cpu_data_master_byteenable_sram_avalon_slave) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //local readdatavalid cpu_data_master_read_data_valid_sram_avalon_slave, which is an e_mux
  assign cpu_data_master_read_data_valid_sram_avalon_slave = cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read & ~sram_avalon_slave_waits_for_read;

  //sram_avalon_slave_writedata mux, which is an e_mux
  assign sram_avalon_slave_writedata = cpu_data_master_dbs_write_16;

  assign cpu_instruction_master_requests_sram_avalon_slave = (({cpu_instruction_master_address_to_slave[25 : 21] , 21'b0} == 26'h400000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted sram/avalon_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_sram_avalon_slave <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_sram_avalon_slave <= cpu_data_master_saved_grant_sram_avalon_slave ? 1 : (sram_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_sram_avalon_slave) ? 0 : last_cycle_cpu_data_master_granted_slave_sram_avalon_slave;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_sram_avalon_slave & cpu_data_master_requests_sram_avalon_slave;

  assign cpu_instruction_master_qualified_request_sram_avalon_slave = cpu_instruction_master_requests_sram_avalon_slave & ~((cpu_instruction_master_read & ((cpu_instruction_master_latency_counter != 0))) | cpu_data_master_arbiterlock);
  //local readdatavalid cpu_instruction_master_read_data_valid_sram_avalon_slave, which is an e_mux
  assign cpu_instruction_master_read_data_valid_sram_avalon_slave = cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read & ~sram_avalon_slave_waits_for_read;

  //allow new arb cycle for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_sram_avalon_slave;

  //cpu/instruction_master grant sram/avalon_slave, which is an e_assign
  assign cpu_instruction_master_granted_sram_avalon_slave = sram_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant sram/avalon_slave, which is an e_assign
  assign cpu_instruction_master_saved_grant_sram_avalon_slave = sram_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_sram_avalon_slave;

  //cpu/data_master assignment into master qualified-requests vector for sram/avalon_slave, which is an e_assign
  assign sram_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_sram_avalon_slave;

  //cpu/data_master grant sram/avalon_slave, which is an e_assign
  assign cpu_data_master_granted_sram_avalon_slave = sram_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant sram/avalon_slave, which is an e_assign
  assign cpu_data_master_saved_grant_sram_avalon_slave = sram_avalon_slave_arb_winner[1] && cpu_data_master_requests_sram_avalon_slave;

  //sram/avalon_slave chosen-master double-vector, which is an e_assign
  assign sram_avalon_slave_chosen_master_double_vector = {sram_avalon_slave_master_qreq_vector, sram_avalon_slave_master_qreq_vector} & ({~sram_avalon_slave_master_qreq_vector, ~sram_avalon_slave_master_qreq_vector} + sram_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_avalon_slave_arb_winner = (sram_avalon_slave_allow_new_arb_cycle & | sram_avalon_slave_grant_vector) ? sram_avalon_slave_grant_vector : sram_avalon_slave_saved_chosen_master_vector;

  //saved sram_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_saved_chosen_master_vector <= 0;
      else if (sram_avalon_slave_allow_new_arb_cycle)
          sram_avalon_slave_saved_chosen_master_vector <= |sram_avalon_slave_grant_vector ? sram_avalon_slave_grant_vector : sram_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_avalon_slave_grant_vector = {(sram_avalon_slave_chosen_master_double_vector[1] | sram_avalon_slave_chosen_master_double_vector[3]),
    (sram_avalon_slave_chosen_master_double_vector[0] | sram_avalon_slave_chosen_master_double_vector[2])};

  //sram/avalon_slave chosen master rotated left, which is an e_assign
  assign sram_avalon_slave_chosen_master_rot_left = (sram_avalon_slave_arb_winner << 1) ? (sram_avalon_slave_arb_winner << 1) : 1;

  //sram/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_arb_addend <= 1;
      else if (|sram_avalon_slave_grant_vector)
          sram_avalon_slave_arb_addend <= sram_avalon_slave_end_xfer? sram_avalon_slave_chosen_master_rot_left : sram_avalon_slave_grant_vector;
    end


  //sram_avalon_slave_reset_n assignment, which is an e_assign
  assign sram_avalon_slave_reset_n = reset_n;

  assign sram_avalon_slave_chipselect_n = ~(cpu_data_master_granted_sram_avalon_slave | cpu_instruction_master_granted_sram_avalon_slave);
  //sram_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_slave_firsttransfer = sram_avalon_slave_begins_xfer ? sram_avalon_slave_unreg_firsttransfer : sram_avalon_slave_reg_firsttransfer;

  //sram_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_avalon_slave_unreg_firsttransfer = ~(sram_avalon_slave_slavearbiterlockenable & sram_avalon_slave_any_continuerequest);

  //sram_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (sram_avalon_slave_begins_xfer)
          sram_avalon_slave_reg_firsttransfer <= sram_avalon_slave_unreg_firsttransfer;
    end


  //sram_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_avalon_slave_beginbursttransfer_internal = sram_avalon_slave_begins_xfer;

  //sram_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_avalon_slave_arbitration_holdoff_internal = sram_avalon_slave_begins_xfer & sram_avalon_slave_firsttransfer;

  //~sram_avalon_slave_read_n assignment, which is an e_mux
  assign sram_avalon_slave_read_n = ~(((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read) | (cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read))& ~sram_avalon_slave_begins_xfer & (sram_avalon_slave_wait_counter < 3));

  //~sram_avalon_slave_write_n assignment, which is an e_mux
  assign sram_avalon_slave_write_n = ~(((cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write)) & ~sram_avalon_slave_begins_xfer & (sram_avalon_slave_wait_counter >= 2) & (sram_avalon_slave_wait_counter < 5));

  assign shifted_address_to_sram_avalon_slave_from_cpu_data_master = {cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_avalon_slave_address mux, which is an e_mux
  assign sram_avalon_slave_address = (cpu_data_master_granted_sram_avalon_slave)? (shifted_address_to_sram_avalon_slave_from_cpu_data_master >> 1) :
    (shifted_address_to_sram_avalon_slave_from_cpu_instruction_master >> 1);

  assign shifted_address_to_sram_avalon_slave_from_cpu_instruction_master = {cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sram_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_avalon_slave_end_xfer <= 1;
      else 
        d1_sram_avalon_slave_end_xfer <= sram_avalon_slave_end_xfer;
    end


  //sram_avalon_slave_waits_for_read in a cycle, which is an e_mux
  assign sram_avalon_slave_waits_for_read = sram_avalon_slave_in_a_read_cycle & wait_for_sram_avalon_slave_counter;

  //sram_avalon_slave_in_a_read_cycle assignment, which is an e_assign
  assign sram_avalon_slave_in_a_read_cycle = (cpu_data_master_granted_sram_avalon_slave & cpu_data_master_read) | (cpu_instruction_master_granted_sram_avalon_slave & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_avalon_slave_in_a_read_cycle;

  //sram_avalon_slave_waits_for_write in a cycle, which is an e_mux
  assign sram_avalon_slave_waits_for_write = sram_avalon_slave_in_a_write_cycle & wait_for_sram_avalon_slave_counter;

  //sram_avalon_slave_in_a_write_cycle assignment, which is an e_assign
  assign sram_avalon_slave_in_a_write_cycle = cpu_data_master_granted_sram_avalon_slave & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_avalon_slave_in_a_write_cycle;

  assign sram_avalon_slave_wait_counter_eq_0 = sram_avalon_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_avalon_slave_wait_counter <= 0;
      else 
        sram_avalon_slave_wait_counter <= sram_avalon_slave_counter_load_value;
    end


  assign sram_avalon_slave_counter_load_value = ((sram_avalon_slave_in_a_write_cycle & sram_avalon_slave_begins_xfer))? 5 :
    ((sram_avalon_slave_in_a_read_cycle & sram_avalon_slave_begins_xfer))? 3 :
    (~sram_avalon_slave_wait_counter_eq_0)? sram_avalon_slave_wait_counter - 1 :
    0;

  assign wait_for_sram_avalon_slave_counter = sram_avalon_slave_begins_xfer | ~sram_avalon_slave_wait_counter_eq_0;
  //~sram_avalon_slave_byteenable_n byte enable port mux, which is an e_mux
  assign sram_avalon_slave_byteenable_n = ~((cpu_data_master_granted_sram_avalon_slave)? cpu_data_master_byteenable_sram_avalon_slave :
    -1);

  assign {cpu_data_master_byteenable_sram_avalon_slave_segment_1,
cpu_data_master_byteenable_sram_avalon_slave_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_sram_avalon_slave = ((cpu_data_master_dbs_address[1] == 0))? cpu_data_master_byteenable_sram_avalon_slave_segment_0 :
    cpu_data_master_byteenable_sram_avalon_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram/avalon_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_sram_avalon_slave + cpu_instruction_master_granted_sram_avalon_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_sram_avalon_slave + cpu_instruction_master_saved_grant_sram_avalon_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sw_s1_arbitrator (
                          // inputs:
                           clk,
                           clock_crossing_io_m1_address_to_slave,
                           clock_crossing_io_m1_latency_counter,
                           clock_crossing_io_m1_nativeaddress,
                           clock_crossing_io_m1_read,
                           clock_crossing_io_m1_write,
                           reset_n,
                           sw_s1_readdata,

                          // outputs:
                           clock_crossing_io_m1_granted_sw_s1,
                           clock_crossing_io_m1_qualified_request_sw_s1,
                           clock_crossing_io_m1_read_data_valid_sw_s1,
                           clock_crossing_io_m1_requests_sw_s1,
                           d1_sw_s1_end_xfer,
                           sw_s1_address,
                           sw_s1_readdata_from_sa,
                           sw_s1_reset_n
                        )
;

  output           clock_crossing_io_m1_granted_sw_s1;
  output           clock_crossing_io_m1_qualified_request_sw_s1;
  output           clock_crossing_io_m1_read_data_valid_sw_s1;
  output           clock_crossing_io_m1_requests_sw_s1;
  output           d1_sw_s1_end_xfer;
  output  [  1: 0] sw_s1_address;
  output  [ 17: 0] sw_s1_readdata_from_sa;
  output           sw_s1_reset_n;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address_to_slave;
  input            clock_crossing_io_m1_latency_counter;
  input   [  4: 0] clock_crossing_io_m1_nativeaddress;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_write;
  input            reset_n;
  input   [ 17: 0] sw_s1_readdata;

  wire             clock_crossing_io_m1_arbiterlock;
  wire             clock_crossing_io_m1_arbiterlock2;
  wire             clock_crossing_io_m1_continuerequest;
  wire             clock_crossing_io_m1_granted_sw_s1;
  wire             clock_crossing_io_m1_qualified_request_sw_s1;
  wire             clock_crossing_io_m1_read_data_valid_sw_s1;
  wire             clock_crossing_io_m1_requests_sw_s1;
  wire             clock_crossing_io_m1_saved_grant_sw_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sw_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sw_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] sw_s1_address;
  wire             sw_s1_allgrants;
  wire             sw_s1_allow_new_arb_cycle;
  wire             sw_s1_any_bursting_master_saved_grant;
  wire             sw_s1_any_continuerequest;
  wire             sw_s1_arb_counter_enable;
  reg              sw_s1_arb_share_counter;
  wire             sw_s1_arb_share_counter_next_value;
  wire             sw_s1_arb_share_set_values;
  wire             sw_s1_beginbursttransfer_internal;
  wire             sw_s1_begins_xfer;
  wire             sw_s1_end_xfer;
  wire             sw_s1_firsttransfer;
  wire             sw_s1_grant_vector;
  wire             sw_s1_in_a_read_cycle;
  wire             sw_s1_in_a_write_cycle;
  wire             sw_s1_master_qreq_vector;
  wire             sw_s1_non_bursting_master_requests;
  wire    [ 17: 0] sw_s1_readdata_from_sa;
  reg              sw_s1_reg_firsttransfer;
  wire             sw_s1_reset_n;
  reg              sw_s1_slavearbiterlockenable;
  wire             sw_s1_slavearbiterlockenable2;
  wire             sw_s1_unreg_firsttransfer;
  wire             sw_s1_waits_for_read;
  wire             sw_s1_waits_for_write;
  wire             wait_for_sw_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sw_s1_end_xfer;
    end


  assign sw_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_io_m1_qualified_request_sw_s1));
  //assign sw_s1_readdata_from_sa = sw_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sw_s1_readdata_from_sa = sw_s1_readdata;

  assign clock_crossing_io_m1_requests_sw_s1 = (({clock_crossing_io_m1_address_to_slave[6 : 4] , 4'b0} == 7'h40) & (clock_crossing_io_m1_read | clock_crossing_io_m1_write)) & clock_crossing_io_m1_read;
  //sw_s1_arb_share_counter set values, which is an e_mux
  assign sw_s1_arb_share_set_values = 1;

  //sw_s1_non_bursting_master_requests mux, which is an e_mux
  assign sw_s1_non_bursting_master_requests = clock_crossing_io_m1_requests_sw_s1;

  //sw_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sw_s1_any_bursting_master_saved_grant = 0;

  //sw_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sw_s1_arb_share_counter_next_value = sw_s1_firsttransfer ? (sw_s1_arb_share_set_values - 1) : |sw_s1_arb_share_counter ? (sw_s1_arb_share_counter - 1) : 0;

  //sw_s1_allgrants all slave grants, which is an e_mux
  assign sw_s1_allgrants = |sw_s1_grant_vector;

  //sw_s1_end_xfer assignment, which is an e_assign
  assign sw_s1_end_xfer = ~(sw_s1_waits_for_read | sw_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sw_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sw_s1 = sw_s1_end_xfer & (~sw_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sw_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sw_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sw_s1 & sw_s1_allgrants) | (end_xfer_arb_share_counter_term_sw_s1 & ~sw_s1_non_bursting_master_requests);

  //sw_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_arb_share_counter <= 0;
      else if (sw_s1_arb_counter_enable)
          sw_s1_arb_share_counter <= sw_s1_arb_share_counter_next_value;
    end


  //sw_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_slavearbiterlockenable <= 0;
      else if ((|sw_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sw_s1) | (end_xfer_arb_share_counter_term_sw_s1 & ~sw_s1_non_bursting_master_requests))
          sw_s1_slavearbiterlockenable <= |sw_s1_arb_share_counter_next_value;
    end


  //clock_crossing_io/m1 sw/s1 arbiterlock, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock = sw_s1_slavearbiterlockenable & clock_crossing_io_m1_continuerequest;

  //sw_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sw_s1_slavearbiterlockenable2 = |sw_s1_arb_share_counter_next_value;

  //clock_crossing_io/m1 sw/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock2 = sw_s1_slavearbiterlockenable2 & clock_crossing_io_m1_continuerequest;

  //sw_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sw_s1_any_continuerequest = 1;

  //clock_crossing_io_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_io_m1_continuerequest = 1;

  assign clock_crossing_io_m1_qualified_request_sw_s1 = clock_crossing_io_m1_requests_sw_s1 & ~((clock_crossing_io_m1_read & ((clock_crossing_io_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_io_m1_read_data_valid_sw_s1, which is an e_mux
  assign clock_crossing_io_m1_read_data_valid_sw_s1 = clock_crossing_io_m1_granted_sw_s1 & clock_crossing_io_m1_read & ~sw_s1_waits_for_read;

  //master is always granted when requested
  assign clock_crossing_io_m1_granted_sw_s1 = clock_crossing_io_m1_qualified_request_sw_s1;

  //clock_crossing_io/m1 saved-grant sw/s1, which is an e_assign
  assign clock_crossing_io_m1_saved_grant_sw_s1 = clock_crossing_io_m1_requests_sw_s1;

  //allow new arb cycle for sw/s1, which is an e_assign
  assign sw_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sw_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sw_s1_master_qreq_vector = 1;

  //sw_s1_reset_n assignment, which is an e_assign
  assign sw_s1_reset_n = reset_n;

  //sw_s1_firsttransfer first transaction, which is an e_assign
  assign sw_s1_firsttransfer = sw_s1_begins_xfer ? sw_s1_unreg_firsttransfer : sw_s1_reg_firsttransfer;

  //sw_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sw_s1_unreg_firsttransfer = ~(sw_s1_slavearbiterlockenable & sw_s1_any_continuerequest);

  //sw_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sw_s1_reg_firsttransfer <= 1'b1;
      else if (sw_s1_begins_xfer)
          sw_s1_reg_firsttransfer <= sw_s1_unreg_firsttransfer;
    end


  //sw_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sw_s1_beginbursttransfer_internal = sw_s1_begins_xfer;

  //sw_s1_address mux, which is an e_mux
  assign sw_s1_address = clock_crossing_io_m1_nativeaddress;

  //d1_sw_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sw_s1_end_xfer <= 1;
      else 
        d1_sw_s1_end_xfer <= sw_s1_end_xfer;
    end


  //sw_s1_waits_for_read in a cycle, which is an e_mux
  assign sw_s1_waits_for_read = sw_s1_in_a_read_cycle & sw_s1_begins_xfer;

  //sw_s1_in_a_read_cycle assignment, which is an e_assign
  assign sw_s1_in_a_read_cycle = clock_crossing_io_m1_granted_sw_s1 & clock_crossing_io_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sw_s1_in_a_read_cycle;

  //sw_s1_waits_for_write in a cycle, which is an e_mux
  assign sw_s1_waits_for_write = sw_s1_in_a_write_cycle & 0;

  //sw_s1_in_a_write_cycle assignment, which is an e_assign
  assign sw_s1_in_a_write_cycle = clock_crossing_io_m1_granted_sw_s1 & clock_crossing_io_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sw_s1_in_a_write_cycle;

  assign wait_for_sw_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sw/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         clock_crossing_io_m1_address_to_slave,
                                         clock_crossing_io_m1_latency_counter,
                                         clock_crossing_io_m1_nativeaddress,
                                         clock_crossing_io_m1_read,
                                         clock_crossing_io_m1_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         clock_crossing_io_m1_granted_sysid_control_slave,
                                         clock_crossing_io_m1_qualified_request_sysid_control_slave,
                                         clock_crossing_io_m1_read_data_valid_sysid_control_slave,
                                         clock_crossing_io_m1_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa,
                                         sysid_control_slave_reset_n
                                      )
;

  output           clock_crossing_io_m1_granted_sysid_control_slave;
  output           clock_crossing_io_m1_qualified_request_sysid_control_slave;
  output           clock_crossing_io_m1_read_data_valid_sysid_control_slave;
  output           clock_crossing_io_m1_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  output           sysid_control_slave_reset_n;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address_to_slave;
  input            clock_crossing_io_m1_latency_counter;
  input   [  4: 0] clock_crossing_io_m1_nativeaddress;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             clock_crossing_io_m1_arbiterlock;
  wire             clock_crossing_io_m1_arbiterlock2;
  wire             clock_crossing_io_m1_continuerequest;
  wire             clock_crossing_io_m1_granted_sysid_control_slave;
  wire             clock_crossing_io_m1_qualified_request_sysid_control_slave;
  wire             clock_crossing_io_m1_read_data_valid_sysid_control_slave;
  wire             clock_crossing_io_m1_requests_sysid_control_slave;
  wire             clock_crossing_io_m1_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg              sysid_control_slave_arb_share_counter;
  wire             sysid_control_slave_arb_share_counter_next_value;
  wire             sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  wire             sysid_control_slave_reset_n;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_io_m1_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign clock_crossing_io_m1_requests_sysid_control_slave = (({clock_crossing_io_m1_address_to_slave[6 : 3] , 3'b0} == 7'h60) & (clock_crossing_io_m1_read | clock_crossing_io_m1_write)) & clock_crossing_io_m1_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = clock_crossing_io_m1_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //clock_crossing_io/m1 sysid/control_slave arbiterlock, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock = sysid_control_slave_slavearbiterlockenable & clock_crossing_io_m1_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //clock_crossing_io/m1 sysid/control_slave arbiterlock2, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & clock_crossing_io_m1_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //clock_crossing_io_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_io_m1_continuerequest = 1;

  assign clock_crossing_io_m1_qualified_request_sysid_control_slave = clock_crossing_io_m1_requests_sysid_control_slave & ~((clock_crossing_io_m1_read & ((clock_crossing_io_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_io_m1_read_data_valid_sysid_control_slave, which is an e_mux
  assign clock_crossing_io_m1_read_data_valid_sysid_control_slave = clock_crossing_io_m1_granted_sysid_control_slave & clock_crossing_io_m1_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign clock_crossing_io_m1_granted_sysid_control_slave = clock_crossing_io_m1_qualified_request_sysid_control_slave;

  //clock_crossing_io/m1 saved-grant sysid/control_slave, which is an e_assign
  assign clock_crossing_io_m1_saved_grant_sysid_control_slave = clock_crossing_io_m1_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_reset_n assignment, which is an e_assign
  assign sysid_control_slave_reset_n = reset_n;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = clock_crossing_io_m1_nativeaddress;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = clock_crossing_io_m1_granted_sysid_control_slave & clock_crossing_io_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = clock_crossing_io_m1_granted_sysid_control_slave & clock_crossing_io_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_s1_arbitrator (
                             // inputs:
                              clk,
                              clock_crossing_io_m1_address_to_slave,
                              clock_crossing_io_m1_latency_counter,
                              clock_crossing_io_m1_nativeaddress,
                              clock_crossing_io_m1_read,
                              clock_crossing_io_m1_write,
                              clock_crossing_io_m1_writedata,
                              reset_n,
                              timer_s1_irq,
                              timer_s1_readdata,

                             // outputs:
                              clock_crossing_io_m1_granted_timer_s1,
                              clock_crossing_io_m1_qualified_request_timer_s1,
                              clock_crossing_io_m1_read_data_valid_timer_s1,
                              clock_crossing_io_m1_requests_timer_s1,
                              d1_timer_s1_end_xfer,
                              timer_s1_address,
                              timer_s1_chipselect,
                              timer_s1_irq_from_sa,
                              timer_s1_readdata_from_sa,
                              timer_s1_reset_n,
                              timer_s1_write_n,
                              timer_s1_writedata
                           )
;

  output           clock_crossing_io_m1_granted_timer_s1;
  output           clock_crossing_io_m1_qualified_request_timer_s1;
  output           clock_crossing_io_m1_read_data_valid_timer_s1;
  output           clock_crossing_io_m1_requests_timer_s1;
  output           d1_timer_s1_end_xfer;
  output  [  2: 0] timer_s1_address;
  output           timer_s1_chipselect;
  output           timer_s1_irq_from_sa;
  output  [ 15: 0] timer_s1_readdata_from_sa;
  output           timer_s1_reset_n;
  output           timer_s1_write_n;
  output  [ 15: 0] timer_s1_writedata;
  input            clk;
  input   [  6: 0] clock_crossing_io_m1_address_to_slave;
  input            clock_crossing_io_m1_latency_counter;
  input   [  4: 0] clock_crossing_io_m1_nativeaddress;
  input            clock_crossing_io_m1_read;
  input            clock_crossing_io_m1_write;
  input   [ 31: 0] clock_crossing_io_m1_writedata;
  input            reset_n;
  input            timer_s1_irq;
  input   [ 15: 0] timer_s1_readdata;

  wire             clock_crossing_io_m1_arbiterlock;
  wire             clock_crossing_io_m1_arbiterlock2;
  wire             clock_crossing_io_m1_continuerequest;
  wire             clock_crossing_io_m1_granted_timer_s1;
  wire             clock_crossing_io_m1_qualified_request_timer_s1;
  wire             clock_crossing_io_m1_read_data_valid_timer_s1;
  wire             clock_crossing_io_m1_requests_timer_s1;
  wire             clock_crossing_io_m1_saved_grant_timer_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_allgrants;
  wire             timer_s1_allow_new_arb_cycle;
  wire             timer_s1_any_bursting_master_saved_grant;
  wire             timer_s1_any_continuerequest;
  wire             timer_s1_arb_counter_enable;
  reg              timer_s1_arb_share_counter;
  wire             timer_s1_arb_share_counter_next_value;
  wire             timer_s1_arb_share_set_values;
  wire             timer_s1_beginbursttransfer_internal;
  wire             timer_s1_begins_xfer;
  wire             timer_s1_chipselect;
  wire             timer_s1_end_xfer;
  wire             timer_s1_firsttransfer;
  wire             timer_s1_grant_vector;
  wire             timer_s1_in_a_read_cycle;
  wire             timer_s1_in_a_write_cycle;
  wire             timer_s1_irq_from_sa;
  wire             timer_s1_master_qreq_vector;
  wire             timer_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  reg              timer_s1_reg_firsttransfer;
  wire             timer_s1_reset_n;
  reg              timer_s1_slavearbiterlockenable;
  wire             timer_s1_slavearbiterlockenable2;
  wire             timer_s1_unreg_firsttransfer;
  wire             timer_s1_waits_for_read;
  wire             timer_s1_waits_for_write;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             wait_for_timer_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_s1_end_xfer;
    end


  assign timer_s1_begins_xfer = ~d1_reasons_to_wait & ((clock_crossing_io_m1_qualified_request_timer_s1));
  //assign timer_s1_readdata_from_sa = timer_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_readdata_from_sa = timer_s1_readdata;

  assign clock_crossing_io_m1_requests_timer_s1 = ({clock_crossing_io_m1_address_to_slave[6 : 5] , 5'b0} == 7'h0) & (clock_crossing_io_m1_read | clock_crossing_io_m1_write);
  //timer_s1_arb_share_counter set values, which is an e_mux
  assign timer_s1_arb_share_set_values = 1;

  //timer_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_s1_non_bursting_master_requests = clock_crossing_io_m1_requests_timer_s1;

  //timer_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_s1_any_bursting_master_saved_grant = 0;

  //timer_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_s1_arb_share_counter_next_value = timer_s1_firsttransfer ? (timer_s1_arb_share_set_values - 1) : |timer_s1_arb_share_counter ? (timer_s1_arb_share_counter - 1) : 0;

  //timer_s1_allgrants all slave grants, which is an e_mux
  assign timer_s1_allgrants = |timer_s1_grant_vector;

  //timer_s1_end_xfer assignment, which is an e_assign
  assign timer_s1_end_xfer = ~(timer_s1_waits_for_read | timer_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_s1 = timer_s1_end_xfer & (~timer_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_s1 & timer_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests);

  //timer_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_arb_share_counter <= 0;
      else if (timer_s1_arb_counter_enable)
          timer_s1_arb_share_counter <= timer_s1_arb_share_counter_next_value;
    end


  //timer_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_slavearbiterlockenable <= 0;
      else if ((|timer_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_s1) | (end_xfer_arb_share_counter_term_timer_s1 & ~timer_s1_non_bursting_master_requests))
          timer_s1_slavearbiterlockenable <= |timer_s1_arb_share_counter_next_value;
    end


  //clock_crossing_io/m1 timer/s1 arbiterlock, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock = timer_s1_slavearbiterlockenable & clock_crossing_io_m1_continuerequest;

  //timer_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_s1_slavearbiterlockenable2 = |timer_s1_arb_share_counter_next_value;

  //clock_crossing_io/m1 timer/s1 arbiterlock2, which is an e_assign
  assign clock_crossing_io_m1_arbiterlock2 = timer_s1_slavearbiterlockenable2 & clock_crossing_io_m1_continuerequest;

  //timer_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_s1_any_continuerequest = 1;

  //clock_crossing_io_m1_continuerequest continued request, which is an e_assign
  assign clock_crossing_io_m1_continuerequest = 1;

  assign clock_crossing_io_m1_qualified_request_timer_s1 = clock_crossing_io_m1_requests_timer_s1 & ~((clock_crossing_io_m1_read & ((clock_crossing_io_m1_latency_counter != 0))));
  //local readdatavalid clock_crossing_io_m1_read_data_valid_timer_s1, which is an e_mux
  assign clock_crossing_io_m1_read_data_valid_timer_s1 = clock_crossing_io_m1_granted_timer_s1 & clock_crossing_io_m1_read & ~timer_s1_waits_for_read;

  //timer_s1_writedata mux, which is an e_mux
  assign timer_s1_writedata = clock_crossing_io_m1_writedata;

  //master is always granted when requested
  assign clock_crossing_io_m1_granted_timer_s1 = clock_crossing_io_m1_qualified_request_timer_s1;

  //clock_crossing_io/m1 saved-grant timer/s1, which is an e_assign
  assign clock_crossing_io_m1_saved_grant_timer_s1 = clock_crossing_io_m1_requests_timer_s1;

  //allow new arb cycle for timer/s1, which is an e_assign
  assign timer_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_s1_master_qreq_vector = 1;

  //timer_s1_reset_n assignment, which is an e_assign
  assign timer_s1_reset_n = reset_n;

  assign timer_s1_chipselect = clock_crossing_io_m1_granted_timer_s1;
  //timer_s1_firsttransfer first transaction, which is an e_assign
  assign timer_s1_firsttransfer = timer_s1_begins_xfer ? timer_s1_unreg_firsttransfer : timer_s1_reg_firsttransfer;

  //timer_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_s1_unreg_firsttransfer = ~(timer_s1_slavearbiterlockenable & timer_s1_any_continuerequest);

  //timer_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_s1_reg_firsttransfer <= 1'b1;
      else if (timer_s1_begins_xfer)
          timer_s1_reg_firsttransfer <= timer_s1_unreg_firsttransfer;
    end


  //timer_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_s1_beginbursttransfer_internal = timer_s1_begins_xfer;

  //~timer_s1_write_n assignment, which is an e_mux
  assign timer_s1_write_n = ~(clock_crossing_io_m1_granted_timer_s1 & clock_crossing_io_m1_write);

  //timer_s1_address mux, which is an e_mux
  assign timer_s1_address = clock_crossing_io_m1_nativeaddress;

  //d1_timer_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_s1_end_xfer <= 1;
      else 
        d1_timer_s1_end_xfer <= timer_s1_end_xfer;
    end


  //timer_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_s1_waits_for_read = timer_s1_in_a_read_cycle & timer_s1_begins_xfer;

  //timer_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_s1_in_a_read_cycle = clock_crossing_io_m1_granted_timer_s1 & clock_crossing_io_m1_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_s1_in_a_read_cycle;

  //timer_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_s1_waits_for_write = timer_s1_in_a_write_cycle & 0;

  //timer_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_s1_in_a_write_cycle = clock_crossing_io_m1_granted_timer_s1 & clock_crossing_io_m1_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_s1_in_a_write_cycle;

  assign wait_for_timer_s1_counter = 0;
  //assign timer_s1_irq_from_sa = timer_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_s1_irq_from_sa = timer_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_flash_avalon_slave_arbitrator (
                                                        // inputs:
                                                         clk,
                                                         cpu_data_master_address_to_slave,
                                                         cpu_data_master_byteenable,
                                                         cpu_data_master_dbs_address,
                                                         cpu_data_master_dbs_write_8,
                                                         cpu_data_master_latency_counter,
                                                         cpu_data_master_read,
                                                         cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register,
                                                         cpu_data_master_read_data_valid_sdram_s1_shift_register,
                                                         cpu_data_master_write,
                                                         cpu_instruction_master_address_to_slave,
                                                         cpu_instruction_master_dbs_address,
                                                         cpu_instruction_master_latency_counter,
                                                         cpu_instruction_master_read,
                                                         reset_n,

                                                        // outputs:
                                                         address_to_the_cfi_flash,
                                                         cfi_flash_s1_wait_counter_eq_0,
                                                         cpu_data_master_byteenable_cfi_flash_s1,
                                                         cpu_data_master_granted_cfi_flash_s1,
                                                         cpu_data_master_qualified_request_cfi_flash_s1,
                                                         cpu_data_master_read_data_valid_cfi_flash_s1,
                                                         cpu_data_master_requests_cfi_flash_s1,
                                                         cpu_instruction_master_granted_cfi_flash_s1,
                                                         cpu_instruction_master_qualified_request_cfi_flash_s1,
                                                         cpu_instruction_master_read_data_valid_cfi_flash_s1,
                                                         cpu_instruction_master_requests_cfi_flash_s1,
                                                         d1_tri_state_bridge_flash_avalon_slave_end_xfer,
                                                         data_to_and_from_the_cfi_flash,
                                                         incoming_data_to_and_from_the_cfi_flash,
                                                         incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0,
                                                         read_n_to_the_cfi_flash,
                                                         select_n_to_the_cfi_flash,
                                                         write_n_to_the_cfi_flash
                                                      )
;

  output  [ 22: 0] address_to_the_cfi_flash;
  output           cfi_flash_s1_wait_counter_eq_0;
  output           cpu_data_master_byteenable_cfi_flash_s1;
  output           cpu_data_master_granted_cfi_flash_s1;
  output           cpu_data_master_qualified_request_cfi_flash_s1;
  output           cpu_data_master_read_data_valid_cfi_flash_s1;
  output           cpu_data_master_requests_cfi_flash_s1;
  output           cpu_instruction_master_granted_cfi_flash_s1;
  output           cpu_instruction_master_qualified_request_cfi_flash_s1;
  output           cpu_instruction_master_read_data_valid_cfi_flash_s1;
  output           cpu_instruction_master_requests_cfi_flash_s1;
  output           d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  inout   [  7: 0] data_to_and_from_the_cfi_flash;
  output  [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  output  [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  output           read_n_to_the_cfi_flash;
  output           select_n_to_the_cfi_flash;
  output           write_n_to_the_cfi_flash;
  input            clk;
  input   [ 27: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input   [  1: 0] cpu_data_master_dbs_address;
  input   [  7: 0] cpu_data_master_dbs_write_8;
  input   [  1: 0] cpu_data_master_latency_counter;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  input            cpu_data_master_read_data_valid_sdram_s1_shift_register;
  input            cpu_data_master_write;
  input   [ 25: 0] cpu_instruction_master_address_to_slave;
  input   [  1: 0] cpu_instruction_master_dbs_address;
  input   [  1: 0] cpu_instruction_master_latency_counter;
  input            cpu_instruction_master_read;
  input            reset_n;

  reg     [ 22: 0] address_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire    [  4: 0] cfi_flash_s1_counter_load_value;
  wire             cfi_flash_s1_in_a_read_cycle;
  wire             cfi_flash_s1_in_a_write_cycle;
  wire             cfi_flash_s1_pretend_byte_enable;
  reg     [  4: 0] cfi_flash_s1_wait_counter;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             cfi_flash_s1_waits_for_read;
  wire             cfi_flash_s1_waits_for_write;
  wire             cfi_flash_s1_with_write_latency;
  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_byteenable_cfi_flash_s1;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_0;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_1;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_2;
  wire             cpu_data_master_byteenable_cfi_flash_s1_segment_3;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_saved_grant_cfi_flash_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  reg     [  1: 0] cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_saved_grant_cfi_flash_s1;
  reg              d1_in_a_write_cycle /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_ENABLE_REGISTER=ON"  */;
  reg     [  7: 0] d1_outgoing_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              d1_reasons_to_wait;
  reg              d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  wire    [  7: 0] data_to_and_from_the_cfi_flash;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg     [  7: 0] incoming_data_to_and_from_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_INPUT_REGISTER=ON"  */;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_0_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_1_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_2_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_3_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_4_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_5_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_6_is_x;
  wire             incoming_data_to_and_from_the_cfi_flash_bit_7_is_x;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  reg              last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
  wire    [  7: 0] outgoing_data_to_and_from_the_cfi_flash;
  wire    [ 22: 0] p1_address_to_the_cfi_flash;
  wire    [  1: 0] p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
  wire    [  1: 0] p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
  wire             p1_read_n_to_the_cfi_flash;
  wire             p1_select_n_to_the_cfi_flash;
  wire             p1_write_n_to_the_cfi_flash;
  reg              read_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  reg              select_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  wire             time_to_write;
  wire             tri_state_bridge_flash_avalon_slave_allgrants;
  wire             tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle;
  wire             tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant;
  wire             tri_state_bridge_flash_avalon_slave_any_continuerequest;
  reg     [  1: 0] tri_state_bridge_flash_avalon_slave_arb_addend;
  wire             tri_state_bridge_flash_avalon_slave_arb_counter_enable;
  reg     [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_counter;
  wire    [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
  wire    [  2: 0] tri_state_bridge_flash_avalon_slave_arb_share_set_values;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_arb_winner;
  wire             tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal;
  wire             tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal;
  wire             tri_state_bridge_flash_avalon_slave_begins_xfer;
  wire    [  3: 0] tri_state_bridge_flash_avalon_slave_chosen_master_double_vector;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_chosen_master_rot_left;
  wire             tri_state_bridge_flash_avalon_slave_end_xfer;
  wire             tri_state_bridge_flash_avalon_slave_firsttransfer;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_grant_vector;
  wire    [  1: 0] tri_state_bridge_flash_avalon_slave_master_qreq_vector;
  wire             tri_state_bridge_flash_avalon_slave_non_bursting_master_requests;
  wire             tri_state_bridge_flash_avalon_slave_read_pending;
  reg              tri_state_bridge_flash_avalon_slave_reg_firsttransfer;
  reg     [  1: 0] tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;
  reg              tri_state_bridge_flash_avalon_slave_slavearbiterlockenable;
  wire             tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2;
  wire             tri_state_bridge_flash_avalon_slave_unreg_firsttransfer;
  wire             tri_state_bridge_flash_avalon_slave_write_pending;
  wire             wait_for_cfi_flash_s1_counter;
  reg              write_n_to_the_cfi_flash /* synthesis ALTERA_ATTRIBUTE = "FAST_OUTPUT_REGISTER=ON"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~tri_state_bridge_flash_avalon_slave_end_xfer;
    end


  assign tri_state_bridge_flash_avalon_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1));
  assign cpu_data_master_requests_cfi_flash_s1 = ({cpu_data_master_address_to_slave[27 : 23] , 23'b0} == 28'h2000000) & (cpu_data_master_read | cpu_data_master_write);
  //~select_n_to_the_cfi_flash of type chipselect to ~p1_select_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          select_n_to_the_cfi_flash <= ~0;
      else 
        select_n_to_the_cfi_flash <= p1_select_n_to_the_cfi_flash;
    end


  assign tri_state_bridge_flash_avalon_slave_write_pending = 0;
  //tri_state_bridge_flash/avalon_slave read pending calc, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_read_pending = 0;

  //tri_state_bridge_flash_avalon_slave_arb_share_counter set values, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_arb_share_set_values = (cpu_data_master_granted_cfi_flash_s1)? 4 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 4 :
    (cpu_data_master_granted_cfi_flash_s1)? 4 :
    (cpu_instruction_master_granted_cfi_flash_s1)? 4 :
    1;

  //tri_state_bridge_flash_avalon_slave_non_bursting_master_requests mux, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_non_bursting_master_requests = cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1 |
    cpu_data_master_requests_cfi_flash_s1 |
    cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant = 0;

  //tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value = tri_state_bridge_flash_avalon_slave_firsttransfer ? (tri_state_bridge_flash_avalon_slave_arb_share_set_values - 1) : |tri_state_bridge_flash_avalon_slave_arb_share_counter ? (tri_state_bridge_flash_avalon_slave_arb_share_counter - 1) : 0;

  //tri_state_bridge_flash_avalon_slave_allgrants all slave grants, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_allgrants = (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector) |
    (|tri_state_bridge_flash_avalon_slave_grant_vector);

  //tri_state_bridge_flash_avalon_slave_end_xfer assignment, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_end_xfer = ~(cfi_flash_s1_waits_for_read | cfi_flash_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave = tri_state_bridge_flash_avalon_slave_end_xfer & (~tri_state_bridge_flash_avalon_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //tri_state_bridge_flash_avalon_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & tri_state_bridge_flash_avalon_slave_allgrants) | (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & ~tri_state_bridge_flash_avalon_slave_non_bursting_master_requests);

  //tri_state_bridge_flash_avalon_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_arb_share_counter <= 0;
      else if (tri_state_bridge_flash_avalon_slave_arb_counter_enable)
          tri_state_bridge_flash_avalon_slave_arb_share_counter <= tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
    end


  //tri_state_bridge_flash_avalon_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_slavearbiterlockenable <= 0;
      else if ((|tri_state_bridge_flash_avalon_slave_master_qreq_vector & end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave) | (end_xfer_arb_share_counter_term_tri_state_bridge_flash_avalon_slave & ~tri_state_bridge_flash_avalon_slave_non_bursting_master_requests))
          tri_state_bridge_flash_avalon_slave_slavearbiterlockenable <= |tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;
    end


  //cpu/data_master tri_state_bridge_flash/avalon_slave arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & cpu_data_master_continuerequest;

  //tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 = |tri_state_bridge_flash_avalon_slave_arb_share_counter_next_value;

  //cpu/data_master tri_state_bridge_flash/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_flash/avalon_slave arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master tri_state_bridge_flash/avalon_slave arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = tri_state_bridge_flash_avalon_slave_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 <= cpu_instruction_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cfi_flash_s1 & cpu_instruction_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash_avalon_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign tri_state_bridge_flash_avalon_slave_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cfi_flash_s1 = cpu_data_master_requests_cfi_flash_s1 & ~((cpu_data_master_read & (tri_state_bridge_flash_avalon_slave_write_pending | (tri_state_bridge_flash_avalon_slave_read_pending) | (2 < cpu_data_master_latency_counter) | (|cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register) | (|cpu_data_master_read_data_valid_sdram_s1_shift_register))) | ((tri_state_bridge_flash_avalon_slave_read_pending | !cpu_data_master_byteenable_cfi_flash_s1) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_data_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_data_master_read_data_valid_cfi_flash_s1_shift_register, cpu_data_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_data_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_data_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_cfi_flash_s1 = cpu_data_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          incoming_data_to_and_from_the_cfi_flash <= 0;
      else 
        incoming_data_to_and_from_the_cfi_flash <= data_to_and_from_the_cfi_flash;
    end


  //cfi_flash_s1_with_write_latency assignment, which is an e_assign
  assign cfi_flash_s1_with_write_latency = in_a_write_cycle & (cpu_data_master_qualified_request_cfi_flash_s1 | cpu_instruction_master_qualified_request_cfi_flash_s1);

  //time to write the data, which is an e_mux
  assign time_to_write = (cfi_flash_s1_with_write_latency)? 1 :
    0;

  //d1_outgoing_data_to_and_from_the_cfi_flash register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_outgoing_data_to_and_from_the_cfi_flash <= 0;
      else 
        d1_outgoing_data_to_and_from_the_cfi_flash <= outgoing_data_to_and_from_the_cfi_flash;
    end


  //write cycle delayed by 1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_in_a_write_cycle <= 0;
      else 
        d1_in_a_write_cycle <= time_to_write;
    end


  //d1_outgoing_data_to_and_from_the_cfi_flash tristate driver, which is an e_assign
  assign data_to_and_from_the_cfi_flash = (d1_in_a_write_cycle)? d1_outgoing_data_to_and_from_the_cfi_flash:{8{1'bz}};

  //outgoing_data_to_and_from_the_cfi_flash mux, which is an e_mux
  assign outgoing_data_to_and_from_the_cfi_flash = cpu_data_master_dbs_write_8;

  assign cpu_instruction_master_requests_cfi_flash_s1 = (({cpu_instruction_master_address_to_slave[25 : 23] , 23'b0} == 26'h2000000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cfi_flash/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 <= cpu_data_master_saved_grant_cfi_flash_s1 ? 1 : (tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal | ~cpu_data_master_requests_cfi_flash_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_cfi_flash_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cfi_flash_s1 & cpu_data_master_requests_cfi_flash_s1;

  assign cpu_instruction_master_qualified_request_cfi_flash_s1 = cpu_instruction_master_requests_cfi_flash_s1 & ~((cpu_instruction_master_read & (tri_state_bridge_flash_avalon_slave_write_pending | (tri_state_bridge_flash_avalon_slave_read_pending) | (2 < cpu_instruction_master_latency_counter))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in = cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read & ~cfi_flash_s1_waits_for_read;

  //shift register p1 cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register = {cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register, cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_cfi_flash_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_cfi_flash_s1 = cpu_instruction_master_read_data_valid_cfi_flash_s1_shift_register[1];

  //allow new arb cycle for tri_state_bridge_flash/avalon_slave, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cfi_flash_s1;

  //cpu/instruction_master grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_granted_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_grant_vector[0];

  //cpu/instruction_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_arb_winner[0] && cpu_instruction_master_requests_cfi_flash_s1;

  //cpu/data_master assignment into master qualified-requests vector for cfi_flash/s1, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_master_qreq_vector[1] = cpu_data_master_qualified_request_cfi_flash_s1;

  //cpu/data_master grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_granted_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_grant_vector[1];

  //cpu/data_master saved-grant cfi_flash/s1, which is an e_assign
  assign cpu_data_master_saved_grant_cfi_flash_s1 = tri_state_bridge_flash_avalon_slave_arb_winner[1] && cpu_data_master_requests_cfi_flash_s1;

  //tri_state_bridge_flash/avalon_slave chosen-master double-vector, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_chosen_master_double_vector = {tri_state_bridge_flash_avalon_slave_master_qreq_vector, tri_state_bridge_flash_avalon_slave_master_qreq_vector} & ({~tri_state_bridge_flash_avalon_slave_master_qreq_vector, ~tri_state_bridge_flash_avalon_slave_master_qreq_vector} + tri_state_bridge_flash_avalon_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign tri_state_bridge_flash_avalon_slave_arb_winner = (tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle & | tri_state_bridge_flash_avalon_slave_grant_vector) ? tri_state_bridge_flash_avalon_slave_grant_vector : tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;

  //saved tri_state_bridge_flash_avalon_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector <= 0;
      else if (tri_state_bridge_flash_avalon_slave_allow_new_arb_cycle)
          tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector <= |tri_state_bridge_flash_avalon_slave_grant_vector ? tri_state_bridge_flash_avalon_slave_grant_vector : tri_state_bridge_flash_avalon_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign tri_state_bridge_flash_avalon_slave_grant_vector = {(tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[1] | tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[3]),
    (tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[0] | tri_state_bridge_flash_avalon_slave_chosen_master_double_vector[2])};

  //tri_state_bridge_flash/avalon_slave chosen master rotated left, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_chosen_master_rot_left = (tri_state_bridge_flash_avalon_slave_arb_winner << 1) ? (tri_state_bridge_flash_avalon_slave_arb_winner << 1) : 1;

  //tri_state_bridge_flash/avalon_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_arb_addend <= 1;
      else if (|tri_state_bridge_flash_avalon_slave_grant_vector)
          tri_state_bridge_flash_avalon_slave_arb_addend <= tri_state_bridge_flash_avalon_slave_end_xfer? tri_state_bridge_flash_avalon_slave_chosen_master_rot_left : tri_state_bridge_flash_avalon_slave_grant_vector;
    end


  assign p1_select_n_to_the_cfi_flash = ~(cpu_data_master_granted_cfi_flash_s1 | cpu_instruction_master_granted_cfi_flash_s1);
  //tri_state_bridge_flash_avalon_slave_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_firsttransfer = tri_state_bridge_flash_avalon_slave_begins_xfer ? tri_state_bridge_flash_avalon_slave_unreg_firsttransfer : tri_state_bridge_flash_avalon_slave_reg_firsttransfer;

  //tri_state_bridge_flash_avalon_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_unreg_firsttransfer = ~(tri_state_bridge_flash_avalon_slave_slavearbiterlockenable & tri_state_bridge_flash_avalon_slave_any_continuerequest);

  //tri_state_bridge_flash_avalon_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          tri_state_bridge_flash_avalon_slave_reg_firsttransfer <= 1'b1;
      else if (tri_state_bridge_flash_avalon_slave_begins_xfer)
          tri_state_bridge_flash_avalon_slave_reg_firsttransfer <= tri_state_bridge_flash_avalon_slave_unreg_firsttransfer;
    end


  //tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_beginbursttransfer_internal = tri_state_bridge_flash_avalon_slave_begins_xfer;

  //tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign tri_state_bridge_flash_avalon_slave_arbitration_holdoff_internal = tri_state_bridge_flash_avalon_slave_begins_xfer & tri_state_bridge_flash_avalon_slave_firsttransfer;

  //~read_n_to_the_cfi_flash of type read to ~p1_read_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          read_n_to_the_cfi_flash <= ~0;
      else 
        read_n_to_the_cfi_flash <= p1_read_n_to_the_cfi_flash;
    end


  //~p1_read_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_read_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read))& ~tri_state_bridge_flash_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter < 16));

  //~write_n_to_the_cfi_flash of type write to ~p1_write_n_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          write_n_to_the_cfi_flash <= ~0;
      else 
        write_n_to_the_cfi_flash <= p1_write_n_to_the_cfi_flash;
    end


  //~p1_write_n_to_the_cfi_flash assignment, which is an e_mux
  assign p1_write_n_to_the_cfi_flash = ~(((cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write)) & ~tri_state_bridge_flash_avalon_slave_begins_xfer & (cfi_flash_s1_wait_counter >= 6) & (cfi_flash_s1_wait_counter < 22) & cfi_flash_s1_pretend_byte_enable);

  //address_to_the_cfi_flash of type address to p1_address_to_the_cfi_flash, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          address_to_the_cfi_flash <= 0;
      else 
        address_to_the_cfi_flash <= p1_address_to_the_cfi_flash;
    end


  //p1_address_to_the_cfi_flash mux, which is an e_mux
  assign p1_address_to_the_cfi_flash = (cpu_data_master_granted_cfi_flash_s1)? ({cpu_data_master_address_to_slave >> 2,
    cpu_data_master_dbs_address[1 : 0]}) :
    ({cpu_instruction_master_address_to_slave >> 2,
    cpu_instruction_master_dbs_address[1 : 0]});

  //d1_tri_state_bridge_flash_avalon_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_tri_state_bridge_flash_avalon_slave_end_xfer <= 1;
      else 
        d1_tri_state_bridge_flash_avalon_slave_end_xfer <= tri_state_bridge_flash_avalon_slave_end_xfer;
    end


  //cfi_flash_s1_waits_for_read in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_read = cfi_flash_s1_in_a_read_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_read_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_read_cycle = (cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_cfi_flash_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cfi_flash_s1_in_a_read_cycle;

  //cfi_flash_s1_waits_for_write in a cycle, which is an e_mux
  assign cfi_flash_s1_waits_for_write = cfi_flash_s1_in_a_write_cycle & wait_for_cfi_flash_s1_counter;

  //cfi_flash_s1_in_a_write_cycle assignment, which is an e_assign
  assign cfi_flash_s1_in_a_write_cycle = cpu_data_master_granted_cfi_flash_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cfi_flash_s1_in_a_write_cycle;

  assign cfi_flash_s1_wait_counter_eq_0 = cfi_flash_s1_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cfi_flash_s1_wait_counter <= 0;
      else 
        cfi_flash_s1_wait_counter <= cfi_flash_s1_counter_load_value;
    end


  assign cfi_flash_s1_counter_load_value = ((cfi_flash_s1_in_a_read_cycle & tri_state_bridge_flash_avalon_slave_begins_xfer))? 20 :
    ((cfi_flash_s1_in_a_write_cycle & tri_state_bridge_flash_avalon_slave_begins_xfer))? 26 :
    (~cfi_flash_s1_wait_counter_eq_0)? cfi_flash_s1_wait_counter - 1 :
    0;

  assign wait_for_cfi_flash_s1_counter = tri_state_bridge_flash_avalon_slave_begins_xfer | ~cfi_flash_s1_wait_counter_eq_0;
  //cfi_flash_s1_pretend_byte_enable byte enable port mux, which is an e_mux
  assign cfi_flash_s1_pretend_byte_enable = (cpu_data_master_granted_cfi_flash_s1)? cpu_data_master_byteenable_cfi_flash_s1 :
    -1;

  assign {cpu_data_master_byteenable_cfi_flash_s1_segment_3,
cpu_data_master_byteenable_cfi_flash_s1_segment_2,
cpu_data_master_byteenable_cfi_flash_s1_segment_1,
cpu_data_master_byteenable_cfi_flash_s1_segment_0} = cpu_data_master_byteenable;
  assign cpu_data_master_byteenable_cfi_flash_s1 = ((cpu_data_master_dbs_address[1 : 0] == 0))? cpu_data_master_byteenable_cfi_flash_s1_segment_0 :
    ((cpu_data_master_dbs_address[1 : 0] == 1))? cpu_data_master_byteenable_cfi_flash_s1_segment_1 :
    ((cpu_data_master_dbs_address[1 : 0] == 2))? cpu_data_master_byteenable_cfi_flash_s1_segment_2 :
    cpu_data_master_byteenable_cfi_flash_s1_segment_3;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //incoming_data_to_and_from_the_cfi_flash_bit_0_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_0_is_x = ^(incoming_data_to_and_from_the_cfi_flash[0]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[0] = incoming_data_to_and_from_the_cfi_flash_bit_0_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[0];

  //incoming_data_to_and_from_the_cfi_flash_bit_1_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_1_is_x = ^(incoming_data_to_and_from_the_cfi_flash[1]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[1] = incoming_data_to_and_from_the_cfi_flash_bit_1_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[1];

  //incoming_data_to_and_from_the_cfi_flash_bit_2_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_2_is_x = ^(incoming_data_to_and_from_the_cfi_flash[2]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[2] = incoming_data_to_and_from_the_cfi_flash_bit_2_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[2];

  //incoming_data_to_and_from_the_cfi_flash_bit_3_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_3_is_x = ^(incoming_data_to_and_from_the_cfi_flash[3]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[3] = incoming_data_to_and_from_the_cfi_flash_bit_3_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[3];

  //incoming_data_to_and_from_the_cfi_flash_bit_4_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_4_is_x = ^(incoming_data_to_and_from_the_cfi_flash[4]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[4] = incoming_data_to_and_from_the_cfi_flash_bit_4_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[4];

  //incoming_data_to_and_from_the_cfi_flash_bit_5_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_5_is_x = ^(incoming_data_to_and_from_the_cfi_flash[5]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[5] = incoming_data_to_and_from_the_cfi_flash_bit_5_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[5];

  //incoming_data_to_and_from_the_cfi_flash_bit_6_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_6_is_x = ^(incoming_data_to_and_from_the_cfi_flash[6]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[6] = incoming_data_to_and_from_the_cfi_flash_bit_6_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[6];

  //incoming_data_to_and_from_the_cfi_flash_bit_7_is_x x check, which is an e_assign_is_x
  assign incoming_data_to_and_from_the_cfi_flash_bit_7_is_x = ^(incoming_data_to_and_from_the_cfi_flash[7]) === 1'bx;

  //Crush incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] Xs to 0, which is an e_assign
  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0[7] = incoming_data_to_and_from_the_cfi_flash_bit_7_is_x ? 1'b0 : incoming_data_to_and_from_the_cfi_flash[7];

  //cfi_flash/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cfi_flash_s1 + cpu_instruction_master_granted_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cfi_flash_s1 + cpu_instruction_master_saved_grant_cfi_flash_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  
//  assign incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0 = incoming_data_to_and_from_the_cfi_flash;
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module tri_state_bridge_flash_bridge_arbitrator 
;



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_reset_altpll_sys_domain_synch_module (
                                                       // inputs:
                                                        clk,
                                                        data_in,
                                                        reset_n,

                                                       // outputs:
                                                        data_out
                                                     )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_reset_clk_50_domain_synch_module (
                                                   // inputs:
                                                    clk,
                                                    data_in,
                                                    reset_n,

                                                   // outputs:
                                                    data_out
                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_reset_altpll_io_domain_synch_module (
                                                      // inputs:
                                                       clk,
                                                       data_in,
                                                       reset_n,

                                                      // outputs:
                                                       data_out
                                                    )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC_reset_altpll_touch_domain_synch_module (
                                                         // inputs:
                                                          clk,
                                                          data_in,
                                                          reset_n,

                                                         // outputs:
                                                          data_out
                                                       )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module MTL_SOPC (
                  // 1) global signals:
                   altpll_io,
                   altpll_sdram,
                   altpll_sys,
                   altpll_touch,
                   clk_50,
                   reset_n,

                  // the_alt_vip_itc_0
                   underflow_from_the_alt_vip_itc_0,
                   vid_clk_to_the_alt_vip_itc_0,
                   vid_data_from_the_alt_vip_itc_0,
                   vid_datavalid_from_the_alt_vip_itc_0,
                   vid_f_from_the_alt_vip_itc_0,
                   vid_h_from_the_alt_vip_itc_0,
                   vid_h_sync_from_the_alt_vip_itc_0,
                   vid_v_from_the_alt_vip_itc_0,
                   vid_v_sync_from_the_alt_vip_itc_0,

                  // the_altpll_sys
                   locked_from_the_altpll_sys,
                   phasedone_from_the_altpll_sys,

                  // the_epcs_flash_controller
                   data0_to_the_epcs_flash_controller,
                   dclk_from_the_epcs_flash_controller,
                   sce_from_the_epcs_flash_controller,
                   sdo_from_the_epcs_flash_controller,

                  // the_key
                   in_port_to_the_key,

                  // the_lcd
                   LCD_E_from_the_lcd,
                   LCD_RS_from_the_lcd,
                   LCD_RW_from_the_lcd,
                   LCD_data_to_and_from_the_lcd,

                  // the_led
                   out_port_from_the_led,

                  // the_multi_touch
                   TOUCH_I2C_SCL_from_the_multi_touch,
                   TOUCH_I2C_SDA_to_and_from_the_multi_touch,
                   TOUCH_INT_n_to_the_multi_touch,

                  // the_sdram
                   zs_addr_from_the_sdram,
                   zs_ba_from_the_sdram,
                   zs_cas_n_from_the_sdram,
                   zs_cke_from_the_sdram,
                   zs_cs_n_from_the_sdram,
                   zs_dq_to_and_from_the_sdram,
                   zs_dqm_from_the_sdram,
                   zs_ras_n_from_the_sdram,
                   zs_we_n_from_the_sdram,

                  // the_sram
                   SRAM_ADDR_from_the_sram,
                   SRAM_CE_n_from_the_sram,
                   SRAM_DQ_to_and_from_the_sram,
                   SRAM_LB_n_from_the_sram,
                   SRAM_OE_n_from_the_sram,
                   SRAM_UB_n_from_the_sram,
                   SRAM_WE_n_from_the_sram,

                  // the_sw
                   in_port_to_the_sw,

                  // the_tri_state_bridge_flash_avalon_slave
                   address_to_the_cfi_flash,
                   data_to_and_from_the_cfi_flash,
                   read_n_to_the_cfi_flash,
                   select_n_to_the_cfi_flash,
                   write_n_to_the_cfi_flash
                )
;

  output           LCD_E_from_the_lcd;
  output           LCD_RS_from_the_lcd;
  output           LCD_RW_from_the_lcd;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd;
  output  [ 19: 0] SRAM_ADDR_from_the_sram;
  output           SRAM_CE_n_from_the_sram;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  output           SRAM_LB_n_from_the_sram;
  output           SRAM_OE_n_from_the_sram;
  output           SRAM_UB_n_from_the_sram;
  output           SRAM_WE_n_from_the_sram;
  output           TOUCH_I2C_SCL_from_the_multi_touch;
  inout            TOUCH_I2C_SDA_to_and_from_the_multi_touch;
  output  [ 22: 0] address_to_the_cfi_flash;
  output           altpll_io;
  output           altpll_sdram;
  output           altpll_sys;
  output           altpll_touch;
  inout   [  7: 0] data_to_and_from_the_cfi_flash;
  output           dclk_from_the_epcs_flash_controller;
  output           locked_from_the_altpll_sys;
  output  [ 26: 0] out_port_from_the_led;
  output           phasedone_from_the_altpll_sys;
  output           read_n_to_the_cfi_flash;
  output           sce_from_the_epcs_flash_controller;
  output           sdo_from_the_epcs_flash_controller;
  output           select_n_to_the_cfi_flash;
  output           underflow_from_the_alt_vip_itc_0;
  output  [ 23: 0] vid_data_from_the_alt_vip_itc_0;
  output           vid_datavalid_from_the_alt_vip_itc_0;
  output           vid_f_from_the_alt_vip_itc_0;
  output           vid_h_from_the_alt_vip_itc_0;
  output           vid_h_sync_from_the_alt_vip_itc_0;
  output           vid_v_from_the_alt_vip_itc_0;
  output           vid_v_sync_from_the_alt_vip_itc_0;
  output           write_n_to_the_cfi_flash;
  output  [ 12: 0] zs_addr_from_the_sdram;
  output  [  1: 0] zs_ba_from_the_sdram;
  output           zs_cas_n_from_the_sdram;
  output           zs_cke_from_the_sdram;
  output           zs_cs_n_from_the_sdram;
  inout   [ 31: 0] zs_dq_to_and_from_the_sdram;
  output  [  3: 0] zs_dqm_from_the_sdram;
  output           zs_ras_n_from_the_sdram;
  output           zs_we_n_from_the_sdram;
  input            TOUCH_INT_n_to_the_multi_touch;
  input            clk_50;
  input            data0_to_the_epcs_flash_controller;
  input   [  3: 0] in_port_to_the_key;
  input   [ 17: 0] in_port_to_the_sw;
  input            reset_n;
  input            vid_clk_to_the_alt_vip_itc_0;

  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire    [ 26: 0] MTL_SOPC_burst_0_downstream_address;
  wire    [ 26: 0] MTL_SOPC_burst_0_downstream_address_to_slave;
  wire    [  5: 0] MTL_SOPC_burst_0_downstream_arbitrationshare;
  wire             MTL_SOPC_burst_0_downstream_burstcount;
  wire    [  3: 0] MTL_SOPC_burst_0_downstream_byteenable;
  wire             MTL_SOPC_burst_0_downstream_debugaccess;
  wire             MTL_SOPC_burst_0_downstream_granted_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_latency_counter;
  wire    [ 26: 0] MTL_SOPC_burst_0_downstream_nativeaddress;
  wire             MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_read;
  wire             MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register;
  wire    [ 31: 0] MTL_SOPC_burst_0_downstream_readdata;
  wire             MTL_SOPC_burst_0_downstream_readdatavalid;
  wire             MTL_SOPC_burst_0_downstream_requests_sdram_s1;
  wire             MTL_SOPC_burst_0_downstream_reset_n;
  wire             MTL_SOPC_burst_0_downstream_waitrequest;
  wire             MTL_SOPC_burst_0_downstream_write;
  wire    [ 31: 0] MTL_SOPC_burst_0_downstream_writedata;
  wire    [ 26: 0] MTL_SOPC_burst_0_upstream_address;
  wire    [  5: 0] MTL_SOPC_burst_0_upstream_burstcount;
  wire    [ 28: 0] MTL_SOPC_burst_0_upstream_byteaddress;
  wire    [  3: 0] MTL_SOPC_burst_0_upstream_byteenable;
  wire             MTL_SOPC_burst_0_upstream_debugaccess;
  wire             MTL_SOPC_burst_0_upstream_read;
  wire    [ 31: 0] MTL_SOPC_burst_0_upstream_readdata;
  wire    [ 31: 0] MTL_SOPC_burst_0_upstream_readdata_from_sa;
  wire             MTL_SOPC_burst_0_upstream_readdatavalid;
  wire             MTL_SOPC_burst_0_upstream_waitrequest;
  wire             MTL_SOPC_burst_0_upstream_waitrequest_from_sa;
  wire             MTL_SOPC_burst_0_upstream_write;
  wire    [ 31: 0] MTL_SOPC_burst_0_upstream_writedata;
  wire    [  3: 0] MTL_SOPC_clock_0_in_address;
  wire    [  3: 0] MTL_SOPC_clock_0_in_byteenable;
  wire             MTL_SOPC_clock_0_in_endofpacket;
  wire             MTL_SOPC_clock_0_in_endofpacket_from_sa;
  wire    [  1: 0] MTL_SOPC_clock_0_in_nativeaddress;
  wire             MTL_SOPC_clock_0_in_read;
  wire    [ 31: 0] MTL_SOPC_clock_0_in_readdata;
  wire    [ 31: 0] MTL_SOPC_clock_0_in_readdata_from_sa;
  wire             MTL_SOPC_clock_0_in_reset_n;
  wire             MTL_SOPC_clock_0_in_waitrequest;
  wire             MTL_SOPC_clock_0_in_waitrequest_from_sa;
  wire             MTL_SOPC_clock_0_in_write;
  wire    [ 31: 0] MTL_SOPC_clock_0_in_writedata;
  wire    [  3: 0] MTL_SOPC_clock_0_out_address;
  wire    [  3: 0] MTL_SOPC_clock_0_out_address_to_slave;
  wire    [  3: 0] MTL_SOPC_clock_0_out_byteenable;
  wire             MTL_SOPC_clock_0_out_endofpacket;
  wire             MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave;
  wire    [  1: 0] MTL_SOPC_clock_0_out_nativeaddress;
  wire             MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave;
  wire             MTL_SOPC_clock_0_out_read;
  wire             MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave;
  wire    [ 31: 0] MTL_SOPC_clock_0_out_readdata;
  wire             MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave;
  wire             MTL_SOPC_clock_0_out_reset_n;
  wire             MTL_SOPC_clock_0_out_waitrequest;
  wire             MTL_SOPC_clock_0_out_write;
  wire    [ 31: 0] MTL_SOPC_clock_0_out_writedata;
  wire    [  5: 0] MTL_SOPC_clock_1_in_address;
  wire    [  1: 0] MTL_SOPC_clock_1_in_byteenable;
  wire             MTL_SOPC_clock_1_in_endofpacket;
  wire             MTL_SOPC_clock_1_in_endofpacket_from_sa;
  wire    [  4: 0] MTL_SOPC_clock_1_in_nativeaddress;
  wire             MTL_SOPC_clock_1_in_read;
  wire    [ 15: 0] MTL_SOPC_clock_1_in_readdata;
  wire    [ 15: 0] MTL_SOPC_clock_1_in_readdata_from_sa;
  wire             MTL_SOPC_clock_1_in_reset_n;
  wire             MTL_SOPC_clock_1_in_waitrequest;
  wire             MTL_SOPC_clock_1_in_waitrequest_from_sa;
  wire             MTL_SOPC_clock_1_in_write;
  wire    [ 15: 0] MTL_SOPC_clock_1_in_writedata;
  wire    [  5: 0] MTL_SOPC_clock_1_out_address;
  wire    [  5: 0] MTL_SOPC_clock_1_out_address_to_slave;
  wire    [  1: 0] MTL_SOPC_clock_1_out_byteenable;
  wire             MTL_SOPC_clock_1_out_endofpacket;
  wire             MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave;
  wire    [  4: 0] MTL_SOPC_clock_1_out_nativeaddress;
  wire             MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave;
  wire             MTL_SOPC_clock_1_out_read;
  wire             MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave;
  wire    [ 15: 0] MTL_SOPC_clock_1_out_readdata;
  wire             MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave;
  wire             MTL_SOPC_clock_1_out_reset_n;
  wire             MTL_SOPC_clock_1_out_waitrequest;
  wire             MTL_SOPC_clock_1_out_write;
  wire    [ 15: 0] MTL_SOPC_clock_1_out_writedata;
  wire    [ 19: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_n_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_n_from_the_sram;
  wire             SRAM_OE_n_from_the_sram;
  wire             SRAM_UB_n_from_the_sram;
  wire             SRAM_WE_n_from_the_sram;
  wire             TOUCH_I2C_SCL_from_the_multi_touch;
  wire             TOUCH_I2C_SDA_to_and_from_the_multi_touch;
  wire    [ 22: 0] address_to_the_cfi_flash;
  wire    [ 23: 0] alt_vip_itc_0_din_data;
  wire             alt_vip_itc_0_din_endofpacket;
  wire             alt_vip_itc_0_din_ready;
  wire             alt_vip_itc_0_din_ready_from_sa;
  wire             alt_vip_itc_0_din_reset;
  wire             alt_vip_itc_0_din_startofpacket;
  wire             alt_vip_itc_0_din_valid;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_master_address;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_master_address_to_slave;
  wire    [  5: 0] alt_vip_vfr_0_avalon_master_burstcount;
  wire             alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_latency_counter;
  wire             alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_read;
  wire             alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_master_readdata;
  wire             alt_vip_vfr_0_avalon_master_readdatavalid;
  wire             alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream;
  wire             alt_vip_vfr_0_avalon_master_reset;
  wire             alt_vip_vfr_0_avalon_master_waitrequest;
  wire    [  4: 0] alt_vip_vfr_0_avalon_slave_address;
  wire             alt_vip_vfr_0_avalon_slave_irq;
  wire             alt_vip_vfr_0_avalon_slave_irq_from_sa;
  wire             alt_vip_vfr_0_avalon_slave_read;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_slave_readdata;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_slave_readdata_from_sa;
  wire             alt_vip_vfr_0_avalon_slave_reset;
  wire             alt_vip_vfr_0_avalon_slave_write;
  wire    [ 31: 0] alt_vip_vfr_0_avalon_slave_writedata;
  wire    [ 23: 0] alt_vip_vfr_0_avalon_streaming_source_data;
  wire             alt_vip_vfr_0_avalon_streaming_source_endofpacket;
  wire             alt_vip_vfr_0_avalon_streaming_source_ready;
  wire             alt_vip_vfr_0_avalon_streaming_source_startofpacket;
  wire             alt_vip_vfr_0_avalon_streaming_source_valid;
  wire             altpll_io;
  wire             altpll_io_reset_n;
  wire             altpll_sdram;
  wire             altpll_sys;
  wire    [  1: 0] altpll_sys_pll_slave_address;
  wire             altpll_sys_pll_slave_read;
  wire    [ 31: 0] altpll_sys_pll_slave_readdata;
  wire    [ 31: 0] altpll_sys_pll_slave_readdata_from_sa;
  wire             altpll_sys_pll_slave_reset;
  wire             altpll_sys_pll_slave_write;
  wire    [ 31: 0] altpll_sys_pll_slave_writedata;
  wire             altpll_sys_reset_n;
  wire             altpll_touch;
  wire             altpll_touch_reset_n;
  wire             cfi_flash_s1_wait_counter_eq_0;
  wire             clk_50_reset_n;
  wire    [  6: 0] clock_crossing_io_m1_address;
  wire    [  6: 0] clock_crossing_io_m1_address_to_slave;
  wire    [  3: 0] clock_crossing_io_m1_byteenable;
  wire             clock_crossing_io_m1_endofpacket;
  wire             clock_crossing_io_m1_granted_key_s1;
  wire             clock_crossing_io_m1_granted_lcd_control_slave;
  wire             clock_crossing_io_m1_granted_led_s1;
  wire             clock_crossing_io_m1_granted_sw_s1;
  wire             clock_crossing_io_m1_granted_sysid_control_slave;
  wire             clock_crossing_io_m1_granted_timer_s1;
  wire             clock_crossing_io_m1_latency_counter;
  wire    [  4: 0] clock_crossing_io_m1_nativeaddress;
  wire             clock_crossing_io_m1_qualified_request_key_s1;
  wire             clock_crossing_io_m1_qualified_request_lcd_control_slave;
  wire             clock_crossing_io_m1_qualified_request_led_s1;
  wire             clock_crossing_io_m1_qualified_request_sw_s1;
  wire             clock_crossing_io_m1_qualified_request_sysid_control_slave;
  wire             clock_crossing_io_m1_qualified_request_timer_s1;
  wire             clock_crossing_io_m1_read;
  wire             clock_crossing_io_m1_read_data_valid_key_s1;
  wire             clock_crossing_io_m1_read_data_valid_lcd_control_slave;
  wire             clock_crossing_io_m1_read_data_valid_led_s1;
  wire             clock_crossing_io_m1_read_data_valid_sw_s1;
  wire             clock_crossing_io_m1_read_data_valid_sysid_control_slave;
  wire             clock_crossing_io_m1_read_data_valid_timer_s1;
  wire    [ 31: 0] clock_crossing_io_m1_readdata;
  wire             clock_crossing_io_m1_readdatavalid;
  wire             clock_crossing_io_m1_requests_key_s1;
  wire             clock_crossing_io_m1_requests_lcd_control_slave;
  wire             clock_crossing_io_m1_requests_led_s1;
  wire             clock_crossing_io_m1_requests_sw_s1;
  wire             clock_crossing_io_m1_requests_sysid_control_slave;
  wire             clock_crossing_io_m1_requests_timer_s1;
  wire             clock_crossing_io_m1_reset_n;
  wire             clock_crossing_io_m1_waitrequest;
  wire             clock_crossing_io_m1_write;
  wire    [ 31: 0] clock_crossing_io_m1_writedata;
  wire    [  4: 0] clock_crossing_io_s1_address;
  wire    [  3: 0] clock_crossing_io_s1_byteenable;
  wire             clock_crossing_io_s1_endofpacket;
  wire             clock_crossing_io_s1_endofpacket_from_sa;
  wire    [  4: 0] clock_crossing_io_s1_nativeaddress;
  wire             clock_crossing_io_s1_read;
  wire    [ 31: 0] clock_crossing_io_s1_readdata;
  wire    [ 31: 0] clock_crossing_io_s1_readdata_from_sa;
  wire             clock_crossing_io_s1_readdatavalid;
  wire             clock_crossing_io_s1_reset_n;
  wire             clock_crossing_io_s1_waitrequest;
  wire             clock_crossing_io_s1_waitrequest_from_sa;
  wire             clock_crossing_io_s1_write;
  wire    [ 31: 0] clock_crossing_io_s1_writedata;
  wire    [ 27: 0] cpu_data_master_address;
  wire    [ 27: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_byteenable_cfi_flash_s1;
  wire    [  1: 0] cpu_data_master_byteenable_sram_avalon_slave;
  wire    [  1: 0] cpu_data_master_dbs_address;
  wire    [ 15: 0] cpu_data_master_dbs_write_16;
  wire    [  7: 0] cpu_data_master_dbs_write_8;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_granted_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_granted_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_granted_cfi_flash_s1;
  wire             cpu_data_master_granted_clock_crossing_io_s1;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_granted_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_granted_sdram_s1;
  wire             cpu_data_master_granted_sram_avalon_slave;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [  1: 0] cpu_data_master_latency_counter;
  wire             cpu_data_master_qualified_request_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_qualified_request_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_qualified_request_cfi_flash_s1;
  wire             cpu_data_master_qualified_request_clock_crossing_io_s1;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_qualified_request_sdram_s1;
  wire             cpu_data_master_qualified_request_sram_avalon_slave;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_read_data_valid_cfi_flash_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_io_s1;
  wire             cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_read_data_valid_sdram_s1;
  wire             cpu_data_master_read_data_valid_sdram_s1_shift_register;
  wire             cpu_data_master_read_data_valid_sram_avalon_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_readdatavalid;
  wire             cpu_data_master_requests_MTL_SOPC_clock_0_in;
  wire             cpu_data_master_requests_MTL_SOPC_clock_1_in;
  wire             cpu_data_master_requests_alt_vip_vfr_0_avalon_slave;
  wire             cpu_data_master_requests_cfi_flash_s1;
  wire             cpu_data_master_requests_clock_crossing_io_s1;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_epcs_flash_controller_epcs_control_port;
  wire             cpu_data_master_requests_jtag_uart_avalon_jtag_slave;
  wire             cpu_data_master_requests_sdram_s1;
  wire             cpu_data_master_requests_sram_avalon_slave;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 25: 0] cpu_instruction_master_address;
  wire    [ 25: 0] cpu_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_instruction_master_dbs_address;
  wire             cpu_instruction_master_granted_cfi_flash_s1;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_granted_sram_avalon_slave;
  wire    [  1: 0] cpu_instruction_master_latency_counter;
  wire             cpu_instruction_master_qualified_request_cfi_flash_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_qualified_request_sram_avalon_slave;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cfi_flash_s1;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_read_data_valid_sram_avalon_slave;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_readdatavalid;
  wire             cpu_instruction_master_requests_cfi_flash_s1;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port;
  wire             cpu_instruction_master_requests_sram_avalon_slave;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_MTL_SOPC_burst_0_upstream_end_xfer;
  wire             d1_MTL_SOPC_clock_0_in_end_xfer;
  wire             d1_MTL_SOPC_clock_1_in_end_xfer;
  wire             d1_alt_vip_vfr_0_avalon_slave_end_xfer;
  wire             d1_altpll_sys_pll_slave_end_xfer;
  wire             d1_clock_crossing_io_s1_end_xfer;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_epcs_flash_controller_epcs_control_port_end_xfer;
  wire             d1_jtag_uart_avalon_jtag_slave_end_xfer;
  wire             d1_key_s1_end_xfer;
  wire             d1_lcd_control_slave_end_xfer;
  wire             d1_led_s1_end_xfer;
  wire             d1_multi_touch_avalon_slave_end_xfer;
  wire             d1_sdram_s1_end_xfer;
  wire             d1_sram_avalon_slave_end_xfer;
  wire             d1_sw_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_s1_end_xfer;
  wire             d1_tri_state_bridge_flash_avalon_slave_end_xfer;
  wire    [  7: 0] data_to_and_from_the_cfi_flash;
  wire             dclk_from_the_epcs_flash_controller;
  wire    [  8: 0] epcs_flash_controller_epcs_control_port_address;
  wire             epcs_flash_controller_epcs_control_port_chipselect;
  wire             epcs_flash_controller_epcs_control_port_dataavailable;
  wire             epcs_flash_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_flash_controller_epcs_control_port_endofpacket;
  wire             epcs_flash_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_flash_controller_epcs_control_port_irq;
  wire             epcs_flash_controller_epcs_control_port_irq_from_sa;
  wire             epcs_flash_controller_epcs_control_port_read_n;
  wire    [ 31: 0] epcs_flash_controller_epcs_control_port_readdata;
  wire    [ 31: 0] epcs_flash_controller_epcs_control_port_readdata_from_sa;
  wire             epcs_flash_controller_epcs_control_port_readyfordata;
  wire             epcs_flash_controller_epcs_control_port_readyfordata_from_sa;
  wire             epcs_flash_controller_epcs_control_port_reset_n;
  wire             epcs_flash_controller_epcs_control_port_write_n;
  wire    [ 31: 0] epcs_flash_controller_epcs_control_port_writedata;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash;
  wire    [  7: 0] incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0;
  wire             jtag_uart_avalon_jtag_slave_address;
  wire             jtag_uart_avalon_jtag_slave_chipselect;
  wire             jtag_uart_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_irq;
  wire             jtag_uart_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_avalon_jtag_slave_reset_n;
  wire             jtag_uart_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_avalon_jtag_slave_writedata;
  wire    [  1: 0] key_s1_address;
  wire             key_s1_chipselect;
  wire             key_s1_irq;
  wire             key_s1_irq_from_sa;
  wire    [  3: 0] key_s1_readdata;
  wire    [  3: 0] key_s1_readdata_from_sa;
  wire             key_s1_reset_n;
  wire             key_s1_write_n;
  wire    [  3: 0] key_s1_writedata;
  wire    [  1: 0] lcd_control_slave_address;
  wire             lcd_control_slave_begintransfer;
  wire             lcd_control_slave_read;
  wire    [  7: 0] lcd_control_slave_readdata;
  wire    [  7: 0] lcd_control_slave_readdata_from_sa;
  wire             lcd_control_slave_wait_counter_eq_0;
  wire             lcd_control_slave_write;
  wire    [  7: 0] lcd_control_slave_writedata;
  wire    [  1: 0] led_s1_address;
  wire             led_s1_chipselect;
  wire    [ 26: 0] led_s1_readdata;
  wire    [ 26: 0] led_s1_readdata_from_sa;
  wire             led_s1_reset_n;
  wire             led_s1_write_n;
  wire    [ 26: 0] led_s1_writedata;
  wire             locked_from_the_altpll_sys;
  wire    [  4: 0] multi_touch_avalon_slave_address;
  wire             multi_touch_avalon_slave_chipselect;
  wire             multi_touch_avalon_slave_irq_n;
  wire             multi_touch_avalon_slave_irq_n_from_sa;
  wire             multi_touch_avalon_slave_read;
  wire    [ 15: 0] multi_touch_avalon_slave_readdata;
  wire    [ 15: 0] multi_touch_avalon_slave_readdata_from_sa;
  wire             multi_touch_avalon_slave_reset_n;
  wire             multi_touch_avalon_slave_write;
  wire    [ 15: 0] multi_touch_avalon_slave_writedata;
  wire             out_clk_altpll_sys_c0;
  wire             out_clk_altpll_sys_c1;
  wire             out_clk_altpll_sys_c2;
  wire             out_clk_altpll_sys_c3;
  wire    [ 26: 0] out_port_from_the_led;
  wire             phasedone_from_the_altpll_sys;
  wire             read_n_to_the_cfi_flash;
  wire             reset_n_sources;
  wire             sce_from_the_epcs_flash_controller;
  wire             sdo_from_the_epcs_flash_controller;
  wire    [ 24: 0] sdram_s1_address;
  wire    [  3: 0] sdram_s1_byteenable_n;
  wire             sdram_s1_chipselect;
  wire             sdram_s1_read_n;
  wire    [ 31: 0] sdram_s1_readdata;
  wire    [ 31: 0] sdram_s1_readdata_from_sa;
  wire             sdram_s1_readdatavalid;
  wire             sdram_s1_reset_n;
  wire             sdram_s1_waitrequest;
  wire             sdram_s1_waitrequest_from_sa;
  wire             sdram_s1_write_n;
  wire    [ 31: 0] sdram_s1_writedata;
  wire             select_n_to_the_cfi_flash;
  wire    [ 19: 0] sram_avalon_slave_address;
  wire    [  1: 0] sram_avalon_slave_byteenable_n;
  wire             sram_avalon_slave_chipselect_n;
  wire             sram_avalon_slave_read_n;
  wire    [ 15: 0] sram_avalon_slave_readdata;
  wire    [ 15: 0] sram_avalon_slave_readdata_from_sa;
  wire             sram_avalon_slave_reset_n;
  wire             sram_avalon_slave_wait_counter_eq_0;
  wire             sram_avalon_slave_write_n;
  wire    [ 15: 0] sram_avalon_slave_writedata;
  wire    [  1: 0] sw_s1_address;
  wire    [ 17: 0] sw_s1_readdata;
  wire    [ 17: 0] sw_s1_readdata_from_sa;
  wire             sw_s1_reset_n;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_clock;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             sysid_control_slave_reset_n;
  wire    [  2: 0] timer_s1_address;
  wire             timer_s1_chipselect;
  wire             timer_s1_irq;
  wire             timer_s1_irq_from_sa;
  wire    [ 15: 0] timer_s1_readdata;
  wire    [ 15: 0] timer_s1_readdata_from_sa;
  wire             timer_s1_reset_n;
  wire             timer_s1_write_n;
  wire    [ 15: 0] timer_s1_writedata;
  wire             underflow_from_the_alt_vip_itc_0;
  wire    [ 23: 0] vid_data_from_the_alt_vip_itc_0;
  wire             vid_datavalid_from_the_alt_vip_itc_0;
  wire             vid_f_from_the_alt_vip_itc_0;
  wire             vid_h_from_the_alt_vip_itc_0;
  wire             vid_h_sync_from_the_alt_vip_itc_0;
  wire             vid_v_from_the_alt_vip_itc_0;
  wire             vid_v_sync_from_the_alt_vip_itc_0;
  wire             write_n_to_the_cfi_flash;
  wire    [ 12: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;
  MTL_SOPC_burst_0_upstream_arbitrator the_MTL_SOPC_burst_0_upstream
    (
      .MTL_SOPC_burst_0_upstream_address                                                    (MTL_SOPC_burst_0_upstream_address),
      .MTL_SOPC_burst_0_upstream_burstcount                                                 (MTL_SOPC_burst_0_upstream_burstcount),
      .MTL_SOPC_burst_0_upstream_byteaddress                                                (MTL_SOPC_burst_0_upstream_byteaddress),
      .MTL_SOPC_burst_0_upstream_byteenable                                                 (MTL_SOPC_burst_0_upstream_byteenable),
      .MTL_SOPC_burst_0_upstream_debugaccess                                                (MTL_SOPC_burst_0_upstream_debugaccess),
      .MTL_SOPC_burst_0_upstream_read                                                       (MTL_SOPC_burst_0_upstream_read),
      .MTL_SOPC_burst_0_upstream_readdata                                                   (MTL_SOPC_burst_0_upstream_readdata),
      .MTL_SOPC_burst_0_upstream_readdata_from_sa                                           (MTL_SOPC_burst_0_upstream_readdata_from_sa),
      .MTL_SOPC_burst_0_upstream_readdatavalid                                              (MTL_SOPC_burst_0_upstream_readdatavalid),
      .MTL_SOPC_burst_0_upstream_waitrequest                                                (MTL_SOPC_burst_0_upstream_waitrequest),
      .MTL_SOPC_burst_0_upstream_waitrequest_from_sa                                        (MTL_SOPC_burst_0_upstream_waitrequest_from_sa),
      .MTL_SOPC_burst_0_upstream_write                                                      (MTL_SOPC_burst_0_upstream_write),
      .alt_vip_vfr_0_avalon_master_address_to_slave                                         (alt_vip_vfr_0_avalon_master_address_to_slave),
      .alt_vip_vfr_0_avalon_master_burstcount                                               (alt_vip_vfr_0_avalon_master_burstcount),
      .alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream                        (alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_latency_counter                                          (alt_vip_vfr_0_avalon_master_latency_counter),
      .alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream              (alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_read                                                     (alt_vip_vfr_0_avalon_master_read),
      .alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream                (alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register (alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register),
      .alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream                       (alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream),
      .clk                                                                                  (altpll_sys),
      .d1_MTL_SOPC_burst_0_upstream_end_xfer                                                (d1_MTL_SOPC_burst_0_upstream_end_xfer),
      .reset_n                                                                              (altpll_sys_reset_n)
    );

  MTL_SOPC_burst_0_downstream_arbitrator the_MTL_SOPC_burst_0_downstream
    (
      .MTL_SOPC_burst_0_downstream_address                                 (MTL_SOPC_burst_0_downstream_address),
      .MTL_SOPC_burst_0_downstream_address_to_slave                        (MTL_SOPC_burst_0_downstream_address_to_slave),
      .MTL_SOPC_burst_0_downstream_burstcount                              (MTL_SOPC_burst_0_downstream_burstcount),
      .MTL_SOPC_burst_0_downstream_byteenable                              (MTL_SOPC_burst_0_downstream_byteenable),
      .MTL_SOPC_burst_0_downstream_granted_sdram_s1                        (MTL_SOPC_burst_0_downstream_granted_sdram_s1),
      .MTL_SOPC_burst_0_downstream_latency_counter                         (MTL_SOPC_burst_0_downstream_latency_counter),
      .MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1              (MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1),
      .MTL_SOPC_burst_0_downstream_read                                    (MTL_SOPC_burst_0_downstream_read),
      .MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1                (MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1),
      .MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register (MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register),
      .MTL_SOPC_burst_0_downstream_readdata                                (MTL_SOPC_burst_0_downstream_readdata),
      .MTL_SOPC_burst_0_downstream_readdatavalid                           (MTL_SOPC_burst_0_downstream_readdatavalid),
      .MTL_SOPC_burst_0_downstream_requests_sdram_s1                       (MTL_SOPC_burst_0_downstream_requests_sdram_s1),
      .MTL_SOPC_burst_0_downstream_reset_n                                 (MTL_SOPC_burst_0_downstream_reset_n),
      .MTL_SOPC_burst_0_downstream_waitrequest                             (MTL_SOPC_burst_0_downstream_waitrequest),
      .MTL_SOPC_burst_0_downstream_write                                   (MTL_SOPC_burst_0_downstream_write),
      .MTL_SOPC_burst_0_downstream_writedata                               (MTL_SOPC_burst_0_downstream_writedata),
      .clk                                                                 (altpll_sys),
      .d1_sdram_s1_end_xfer                                                (d1_sdram_s1_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n),
      .sdram_s1_readdata_from_sa                                           (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                        (sdram_s1_waitrequest_from_sa)
    );

  MTL_SOPC_burst_0 the_MTL_SOPC_burst_0
    (
      .clk                         (altpll_sys),
      .downstream_address          (MTL_SOPC_burst_0_downstream_address),
      .downstream_arbitrationshare (MTL_SOPC_burst_0_downstream_arbitrationshare),
      .downstream_burstcount       (MTL_SOPC_burst_0_downstream_burstcount),
      .downstream_byteenable       (MTL_SOPC_burst_0_downstream_byteenable),
      .downstream_debugaccess      (MTL_SOPC_burst_0_downstream_debugaccess),
      .downstream_nativeaddress    (MTL_SOPC_burst_0_downstream_nativeaddress),
      .downstream_read             (MTL_SOPC_burst_0_downstream_read),
      .downstream_readdata         (MTL_SOPC_burst_0_downstream_readdata),
      .downstream_readdatavalid    (MTL_SOPC_burst_0_downstream_readdatavalid),
      .downstream_waitrequest      (MTL_SOPC_burst_0_downstream_waitrequest),
      .downstream_write            (MTL_SOPC_burst_0_downstream_write),
      .downstream_writedata        (MTL_SOPC_burst_0_downstream_writedata),
      .reset_n                     (MTL_SOPC_burst_0_downstream_reset_n),
      .upstream_address            (MTL_SOPC_burst_0_upstream_byteaddress),
      .upstream_burstcount         (MTL_SOPC_burst_0_upstream_burstcount),
      .upstream_byteenable         (MTL_SOPC_burst_0_upstream_byteenable),
      .upstream_debugaccess        (MTL_SOPC_burst_0_upstream_debugaccess),
      .upstream_nativeaddress      (MTL_SOPC_burst_0_upstream_address),
      .upstream_read               (MTL_SOPC_burst_0_upstream_read),
      .upstream_readdata           (MTL_SOPC_burst_0_upstream_readdata),
      .upstream_readdatavalid      (MTL_SOPC_burst_0_upstream_readdatavalid),
      .upstream_waitrequest        (MTL_SOPC_burst_0_upstream_waitrequest),
      .upstream_write              (MTL_SOPC_burst_0_upstream_write),
      .upstream_writedata          (MTL_SOPC_burst_0_upstream_writedata)
    );

  MTL_SOPC_clock_0_in_arbitrator the_MTL_SOPC_clock_0_in
    (
      .MTL_SOPC_clock_0_in_address                                         (MTL_SOPC_clock_0_in_address),
      .MTL_SOPC_clock_0_in_byteenable                                      (MTL_SOPC_clock_0_in_byteenable),
      .MTL_SOPC_clock_0_in_endofpacket                                     (MTL_SOPC_clock_0_in_endofpacket),
      .MTL_SOPC_clock_0_in_endofpacket_from_sa                             (MTL_SOPC_clock_0_in_endofpacket_from_sa),
      .MTL_SOPC_clock_0_in_nativeaddress                                   (MTL_SOPC_clock_0_in_nativeaddress),
      .MTL_SOPC_clock_0_in_read                                            (MTL_SOPC_clock_0_in_read),
      .MTL_SOPC_clock_0_in_readdata                                        (MTL_SOPC_clock_0_in_readdata),
      .MTL_SOPC_clock_0_in_readdata_from_sa                                (MTL_SOPC_clock_0_in_readdata_from_sa),
      .MTL_SOPC_clock_0_in_reset_n                                         (MTL_SOPC_clock_0_in_reset_n),
      .MTL_SOPC_clock_0_in_waitrequest                                     (MTL_SOPC_clock_0_in_waitrequest),
      .MTL_SOPC_clock_0_in_waitrequest_from_sa                             (MTL_SOPC_clock_0_in_waitrequest_from_sa),
      .MTL_SOPC_clock_0_in_write                                           (MTL_SOPC_clock_0_in_write),
      .MTL_SOPC_clock_0_in_writedata                                       (MTL_SOPC_clock_0_in_writedata),
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_MTL_SOPC_clock_0_in                         (cpu_data_master_granted_MTL_SOPC_clock_0_in),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_MTL_SOPC_clock_0_in               (cpu_data_master_qualified_request_MTL_SOPC_clock_0_in),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in                 (cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_MTL_SOPC_clock_0_in                        (cpu_data_master_requests_MTL_SOPC_clock_0_in),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_MTL_SOPC_clock_0_in_end_xfer                                     (d1_MTL_SOPC_clock_0_in_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n)
    );

  MTL_SOPC_clock_0_out_arbitrator the_MTL_SOPC_clock_0_out
    (
      .MTL_SOPC_clock_0_out_address                                (MTL_SOPC_clock_0_out_address),
      .MTL_SOPC_clock_0_out_address_to_slave                       (MTL_SOPC_clock_0_out_address_to_slave),
      .MTL_SOPC_clock_0_out_byteenable                             (MTL_SOPC_clock_0_out_byteenable),
      .MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave           (MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave (MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_read                                   (MTL_SOPC_clock_0_out_read),
      .MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave   (MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_readdata                               (MTL_SOPC_clock_0_out_readdata),
      .MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave          (MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_reset_n                                (MTL_SOPC_clock_0_out_reset_n),
      .MTL_SOPC_clock_0_out_waitrequest                            (MTL_SOPC_clock_0_out_waitrequest),
      .MTL_SOPC_clock_0_out_write                                  (MTL_SOPC_clock_0_out_write),
      .MTL_SOPC_clock_0_out_writedata                              (MTL_SOPC_clock_0_out_writedata),
      .altpll_sys_pll_slave_readdata_from_sa                       (altpll_sys_pll_slave_readdata_from_sa),
      .clk                                                         (clk_50),
      .d1_altpll_sys_pll_slave_end_xfer                            (d1_altpll_sys_pll_slave_end_xfer),
      .reset_n                                                     (clk_50_reset_n)
    );

  MTL_SOPC_clock_0 the_MTL_SOPC_clock_0
    (
      .master_address       (MTL_SOPC_clock_0_out_address),
      .master_byteenable    (MTL_SOPC_clock_0_out_byteenable),
      .master_clk           (clk_50),
      .master_endofpacket   (MTL_SOPC_clock_0_out_endofpacket),
      .master_nativeaddress (MTL_SOPC_clock_0_out_nativeaddress),
      .master_read          (MTL_SOPC_clock_0_out_read),
      .master_readdata      (MTL_SOPC_clock_0_out_readdata),
      .master_reset_n       (MTL_SOPC_clock_0_out_reset_n),
      .master_waitrequest   (MTL_SOPC_clock_0_out_waitrequest),
      .master_write         (MTL_SOPC_clock_0_out_write),
      .master_writedata     (MTL_SOPC_clock_0_out_writedata),
      .slave_address        (MTL_SOPC_clock_0_in_address),
      .slave_byteenable     (MTL_SOPC_clock_0_in_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (MTL_SOPC_clock_0_in_endofpacket),
      .slave_nativeaddress  (MTL_SOPC_clock_0_in_nativeaddress),
      .slave_read           (MTL_SOPC_clock_0_in_read),
      .slave_readdata       (MTL_SOPC_clock_0_in_readdata),
      .slave_reset_n        (MTL_SOPC_clock_0_in_reset_n),
      .slave_waitrequest    (MTL_SOPC_clock_0_in_waitrequest),
      .slave_write          (MTL_SOPC_clock_0_in_write),
      .slave_writedata      (MTL_SOPC_clock_0_in_writedata)
    );

  MTL_SOPC_clock_1_in_arbitrator the_MTL_SOPC_clock_1_in
    (
      .MTL_SOPC_clock_1_in_address                                         (MTL_SOPC_clock_1_in_address),
      .MTL_SOPC_clock_1_in_byteenable                                      (MTL_SOPC_clock_1_in_byteenable),
      .MTL_SOPC_clock_1_in_endofpacket                                     (MTL_SOPC_clock_1_in_endofpacket),
      .MTL_SOPC_clock_1_in_endofpacket_from_sa                             (MTL_SOPC_clock_1_in_endofpacket_from_sa),
      .MTL_SOPC_clock_1_in_nativeaddress                                   (MTL_SOPC_clock_1_in_nativeaddress),
      .MTL_SOPC_clock_1_in_read                                            (MTL_SOPC_clock_1_in_read),
      .MTL_SOPC_clock_1_in_readdata                                        (MTL_SOPC_clock_1_in_readdata),
      .MTL_SOPC_clock_1_in_readdata_from_sa                                (MTL_SOPC_clock_1_in_readdata_from_sa),
      .MTL_SOPC_clock_1_in_reset_n                                         (MTL_SOPC_clock_1_in_reset_n),
      .MTL_SOPC_clock_1_in_waitrequest                                     (MTL_SOPC_clock_1_in_waitrequest),
      .MTL_SOPC_clock_1_in_waitrequest_from_sa                             (MTL_SOPC_clock_1_in_waitrequest_from_sa),
      .MTL_SOPC_clock_1_in_write                                           (MTL_SOPC_clock_1_in_write),
      .MTL_SOPC_clock_1_in_writedata                                       (MTL_SOPC_clock_1_in_writedata),
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_MTL_SOPC_clock_1_in                         (cpu_data_master_granted_MTL_SOPC_clock_1_in),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_MTL_SOPC_clock_1_in               (cpu_data_master_qualified_request_MTL_SOPC_clock_1_in),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in                 (cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_MTL_SOPC_clock_1_in                        (cpu_data_master_requests_MTL_SOPC_clock_1_in),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_MTL_SOPC_clock_1_in_end_xfer                                     (d1_MTL_SOPC_clock_1_in_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n)
    );

  MTL_SOPC_clock_1_out_arbitrator the_MTL_SOPC_clock_1_out
    (
      .MTL_SOPC_clock_1_out_address                                    (MTL_SOPC_clock_1_out_address),
      .MTL_SOPC_clock_1_out_address_to_slave                           (MTL_SOPC_clock_1_out_address_to_slave),
      .MTL_SOPC_clock_1_out_byteenable                                 (MTL_SOPC_clock_1_out_byteenable),
      .MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave           (MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave (MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_read                                       (MTL_SOPC_clock_1_out_read),
      .MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave   (MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_readdata                                   (MTL_SOPC_clock_1_out_readdata),
      .MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave          (MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_reset_n                                    (MTL_SOPC_clock_1_out_reset_n),
      .MTL_SOPC_clock_1_out_waitrequest                                (MTL_SOPC_clock_1_out_waitrequest),
      .MTL_SOPC_clock_1_out_write                                      (MTL_SOPC_clock_1_out_write),
      .MTL_SOPC_clock_1_out_writedata                                  (MTL_SOPC_clock_1_out_writedata),
      .clk                                                             (altpll_touch),
      .d1_multi_touch_avalon_slave_end_xfer                            (d1_multi_touch_avalon_slave_end_xfer),
      .multi_touch_avalon_slave_readdata_from_sa                       (multi_touch_avalon_slave_readdata_from_sa),
      .reset_n                                                         (altpll_touch_reset_n)
    );

  MTL_SOPC_clock_1 the_MTL_SOPC_clock_1
    (
      .master_address       (MTL_SOPC_clock_1_out_address),
      .master_byteenable    (MTL_SOPC_clock_1_out_byteenable),
      .master_clk           (altpll_touch),
      .master_endofpacket   (MTL_SOPC_clock_1_out_endofpacket),
      .master_nativeaddress (MTL_SOPC_clock_1_out_nativeaddress),
      .master_read          (MTL_SOPC_clock_1_out_read),
      .master_readdata      (MTL_SOPC_clock_1_out_readdata),
      .master_reset_n       (MTL_SOPC_clock_1_out_reset_n),
      .master_waitrequest   (MTL_SOPC_clock_1_out_waitrequest),
      .master_write         (MTL_SOPC_clock_1_out_write),
      .master_writedata     (MTL_SOPC_clock_1_out_writedata),
      .slave_address        (MTL_SOPC_clock_1_in_address),
      .slave_byteenable     (MTL_SOPC_clock_1_in_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (MTL_SOPC_clock_1_in_endofpacket),
      .slave_nativeaddress  (MTL_SOPC_clock_1_in_nativeaddress),
      .slave_read           (MTL_SOPC_clock_1_in_read),
      .slave_readdata       (MTL_SOPC_clock_1_in_readdata),
      .slave_reset_n        (MTL_SOPC_clock_1_in_reset_n),
      .slave_waitrequest    (MTL_SOPC_clock_1_in_waitrequest),
      .slave_write          (MTL_SOPC_clock_1_in_write),
      .slave_writedata      (MTL_SOPC_clock_1_in_writedata)
    );

  alt_vip_itc_0_din_arbitrator the_alt_vip_itc_0_din
    (
      .alt_vip_itc_0_din_data                              (alt_vip_itc_0_din_data),
      .alt_vip_itc_0_din_endofpacket                       (alt_vip_itc_0_din_endofpacket),
      .alt_vip_itc_0_din_ready                             (alt_vip_itc_0_din_ready),
      .alt_vip_itc_0_din_ready_from_sa                     (alt_vip_itc_0_din_ready_from_sa),
      .alt_vip_itc_0_din_reset                             (alt_vip_itc_0_din_reset),
      .alt_vip_itc_0_din_startofpacket                     (alt_vip_itc_0_din_startofpacket),
      .alt_vip_itc_0_din_valid                             (alt_vip_itc_0_din_valid),
      .alt_vip_vfr_0_avalon_streaming_source_data          (alt_vip_vfr_0_avalon_streaming_source_data),
      .alt_vip_vfr_0_avalon_streaming_source_endofpacket   (alt_vip_vfr_0_avalon_streaming_source_endofpacket),
      .alt_vip_vfr_0_avalon_streaming_source_startofpacket (alt_vip_vfr_0_avalon_streaming_source_startofpacket),
      .alt_vip_vfr_0_avalon_streaming_source_valid         (alt_vip_vfr_0_avalon_streaming_source_valid),
      .clk                                                 (altpll_sys),
      .reset_n                                             (altpll_sys_reset_n)
    );

  alt_vip_itc_0 the_alt_vip_itc_0
    (
      .is_clk        (altpll_sys),
      .is_data       (alt_vip_itc_0_din_data),
      .is_eop        (alt_vip_itc_0_din_endofpacket),
      .is_ready      (alt_vip_itc_0_din_ready),
      .is_sop        (alt_vip_itc_0_din_startofpacket),
      .is_valid      (alt_vip_itc_0_din_valid),
      .rst           (alt_vip_itc_0_din_reset),
      .underflow     (underflow_from_the_alt_vip_itc_0),
      .vid_clk       (vid_clk_to_the_alt_vip_itc_0),
      .vid_data      (vid_data_from_the_alt_vip_itc_0),
      .vid_datavalid (vid_datavalid_from_the_alt_vip_itc_0),
      .vid_f         (vid_f_from_the_alt_vip_itc_0),
      .vid_h         (vid_h_from_the_alt_vip_itc_0),
      .vid_h_sync    (vid_h_sync_from_the_alt_vip_itc_0),
      .vid_v         (vid_v_from_the_alt_vip_itc_0),
      .vid_v_sync    (vid_v_sync_from_the_alt_vip_itc_0)
    );

  alt_vip_vfr_0_avalon_slave_arbitrator the_alt_vip_vfr_0_avalon_slave
    (
      .alt_vip_vfr_0_avalon_slave_address                                  (alt_vip_vfr_0_avalon_slave_address),
      .alt_vip_vfr_0_avalon_slave_irq                                      (alt_vip_vfr_0_avalon_slave_irq),
      .alt_vip_vfr_0_avalon_slave_irq_from_sa                              (alt_vip_vfr_0_avalon_slave_irq_from_sa),
      .alt_vip_vfr_0_avalon_slave_read                                     (alt_vip_vfr_0_avalon_slave_read),
      .alt_vip_vfr_0_avalon_slave_readdata                                 (alt_vip_vfr_0_avalon_slave_readdata),
      .alt_vip_vfr_0_avalon_slave_readdata_from_sa                         (alt_vip_vfr_0_avalon_slave_readdata_from_sa),
      .alt_vip_vfr_0_avalon_slave_reset                                    (alt_vip_vfr_0_avalon_slave_reset),
      .alt_vip_vfr_0_avalon_slave_write                                    (alt_vip_vfr_0_avalon_slave_write),
      .alt_vip_vfr_0_avalon_slave_writedata                                (alt_vip_vfr_0_avalon_slave_writedata),
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_alt_vip_vfr_0_avalon_slave                  (cpu_data_master_granted_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave        (cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave          (cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_alt_vip_vfr_0_avalon_slave                 (cpu_data_master_requests_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_alt_vip_vfr_0_avalon_slave_end_xfer                              (d1_alt_vip_vfr_0_avalon_slave_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n)
    );

  alt_vip_vfr_0_avalon_master_arbitrator the_alt_vip_vfr_0_avalon_master
    (
      .MTL_SOPC_burst_0_upstream_readdata_from_sa                                           (MTL_SOPC_burst_0_upstream_readdata_from_sa),
      .MTL_SOPC_burst_0_upstream_waitrequest_from_sa                                        (MTL_SOPC_burst_0_upstream_waitrequest_from_sa),
      .alt_vip_vfr_0_avalon_master_address                                                  (alt_vip_vfr_0_avalon_master_address),
      .alt_vip_vfr_0_avalon_master_address_to_slave                                         (alt_vip_vfr_0_avalon_master_address_to_slave),
      .alt_vip_vfr_0_avalon_master_burstcount                                               (alt_vip_vfr_0_avalon_master_burstcount),
      .alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream                        (alt_vip_vfr_0_avalon_master_granted_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_latency_counter                                          (alt_vip_vfr_0_avalon_master_latency_counter),
      .alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream              (alt_vip_vfr_0_avalon_master_qualified_request_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_read                                                     (alt_vip_vfr_0_avalon_master_read),
      .alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream                (alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register (alt_vip_vfr_0_avalon_master_read_data_valid_MTL_SOPC_burst_0_upstream_shift_register),
      .alt_vip_vfr_0_avalon_master_readdata                                                 (alt_vip_vfr_0_avalon_master_readdata),
      .alt_vip_vfr_0_avalon_master_readdatavalid                                            (alt_vip_vfr_0_avalon_master_readdatavalid),
      .alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream                       (alt_vip_vfr_0_avalon_master_requests_MTL_SOPC_burst_0_upstream),
      .alt_vip_vfr_0_avalon_master_reset                                                    (alt_vip_vfr_0_avalon_master_reset),
      .alt_vip_vfr_0_avalon_master_waitrequest                                              (alt_vip_vfr_0_avalon_master_waitrequest),
      .clk                                                                                  (altpll_sys),
      .d1_MTL_SOPC_burst_0_upstream_end_xfer                                                (d1_MTL_SOPC_burst_0_upstream_end_xfer),
      .reset_n                                                                              (altpll_sys_reset_n)
    );

  alt_vip_vfr_0_avalon_streaming_source_arbitrator the_alt_vip_vfr_0_avalon_streaming_source
    (
      .alt_vip_itc_0_din_ready_from_sa                     (alt_vip_itc_0_din_ready_from_sa),
      .alt_vip_vfr_0_avalon_streaming_source_data          (alt_vip_vfr_0_avalon_streaming_source_data),
      .alt_vip_vfr_0_avalon_streaming_source_endofpacket   (alt_vip_vfr_0_avalon_streaming_source_endofpacket),
      .alt_vip_vfr_0_avalon_streaming_source_ready         (alt_vip_vfr_0_avalon_streaming_source_ready),
      .alt_vip_vfr_0_avalon_streaming_source_startofpacket (alt_vip_vfr_0_avalon_streaming_source_startofpacket),
      .alt_vip_vfr_0_avalon_streaming_source_valid         (alt_vip_vfr_0_avalon_streaming_source_valid),
      .clk                                                 (altpll_sys),
      .reset_n                                             (altpll_sys_reset_n)
    );

  alt_vip_vfr_0 the_alt_vip_vfr_0
    (
      .clock                (altpll_sys),
      .dout_data            (alt_vip_vfr_0_avalon_streaming_source_data),
      .dout_endofpacket     (alt_vip_vfr_0_avalon_streaming_source_endofpacket),
      .dout_ready           (alt_vip_vfr_0_avalon_streaming_source_ready),
      .dout_startofpacket   (alt_vip_vfr_0_avalon_streaming_source_startofpacket),
      .dout_valid           (alt_vip_vfr_0_avalon_streaming_source_valid),
      .master_address       (alt_vip_vfr_0_avalon_master_address),
      .master_burstcount    (alt_vip_vfr_0_avalon_master_burstcount),
      .master_clock         (altpll_sys),
      .master_read          (alt_vip_vfr_0_avalon_master_read),
      .master_readdata      (alt_vip_vfr_0_avalon_master_readdata),
      .master_readdatavalid (alt_vip_vfr_0_avalon_master_readdatavalid),
      .master_reset         (alt_vip_vfr_0_avalon_master_reset),
      .master_waitrequest   (alt_vip_vfr_0_avalon_master_waitrequest),
      .reset                (alt_vip_vfr_0_avalon_slave_reset),
      .slave_address        (alt_vip_vfr_0_avalon_slave_address),
      .slave_irq            (alt_vip_vfr_0_avalon_slave_irq),
      .slave_read           (alt_vip_vfr_0_avalon_slave_read),
      .slave_readdata       (alt_vip_vfr_0_avalon_slave_readdata),
      .slave_write          (alt_vip_vfr_0_avalon_slave_write),
      .slave_writedata      (alt_vip_vfr_0_avalon_slave_writedata)
    );

  altpll_sys_pll_slave_arbitrator the_altpll_sys_pll_slave
    (
      .MTL_SOPC_clock_0_out_address_to_slave                       (MTL_SOPC_clock_0_out_address_to_slave),
      .MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave           (MTL_SOPC_clock_0_out_granted_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave (MTL_SOPC_clock_0_out_qualified_request_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_read                                   (MTL_SOPC_clock_0_out_read),
      .MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave   (MTL_SOPC_clock_0_out_read_data_valid_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave          (MTL_SOPC_clock_0_out_requests_altpll_sys_pll_slave),
      .MTL_SOPC_clock_0_out_write                                  (MTL_SOPC_clock_0_out_write),
      .MTL_SOPC_clock_0_out_writedata                              (MTL_SOPC_clock_0_out_writedata),
      .altpll_sys_pll_slave_address                                (altpll_sys_pll_slave_address),
      .altpll_sys_pll_slave_read                                   (altpll_sys_pll_slave_read),
      .altpll_sys_pll_slave_readdata                               (altpll_sys_pll_slave_readdata),
      .altpll_sys_pll_slave_readdata_from_sa                       (altpll_sys_pll_slave_readdata_from_sa),
      .altpll_sys_pll_slave_reset                                  (altpll_sys_pll_slave_reset),
      .altpll_sys_pll_slave_write                                  (altpll_sys_pll_slave_write),
      .altpll_sys_pll_slave_writedata                              (altpll_sys_pll_slave_writedata),
      .clk                                                         (clk_50),
      .d1_altpll_sys_pll_slave_end_xfer                            (d1_altpll_sys_pll_slave_end_xfer),
      .reset_n                                                     (clk_50_reset_n)
    );

  //altpll_sys out_clk assignment, which is an e_assign
  assign altpll_sys = out_clk_altpll_sys_c0;

  //altpll_sdram out_clk assignment, which is an e_assign
  assign altpll_sdram = out_clk_altpll_sys_c1;

  //altpll_io out_clk assignment, which is an e_assign
  assign altpll_io = out_clk_altpll_sys_c2;

  //altpll_touch out_clk assignment, which is an e_assign
  assign altpll_touch = out_clk_altpll_sys_c3;

  altpll_sys the_altpll_sys
    (
      .address   (altpll_sys_pll_slave_address),
      .c0        (out_clk_altpll_sys_c0),
      .c1        (out_clk_altpll_sys_c1),
      .c2        (out_clk_altpll_sys_c2),
      .c3        (out_clk_altpll_sys_c3),
      .clk       (clk_50),
      .locked    (locked_from_the_altpll_sys),
      .phasedone (phasedone_from_the_altpll_sys),
      .read      (altpll_sys_pll_slave_read),
      .readdata  (altpll_sys_pll_slave_readdata),
      .reset     (altpll_sys_pll_slave_reset),
      .write     (altpll_sys_pll_slave_write),
      .writedata (altpll_sys_pll_slave_writedata)
    );

  clock_crossing_io_s1_arbitrator the_clock_crossing_io_s1
    (
      .clk                                                                 (altpll_sys),
      .clock_crossing_io_s1_address                                        (clock_crossing_io_s1_address),
      .clock_crossing_io_s1_byteenable                                     (clock_crossing_io_s1_byteenable),
      .clock_crossing_io_s1_endofpacket                                    (clock_crossing_io_s1_endofpacket),
      .clock_crossing_io_s1_endofpacket_from_sa                            (clock_crossing_io_s1_endofpacket_from_sa),
      .clock_crossing_io_s1_nativeaddress                                  (clock_crossing_io_s1_nativeaddress),
      .clock_crossing_io_s1_read                                           (clock_crossing_io_s1_read),
      .clock_crossing_io_s1_readdata                                       (clock_crossing_io_s1_readdata),
      .clock_crossing_io_s1_readdata_from_sa                               (clock_crossing_io_s1_readdata_from_sa),
      .clock_crossing_io_s1_readdatavalid                                  (clock_crossing_io_s1_readdatavalid),
      .clock_crossing_io_s1_reset_n                                        (clock_crossing_io_s1_reset_n),
      .clock_crossing_io_s1_waitrequest                                    (clock_crossing_io_s1_waitrequest),
      .clock_crossing_io_s1_waitrequest_from_sa                            (clock_crossing_io_s1_waitrequest_from_sa),
      .clock_crossing_io_s1_write                                          (clock_crossing_io_s1_write),
      .clock_crossing_io_s1_writedata                                      (clock_crossing_io_s1_writedata),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_clock_crossing_io_s1                        (cpu_data_master_granted_clock_crossing_io_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_clock_crossing_io_s1              (cpu_data_master_qualified_request_clock_crossing_io_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1                (cpu_data_master_read_data_valid_clock_crossing_io_s1),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_clock_crossing_io_s1                       (cpu_data_master_requests_clock_crossing_io_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_clock_crossing_io_s1_end_xfer                                    (d1_clock_crossing_io_s1_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n)
    );

  clock_crossing_io_m1_arbitrator the_clock_crossing_io_m1
    (
      .clk                                                        (altpll_io),
      .clock_crossing_io_m1_address                               (clock_crossing_io_m1_address),
      .clock_crossing_io_m1_address_to_slave                      (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_byteenable                            (clock_crossing_io_m1_byteenable),
      .clock_crossing_io_m1_granted_key_s1                        (clock_crossing_io_m1_granted_key_s1),
      .clock_crossing_io_m1_granted_lcd_control_slave             (clock_crossing_io_m1_granted_lcd_control_slave),
      .clock_crossing_io_m1_granted_led_s1                        (clock_crossing_io_m1_granted_led_s1),
      .clock_crossing_io_m1_granted_sw_s1                         (clock_crossing_io_m1_granted_sw_s1),
      .clock_crossing_io_m1_granted_sysid_control_slave           (clock_crossing_io_m1_granted_sysid_control_slave),
      .clock_crossing_io_m1_granted_timer_s1                      (clock_crossing_io_m1_granted_timer_s1),
      .clock_crossing_io_m1_latency_counter                       (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_qualified_request_key_s1              (clock_crossing_io_m1_qualified_request_key_s1),
      .clock_crossing_io_m1_qualified_request_lcd_control_slave   (clock_crossing_io_m1_qualified_request_lcd_control_slave),
      .clock_crossing_io_m1_qualified_request_led_s1              (clock_crossing_io_m1_qualified_request_led_s1),
      .clock_crossing_io_m1_qualified_request_sw_s1               (clock_crossing_io_m1_qualified_request_sw_s1),
      .clock_crossing_io_m1_qualified_request_sysid_control_slave (clock_crossing_io_m1_qualified_request_sysid_control_slave),
      .clock_crossing_io_m1_qualified_request_timer_s1            (clock_crossing_io_m1_qualified_request_timer_s1),
      .clock_crossing_io_m1_read                                  (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_key_s1                (clock_crossing_io_m1_read_data_valid_key_s1),
      .clock_crossing_io_m1_read_data_valid_lcd_control_slave     (clock_crossing_io_m1_read_data_valid_lcd_control_slave),
      .clock_crossing_io_m1_read_data_valid_led_s1                (clock_crossing_io_m1_read_data_valid_led_s1),
      .clock_crossing_io_m1_read_data_valid_sw_s1                 (clock_crossing_io_m1_read_data_valid_sw_s1),
      .clock_crossing_io_m1_read_data_valid_sysid_control_slave   (clock_crossing_io_m1_read_data_valid_sysid_control_slave),
      .clock_crossing_io_m1_read_data_valid_timer_s1              (clock_crossing_io_m1_read_data_valid_timer_s1),
      .clock_crossing_io_m1_readdata                              (clock_crossing_io_m1_readdata),
      .clock_crossing_io_m1_readdatavalid                         (clock_crossing_io_m1_readdatavalid),
      .clock_crossing_io_m1_requests_key_s1                       (clock_crossing_io_m1_requests_key_s1),
      .clock_crossing_io_m1_requests_lcd_control_slave            (clock_crossing_io_m1_requests_lcd_control_slave),
      .clock_crossing_io_m1_requests_led_s1                       (clock_crossing_io_m1_requests_led_s1),
      .clock_crossing_io_m1_requests_sw_s1                        (clock_crossing_io_m1_requests_sw_s1),
      .clock_crossing_io_m1_requests_sysid_control_slave          (clock_crossing_io_m1_requests_sysid_control_slave),
      .clock_crossing_io_m1_requests_timer_s1                     (clock_crossing_io_m1_requests_timer_s1),
      .clock_crossing_io_m1_reset_n                               (clock_crossing_io_m1_reset_n),
      .clock_crossing_io_m1_waitrequest                           (clock_crossing_io_m1_waitrequest),
      .clock_crossing_io_m1_write                                 (clock_crossing_io_m1_write),
      .clock_crossing_io_m1_writedata                             (clock_crossing_io_m1_writedata),
      .d1_key_s1_end_xfer                                         (d1_key_s1_end_xfer),
      .d1_lcd_control_slave_end_xfer                              (d1_lcd_control_slave_end_xfer),
      .d1_led_s1_end_xfer                                         (d1_led_s1_end_xfer),
      .d1_sw_s1_end_xfer                                          (d1_sw_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                            (d1_sysid_control_slave_end_xfer),
      .d1_timer_s1_end_xfer                                       (d1_timer_s1_end_xfer),
      .key_s1_readdata_from_sa                                    (key_s1_readdata_from_sa),
      .lcd_control_slave_readdata_from_sa                         (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_wait_counter_eq_0                        (lcd_control_slave_wait_counter_eq_0),
      .led_s1_readdata_from_sa                                    (led_s1_readdata_from_sa),
      .reset_n                                                    (altpll_io_reset_n),
      .sw_s1_readdata_from_sa                                     (sw_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                       (sysid_control_slave_readdata_from_sa),
      .timer_s1_readdata_from_sa                                  (timer_s1_readdata_from_sa)
    );

  clock_crossing_io the_clock_crossing_io
    (
      .master_address       (clock_crossing_io_m1_address),
      .master_byteenable    (clock_crossing_io_m1_byteenable),
      .master_clk           (altpll_io),
      .master_endofpacket   (clock_crossing_io_m1_endofpacket),
      .master_nativeaddress (clock_crossing_io_m1_nativeaddress),
      .master_read          (clock_crossing_io_m1_read),
      .master_readdata      (clock_crossing_io_m1_readdata),
      .master_readdatavalid (clock_crossing_io_m1_readdatavalid),
      .master_reset_n       (clock_crossing_io_m1_reset_n),
      .master_waitrequest   (clock_crossing_io_m1_waitrequest),
      .master_write         (clock_crossing_io_m1_write),
      .master_writedata     (clock_crossing_io_m1_writedata),
      .slave_address        (clock_crossing_io_s1_address),
      .slave_byteenable     (clock_crossing_io_s1_byteenable),
      .slave_clk            (altpll_sys),
      .slave_endofpacket    (clock_crossing_io_s1_endofpacket),
      .slave_nativeaddress  (clock_crossing_io_s1_nativeaddress),
      .slave_read           (clock_crossing_io_s1_read),
      .slave_readdata       (clock_crossing_io_s1_readdata),
      .slave_readdatavalid  (clock_crossing_io_s1_readdatavalid),
      .slave_reset_n        (clock_crossing_io_s1_reset_n),
      .slave_waitrequest    (clock_crossing_io_s1_waitrequest),
      .slave_write          (clock_crossing_io_s1_write),
      .slave_writedata      (clock_crossing_io_s1_writedata)
    );

  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                         (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                       (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module             (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module               (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cpu_jtag_debug_module                      (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module      (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module        (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module               (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                       (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                                 (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                                    (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                                    (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                                   (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                      (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                              (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset_n                                       (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                                  (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                          (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                         (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                     (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                                   (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .MTL_SOPC_clock_0_in_readdata_from_sa                                      (MTL_SOPC_clock_0_in_readdata_from_sa),
      .MTL_SOPC_clock_0_in_waitrequest_from_sa                                   (MTL_SOPC_clock_0_in_waitrequest_from_sa),
      .MTL_SOPC_clock_1_in_readdata_from_sa                                      (MTL_SOPC_clock_1_in_readdata_from_sa),
      .MTL_SOPC_clock_1_in_waitrequest_from_sa                                   (MTL_SOPC_clock_1_in_waitrequest_from_sa),
      .alt_vip_vfr_0_avalon_slave_irq_from_sa                                    (alt_vip_vfr_0_avalon_slave_irq_from_sa),
      .alt_vip_vfr_0_avalon_slave_readdata_from_sa                               (alt_vip_vfr_0_avalon_slave_readdata_from_sa),
      .altpll_sys                                                                (altpll_sys),
      .altpll_sys_reset_n                                                        (altpll_sys_reset_n),
      .cfi_flash_s1_wait_counter_eq_0                                            (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                       (altpll_sys),
      .clock_crossing_io_s1_readdata_from_sa                                     (clock_crossing_io_s1_readdata_from_sa),
      .clock_crossing_io_s1_waitrequest_from_sa                                  (clock_crossing_io_s1_waitrequest_from_sa),
      .cpu_data_master_address                                                   (cpu_data_master_address),
      .cpu_data_master_address_to_slave                                          (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                                (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                                   (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_byteenable_sram_avalon_slave                              (cpu_data_master_byteenable_sram_avalon_slave),
      .cpu_data_master_dbs_address                                               (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                              (cpu_data_master_dbs_write_16),
      .cpu_data_master_dbs_write_8                                               (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_MTL_SOPC_clock_0_in                               (cpu_data_master_granted_MTL_SOPC_clock_0_in),
      .cpu_data_master_granted_MTL_SOPC_clock_1_in                               (cpu_data_master_granted_MTL_SOPC_clock_1_in),
      .cpu_data_master_granted_alt_vip_vfr_0_avalon_slave                        (cpu_data_master_granted_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_granted_cfi_flash_s1                                      (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_granted_clock_crossing_io_s1                              (cpu_data_master_granted_clock_crossing_io_s1),
      .cpu_data_master_granted_cpu_jtag_debug_module                             (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_epcs_flash_controller_epcs_control_port           (cpu_data_master_granted_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                       (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_granted_sdram_s1                                          (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_granted_sram_avalon_slave                                 (cpu_data_master_granted_sram_avalon_slave),
      .cpu_data_master_irq                                                       (cpu_data_master_irq),
      .cpu_data_master_latency_counter                                           (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_MTL_SOPC_clock_0_in                     (cpu_data_master_qualified_request_MTL_SOPC_clock_0_in),
      .cpu_data_master_qualified_request_MTL_SOPC_clock_1_in                     (cpu_data_master_qualified_request_MTL_SOPC_clock_1_in),
      .cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave              (cpu_data_master_qualified_request_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_qualified_request_cfi_flash_s1                            (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_qualified_request_clock_crossing_io_s1                    (cpu_data_master_qualified_request_clock_crossing_io_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module                   (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port (cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave             (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_qualified_request_sdram_s1                                (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_qualified_request_sram_avalon_slave                       (cpu_data_master_qualified_request_sram_avalon_slave),
      .cpu_data_master_read                                                      (cpu_data_master_read),
      .cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in                       (cpu_data_master_read_data_valid_MTL_SOPC_clock_0_in),
      .cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in                       (cpu_data_master_read_data_valid_MTL_SOPC_clock_1_in),
      .cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave                (cpu_data_master_read_data_valid_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_read_data_valid_cfi_flash_s1                              (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1                      (cpu_data_master_read_data_valid_clock_crossing_io_s1),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register       (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module                     (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port   (cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave               (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_sdram_s1                                  (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                   (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sram_avalon_slave                         (cpu_data_master_read_data_valid_sram_avalon_slave),
      .cpu_data_master_readdata                                                  (cpu_data_master_readdata),
      .cpu_data_master_readdatavalid                                             (cpu_data_master_readdatavalid),
      .cpu_data_master_requests_MTL_SOPC_clock_0_in                              (cpu_data_master_requests_MTL_SOPC_clock_0_in),
      .cpu_data_master_requests_MTL_SOPC_clock_1_in                              (cpu_data_master_requests_MTL_SOPC_clock_1_in),
      .cpu_data_master_requests_alt_vip_vfr_0_avalon_slave                       (cpu_data_master_requests_alt_vip_vfr_0_avalon_slave),
      .cpu_data_master_requests_cfi_flash_s1                                     (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_requests_clock_crossing_io_s1                             (cpu_data_master_requests_clock_crossing_io_s1),
      .cpu_data_master_requests_cpu_jtag_debug_module                            (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_epcs_flash_controller_epcs_control_port          (cpu_data_master_requests_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                      (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_requests_sdram_s1                                         (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_requests_sram_avalon_slave                                (cpu_data_master_requests_sram_avalon_slave),
      .cpu_data_master_waitrequest                                               (cpu_data_master_waitrequest),
      .cpu_data_master_write                                                     (cpu_data_master_write),
      .cpu_data_master_writedata                                                 (cpu_data_master_writedata),
      .cpu_jtag_debug_module_readdata_from_sa                                    (cpu_jtag_debug_module_readdata_from_sa),
      .d1_MTL_SOPC_clock_0_in_end_xfer                                           (d1_MTL_SOPC_clock_0_in_end_xfer),
      .d1_MTL_SOPC_clock_1_in_end_xfer                                           (d1_MTL_SOPC_clock_1_in_end_xfer),
      .d1_alt_vip_vfr_0_avalon_slave_end_xfer                                    (d1_alt_vip_vfr_0_avalon_slave_end_xfer),
      .d1_clock_crossing_io_s1_end_xfer                                          (d1_clock_crossing_io_s1_end_xfer),
      .d1_cpu_jtag_debug_module_end_xfer                                         (d1_cpu_jtag_debug_module_end_xfer),
      .d1_epcs_flash_controller_epcs_control_port_end_xfer                       (d1_epcs_flash_controller_epcs_control_port_end_xfer),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                                   (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .d1_sdram_s1_end_xfer                                                      (d1_sdram_s1_end_xfer),
      .d1_sram_avalon_slave_end_xfer                                             (d1_sram_avalon_slave_end_xfer),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                           (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .epcs_flash_controller_epcs_control_port_irq_from_sa                       (epcs_flash_controller_epcs_control_port_irq_from_sa),
      .epcs_flash_controller_epcs_control_port_readdata_from_sa                  (epcs_flash_controller_epcs_control_port_readdata_from_sa),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0            (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                                   (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                              (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                           (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .key_s1_irq_from_sa                                                        (key_s1_irq_from_sa),
      .multi_touch_avalon_slave_irq_n_from_sa                                    (multi_touch_avalon_slave_irq_n_from_sa),
      .reset_n                                                                   (altpll_sys_reset_n),
      .sdram_s1_readdata_from_sa                                                 (sdram_s1_readdata_from_sa),
      .sdram_s1_waitrequest_from_sa                                              (sdram_s1_waitrequest_from_sa),
      .sram_avalon_slave_readdata_from_sa                                        (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_wait_counter_eq_0                                       (sram_avalon_slave_wait_counter_eq_0),
      .timer_s1_irq_from_sa                                                      (timer_s1_irq_from_sa)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .cfi_flash_s1_wait_counter_eq_0                                                   (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                              (altpll_sys),
      .cpu_instruction_master_address                                                   (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                                          (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                               (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                                      (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_granted_cpu_jtag_debug_module                             (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port           (cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_granted_sram_avalon_slave                                 (cpu_instruction_master_granted_sram_avalon_slave),
      .cpu_instruction_master_latency_counter                                           (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1                            (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module                   (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port (cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_qualified_request_sram_avalon_slave                       (cpu_instruction_master_qualified_request_sram_avalon_slave),
      .cpu_instruction_master_read                                                      (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1                              (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module                     (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port   (cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_read_data_valid_sram_avalon_slave                         (cpu_instruction_master_read_data_valid_sram_avalon_slave),
      .cpu_instruction_master_readdata                                                  (cpu_instruction_master_readdata),
      .cpu_instruction_master_readdatavalid                                             (cpu_instruction_master_readdatavalid),
      .cpu_instruction_master_requests_cfi_flash_s1                                     (cpu_instruction_master_requests_cfi_flash_s1),
      .cpu_instruction_master_requests_cpu_jtag_debug_module                            (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port          (cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_requests_sram_avalon_slave                                (cpu_instruction_master_requests_sram_avalon_slave),
      .cpu_instruction_master_waitrequest                                               (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                                           (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                                                (d1_cpu_jtag_debug_module_end_xfer),
      .d1_epcs_flash_controller_epcs_control_port_end_xfer                              (d1_epcs_flash_controller_epcs_control_port_end_xfer),
      .d1_sram_avalon_slave_end_xfer                                                    (d1_sram_avalon_slave_end_xfer),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                                  (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .epcs_flash_controller_epcs_control_port_readdata_from_sa                         (epcs_flash_controller_epcs_control_port_readdata_from_sa),
      .incoming_data_to_and_from_the_cfi_flash                                          (incoming_data_to_and_from_the_cfi_flash),
      .reset_n                                                                          (altpll_sys_reset_n),
      .sram_avalon_slave_readdata_from_sa                                               (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_wait_counter_eq_0                                              (sram_avalon_slave_wait_counter_eq_0)
    );

  cpu the_cpu
    (
      .clk                                   (altpll_sys),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_readdatavalid                       (cpu_data_master_readdatavalid),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_readdatavalid                       (cpu_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  epcs_flash_controller_epcs_control_port_arbitrator the_epcs_flash_controller_epcs_control_port
    (
      .clk                                                                              (altpll_sys),
      .cpu_data_master_address_to_slave                                                 (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_epcs_flash_controller_epcs_control_port                  (cpu_data_master_granted_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_latency_counter                                                  (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port        (cpu_data_master_qualified_request_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_read                                                             (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register              (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port          (cpu_data_master_read_data_valid_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register                          (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_epcs_flash_controller_epcs_control_port                 (cpu_data_master_requests_epcs_flash_controller_epcs_control_port),
      .cpu_data_master_write                                                            (cpu_data_master_write),
      .cpu_data_master_writedata                                                        (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                                          (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port           (cpu_instruction_master_granted_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_latency_counter                                           (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port (cpu_instruction_master_qualified_request_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_read                                                      (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port   (cpu_instruction_master_read_data_valid_epcs_flash_controller_epcs_control_port),
      .cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port          (cpu_instruction_master_requests_epcs_flash_controller_epcs_control_port),
      .d1_epcs_flash_controller_epcs_control_port_end_xfer                              (d1_epcs_flash_controller_epcs_control_port_end_xfer),
      .epcs_flash_controller_epcs_control_port_address                                  (epcs_flash_controller_epcs_control_port_address),
      .epcs_flash_controller_epcs_control_port_chipselect                               (epcs_flash_controller_epcs_control_port_chipselect),
      .epcs_flash_controller_epcs_control_port_dataavailable                            (epcs_flash_controller_epcs_control_port_dataavailable),
      .epcs_flash_controller_epcs_control_port_dataavailable_from_sa                    (epcs_flash_controller_epcs_control_port_dataavailable_from_sa),
      .epcs_flash_controller_epcs_control_port_endofpacket                              (epcs_flash_controller_epcs_control_port_endofpacket),
      .epcs_flash_controller_epcs_control_port_endofpacket_from_sa                      (epcs_flash_controller_epcs_control_port_endofpacket_from_sa),
      .epcs_flash_controller_epcs_control_port_irq                                      (epcs_flash_controller_epcs_control_port_irq),
      .epcs_flash_controller_epcs_control_port_irq_from_sa                              (epcs_flash_controller_epcs_control_port_irq_from_sa),
      .epcs_flash_controller_epcs_control_port_read_n                                   (epcs_flash_controller_epcs_control_port_read_n),
      .epcs_flash_controller_epcs_control_port_readdata                                 (epcs_flash_controller_epcs_control_port_readdata),
      .epcs_flash_controller_epcs_control_port_readdata_from_sa                         (epcs_flash_controller_epcs_control_port_readdata_from_sa),
      .epcs_flash_controller_epcs_control_port_readyfordata                             (epcs_flash_controller_epcs_control_port_readyfordata),
      .epcs_flash_controller_epcs_control_port_readyfordata_from_sa                     (epcs_flash_controller_epcs_control_port_readyfordata_from_sa),
      .epcs_flash_controller_epcs_control_port_reset_n                                  (epcs_flash_controller_epcs_control_port_reset_n),
      .epcs_flash_controller_epcs_control_port_write_n                                  (epcs_flash_controller_epcs_control_port_write_n),
      .epcs_flash_controller_epcs_control_port_writedata                                (epcs_flash_controller_epcs_control_port_writedata),
      .reset_n                                                                          (altpll_sys_reset_n)
    );

  epcs_flash_controller the_epcs_flash_controller
    (
      .address       (epcs_flash_controller_epcs_control_port_address),
      .chipselect    (epcs_flash_controller_epcs_control_port_chipselect),
      .clk           (altpll_sys),
      .data0         (data0_to_the_epcs_flash_controller),
      .dataavailable (epcs_flash_controller_epcs_control_port_dataavailable),
      .dclk          (dclk_from_the_epcs_flash_controller),
      .endofpacket   (epcs_flash_controller_epcs_control_port_endofpacket),
      .irq           (epcs_flash_controller_epcs_control_port_irq),
      .read_n        (epcs_flash_controller_epcs_control_port_read_n),
      .readdata      (epcs_flash_controller_epcs_control_port_readdata),
      .readyfordata  (epcs_flash_controller_epcs_control_port_readyfordata),
      .reset_n       (epcs_flash_controller_epcs_control_port_reset_n),
      .sce           (sce_from_the_epcs_flash_controller),
      .sdo           (sdo_from_the_epcs_flash_controller),
      .write_n       (epcs_flash_controller_epcs_control_port_write_n),
      .writedata     (epcs_flash_controller_epcs_control_port_writedata)
    );

  jtag_uart_avalon_jtag_slave_arbitrator the_jtag_uart_avalon_jtag_slave
    (
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_jtag_uart_avalon_jtag_slave                 (cpu_data_master_granted_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave       (cpu_data_master_qualified_request_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave         (cpu_data_master_read_data_valid_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_jtag_uart_avalon_jtag_slave                (cpu_data_master_requests_jtag_uart_avalon_jtag_slave),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_jtag_uart_avalon_jtag_slave_end_xfer                             (d1_jtag_uart_avalon_jtag_slave_end_xfer),
      .jtag_uart_avalon_jtag_slave_address                                 (jtag_uart_avalon_jtag_slave_address),
      .jtag_uart_avalon_jtag_slave_chipselect                              (jtag_uart_avalon_jtag_slave_chipselect),
      .jtag_uart_avalon_jtag_slave_dataavailable                           (jtag_uart_avalon_jtag_slave_dataavailable),
      .jtag_uart_avalon_jtag_slave_dataavailable_from_sa                   (jtag_uart_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_avalon_jtag_slave_irq                                     (jtag_uart_avalon_jtag_slave_irq),
      .jtag_uart_avalon_jtag_slave_irq_from_sa                             (jtag_uart_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_avalon_jtag_slave_read_n                                  (jtag_uart_avalon_jtag_slave_read_n),
      .jtag_uart_avalon_jtag_slave_readdata                                (jtag_uart_avalon_jtag_slave_readdata),
      .jtag_uart_avalon_jtag_slave_readdata_from_sa                        (jtag_uart_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_avalon_jtag_slave_readyfordata                            (jtag_uart_avalon_jtag_slave_readyfordata),
      .jtag_uart_avalon_jtag_slave_readyfordata_from_sa                    (jtag_uart_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_avalon_jtag_slave_reset_n                                 (jtag_uart_avalon_jtag_slave_reset_n),
      .jtag_uart_avalon_jtag_slave_waitrequest                             (jtag_uart_avalon_jtag_slave_waitrequest),
      .jtag_uart_avalon_jtag_slave_waitrequest_from_sa                     (jtag_uart_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_avalon_jtag_slave_write_n                                 (jtag_uart_avalon_jtag_slave_write_n),
      .jtag_uart_avalon_jtag_slave_writedata                               (jtag_uart_avalon_jtag_slave_writedata),
      .reset_n                                                             (altpll_sys_reset_n)
    );

  jtag_uart the_jtag_uart
    (
      .av_address     (jtag_uart_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_avalon_jtag_slave_writedata),
      .clk            (altpll_sys),
      .dataavailable  (jtag_uart_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_avalon_jtag_slave_reset_n)
    );

  key_s1_arbitrator the_key_s1
    (
      .clk                                           (altpll_io),
      .clock_crossing_io_m1_address_to_slave         (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_granted_key_s1           (clock_crossing_io_m1_granted_key_s1),
      .clock_crossing_io_m1_latency_counter          (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_nativeaddress            (clock_crossing_io_m1_nativeaddress),
      .clock_crossing_io_m1_qualified_request_key_s1 (clock_crossing_io_m1_qualified_request_key_s1),
      .clock_crossing_io_m1_read                     (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_key_s1   (clock_crossing_io_m1_read_data_valid_key_s1),
      .clock_crossing_io_m1_requests_key_s1          (clock_crossing_io_m1_requests_key_s1),
      .clock_crossing_io_m1_write                    (clock_crossing_io_m1_write),
      .clock_crossing_io_m1_writedata                (clock_crossing_io_m1_writedata),
      .d1_key_s1_end_xfer                            (d1_key_s1_end_xfer),
      .key_s1_address                                (key_s1_address),
      .key_s1_chipselect                             (key_s1_chipselect),
      .key_s1_irq                                    (key_s1_irq),
      .key_s1_irq_from_sa                            (key_s1_irq_from_sa),
      .key_s1_readdata                               (key_s1_readdata),
      .key_s1_readdata_from_sa                       (key_s1_readdata_from_sa),
      .key_s1_reset_n                                (key_s1_reset_n),
      .key_s1_write_n                                (key_s1_write_n),
      .key_s1_writedata                              (key_s1_writedata),
      .reset_n                                       (altpll_io_reset_n)
    );

  key the_key
    (
      .address    (key_s1_address),
      .chipselect (key_s1_chipselect),
      .clk        (altpll_io),
      .in_port    (in_port_to_the_key),
      .irq        (key_s1_irq),
      .readdata   (key_s1_readdata),
      .reset_n    (key_s1_reset_n),
      .write_n    (key_s1_write_n),
      .writedata  (key_s1_writedata)
    );

  lcd_control_slave_arbitrator the_lcd_control_slave
    (
      .clk                                                      (altpll_io),
      .clock_crossing_io_m1_address_to_slave                    (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_byteenable                          (clock_crossing_io_m1_byteenable),
      .clock_crossing_io_m1_granted_lcd_control_slave           (clock_crossing_io_m1_granted_lcd_control_slave),
      .clock_crossing_io_m1_latency_counter                     (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_nativeaddress                       (clock_crossing_io_m1_nativeaddress),
      .clock_crossing_io_m1_qualified_request_lcd_control_slave (clock_crossing_io_m1_qualified_request_lcd_control_slave),
      .clock_crossing_io_m1_read                                (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_lcd_control_slave   (clock_crossing_io_m1_read_data_valid_lcd_control_slave),
      .clock_crossing_io_m1_requests_lcd_control_slave          (clock_crossing_io_m1_requests_lcd_control_slave),
      .clock_crossing_io_m1_write                               (clock_crossing_io_m1_write),
      .clock_crossing_io_m1_writedata                           (clock_crossing_io_m1_writedata),
      .d1_lcd_control_slave_end_xfer                            (d1_lcd_control_slave_end_xfer),
      .lcd_control_slave_address                                (lcd_control_slave_address),
      .lcd_control_slave_begintransfer                          (lcd_control_slave_begintransfer),
      .lcd_control_slave_read                                   (lcd_control_slave_read),
      .lcd_control_slave_readdata                               (lcd_control_slave_readdata),
      .lcd_control_slave_readdata_from_sa                       (lcd_control_slave_readdata_from_sa),
      .lcd_control_slave_wait_counter_eq_0                      (lcd_control_slave_wait_counter_eq_0),
      .lcd_control_slave_write                                  (lcd_control_slave_write),
      .lcd_control_slave_writedata                              (lcd_control_slave_writedata),
      .reset_n                                                  (altpll_io_reset_n)
    );

  lcd the_lcd
    (
      .LCD_E         (LCD_E_from_the_lcd),
      .LCD_RS        (LCD_RS_from_the_lcd),
      .LCD_RW        (LCD_RW_from_the_lcd),
      .LCD_data      (LCD_data_to_and_from_the_lcd),
      .address       (lcd_control_slave_address),
      .begintransfer (lcd_control_slave_begintransfer),
      .read          (lcd_control_slave_read),
      .readdata      (lcd_control_slave_readdata),
      .write         (lcd_control_slave_write),
      .writedata     (lcd_control_slave_writedata)
    );

  led_s1_arbitrator the_led_s1
    (
      .clk                                           (altpll_io),
      .clock_crossing_io_m1_address_to_slave         (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_granted_led_s1           (clock_crossing_io_m1_granted_led_s1),
      .clock_crossing_io_m1_latency_counter          (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_nativeaddress            (clock_crossing_io_m1_nativeaddress),
      .clock_crossing_io_m1_qualified_request_led_s1 (clock_crossing_io_m1_qualified_request_led_s1),
      .clock_crossing_io_m1_read                     (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_led_s1   (clock_crossing_io_m1_read_data_valid_led_s1),
      .clock_crossing_io_m1_requests_led_s1          (clock_crossing_io_m1_requests_led_s1),
      .clock_crossing_io_m1_write                    (clock_crossing_io_m1_write),
      .clock_crossing_io_m1_writedata                (clock_crossing_io_m1_writedata),
      .d1_led_s1_end_xfer                            (d1_led_s1_end_xfer),
      .led_s1_address                                (led_s1_address),
      .led_s1_chipselect                             (led_s1_chipselect),
      .led_s1_readdata                               (led_s1_readdata),
      .led_s1_readdata_from_sa                       (led_s1_readdata_from_sa),
      .led_s1_reset_n                                (led_s1_reset_n),
      .led_s1_write_n                                (led_s1_write_n),
      .led_s1_writedata                              (led_s1_writedata),
      .reset_n                                       (altpll_io_reset_n)
    );

  led the_led
    (
      .address    (led_s1_address),
      .chipselect (led_s1_chipselect),
      .clk        (altpll_io),
      .out_port   (out_port_from_the_led),
      .readdata   (led_s1_readdata),
      .reset_n    (led_s1_reset_n),
      .write_n    (led_s1_write_n),
      .writedata  (led_s1_writedata)
    );

  multi_touch_avalon_slave_arbitrator the_multi_touch_avalon_slave
    (
      .MTL_SOPC_clock_1_out_address_to_slave                           (MTL_SOPC_clock_1_out_address_to_slave),
      .MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave           (MTL_SOPC_clock_1_out_granted_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_nativeaddress                              (MTL_SOPC_clock_1_out_nativeaddress),
      .MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave (MTL_SOPC_clock_1_out_qualified_request_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_read                                       (MTL_SOPC_clock_1_out_read),
      .MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave   (MTL_SOPC_clock_1_out_read_data_valid_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave          (MTL_SOPC_clock_1_out_requests_multi_touch_avalon_slave),
      .MTL_SOPC_clock_1_out_write                                      (MTL_SOPC_clock_1_out_write),
      .MTL_SOPC_clock_1_out_writedata                                  (MTL_SOPC_clock_1_out_writedata),
      .clk                                                             (altpll_touch),
      .d1_multi_touch_avalon_slave_end_xfer                            (d1_multi_touch_avalon_slave_end_xfer),
      .multi_touch_avalon_slave_address                                (multi_touch_avalon_slave_address),
      .multi_touch_avalon_slave_chipselect                             (multi_touch_avalon_slave_chipselect),
      .multi_touch_avalon_slave_irq_n                                  (multi_touch_avalon_slave_irq_n),
      .multi_touch_avalon_slave_irq_n_from_sa                          (multi_touch_avalon_slave_irq_n_from_sa),
      .multi_touch_avalon_slave_read                                   (multi_touch_avalon_slave_read),
      .multi_touch_avalon_slave_readdata                               (multi_touch_avalon_slave_readdata),
      .multi_touch_avalon_slave_readdata_from_sa                       (multi_touch_avalon_slave_readdata_from_sa),
      .multi_touch_avalon_slave_reset_n                                (multi_touch_avalon_slave_reset_n),
      .multi_touch_avalon_slave_write                                  (multi_touch_avalon_slave_write),
      .multi_touch_avalon_slave_writedata                              (multi_touch_avalon_slave_writedata),
      .reset_n                                                         (altpll_touch_reset_n)
    );

  multi_touch the_multi_touch
    (
      .TOUCH_I2C_SCL (TOUCH_I2C_SCL_from_the_multi_touch),
      .TOUCH_I2C_SDA (TOUCH_I2C_SDA_to_and_from_the_multi_touch),
      .TOUCH_INT_n   (TOUCH_INT_n_to_the_multi_touch),
      .clk           (altpll_touch),
      .irq_n         (multi_touch_avalon_slave_irq_n),
      .reset_n       (multi_touch_avalon_slave_reset_n),
      .s_address     (multi_touch_avalon_slave_address),
      .s_cs          (multi_touch_avalon_slave_chipselect),
      .s_read        (multi_touch_avalon_slave_read),
      .s_readdata    (multi_touch_avalon_slave_readdata),
      .s_write       (multi_touch_avalon_slave_write),
      .s_writedata   (multi_touch_avalon_slave_writedata)
    );

  sdram_s1_arbitrator the_sdram_s1
    (
      .MTL_SOPC_burst_0_downstream_address_to_slave                        (MTL_SOPC_burst_0_downstream_address_to_slave),
      .MTL_SOPC_burst_0_downstream_arbitrationshare                        (MTL_SOPC_burst_0_downstream_arbitrationshare),
      .MTL_SOPC_burst_0_downstream_burstcount                              (MTL_SOPC_burst_0_downstream_burstcount),
      .MTL_SOPC_burst_0_downstream_byteenable                              (MTL_SOPC_burst_0_downstream_byteenable),
      .MTL_SOPC_burst_0_downstream_granted_sdram_s1                        (MTL_SOPC_burst_0_downstream_granted_sdram_s1),
      .MTL_SOPC_burst_0_downstream_latency_counter                         (MTL_SOPC_burst_0_downstream_latency_counter),
      .MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1              (MTL_SOPC_burst_0_downstream_qualified_request_sdram_s1),
      .MTL_SOPC_burst_0_downstream_read                                    (MTL_SOPC_burst_0_downstream_read),
      .MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1                (MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1),
      .MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register (MTL_SOPC_burst_0_downstream_read_data_valid_sdram_s1_shift_register),
      .MTL_SOPC_burst_0_downstream_requests_sdram_s1                       (MTL_SOPC_burst_0_downstream_requests_sdram_s1),
      .MTL_SOPC_burst_0_downstream_write                                   (MTL_SOPC_burst_0_downstream_write),
      .MTL_SOPC_burst_0_downstream_writedata                               (MTL_SOPC_burst_0_downstream_writedata),
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_granted_sdram_s1                                    (cpu_data_master_granted_sdram_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sdram_s1                          (cpu_data_master_qualified_request_sdram_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1                            (cpu_data_master_read_data_valid_sdram_s1),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_sdram_s1                                   (cpu_data_master_requests_sdram_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_data_master_writedata                                           (cpu_data_master_writedata),
      .d1_sdram_s1_end_xfer                                                (d1_sdram_s1_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n),
      .sdram_s1_address                                                    (sdram_s1_address),
      .sdram_s1_byteenable_n                                               (sdram_s1_byteenable_n),
      .sdram_s1_chipselect                                                 (sdram_s1_chipselect),
      .sdram_s1_read_n                                                     (sdram_s1_read_n),
      .sdram_s1_readdata                                                   (sdram_s1_readdata),
      .sdram_s1_readdata_from_sa                                           (sdram_s1_readdata_from_sa),
      .sdram_s1_readdatavalid                                              (sdram_s1_readdatavalid),
      .sdram_s1_reset_n                                                    (sdram_s1_reset_n),
      .sdram_s1_waitrequest                                                (sdram_s1_waitrequest),
      .sdram_s1_waitrequest_from_sa                                        (sdram_s1_waitrequest_from_sa),
      .sdram_s1_write_n                                                    (sdram_s1_write_n),
      .sdram_s1_writedata                                                  (sdram_s1_writedata)
    );

  sdram the_sdram
    (
      .az_addr        (sdram_s1_address),
      .az_be_n        (sdram_s1_byteenable_n),
      .az_cs          (sdram_s1_chipselect),
      .az_data        (sdram_s1_writedata),
      .az_rd_n        (sdram_s1_read_n),
      .az_wr_n        (sdram_s1_write_n),
      .clk            (altpll_sys),
      .reset_n        (sdram_s1_reset_n),
      .za_data        (sdram_s1_readdata),
      .za_valid       (sdram_s1_readdatavalid),
      .za_waitrequest (sdram_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram),
      .zs_ba          (zs_ba_from_the_sdram),
      .zs_cas_n       (zs_cas_n_from_the_sdram),
      .zs_cke         (zs_cke_from_the_sdram),
      .zs_cs_n        (zs_cs_n_from_the_sdram),
      .zs_dq          (zs_dq_to_and_from_the_sdram),
      .zs_dqm         (zs_dqm_from_the_sdram),
      .zs_ras_n       (zs_ras_n_from_the_sdram),
      .zs_we_n        (zs_we_n_from_the_sdram)
    );

  sram_avalon_slave_arbitrator the_sram_avalon_slave
    (
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_sram_avalon_slave                        (cpu_data_master_byteenable_sram_avalon_slave),
      .cpu_data_master_dbs_address                                         (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_16                                        (cpu_data_master_dbs_write_16),
      .cpu_data_master_granted_sram_avalon_slave                           (cpu_data_master_granted_sram_avalon_slave),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_sram_avalon_slave                 (cpu_data_master_qualified_request_sram_avalon_slave),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_read_data_valid_sram_avalon_slave                   (cpu_data_master_read_data_valid_sram_avalon_slave),
      .cpu_data_master_requests_sram_avalon_slave                          (cpu_data_master_requests_sram_avalon_slave),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                  (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_sram_avalon_slave                    (cpu_instruction_master_granted_sram_avalon_slave),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_sram_avalon_slave          (cpu_instruction_master_qualified_request_sram_avalon_slave),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_sram_avalon_slave            (cpu_instruction_master_read_data_valid_sram_avalon_slave),
      .cpu_instruction_master_requests_sram_avalon_slave                   (cpu_instruction_master_requests_sram_avalon_slave),
      .d1_sram_avalon_slave_end_xfer                                       (d1_sram_avalon_slave_end_xfer),
      .reset_n                                                             (altpll_sys_reset_n),
      .sram_avalon_slave_address                                           (sram_avalon_slave_address),
      .sram_avalon_slave_byteenable_n                                      (sram_avalon_slave_byteenable_n),
      .sram_avalon_slave_chipselect_n                                      (sram_avalon_slave_chipselect_n),
      .sram_avalon_slave_read_n                                            (sram_avalon_slave_read_n),
      .sram_avalon_slave_readdata                                          (sram_avalon_slave_readdata),
      .sram_avalon_slave_readdata_from_sa                                  (sram_avalon_slave_readdata_from_sa),
      .sram_avalon_slave_reset_n                                           (sram_avalon_slave_reset_n),
      .sram_avalon_slave_wait_counter_eq_0                                 (sram_avalon_slave_wait_counter_eq_0),
      .sram_avalon_slave_write_n                                           (sram_avalon_slave_write_n),
      .sram_avalon_slave_writedata                                         (sram_avalon_slave_writedata)
    );

  sram the_sram
    (
      .SRAM_ADDR      (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n      (SRAM_CE_n_from_the_sram),
      .SRAM_DQ        (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n      (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n      (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n      (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n      (SRAM_WE_n_from_the_sram),
      .clk            (altpll_sys),
      .reset_n        (sram_avalon_slave_reset_n),
      .s_address      (sram_avalon_slave_address),
      .s_byteenable_n (sram_avalon_slave_byteenable_n),
      .s_chipselect_n (sram_avalon_slave_chipselect_n),
      .s_read_n       (sram_avalon_slave_read_n),
      .s_readdata     (sram_avalon_slave_readdata),
      .s_write_n      (sram_avalon_slave_write_n),
      .s_writedata    (sram_avalon_slave_writedata)
    );

  sw_s1_arbitrator the_sw_s1
    (
      .clk                                          (altpll_io),
      .clock_crossing_io_m1_address_to_slave        (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_granted_sw_s1           (clock_crossing_io_m1_granted_sw_s1),
      .clock_crossing_io_m1_latency_counter         (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_nativeaddress           (clock_crossing_io_m1_nativeaddress),
      .clock_crossing_io_m1_qualified_request_sw_s1 (clock_crossing_io_m1_qualified_request_sw_s1),
      .clock_crossing_io_m1_read                    (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_sw_s1   (clock_crossing_io_m1_read_data_valid_sw_s1),
      .clock_crossing_io_m1_requests_sw_s1          (clock_crossing_io_m1_requests_sw_s1),
      .clock_crossing_io_m1_write                   (clock_crossing_io_m1_write),
      .d1_sw_s1_end_xfer                            (d1_sw_s1_end_xfer),
      .reset_n                                      (altpll_io_reset_n),
      .sw_s1_address                                (sw_s1_address),
      .sw_s1_readdata                               (sw_s1_readdata),
      .sw_s1_readdata_from_sa                       (sw_s1_readdata_from_sa),
      .sw_s1_reset_n                                (sw_s1_reset_n)
    );

  sw the_sw
    (
      .address  (sw_s1_address),
      .clk      (altpll_io),
      .in_port  (in_port_to_the_sw),
      .readdata (sw_s1_readdata),
      .reset_n  (sw_s1_reset_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                        (altpll_io),
      .clock_crossing_io_m1_address_to_slave                      (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_granted_sysid_control_slave           (clock_crossing_io_m1_granted_sysid_control_slave),
      .clock_crossing_io_m1_latency_counter                       (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_nativeaddress                         (clock_crossing_io_m1_nativeaddress),
      .clock_crossing_io_m1_qualified_request_sysid_control_slave (clock_crossing_io_m1_qualified_request_sysid_control_slave),
      .clock_crossing_io_m1_read                                  (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_sysid_control_slave   (clock_crossing_io_m1_read_data_valid_sysid_control_slave),
      .clock_crossing_io_m1_requests_sysid_control_slave          (clock_crossing_io_m1_requests_sysid_control_slave),
      .clock_crossing_io_m1_write                                 (clock_crossing_io_m1_write),
      .d1_sysid_control_slave_end_xfer                            (d1_sysid_control_slave_end_xfer),
      .reset_n                                                    (altpll_io_reset_n),
      .sysid_control_slave_address                                (sysid_control_slave_address),
      .sysid_control_slave_readdata                               (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                       (sysid_control_slave_readdata_from_sa),
      .sysid_control_slave_reset_n                                (sysid_control_slave_reset_n)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .clock    (sysid_control_slave_clock),
      .readdata (sysid_control_slave_readdata),
      .reset_n  (sysid_control_slave_reset_n)
    );

  timer_s1_arbitrator the_timer_s1
    (
      .clk                                             (altpll_io),
      .clock_crossing_io_m1_address_to_slave           (clock_crossing_io_m1_address_to_slave),
      .clock_crossing_io_m1_granted_timer_s1           (clock_crossing_io_m1_granted_timer_s1),
      .clock_crossing_io_m1_latency_counter            (clock_crossing_io_m1_latency_counter),
      .clock_crossing_io_m1_nativeaddress              (clock_crossing_io_m1_nativeaddress),
      .clock_crossing_io_m1_qualified_request_timer_s1 (clock_crossing_io_m1_qualified_request_timer_s1),
      .clock_crossing_io_m1_read                       (clock_crossing_io_m1_read),
      .clock_crossing_io_m1_read_data_valid_timer_s1   (clock_crossing_io_m1_read_data_valid_timer_s1),
      .clock_crossing_io_m1_requests_timer_s1          (clock_crossing_io_m1_requests_timer_s1),
      .clock_crossing_io_m1_write                      (clock_crossing_io_m1_write),
      .clock_crossing_io_m1_writedata                  (clock_crossing_io_m1_writedata),
      .d1_timer_s1_end_xfer                            (d1_timer_s1_end_xfer),
      .reset_n                                         (altpll_io_reset_n),
      .timer_s1_address                                (timer_s1_address),
      .timer_s1_chipselect                             (timer_s1_chipselect),
      .timer_s1_irq                                    (timer_s1_irq),
      .timer_s1_irq_from_sa                            (timer_s1_irq_from_sa),
      .timer_s1_readdata                               (timer_s1_readdata),
      .timer_s1_readdata_from_sa                       (timer_s1_readdata_from_sa),
      .timer_s1_reset_n                                (timer_s1_reset_n),
      .timer_s1_write_n                                (timer_s1_write_n),
      .timer_s1_writedata                              (timer_s1_writedata)
    );

  timer the_timer
    (
      .address    (timer_s1_address),
      .chipselect (timer_s1_chipselect),
      .clk        (altpll_io),
      .irq        (timer_s1_irq),
      .readdata   (timer_s1_readdata),
      .reset_n    (timer_s1_reset_n),
      .write_n    (timer_s1_write_n),
      .writedata  (timer_s1_writedata)
    );

  tri_state_bridge_flash_avalon_slave_arbitrator the_tri_state_bridge_flash_avalon_slave
    (
      .address_to_the_cfi_flash                                            (address_to_the_cfi_flash),
      .cfi_flash_s1_wait_counter_eq_0                                      (cfi_flash_s1_wait_counter_eq_0),
      .clk                                                                 (altpll_sys),
      .cpu_data_master_address_to_slave                                    (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                          (cpu_data_master_byteenable),
      .cpu_data_master_byteenable_cfi_flash_s1                             (cpu_data_master_byteenable_cfi_flash_s1),
      .cpu_data_master_dbs_address                                         (cpu_data_master_dbs_address),
      .cpu_data_master_dbs_write_8                                         (cpu_data_master_dbs_write_8),
      .cpu_data_master_granted_cfi_flash_s1                                (cpu_data_master_granted_cfi_flash_s1),
      .cpu_data_master_latency_counter                                     (cpu_data_master_latency_counter),
      .cpu_data_master_qualified_request_cfi_flash_s1                      (cpu_data_master_qualified_request_cfi_flash_s1),
      .cpu_data_master_read                                                (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cfi_flash_s1                        (cpu_data_master_read_data_valid_cfi_flash_s1),
      .cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register (cpu_data_master_read_data_valid_clock_crossing_io_s1_shift_register),
      .cpu_data_master_read_data_valid_sdram_s1_shift_register             (cpu_data_master_read_data_valid_sdram_s1_shift_register),
      .cpu_data_master_requests_cfi_flash_s1                               (cpu_data_master_requests_cfi_flash_s1),
      .cpu_data_master_write                                               (cpu_data_master_write),
      .cpu_instruction_master_address_to_slave                             (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_dbs_address                                  (cpu_instruction_master_dbs_address),
      .cpu_instruction_master_granted_cfi_flash_s1                         (cpu_instruction_master_granted_cfi_flash_s1),
      .cpu_instruction_master_latency_counter                              (cpu_instruction_master_latency_counter),
      .cpu_instruction_master_qualified_request_cfi_flash_s1               (cpu_instruction_master_qualified_request_cfi_flash_s1),
      .cpu_instruction_master_read                                         (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cfi_flash_s1                 (cpu_instruction_master_read_data_valid_cfi_flash_s1),
      .cpu_instruction_master_requests_cfi_flash_s1                        (cpu_instruction_master_requests_cfi_flash_s1),
      .d1_tri_state_bridge_flash_avalon_slave_end_xfer                     (d1_tri_state_bridge_flash_avalon_slave_end_xfer),
      .data_to_and_from_the_cfi_flash                                      (data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash                             (incoming_data_to_and_from_the_cfi_flash),
      .incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0      (incoming_data_to_and_from_the_cfi_flash_with_Xs_converted_to_0),
      .read_n_to_the_cfi_flash                                             (read_n_to_the_cfi_flash),
      .reset_n                                                             (altpll_sys_reset_n),
      .select_n_to_the_cfi_flash                                           (select_n_to_the_cfi_flash),
      .write_n_to_the_cfi_flash                                            (write_n_to_the_cfi_flash)
    );

  //reset is asserted asynchronously and deasserted synchronously
  MTL_SOPC_reset_altpll_sys_domain_synch_module MTL_SOPC_reset_altpll_sys_domain_synch
    (
      .clk      (altpll_sys),
      .data_in  (1'b1),
      .data_out (altpll_sys_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa |
    0 |
    0);

  //reset is asserted asynchronously and deasserted synchronously
  MTL_SOPC_reset_clk_50_domain_synch_module MTL_SOPC_reset_clk_50_domain_synch
    (
      .clk      (clk_50),
      .data_in  (1'b1),
      .data_out (clk_50_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  MTL_SOPC_reset_altpll_io_domain_synch_module MTL_SOPC_reset_altpll_io_domain_synch
    (
      .clk      (altpll_io),
      .data_in  (1'b1),
      .data_out (altpll_io_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset is asserted asynchronously and deasserted synchronously
  MTL_SOPC_reset_altpll_touch_domain_synch_module MTL_SOPC_reset_altpll_touch_domain_synch
    (
      .clk      (altpll_touch),
      .data_in  (1'b1),
      .data_out (altpll_touch_reset_n),
      .reset_n  (reset_n_sources)
    );

  //MTL_SOPC_burst_0_upstream_writedata of type writedata does not connect to anything so wire it to default (0)
  assign MTL_SOPC_burst_0_upstream_writedata = 0;

  //MTL_SOPC_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign MTL_SOPC_clock_0_out_endofpacket = 0;

  //MTL_SOPC_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign MTL_SOPC_clock_1_out_endofpacket = 0;

  //clock_crossing_io_m1_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  assign clock_crossing_io_m1_endofpacket = 0;

  //sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  assign sysid_control_slave_clock = 0;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash_lane0_module (
                                // inputs:
                                 data,
                                 rdaddress,
                                 rdclken,
                                 wraddress,
                                 wrclock,
                                 wren,

                                // outputs:
                                 q
                              )
;

  output  [  7: 0] q;
  input   [  7: 0] data;
  input   [ 22: 0] rdaddress;
  input            rdclken;
  input   [ 22: 0] wraddress;
  input            wrclock;
  input            wren;

  reg     [  7: 0] mem_array [8388607: 0];
  wire    [  7: 0] q;
  reg     [ 22: 0] read_address;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  always @(rdaddress)
    begin
      read_address = rdaddress;
    end


  // Data read is asynchronous.
  assign q = mem_array[read_address];

initial
    $readmemh("cfi_flash.dat", mem_array);
  always @(posedge wrclock)
    begin
      // Write data
      if (wren)
          mem_array[wraddress] <= data;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on
//synthesis read_comments_as_HDL on
//  always @(rdaddress)
//    begin
//      read_address = rdaddress;
//    end
//
//
//  lpm_ram_dp lpm_ram_dp_component
//    (
//      .data (data),
//      .q (q),
//      .rdaddress (read_address),
//      .rdclken (rdclken),
//      .wraddress (wraddress),
//      .wrclock (wrclock),
//      .wren (wren)
//    );
//
//  defparam lpm_ram_dp_component.lpm_file = "cfi_flash.mif",
//           lpm_ram_dp_component.lpm_hint = "USE_EAB=ON",
//           lpm_ram_dp_component.lpm_indata = "REGISTERED",
//           lpm_ram_dp_component.lpm_outdata = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_rdaddress_control = "UNREGISTERED",
//           lpm_ram_dp_component.lpm_width = 8,
//           lpm_ram_dp_component.lpm_widthad = 23,
//           lpm_ram_dp_component.lpm_wraddress_control = "REGISTERED",
//           lpm_ram_dp_component.suppress_memory_conversion_warnings = "ON";
//
//synthesis read_comments_as_HDL off

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cfi_flash (
                   // inputs:
                    address,
                    read_n,
                    select_n,
                    write_n,

                   // outputs:
                    data
                 )
;

  inout   [  7: 0] data;
  input   [ 22: 0] address;
  input            read_n;
  input            select_n;
  input            write_n;

  wire    [  7: 0] data;
  wire    [  7: 0] data_0;
  wire    [  7: 0] logic_vector_gasket;
  wire    [  7: 0] q_0;
  //s1, which is an e_ptf_slave

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  assign logic_vector_gasket = data;
  assign data_0 = logic_vector_gasket[7 : 0];
  //cfi_flash_lane0, which is an e_ram
  cfi_flash_lane0_module cfi_flash_lane0
    (
      .data      (data_0),
      .q         (q_0),
      .rdaddress (address),
      .rdclken   (1'b1),
      .wraddress (address),
      .wrclock   (write_n),
      .wren      (~select_n)
    );

  assign data = (~select_n & ~read_n)? q_0: {8{1'bz}};

//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/10.1/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/220model.v"
`include "c:/altera/10.1/quartus/eda/sim_lib/sgate.v"
`include "ip/TERASIC_SRAM/TERASIC_SRAM.v"
`include "sram.v"
`include "ip/TERASIC_MULTI_TOUCH/TERASIC_MULTI_TOUCH.v"
`include "ip/TERASIC_MULTI_TOUCH/i2c_touch_config.v"
`include "ip/TERASIC_MULTI_TOUCH/i2c_touch_controller.v"
`include "ip/TERASIC_MULTI_TOUCH/touch_fifo.v"
`include "multi_touch.v"
`include "altpll_sys.vo"
`include "alt_vip_vfr_0.vo"
`include "alt_vip_itc_0.vo"
`include "led.v"
`include "sdram.v"
`include "sysid.v"
`include "sw.v"
`include "timer.v"
`include "key.v"
`include "jtag_uart.v"
`include "MTL_SOPC_burst_0.v"
`include "lcd.v"
`include "MTL_SOPC_clock_0.v"
`include "MTL_SOPC_clock_1.v"
`include "epcs_flash_controller.v"
`include "cpu_test_bench.v"
`include "cpu_mult_cell.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "clock_crossing_io.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             LCD_E_from_the_lcd;
  wire             LCD_RS_from_the_lcd;
  wire             LCD_RW_from_the_lcd;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd;
  wire             MTL_SOPC_burst_0_downstream_debugaccess;
  wire    [ 26: 0] MTL_SOPC_burst_0_downstream_nativeaddress;
  wire    [ 31: 0] MTL_SOPC_burst_0_upstream_writedata;
  wire             MTL_SOPC_clock_0_in_endofpacket_from_sa;
  wire             MTL_SOPC_clock_0_out_endofpacket;
  wire    [  1: 0] MTL_SOPC_clock_0_out_nativeaddress;
  wire             MTL_SOPC_clock_1_in_endofpacket_from_sa;
  wire             MTL_SOPC_clock_1_out_endofpacket;
  wire    [ 19: 0] SRAM_ADDR_from_the_sram;
  wire             SRAM_CE_n_from_the_sram;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram;
  wire             SRAM_LB_n_from_the_sram;
  wire             SRAM_OE_n_from_the_sram;
  wire             SRAM_UB_n_from_the_sram;
  wire             SRAM_WE_n_from_the_sram;
  wire             TOUCH_I2C_SCL_from_the_multi_touch;
  wire             TOUCH_I2C_SDA_to_and_from_the_multi_touch;
  wire             TOUCH_INT_n_to_the_multi_touch;
  wire    [ 22: 0] address_to_the_cfi_flash;
  wire             altpll_io;
  wire             altpll_sdram;
  wire             altpll_sys;
  wire             altpll_touch;
  wire             clk;
  reg              clk_50;
  wire             clock_crossing_io_m1_endofpacket;
  wire             clock_crossing_io_s1_endofpacket_from_sa;
  wire             data0_to_the_epcs_flash_controller;
  wire    [  7: 0] data_to_and_from_the_cfi_flash;
  wire             dclk_from_the_epcs_flash_controller;
  wire             epcs_flash_controller_epcs_control_port_dataavailable_from_sa;
  wire             epcs_flash_controller_epcs_control_port_endofpacket_from_sa;
  wire             epcs_flash_controller_epcs_control_port_readyfordata_from_sa;
  wire    [  3: 0] in_port_to_the_key;
  wire    [ 17: 0] in_port_to_the_sw;
  wire             jtag_uart_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_avalon_jtag_slave_readyfordata_from_sa;
  wire             locked_from_the_altpll_sys;
  wire    [ 26: 0] out_port_from_the_led;
  wire             phasedone_from_the_altpll_sys;
  wire             read_n_to_the_cfi_flash;
  reg              reset_n;
  wire             sce_from_the_epcs_flash_controller;
  wire             sdo_from_the_epcs_flash_controller;
  wire             select_n_to_the_cfi_flash;
  wire             sysid_control_slave_clock;
  wire             underflow_from_the_alt_vip_itc_0;
  wire             vid_clk_to_the_alt_vip_itc_0;
  wire    [ 23: 0] vid_data_from_the_alt_vip_itc_0;
  wire             vid_datavalid_from_the_alt_vip_itc_0;
  wire             vid_f_from_the_alt_vip_itc_0;
  wire             vid_h_from_the_alt_vip_itc_0;
  wire             vid_h_sync_from_the_alt_vip_itc_0;
  wire             vid_v_from_the_alt_vip_itc_0;
  wire             vid_v_sync_from_the_alt_vip_itc_0;
  wire             write_n_to_the_cfi_flash;
  wire    [ 12: 0] zs_addr_from_the_sdram;
  wire    [  1: 0] zs_ba_from_the_sdram;
  wire             zs_cas_n_from_the_sdram;
  wire             zs_cke_from_the_sdram;
  wire             zs_cs_n_from_the_sdram;
  wire    [ 31: 0] zs_dq_to_and_from_the_sdram;
  wire    [  3: 0] zs_dqm_from_the_sdram;
  wire             zs_ras_n_from_the_sdram;
  wire             zs_we_n_from_the_sdram;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  MTL_SOPC DUT
    (
      .LCD_E_from_the_lcd                        (LCD_E_from_the_lcd),
      .LCD_RS_from_the_lcd                       (LCD_RS_from_the_lcd),
      .LCD_RW_from_the_lcd                       (LCD_RW_from_the_lcd),
      .LCD_data_to_and_from_the_lcd              (LCD_data_to_and_from_the_lcd),
      .SRAM_ADDR_from_the_sram                   (SRAM_ADDR_from_the_sram),
      .SRAM_CE_n_from_the_sram                   (SRAM_CE_n_from_the_sram),
      .SRAM_DQ_to_and_from_the_sram              (SRAM_DQ_to_and_from_the_sram),
      .SRAM_LB_n_from_the_sram                   (SRAM_LB_n_from_the_sram),
      .SRAM_OE_n_from_the_sram                   (SRAM_OE_n_from_the_sram),
      .SRAM_UB_n_from_the_sram                   (SRAM_UB_n_from_the_sram),
      .SRAM_WE_n_from_the_sram                   (SRAM_WE_n_from_the_sram),
      .TOUCH_I2C_SCL_from_the_multi_touch        (TOUCH_I2C_SCL_from_the_multi_touch),
      .TOUCH_I2C_SDA_to_and_from_the_multi_touch (TOUCH_I2C_SDA_to_and_from_the_multi_touch),
      .TOUCH_INT_n_to_the_multi_touch            (TOUCH_INT_n_to_the_multi_touch),
      .address_to_the_cfi_flash                  (address_to_the_cfi_flash),
      .altpll_io                                 (altpll_io),
      .altpll_sdram                              (altpll_sdram),
      .altpll_sys                                (altpll_sys),
      .altpll_touch                              (altpll_touch),
      .clk_50                                    (clk_50),
      .data0_to_the_epcs_flash_controller        (data0_to_the_epcs_flash_controller),
      .data_to_and_from_the_cfi_flash            (data_to_and_from_the_cfi_flash),
      .dclk_from_the_epcs_flash_controller       (dclk_from_the_epcs_flash_controller),
      .in_port_to_the_key                        (in_port_to_the_key),
      .in_port_to_the_sw                         (in_port_to_the_sw),
      .locked_from_the_altpll_sys                (locked_from_the_altpll_sys),
      .out_port_from_the_led                     (out_port_from_the_led),
      .phasedone_from_the_altpll_sys             (phasedone_from_the_altpll_sys),
      .read_n_to_the_cfi_flash                   (read_n_to_the_cfi_flash),
      .reset_n                                   (reset_n),
      .sce_from_the_epcs_flash_controller        (sce_from_the_epcs_flash_controller),
      .sdo_from_the_epcs_flash_controller        (sdo_from_the_epcs_flash_controller),
      .select_n_to_the_cfi_flash                 (select_n_to_the_cfi_flash),
      .underflow_from_the_alt_vip_itc_0          (underflow_from_the_alt_vip_itc_0),
      .vid_clk_to_the_alt_vip_itc_0              (vid_clk_to_the_alt_vip_itc_0),
      .vid_data_from_the_alt_vip_itc_0           (vid_data_from_the_alt_vip_itc_0),
      .vid_datavalid_from_the_alt_vip_itc_0      (vid_datavalid_from_the_alt_vip_itc_0),
      .vid_f_from_the_alt_vip_itc_0              (vid_f_from_the_alt_vip_itc_0),
      .vid_h_from_the_alt_vip_itc_0              (vid_h_from_the_alt_vip_itc_0),
      .vid_h_sync_from_the_alt_vip_itc_0         (vid_h_sync_from_the_alt_vip_itc_0),
      .vid_v_from_the_alt_vip_itc_0              (vid_v_from_the_alt_vip_itc_0),
      .vid_v_sync_from_the_alt_vip_itc_0         (vid_v_sync_from_the_alt_vip_itc_0),
      .write_n_to_the_cfi_flash                  (write_n_to_the_cfi_flash),
      .zs_addr_from_the_sdram                    (zs_addr_from_the_sdram),
      .zs_ba_from_the_sdram                      (zs_ba_from_the_sdram),
      .zs_cas_n_from_the_sdram                   (zs_cas_n_from_the_sdram),
      .zs_cke_from_the_sdram                     (zs_cke_from_the_sdram),
      .zs_cs_n_from_the_sdram                    (zs_cs_n_from_the_sdram),
      .zs_dq_to_and_from_the_sdram               (zs_dq_to_and_from_the_sdram),
      .zs_dqm_from_the_sdram                     (zs_dqm_from_the_sdram),
      .zs_ras_n_from_the_sdram                   (zs_ras_n_from_the_sdram),
      .zs_we_n_from_the_sdram                    (zs_we_n_from_the_sdram)
    );

  cfi_flash the_cfi_flash
    (
      .address  (address_to_the_cfi_flash),
      .data     (data_to_and_from_the_cfi_flash),
      .read_n   (read_n_to_the_cfi_flash),
      .select_n (select_n_to_the_cfi_flash),
      .write_n  (write_n_to_the_cfi_flash)
    );

  initial
    clk_50 = 1'b0;
  always
    #10 clk_50 <= ~clk_50;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on