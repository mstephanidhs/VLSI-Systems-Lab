SHELL = /bin/bash
VCS = vcs -full64
VLOGAN = vlogan -full64

VLOGAN_OPTS = -nc
VCS_OPTS = -q -debug_access+all -timescale=10ns/1ns
GUI_OPTS = -gui=dve

SRC_DIR = src
VPATH=$(SRC_DIR)

%.o: %.v
	@echo "Compile $<"
	$(VLOGAN) $(VLOGAN_OPTS) $<
	touch $@

example1: 
	$(VCS) $(VCS_OPTS) $(SRC_DIR)/adder.v -o ex1
	./ex1 $(GUI_OPTS)

example2: 
	$(VCS) $(VCS_OPTS) $(SRC_DIR)/mac.v -o ex2
	./ex2 $(GUI_OPTS)
	
example3: fulladder.o rca.o adder_tb.o 
	$(VCS) $(VCS_OPTS) adder_tb -o ex3
	./ex3 $(GUI_OPTS)

example4: rca.o fulladder.o adder_tb2.o 
	$(VCS) $(VCS_OPTS) -pvalue+adder_tb2.fileout='\"ex4_res\"' adder_tb2 -o ex4
	./ex4
	@echo -e "\nCheking the outputs\n"
	@awk '{if (($$1 + $$2)!=$$3){print "error in: "$$0;er=1 }}END{if (er!=1){print "Tests passed!"}}' ex4_res


zitoumeno1: fulladder.o rca.o adder_tb.o 
	$(VCS) $(VCS_OPTS) adder_tb -o zitoumeno1
	./zitoumeno1 $(GUI_OPTS)

zitoumeno2: mac.o mac_tb.o 
	$(VCS) $(VCS_OPTS) mac_tb -o zitoumeno2
	./zitoumeno2
	python3 $(SRC_DIR)/test_mac_results.py ./mac_tb_result.txt

zitoumeno3: count.o count_tb.o
	$(VCS) $(VCS_OPTS) count_tb -o zitoumeno3
	./zitoumeno3 $(GUI_OPTS)

clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
	rm -f mac_tb_result.txt

