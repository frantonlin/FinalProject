// 52-bit Adder/Subtractor
// op: 0=>add, 1=>sub
// `include "mux.v"

module adder
(
    output [52:0] res,
    output sign,
    output cout,
    input op,
    input [52:0] A,
    input [52:0] B
);
    wire op;
    wire [52:0] A, B;

    reg signed [53:0] signedRes;
    reg signedCout;
    
    assign sign = signedRes[53] & ~cout;

    always @(op or A or B) begin
        if (!op) begin
            {signedCout, signedRes} = A + B;
        end else begin
            {signedCout, signedRes} = A - B;
        end
        // $display("%b",signedRes);
    end

    xor (cout, signedRes[53], signedCout);
    mux53bit mux(res, sign, signedRes[52:0], ~signedRes[52:0]+53'b1);

endmodule