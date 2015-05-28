proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  set_param xicom.use_bs_reader 1
  debug::add_scope template.lib 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.cache/wt [current_project]
  set_property parent.project_path C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.xpr [current_project]
  set_property ip_repo_paths c:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.cache/ip [current_project]
  set_property ip_output_repo c:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.cache/ip [current_project]
  add_files -quiet C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.runs/synth_1/acc.dcp
  add_files -quiet C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.runs/c_accum_0_synth_1/c_accum_0.dcp
  set_property netlist_only true [get_files C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.runs/c_accum_0_synth_1/c_accum_0.dcp]
  read_xdc -mode out_of_context -ref c_accum_0 -cells U0 c:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.srcs/sources_1/ip/c_accum_0/c_accum_0_ooc.xdc
  set_property processing_order EARLY [get_files c:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.srcs/sources_1/ip/c_accum_0/c_accum_0_ooc.xdc]
  read_xdc C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.srcs/constrs_1/imports/ECEC-302-Assignments/Basys3_Master.xdc
  link_design -top acc -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force acc_opt.dcp
  catch {report_drc -file acc_drc_opted.rpt}
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  write_checkpoint -force acc_placed.dcp
  catch { report_io -file acc_io_placed.rpt }
  catch { report_clock_utilization -file acc_clock_utilization_placed.rpt }
  catch { report_utilization -file acc_utilization_placed.rpt -pb acc_utilization_placed.pb }
  catch { report_control_sets -verbose -file acc_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force acc_routed.dcp
  catch { report_drc -file acc_drc_routed.rpt -pb acc_drc_routed.pb }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file acc_timing_summary_routed.rpt -rpx acc_timing_summary_routed.rpx }
  catch { report_power -file acc_power_routed.rpt -pb acc_power_summary_routed.pb }
  catch { report_route_status -file acc_route_status.rpt -pb acc_route_status.pb }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force acc.bit 
  if { [file exists C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.runs/synth_1/acc.hwdef] } {
    catch { write_sysdef -hwdef C:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.runs/synth_1/acc.hwdef -bitfile acc.bit -meminfo acc.mmi -file acc.sysdef }
  }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

