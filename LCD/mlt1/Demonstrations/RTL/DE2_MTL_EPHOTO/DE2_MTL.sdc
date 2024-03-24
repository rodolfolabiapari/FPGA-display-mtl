#**************************************************************
# This .sdc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period "50 MHz" -name sys_50m [get_ports OSC_50]
create_clock -period "27 MHz" -name sys_27m [get_ports OSC_27]
create_clock -period "27 MHz" -name tv_27m [get_ports TD_CLK]
create_clock -period "100 MHz" -name clk_dram [get_ports DRAM_CLK]

create_clock -period "80.0 KHZ" [get_ports I2CSCL]
# VGA : 800x480@60Hz
create_clock -period "33 MHz" -name clk_vga [get_ports VGA_CLK]


#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************
# Board Delay (Data) + Propagation Delay - Board Delay (Clock)
set_input_delay -max -clock clk_dram 0.09 [get_ports DRAM_DQ*]
set_input_delay -min -clock clk_dram -0.007 [get_ports DRAM_DQ*]



#**************************************************************
# Set Output Delay
#**************************************************************
# max : Board Delay (Data) - Board Delay (Clock) + tsu (External Device)
# min : Board Delay (Data) - Board Delay (Clock) - th (External Device)
set_output_delay -max -clock clk_dram 2.09  [get_ports DRAM_DQ*]
set_output_delay -min -clock clk_dram -1.007 [get_ports DRAM_DQ*]
set_output_delay -max -clock clk_dram 2.002 [get_ports DRAM_ADDR*]
set_output_delay -min -clock clk_dram -1.11 [get_ports DRAM_ADDR*]
set_output_delay -max -clock clk_dram 1.982  [get_ports DRAM_*DQM]
set_output_delay -min -clock clk_dram -1.043 [get_ports DRAM_*DQM]
set_output_delay -max -clock clk_dram 1.932  [get_ports DRAM_BA*]
set_output_delay -min -clock clk_dram -1.072 [get_ports DRAM_BA*]
set_output_delay -max -clock clk_dram 1.963  [get_ports DRAM_RAS_N]
set_output_delay -min -clock clk_dram -1.037 [get_ports DRAM_RAS_N]
set_output_delay -max -clock clk_dram 1.962  [get_ports DRAM_CAS_N]
set_output_delay -min -clock clk_dram -1.039 [get_ports DRAM_CAS_N]
set_output_delay -max -clock clk_dram 1.956 [get_ports DRAM_WE_N]
set_output_delay -min -clock clk_dram -1.044 [get_ports DRAM_WE_N]
set_output_delay -max -clock clk_dram 1.974  [get_ports DRAM_CKE]
set_output_delay -min -clock clk_dram -1.026 [get_ports DRAM_CKE]
set_output_delay -max -clock clk_dram 1.949  [get_ports DRAM_CS_N]
set_output_delay -min -clock clk_dram -1.051 [get_ports DRAM_CS_N]



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



