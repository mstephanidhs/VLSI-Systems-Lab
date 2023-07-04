SHELL = /bin/bash
VCS = vcs -full64
VLOGAN = vlogan -full64


VLOGAN_OPTS = -nc -v2005
VCS_OPTS = -q -debug_access+all -v2005
VCS_TIMESCALE = -timescale=1ns/1ps
VCS_TIMING = -sdf
VCS_POWER = -kdb
GUI_OPTS = -gui=dve


vpath %.v ./src/*
vpath %.py ./src/*


%.o: %.v
	@echo "Compile $<"
	$(VLOGAN) $(VLOGAN_OPTS) $<
	touch $@
#-------------------------------------------------

.PHONY: example rca vmcoffee gcd ex1_2 clean


#Example 
example_simulation: fulladder.o rca.o rca_tb.o 
	$(VCS) $(VCS_OPTS) rca_tb -o example_sim
	./example_sim $(GUI_OPTS)

example_timing:
	dc_shell -f scripts/example/synthesize_rca.tcl
	$(VCS) $(VCS_OPTS) $(VCS_TIMESCALE) $(VCS_TIMING) max:rca_tb.DUT:netlist.sdf src/rca/rca_tb.v netlist.v /usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o rca_timing
	./rca_timing $(GUI_OPTS)

example_power: 
	dc_shell -f scripts/example/synthesize_rca.tcl
	$(VCS) $(VCS_OPTS) $(VCS_TIMESCALE) $(VCS_POWER) $(VCS_TIMING) max:rca_tb.DUT:netlist.sdf src/rca/rca_tb.v netlist.v /usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o rca_power
	./rca_power -ucli -do scripts/example/dump.tcl
	pt_shell -f scripts/example/power_analysis.tcl

example: example_timing example_power
#-------------------------------------------------



#Exercise 1.2 : Power Analysis of Previous Designs
rca: example_timing example_power
	@echo "✅Done"

vmcoffee_timing: 
	dc_shell -f scripts/vmcoffee/synthesize_vmcoffee.tcl
	$(VCS) $(VCS_OPTS) $(VCS_TIMESCALE) $(VCS_TIMING) max:vmcoffee_tb.DUT:vmcoffee_netlist.sdf src/vmcoffee/vmcoffee_tb.v vmcoffee_netlist.v /usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o vmcoffee_timing
	./vmcoffee_timing $(GUI_OPTS)

vmcoffee_power: vmcoffee_timing
	$(VCS) $(VCS_OPTS) $(VCS_TIMESCALE) $(VCS_POWER) $(VCS_TIMING) max:vmcoffee_tb.DUT:vmcoffee_netlist.sdf src/vmcoffee/vmcoffee_tb.v vmcoffee_netlist.v /usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o vmcoffee_power
	./vmcoffee_power -ucli -do scripts/vmcoffee/dump.tcl
	pt_shell -f scripts/vmcoffee/power_analysis.tcl

vmcoffee: vmcoffee_power
	@echo "✅Done"

gcd_simulation: gcd_tb.o gcd.o gcd_fsm.o gcd_dataflow.o
	$(VCS) $(VCS_OPTS) gcd_tb -o gcd_emulation
	./gcd_emulation 
	python3 ./src/gcd/test_gcd_results.py ./results/gcd/gcd_results.txt
	@echo "❗️Open results_gcd/gcd.vcd for the waveforms."

gcd_timing:
	dc_shell -f scripts/gcd/synthesize_gcd.tcl
	$(VCS) $(VCS_OPTS) $(VCS_TIMESCALE) $(VCS_TIMING) max:gcd_tb.DUT:gcd_netlist.sdf src/gcd/gcd_tb.v gcd_netlist.v /usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o gcd_timing
	./gcd_timing $(GUI_OPTS)

gcd_power: gcd_timing
	$(VCS) $(VCS_OPTS) $(VCS_TIMESCALE) $(VCS_POWER) $(VCS_TIMING) max:gcd_tb.DUT:gcd_netlist.sdf src/gcd/gcd_tb.v gcd_netlist.v /usr/local/eda/synLibs/asap7/7nm/verilog/*.v -o gcd_power
	./gcd_power -ucli -do scripts/gcd/dump.tcl
	pt_shell -f scripts/gcd/power_analysis.tcl

gcd: gcd_power
	@echo "✅Done"

ex1_2: rca vmcoffee gcd
#-------------------------------------------------



#Exercise 1.3 : Artificial Neuron
ineuron_simulation: 
#-------------------------------------------------



#Exercise 1.4 : RedWine MLP classifier

#-------------------------------------------------



#Exercise 1.5 : MLP Accelerator

#-------------------------------------------------
clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
	rm -f *.vcd
	rm -f *.pvl
	rm -f *.syn
	rm -f *.svf
	rm -f *.sdf
	rm -f *.mr
	rm -f *.v
	rm -f *.fsdb
	rm -f -r rca_*
	rm -f -r vmcoffee*
	rm -f -r gcd*