// 53-bit Right and Left Shifters by 11-bit Shift Amount
// TODO: implement as barrel shift

module rightShift53bit
(
    output [52:0] res,
    input [10:0] shiftAmt,
    input [52:0] in
);
    wire signed [10:0] shiftAmt;
    wire signed [52:0] in;
    
    assign res = in >> shiftAmt;

endmodule


module leftShift53bit
(
    output [52:0] res,
    input [10:0] shiftAmt,
    input [52:0] in
);
    wire signed [10:0] shiftAmt;
    wire signed [52:0] in;
    
    assign res = in << shiftAmt;
    
endmodule
