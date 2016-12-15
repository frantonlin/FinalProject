`timescale 1 ns / 1 ps
`include "shift.v"

module testShift(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    
    reg [52:0] in;
    reg [10:0] shiftAmt;
    wire [52:0] rightRes, leftRes;

    rightShift53bit shift0(rightRes, shiftAmt, in);
    leftShift53bit shift1(leftRes, shiftAmt, in);

     always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $display("in                                                     shiftAmt");

        // shift by 3
        in=53'd654321;shiftAmt=11'd3; #10;
        // $display("%b  %-3d", in, shiftAmt);
        // $display("%b", rightRes);
        // $display("%b", leftRes);
        if (rightRes != 81790 || leftRes != 5234568) begin
            dutpassed = 0;
        end

        // shift by 7
        in=53'd9007199254086671;shiftAmt=11'd7; #10;
        // $display("%b  %-3d", in, shiftAmt);
        // $display("%b", rightRes);
        // $display("%b", leftRes);
        if (rightRes != 70368744172552 || leftRes != 9007199170987904) begin
            dutpassed = 0;
        end

        #5 endtest = 1;
    end

endmodule
