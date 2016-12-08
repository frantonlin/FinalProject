// 25-bit Adder/Subtractor
// op: 0=>add, 1=>sub
// `include "mux.v"

module adder
(
    output [23:0] res,
    output sign,
    output cout,
    input op,
    input [23:0] A,
    input [23:0] B
);
    wire op;
    wire [23:0] A, B;

    reg signed [24:0] signedRes;
    reg signedCout;
    
    assign sign = signedRes[24] & ~cout;

    always @(op or A or B) begin
        if (!op) begin
            {signedCout, signedRes} = A + B;
        end else begin
            {signedCout, signedRes} = A - B;
        end
        // $display("%b",signedRes);
    end

    xor (cout, signedRes[24], signedCout);
    mux24bit mux(res, sign, signedRes[23:0], ~signedRes[23:0]+24'b1);

endmodule