read_verilog vmcoffee_netlist.v 
link_design

set power_enable_analysis true

read_fsdb -strip_path vmcoffee_tb/DUT vmcoffee.fsdb

update_power 
report_power

quit