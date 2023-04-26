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


vmcoffee: vmcoffee.o vmcoffee_tb.o
	$(VCS) $(VCS_OPTS) vmcoffee_tb -o zitoumeno1_2
	./zitoumeno1_2
	@echo "❗️Open vmcoffee.vcd for the waveforms."


lockcomp: lockcomp.o lockcomp_tb.o
	$(VCS) $(VCS_OPTS) lockcomp_tb -o zitoumeno2_1
	./zitoumeno2_1	
	@echo "❗️Open lockcomp.vcd for the waveforms."


dlock: lockcomp.o dlock.o dlock_tb.o
	$(VCS) $(VCS_OPTS) dlock_tb -o zitoumeno2_3
	./zitoumeno2_3	
	@echo "❗️Open dlock_tb.vcd for the waveforms."


clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
	rm -f *.vcd
