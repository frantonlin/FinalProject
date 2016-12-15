// Tests all parts of FPU and checks if correct

`include "mux.t.v"
`include "diff.t.v"
`include "shift.t.v"
`include "adder.t.v"
`include "sign.t.v"
`include "zeroCounter.t.v"
`include "fpuAdder.t.v"

module testAll();

    // mux
    reg muxbegin;
    wire muxended, muxpassed;
    testMux testMux0(muxbegin, muxended, muxpassed);

    // diff
    reg diffbegin;
    wire diffended, diffpassed;
    testDiff testDiff0(diffbegin, diffended, diffpassed);

    // shift
    reg shiftbegin;
    wire shiftended, shiftpassed;
    testShift testShift0(shiftbegin, shiftended, shiftpassed);

    // adder
    reg adderbegin;
    wire adderended, adderpassed;
    testAdder testAdder0(adderbegin, adderended, adderpassed);

    // sign
    reg signbegin;
    wire signended, signpassed;
    testSign testSign0(signbegin, signended, signpassed);

    // zero
    reg zerobegin;
    wire zeroended, zeropassed;
    testZeroCounter testZeroCounter0(zerobegin, zeroended, zeropassed);

    // fpuAdder
    reg fpuAdderbegin;
    wire fpuAdderended, fpuAdderpassed;
    testFpuAdder testFpuAdder0(fpuAdderbegin, fpuAdderended, fpuAdderpassed);


    initial begin
        // test mux
        muxbegin = 1; #10 muxbegin = 0;
    end

    always @(posedge muxended) begin
        $display("mux passed:\t%s", muxpassed ? "YES" : "NO ");
        // test diff
        diffbegin = 1; #10 diffbegin = 0;
    end

    always @(posedge diffended) begin
        $display("diff passed:\t%s", diffpassed ? "YES" : "NO ");
        // test shift
        shiftbegin = 1; #10 shiftbegin = 0;
    end

    always @(posedge shiftended) begin
        $display("shift passed:\t%s", shiftpassed ? "YES" : "NO ");
        // test adder
        adderbegin = 1; #10 adderbegin = 0;
    end

    always @(posedge adderended) begin
        $display("adder passed:\t%s", adderpassed ? "YES" : "NO ");
        // test sign
        signbegin = 1; #10 signbegin = 0;
    end

    always @(posedge signended) begin
        $display("sign passed:\t%s", signpassed ? "YES" : "NO ");
        // test zeroCounter
        zerobegin = 1; #10 zerobegin = 0;
    end

    always @(posedge zeroended) begin
        $display("zero passed:\t%s", zeropassed ? "YES" : "NO ");
        // test fpuAdder
        fpuAdderbegin = 1; #10 fpuAdderbegin = 0;
    end

    always @(posedge fpuAdderended) begin
        $display("fpuAdder passed:\t%s", fpuAdderpassed ? "YES" : "NO ");

        if (!muxpassed || !diffpassed || !shiftpassed || !adderpassed || !signpassed || !zeropassed || !fpuAdderpassed) begin
            $display("TESTS FAILED");
        end else begin
            $display("TESTS PASSED");
        end
    end

endmodule