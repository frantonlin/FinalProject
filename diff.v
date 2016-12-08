// 8-bit Exponent Difference
`include "mux.v"

module expDiff
(
    output [7:0] diff,
    output slt,
    output ovfl,
    input [7:0] A,
    input [7:0] B
);
    wire [7:0] A, B;
    wire cout;
    wire signed [7:0] sub;
    assign {cout, sub} = A - B;
    assign slt = sub[7];

    mux8bit mux(diff, slt, sub, ~sub+8'b1);
    xor (ovfl, slt, cout);

endmodule