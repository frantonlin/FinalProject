`timescale 1 ns / 1 ps
`include "shift.v"

module testShift();
    
    reg signed [52:0] in;
    reg signed [10:0] shiftAmt;
    wire signed [52:0] rightRes, leftRes;

    rightShift53bit shift0(rightRes, shiftAmt, in);
    leftShift53bit shift1(leftRes, shiftAmt, in);

    initial begin
        $display("in                                                     shiftAmt");
        in=53'd654321;shiftAmt=11'd3; #1000;
        $display("%b  %-3d", in, shiftAmt);
        $display("%b", rightRes);
        $display("%b", leftRes);
        in=-53'd654321;shiftAmt=11'd7; #1000;
        $display("%b  %-3d", in, shiftAmt);
        $display("%b", rightRes);
        $display("%b", leftRes);
    end

endmodule

