// 32-bit Floating Point Add/Sub
// // op: 0=>add, 1=>sub

`include "diff.v"
// `include "mux.v"
`include "shift.v"
`include "adder.v"
`include "sign.v"
`include "zeroCounter.v"

module fpuAdder
(
    output [31:0] Z,
    input op,
    input [31:0] A,
    input [31:0] B
);

    // break out operands
    wire Asign, Bsign;
    wire [7:0] Aexp, Bexp;
    wire [22:0] Afrac, Bfrac;
    assign Asign = A[31];
    assign Bsign = B[31];
    assign Aexp = A[30:23];
    assign Bexp = B[30:23];
    assign Afrac = A[22:0];
    assign Bfrac = B[22:0]; 

    // diff and slt of exponents
    wire [7:0] expDiff;
    wire expSlt, expOvfl;
    expDiff expDiff0(expDiff, expSlt, ovfl, Aexp, Bexp);

    // muxes to select corresponding frac, exponent, and signs based on exponent slt
    wire [23:0] smallerFrac;
    wire [23:0] largerFrac;
    wire [7:0] largerExp;
    wire smallerSign;
    wire largerSign;
    mux24bit muxFrac0(smallerFrac, expSlt, {1'b1,Bfrac}, {1'b1,Afrac});
    mux24bit muxFrac1(largerFrac, expSlt, {1'b1,Afrac}, {1'b1,Bfrac});
    mux8bit muxExp(largerExp, expSlt, Aexp, Bexp);
    assign smallerSign = expSlt ? Asign : Bsign;
    assign largerSign = expSlt ? Bsign : Asign;

    // right shift fraction of smaller exponent
    wire [23:0] smallerFracShifted;
    rightShift24bit shiftFrac(smallerFracShifted, expDiff, smallerFrac);

    // effective operator and sign calculator
    wire eop, Zsign, esign;
    signComputer signComputer0(eop, Zsign, op, esign, largerSign, smallerSign);

    // fraction add/sub
    wire [23:0] adderOut;
    wire cout;
    adder fracAdder(adderOut, esign, cout, eop, largerFrac, smallerFrac);

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
    wire [4:0] numZeroes;
    zeroCounter zeroCounter0(numZeroes, adderOut);

    // normalize fraction
    wire [23:0] coutShift, zeroesShift, Zfrac;
    rightShift24bit rightShift(coutShift, 8'b1, adderOut);
    leftShift24bit leftShift(zeroesShift, {{3{1'b0}},numZeroes}, adderOut);
    mux24bit normalizeFrac(Zfrac, cout, zeroesShift, coutShift);

    // normalize exponent
    wire [7:0] Zexp;
    mux8bit normalizeExp(Zexp, cout, largerExp-{{3{1'b0}},numZeroes}, largerExp+8'b1);

    assign Z = {Zsign, Zexp, Zfrac[22:0]};

endmodule