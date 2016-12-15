`timescale 1 ns / 1 ps
`include "diff.v"

module testDiff(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    
    reg [10:0] A;
    reg [10:0] B;

    wire slt;
    wire ovfl;
    wire [10:0] diff;

    expDiff diff0(diff, slt, ovfl, A, B);

    always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $display("A     B    | diff  slt  ovfl");

        // A > B
        A=11'd200;B=11'd180; #10;
        // $display("%-4d  %-4d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        if (diff != 20 || slt || ovfl) begin
            dutpassed = 0;
        end
        
        // A < B
        A=11'd127;B=11'd200; #10;
        // $display("%-4d  %-4d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        if (diff != 73 || !slt || ovfl) begin
            dutpassed = 0;
        end

        // overflow test
        A=11'd30;B=11'd2020; #10;
        // $display("%-4d  %-4d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        if (!ovfl) begin
            dutpassed = 0;
        end

        // zero test
        A=11'd200;B=11'd200; #10;
        // $display("%-4d  %-4d | %-4d  %b    %b", A, B, diff, slt, ovfl);
        if (diff != 0 || slt || ovfl) begin
            dutpassed = 0;
        end

        #5 endtest = 1;
    end

endmodule
