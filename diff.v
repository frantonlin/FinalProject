// 8-bit Exponent Difference
// `include "mux.v"

module expDiff
(
    output [10:0] diff,
    output slt,
    output ovfl,
    input [10:0] A,
    input [10:0] B
);
    wire [10:0] A, B;
    wire cout;
    wire signed [10:0] sub;
    assign {cout, sub} = A - B;
    assign slt = sub[10];

    mux11bit mux(diff, slt, sub, ~sub+11'b1);
    xor (ovfl, slt, cout);

endmodule