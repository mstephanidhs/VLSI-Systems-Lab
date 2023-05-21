set DESIGN_NAME gcd

analyze -format verilog {./src/4/gcd_fsm.v ./src/4/gcd_dataflow.v ./src/4/gcd.v }
elaborate $DESIGN_NAME

link
check_design

read_sdc scripts/my_scripts/gcd_clock.sdc

set_max_area 0

compile_ultra

set resultdir "./results_gcd"
set postfix "compile_ultra"
exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.rpt
report_qor > $resultdir/qor_report.${postfix}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.rpt

write -hierarchy -format verilog -output $resultdir/rca_compiled.${postfix}.v

quit