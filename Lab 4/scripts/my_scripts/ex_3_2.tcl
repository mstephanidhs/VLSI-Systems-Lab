set DESIGN_NAME vmcoffee

analyze -format verilog {./src/3/vmcoffee.v}
elaborate $DESIGN_NAME

link
check_design

read_sdc scripts/my_scripts/rca_clock.sdc

set_max_area 0

compile_ultra

set resultdir "./results_vmcoffee"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/rca_compiled.${postfix}.v

quit