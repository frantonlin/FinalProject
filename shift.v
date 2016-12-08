// 24-bit Right and Left Shifters by 8-bit Shift Amount
// TODO: implement as barrel shift

module rightShift24bit
(
    output [23:0] res,
    input [7:0] shiftAmt,
    input [23:0] in
);
    wire signed [7:0] shiftAmt;
    wire signed [23:0] in;
    
    assign res = in >> shiftAmt;

endmodule


module leftShift24bit
(
    output [23:0] res,
    input [7:0] shiftAmt,
    input [23:0] in
);
    wire signed [7:0] shiftAmt;
    wire signed [23:0] in;
    
    assign res = in << shiftAmt;
    
endmodule
