CC=iverilog
OUT=run.out

all:
	echo "make {slt, diff, mux, shift, adder, sign, zero, fpuAdder}"

slt: slt.v slt.t.v
	$(CC) -o $(OUT) slt.t.v && ./$(OUT)

diff: diff.v diff.t.v
	$(CC) -o $(OUT) diff.t.v && ./$(OUT)

mux: mux.v mux.t.v
	$(CC) -o $(OUT) mux.t.v && ./$(OUT)

shift: shift.v shift.t.v
	$(CC) -o $(OUT) shift.t.v && ./$(OUT)

adder: adder.v adder.t.v
	$(CC) -o $(OUT) adder.t.v && ./$(OUT)

sign: sign.v sign.t.v
	$(CC) -o $(OUT) sign.t.v && ./$(OUT)

zero: zeroCounter.v zeroCounter.t.v
	$(CC) -o $(OUT) zeroCounter.t.v && ./$(OUT)

fpuAdder: fpuAdder.v fpuAdder.t.v
	$(CC) -o $(OUT) fpuAdder.t.v && ./$(OUT)

clean:
	rm -r $(OUT)
