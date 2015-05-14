# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7a35tcpg236-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/lc599/Desktop/array_mult/array_mult.cache/wt [current_project]
set_property parent.project_path C:/Users/lc599/Desktop/array_mult/array_mult.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/lc599/Desktop/array_mult/array_mult.srcs/sources_1/new/PE.vhd
  C:/Users/lc599/Desktop/array_mult/array_mult.srcs/sources_1/new/a_mult.vhd
}
read_xdc {{C:/Users/lc599/Desktop/array_mult/array_mult.srcs/constrs_1/imports/ECEC 302 Projects/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/lc599/Desktop/array_mult/array_mult.srcs/constrs_1/imports/ECEC 302 Projects/Basys3_Master.xdc}}]

catch { write_hwdef -file a_mult.hwdef }
synth_design -top a_mult -part xc7a35tcpg236-1
write_checkpoint -noxdef a_mult.dcp
catch { report_utilization -file a_mult_utilization_synth.rpt -pb a_mult_utilization_synth.pb }
