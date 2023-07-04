set DESIGN_NAME gcd

analyze -format verilog {./src/gcd/gcd_fsm.v ./src/gcd/gcd_dataflow.v ./src/gcd/gcd.v}
elaborate $DESIGN_NAME

link
check_design

read_sdc scripts/gcd/gcd_clock.sdc

set_max_area 0

compile

set resultdir "./results/gcd"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir

report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/gcd_compiled.${postfix}.v


change_names -h -rules verilog
write -h -f verilog -output gcd_netlist.v
write_sdf gcd_netlist.sdf

quit

