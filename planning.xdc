#Bank = 35, Pin name = IO_L12P_T1_MRCC_35,					Sch name = CLK100MHZ
set_property PACKAGE_PIN E3 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
## Switches
##Bank = 34, Pin name = IO_L21P_T3_DQS_34,					Sch name = SW0
set_property PACKAGE_PIN U9 [get_ports {swcolors[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {swcolors[0]}]
##Bank = 34, Pin name = IO_25_34,				                Sch name = SW1
set_property PACKAGE_PIN U8 [get_ports {swcolors[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {swcolors[1]}]
##Bank = 34, Pin name = IO_L23P_T3_34,						Sch name = SW2
set_property PACKAGE_PIN R7 [get_ports {swcolors[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {swcolors[2]}]
##Bank = 34, Pin name = IO_L19P_T3_34,						Sch name = SW3
set_property PACKAGE_PIN R6 [get_ports {reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

##VGA Connector
##Bank = 35, Pin name = IO_L8N_T1_AD14N_35,					Sch name = VGA_R0
set_property PACKAGE_PIN A3 [get_ports {colors_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[0]}]
##Bank = 35, Pin name = IO_L7N_T1_AD6N_35,					Sch name = VGA_R1
set_property PACKAGE_PIN B4 [get_ports {colors_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[0]}]
##Bank = 35, Pin name = IO_L1N_T0_AD4N_35,					Sch name = VGA_R2
set_property PACKAGE_PIN C5 [get_ports {colors_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[0]}]
##Bank = 35, Pin name = IO_L8P_T1_AD14P_35,					Sch name = VGA_R3
set_property PACKAGE_PIN A4 [get_ports {colors_out[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[0]}]
##Bank = 35, Pin name = IO_L2P_T0_AD12P_35,					Sch name = VGA_B0
set_property PACKAGE_PIN B7 [get_ports {colors_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[1]}]
##Bank = 35, Pin name = IO_L4N_T0_35,						Sch name = VGA_B1
set_property PACKAGE_PIN C7 [get_ports {colors_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[1]}]
##Bank = 35, Pin name = IO_L6N_T0_VREF_35,					Sch name = VGA_B2
set_property PACKAGE_PIN D7 [get_ports {colors_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[1]}]
##Bank = 35, Pin name = IO_L4P_T0_35,						Sch name = VGA_B3
set_property PACKAGE_PIN D8 [get_ports {colors_out[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[1]}]
##Bank = 35, Pin name = IO_L1P_T0_AD4P_35,					Sch name = VGA_G0
set_property PACKAGE_PIN C6 [get_ports {colors_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[2]}]
##Bank = 35, Pin name = IO_L3N_T0_DQS_AD5N_35,					Sch name = VGA_G1
set_property PACKAGE_PIN A5 [get_ports {colors_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[2]}]
##Bank = 35, Pin name = IO_L2N_T0_AD12N_35,					Sch name = VGA_G2
set_property PACKAGE_PIN B6 [get_ports {colors_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[2]}]
##Bank = 35, Pin name = IO_L3P_T0_DQS_AD5P_35,					Sch name = VGA_G3
set_property PACKAGE_PIN A6 [get_ports {colors_out[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {colors_out[2]}]
##Bank = 15, Pin name = IO_L4P_T0_15,						Sch name = VGA_HS
set_property PACKAGE_PIN B11 [get_ports {h_sync}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {h_sync}]
##Bank = 15, Pin name = IO_L3N_T0_DQS_AD1N_15,					Sch name = VGA_VS
set_property PACKAGE_PIN B12 [get_ports {v_sync}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {v_sync}]		