# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.cache/wt [current_project]
set_property parent.project_path D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/ADR.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/ALU32.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/ALUoutDR.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/imports/new/AvoidShake.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/BDR.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/imports/new/Button_In.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/imports/new/CLKDIV.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/imports/new/CLKDIV_40.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/Control_Unit.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/DBDR.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/Data_Mem.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/imports/new/Display.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/IR.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/Ins_Mem.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/Jump_Address.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/MUX32_ALUSrcA.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/MUX32_ALUSrcB.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/MUX32_DBDataSrc.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/MUX4to1_PCSrc.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/MUX_WriteReg.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/MUX_Write_Data.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/Multi_Cycle_CPU.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/PC.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/PC4_add_imm.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/PC_add_4.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/RegFile.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/imports/new/SegLED.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/Sign_Zero_Extend.v
  D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/sources_1/new/TOP_CPU.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/constrs_1/new/TOP_CPU.xdc
set_property used_in_implementation false [get_files D:/vivado/Multi_Cycle_CPU/Multi_Cycle_CPU.srcs/constrs_1/new/TOP_CPU.xdc]


synth_design -top TOP_CPU -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TOP_CPU.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TOP_CPU_utilization_synth.rpt -pb TOP_CPU_utilization_synth.pb"
