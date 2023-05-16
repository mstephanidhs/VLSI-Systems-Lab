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


ex1_1:
	dc_shell -f scripts/my_scripts/ex_1_1_0.tcl
	dc_shell -f scripts/my_scripts/ex_1_1_50.tcl
	dc_shell -f scripts/my_scripts/ex_1_1_200.tcl
	dc_shell -f scripts/my_scripts/ex_1_1_10000.tcl


ex1_2:
	dc_shell -f scripts/my_scripts/ex_1_2_200.tcl
	dc_shell -f scripts/my_scripts/ex_1_2_200_ultra.tcl


ex2_1:
	dc_shell -f scripts/my_scripts/ex_2_1.tcl


clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
	rm -f *.vcd
	rm -f *.pvl
	rm -f *.syn
	rm -f *.svf
	rm -f *.mr
