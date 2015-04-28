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
set_property PACKAGE_PIN W16 [get_ports {X[2]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {X[2]}]
set_property PACKAGE_PIN W17 [get_ports {X[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {X[3]}]
    
# 7-seg disp
set_property PACKAGE_PIN W7 [get_ports {Z[7]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[7]}]
set_property PACKAGE_PIN W6 [get_ports {Z[6]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[6]}]
set_property PACKAGE_PIN U8 [get_ports {Z[5]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[5]}]
set_property PACKAGE_PIN V8 [get_ports {Z[4]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[4]}]
set_property PACKAGE_PIN U5 [get_ports {Z[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[3]}]
set_property PACKAGE_PIN V5 [get_ports {Z[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[2]}]
set_property PACKAGE_PIN U7 [get_ports {Z[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Z[1]}]
    
set_property PACKAGE_PIN V7 [get_ports Z[0]]                            
    set_property IOSTANDARD LVCMOS33 [get_ports Z[0]]
    
# disp en
set_property PACKAGE_PIN U2 [get_ports {Disp_en[0]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Disp_en[0]}]
set_property PACKAGE_PIN U4 [get_ports {Disp_en[1]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Disp_en[1]}]
set_property PACKAGE_PIN V4 [get_ports {Disp_en[2]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Disp_en[2]}]
set_property PACKAGE_PIN W4 [get_ports {Disp_en[3]}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {Disp_en[3]}]
        
    