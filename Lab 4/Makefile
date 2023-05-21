SHELL = /bin/bash
VCS = vcs -full64 
VLOGAN = vlogan -full64

VLOGAN_OPTS = -nc -v2005
VCS_OPTS = -q -debug_access+all -timescale=10ns/1ns -v2005
GUI_OPTS = -gui=dve

SRC_DIR = src
VPATH=$(SRC_DIR)

%.o: %.v
	@echo "Compile $<"
	$(VLOGAN) $(VLOGAN_OPTS) $<
	touch $@



ex1: ex1_1 ex1_2

ex1_1:
	dc_shell -f scripts/my_scripts/ex_1_1_0.tcl
	dc_shell -f scripts/my_scripts/ex_1_1_50.tcl
	dc_shell -f scripts/my_scripts/ex_1_1_200.tcl
	dc_shell -f scripts/my_scripts/ex_1_1_10000.tcl


ex1_2:
	dc_shell -f scripts/my_scripts/ex_1_2_200.tcl
	dc_shell -f scripts/my_scripts/ex_1_2_200_ultra.tcl



ex2: ex2_1 ex2_2


ex2_1:
	dc_shell -f scripts/my_scripts/ex_2_1.tcl
	dc_shell -f scripts/my_scripts/ex_2_1_ultra.tcl

ex2_2:
	dc_shell -f scripts/my_scripts/ex_2_2.tcl
	dc_shell -f scripts/my_scripts/ex_2_2_retime.tcl


ex3: ex3_1 ex3_2


ex3_1:
	dc_shell -f scripts/my_scripts/ex_3_1.tcl

ex3_2:
	dc_shell -f scripts/my_scripts/ex_3_2.tcl


ex4: ex4_sim ex4_synth

ex4_sim: gcd_tb.o gcd.o gcd_fsm.o gcd_dataflow.o
	$(VCS) $(VCS_OPTS) gcd_tb -o zitoumeno4
	./zitoumeno4
	dlock: lockcomp.o dlock.o dlock_tb.o
	@echo "❗️Open results_gcd/gcd.vcd for the waveforms."

ex4_synth:
	dc_shell -f scripts/my_scripts/ex_4.tcl




clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
	rm -f *.vcd
	rm -f *.pvl
	rm -f *.syn
	rm -f *.svf
	rm -f *.mr
