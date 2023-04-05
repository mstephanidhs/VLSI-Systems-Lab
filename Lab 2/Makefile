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


decoder: decoder.o decoder_tb.o
	$(VCS) $(VCS_OPTS) decoder_tb -o zitoumeno1_12
	./zitoumeno1_12

	$(VCS) $(VCS_OPTS) -pvalue+decoder_tb.dec_size=4 decoder_tb -o zitoumeno1_3
	./zitoumeno1_3

zer_decoder: decoder.o zer_decoder_tb.o
	$(VCS) $(VCS_OPTS) zer_decoder_tb -o zer_dec
	./zer_dec


shift_reg: shift_reg.o shift_reg_tb.o
	$(VCS) $(VCS_OPTS) shift_reg_tb -o zitoumeno2
	./zitoumeno2 

zer_shift_reg: shift_reg.o zer_shift_reg_tb.o
	$(VCS) $(VCS_OPTS) zer_shift_reg_tb -o zer_sr
	./zer_sr

accumulator: shift_reg.o accumulator.o accumulator_tb.0
	$(VCS) $(VCS_OPTS) accumulator_tb -o zitoumeno3
	./zitoumeno3

alu: alu.o alu_tb.o
	$(VCS) $(VCS_OPTS) alu_tb -o zitoumeno4
	./zitoumeno4


clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
