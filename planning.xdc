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
set_property PACKAGE_PIN R5 [get_ports {sw_timer}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {sw_timer}]
##Bank = 34, Pin name = IO_L20P_T3_34,                        Sch name = SW5
set_property PACKAGE_PIN V7 [get_ports {sw_hora}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw_hora}]
##Bank = 34, Pin name = IO_L20N_T3_34,                        Sch name = SW6
set_property PACKAGE_PIN V6 [get_ports {sw_fecha}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw_fecha}]
##Bank = 34, Pin name = IO_L10P_T1_34,                        Sch name = SW7
set_property PACKAGE_PIN V5 [get_ports {sw_formato}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {sw_formato}]
##Bank = 34, Pin name = IO_L8P_T1-34,                        Sch name = SW8
#set_property PACKAGE_PIN U4 [get_ports {sw[8]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
##Bank = 34, Pin name = IO_L9N_T1_DQS_34,                    Sch name = SW9
#set_property PACKAGE_PIN V2 [get_ports {sw[9]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
##Bank = 34, Pin name = IO_L9P_T1_DQS_34,                    Sch name = SW10
#set_property PACKAGE_PIN U2 [get_ports {sw[10]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
##Bank = 34, Pin name = IO_L11N_T1_MRCC_34,                    Sch name = SW11
#set_property PACKAGE_PIN T3 [get_ports {sw[11]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
##Bank = 34, Pin name = IO_L17N_T2_34,                        Sch name = SW12
#set_property PACKAGE_PIN T1 [get_ports {sw[12]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
##Bank = 34, Pin name = IO_L11P_T1_SRCC_34,                    Sch name = SW13
#set_property PACKAGE_PIN R3 [get_ports {sw[13]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
##Bank = 34, Pin name = IO_L14N_T2_SRCC_34,                    Sch name = SW14
#set_property PACKAGE_PIN P3 [get_ports {sw[14]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
##Bank = 34, Pin name = IO_L14P_T2_SRCC_34,                    Sch name = SW15
#set_property PACKAGE_PIN P4 [get_ports {sw[15]}]                    
    #set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
    
##Buttons
##Bank = 15, Pin name = IO_L3P_T0_DQS_AD1P_15,                Sch name = CPU_RESET
#set_property PACKAGE_PIN C12 [get_ports btnCpuReset]                
    #set_property IOSTANDARD LVCMOS33 [get_ports btnCpuReset]
##Bank = 15, Pin name = IO_L11N_T1_SRCC_15,                    Sch name = BTNC
#set_property PACKAGE_PIN E16 [get_ports btnC]                        
    #set_property IOSTANDARD LVCMOS33 [get_ports btnC]
##Bank = 15, Pin name = IO_L14P_T2_SRCC_15,                    Sch name = BTNU
set_property PACKAGE_PIN F15 [get_ports {boton_edit[0]}]                        
    set_property IOSTANDARD LVCMOS33 [get_ports {boton_edit[0]}]
##Bank = CONFIG, Pin name = IO_L15N_T2_DQS_DOUT_CSO_B_14,    Sch name = BTNL
set_property PACKAGE_PIN T16 [get_ports {boton_edit[2]}]                        
    set_property IOSTANDARD LVCMOS33 [get_ports {boton_edit[2]}]
##Bank = 14, Pin name = IO_25_14,                            Sch name = BTNR
set_property PACKAGE_PIN R10 [get_ports {boton_edit[3]}]                        
    set_property IOSTANDARD LVCMOS33 [get_ports {boton_edit[3]}]
##Bank = 14, Pin name = IO_L21P_T3_DQS_14,                    Sch name = BTND
set_property PACKAGE_PIN V10 [get_ports {boton_edit[1]}]                        
    set_property IOSTANDARD LVCMOS33 [get_ports {boton_edit[1]}]
     

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