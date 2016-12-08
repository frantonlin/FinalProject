`timescale 1 ns / 1 ps
`include "shift.v"

module testShift();
    
    reg signed [23:0] in;
    reg signed [7:0] shiftAmt;
    wire signed [23:0] rightRes, leftRes;

    rightShift24bit shift0(rightRes, shiftAmt, in);
    leftShift24bit shift1(leftRes, shiftAmt, in);

    initial begin
        $display("in                        shiftAmt | rightRes                  leftRes");
        in=24'd654321;shiftAmt=8'd3; #1000;
        $display("%b  %-3d      | %b  %b", in, shiftAmt, rightRes, leftRes);
        in=-24'd654321;shiftAmt=8'd7; #1000;
        $display("%b  %-3d      | %b  %b", in, shiftAmt, rightRes, leftRes);
    end

endmodule

