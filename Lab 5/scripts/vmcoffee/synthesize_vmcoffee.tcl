set DESIGN_NAME vmcoffee

analyze -format verilog {./src/vmcoffee/vmcoffee.v}
elaborate $DESIGN_NAME

link
check_design

read_sdc scripts/vmcoffee/vmcoffee_clock.sdc

set_max_area 0

compile_ultra

set resultdir "./results/vmcoffee"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir

report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/vmcoffee_compiled.${postfix}.v


change_names -h -rules verilog
write -h -f verilog -output vmcoffee_netlist.v
write_sdf vmcoffee_netlist.sdf

quit

