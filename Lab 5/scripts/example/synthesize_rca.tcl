set DESIGN_NAME rca

analyze -format verilog {./src/rca/fulladder.v ./src/rca/rca.v}
elaborate $DESIGN_NAME

link
check_design

set delay 100
set_max_delay $delay -from [all_inputs] -to [all_outputs]

set_max_area 0

compile_ultra

set resultdir "./results/rca"
set postfix "compile_ultra"

exec mkdir -p -- $resultdir
report_timing > $resultdir/timing_report.${postfix}.${delay}.rpt
report_qor > $resultdir/qor_report.${postfix}.${delay}.rpt
report_area -hierarchy > $resultdir/area_report.${postfix}.${delay}.rpt
report_power -hierarchy > $resultdir/power_report.${postfix}.${delay}.rpt

write -hierarchy -format verilog -output $resultdir/rca_compiled.${postfix}.${delay}.v


change_names -h -rules verilog
write -h -f verilog -output netlist.v
write_sdf netlist.sdf

quit

