# clock
set_property PACKAGE_PIN W5 [get_ports ck]							
	set_property IOSTANDARD LVCMOS33 [get_ports ck]
	
# buttons
set_property PACKAGE_PIN U18 [get_ports en]						
	set_property IOSTANDARD LVCMOS33 [get_ports en]
	
## Switches
set_property PACKAGE_PIN V17 [get_ports {X[0]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {X[0]}]
set_property PACKAGE_PIN V16 [get_ports {X[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {X[1]}]
set_property PACKAGE_PIN W16 [get_ports {X[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {X[2]}]
set_property PACKAGE_PIN W17 [get_ports {X[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {X[3]}]
    
## LEDs
set_property PACKAGE_PIN U16 [get_ports {Z1[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z1[0]}]
set_property PACKAGE_PIN E19 [get_ports {Z1[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z1[1]}]
set_property PACKAGE_PIN U19 [get_ports {Z1[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z1[2]}]
set_property PACKAGE_PIN V19 [get_ports {Z1[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z1[3]}]
    
set_property PACKAGE_PIN W18 [get_ports {Z2[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z2[0]}]
set_property PACKAGE_PIN U15 [get_ports {Z2[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z2[1]}]
set_property PACKAGE_PIN U14 [get_ports {Z2[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z2[2]}]
set_property PACKAGE_PIN V14 [get_ports {Z2[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z2[3]}]
    
    