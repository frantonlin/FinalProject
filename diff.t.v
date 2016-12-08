`timescale 1 ns / 1 ps
`include "diff.v"

module testDiff();
    
    reg [7:0] A;
    reg [7:0] B;

    wire slt;
    wire ovfl;
    wire [7:0] diff;

    expDiff diff0(diff, slt, ovfl, A, B);

    initial begin
        $display("A    B   | diff  slt  ovfl");
        A=8'd200;B=8'd180; #1000;
        $display("%-3d  %-3d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        A=8'd127;B=8'd200; #1000;
        $display("%-3d  %-3d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        A=8'd30;B=8'd240; #1000;
        $display("%-3d  %-3d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        A=8'd200;B=8'd200; #1000;
        $display("%-3d  %-3d | %-4d  %b    %b", A, B, diff, slt, ovfl);
    end

endmodule

