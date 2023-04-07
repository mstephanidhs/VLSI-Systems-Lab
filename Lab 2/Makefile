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


decoder: decoder.o decoder_tb.o
	$(VCS) $(VCS_OPTS) decoder_tb -o zitoumeno1_12
	./zitoumeno1_12

	$(VCS) $(VCS_OPTS) -pvalue+decoder_tb.dec_size=4 decoder_tb -o zitoumeno1_3
	./zitoumeno1_3

zer_decoder: decoder.o zer_decoder_tb.o
	$(VCS) $(VCS_OPTS) zer_decoder_tb -o zer_decoder
	./zer_decoder

shift_reg: shift_reg.o shift_reg_tb.o
	$(VCS) $(VCS_OPTS) shift_reg_tb -o zitoumeno2
	./zitoumeno2 

zer_shift_reg: shift_reg.o zer_shift_reg_tb.o
	$(VCS) $(VCS_OPTS) zer_shift_reg_tb -o zer_shift_reg
	./zer_shift_reg

accumulator: shift_reg.o accumulator.o accumulator_tb.o
	$(VCS) $(VCS_OPTS) accumulator_tb -o zitoumeno3
	./zitoumeno3 

zer_accumulator: shift_reg.o accumulator.o zer_accumulator_tb.o
	$(VCS) $(VCS_OPTS) zer_accumulator_tb -o zer_accumulator
	./zer_accumulator 

alu: alu.o alu_tb.o
	$(VCS) $(VCS_OPTS) alu_tb -o zitoumeno4
	./zitoumeno4 
	python3 $(SRC_DIR)/test_alu_results.py ./alu_tb_result.txt

zer_alu: alu.o zer_alu_tb.o 
	$(VCS) $(VCS_OPTS) zer_alu_tb -o zer_alu
	./zer_alu 


clean:
	rm -f -r zitoumeno*
	rm -f -r ex*
	rm -f *.o
