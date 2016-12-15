// 32-bit Floating Point Add/Sub
// // op: 0=>add, 1=>sub

// `include "diff.v"
// `include "mux.v"
// `include "shift.v"
// `include "adder.v"
// `include "sign.v"
// `include "zeroCounter.v"

module fpuAdder
(
    output [63:0] Z,
    input op,
    input [63:0] A,
    input [63:0] B
);

    // break out operands
    wire Asign, Bsign;
    wire [10:0] Aexp, Bexp;
    wire [51:0] Afrac, Bfrac;
    assign Asign = A[63];
    assign Bsign = B[63];
    assign Aexp = A[62:52];
    assign Bexp = B[62:52];
    assign Afrac = A[51:0];
    assign Bfrac = B[51:0]; 

    // diff and slt of exponents
    wire [10:0] expDiff;
    wire expSlt, expOvfl;
    expDiff expDiff0(expDiff, expSlt, expOvfl, Aexp, Bexp);

    // muxes to select corresponding frac, exponent, and signs based on exponent slt
    wire [52:0] smallerFrac;
    wire [52:0] largerFrac;
    wire [10:0] largerExp;
    wire smallerSign;
    wire largerSign;
    mux53bit muxFrac0(smallerFrac, expSlt, {1'b1,Bfrac}, {1'b1,Afrac});
    mux53bit muxFrac1(largerFrac, expSlt, {1'b1,Afrac}, {1'b1,Bfrac});
    mux11bit muxExp(largerExp, expSlt, Aexp, Bexp);
    assign smallerSign = expSlt ? Asign : Bsign;
    assign largerSign = expSlt ? Bsign : Asign;

    // right shift fraction of smaller exponent
    wire [52:0] smallerFracShifted;
    rightShift53bit shiftFrac(smallerFracShifted, expDiff, smallerFrac);

    // effective operator and sign calculator
    wire eop, Zsign, esign;
    signComputer signComputer0(eop, Zsign, op, esign, largerSign, smallerSign);

    // fraction add/sub
    wire [52:0] adderOut;
    wire ovfl;
    adder fracAdder(adderOut, esign, ovfl, eop, largerFrac, smallerFracShifted);

    // always @(adderOut) begin
    //     $display("%b", adderOut);
    // end
    // always @(largerExp) begin
    //     $display("%d", largerExp);
    // end

    // always @(largerFrac) begin
    //     $display("larger: %f", $itor(largerFrac)*(2.0**-23.0));
    // end
    // always @(smallerFrac) begin
    //     $display("smaller: %f", $itor(smallerFrac)*(2.0**-23.0));
    // end

    // count leading zeroes
    wire [5:0] numZeroes;
    zeroCounter zeroCounter0(numZeroes, {adderOut,{11{1'b1}}});

    // normalize fraction
    wire [52:0] ovflShift, zeroesShift, Zfrac;
    rightShift53bit rightShift(ovflShift, 11'b1, adderOut);
    leftShift53bit leftShift(zeroesShift, {{5{1'b0}},numZeroes}, adderOut);
    mux53bit normalizeFrac(Zfrac, ovfl, zeroesShift, ovflShift);

    // normalize exponent
    wire [10:0] Zexp;
    mux11bit normalizeExp(Zexp, ovfl, largerExp-{{5{1'b0}},numZeroes}, largerExp+11'b1);

    assign Z = {Zsign, Zexp, Zfrac[51:0]};

endmodule