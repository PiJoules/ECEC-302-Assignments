# clock
set_property PACKAGE_PIN W5 [get_ports ck]							
	set_property IOSTANDARD LVCMOS33 [get_ports ck]
	
# buttons
set_property PACKAGE_PIN T18 [get_ports Btns[1]]						
    set_property IOSTANDARD LVCMOS33 [get_ports Btns[1]]
set_property PACKAGE_PIN W19 [get_ports Btns[2]]						
    set_property IOSTANDARD LVCMOS33 [get_ports Btns[2]]
set_property PACKAGE_PIN T17 [get_ports Btns[0]]						
    set_property IOSTANDARD LVCMOS33 [get_ports Btns[0]]
set_property PACKAGE_PIN U17 [get_ports Btns[3]]                        
    set_property IOSTANDARD LVCMOS33 [get_ports Btns[3]]
	
## Switches
set_property PACKAGE_PIN V17 [get_ports {X[0]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {X[0]}]
set_property PACKAGE_PIN V16 [get_ports {X[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {X[1]}]
    
# LEDs
set_property PACKAGE_PIN U16 [get_ports {LEDS[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[0]}]
set_property PACKAGE_PIN E19 [get_ports {LEDS[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[1]}]
set_property PACKAGE_PIN U19 [get_ports {LEDS[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[2]}]
set_property PACKAGE_PIN V19 [get_ports {LEDS[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[3]}]
set_property PACKAGE_PIN W18 [get_ports {LEDS[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[4]}]
set_property PACKAGE_PIN U15 [get_ports {LEDS[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[5]}]
set_property PACKAGE_PIN U14 [get_ports {LEDS[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[6]}]
set_property PACKAGE_PIN V14 [get_ports {LEDS[7]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {LEDS[7]}]
        
    