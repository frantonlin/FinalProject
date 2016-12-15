`timescale 1 ns / 1 ps
`include "mux.v"

module testMux(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    reg [10:0] A11;
    reg [10:0] B11;
    wire [10:0] out11;

    reg [52:0] A53;
    reg [52:0] B53;
    wire [52:0] out53;

    reg sel;

    mux11bit mux11(out11, sel, A11, B11);
    mux53bit mux53(out53, sel, A53, B53);

    always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $display("A    B    sel | out11  out53");

        // select 0
        A11=11'd321;B11=11'd12;A53=53'd321;B53=53'd12;sel=0; #10
        // $display("%-3d  %-3d  %b   | %-3d    %-3d", A11, B11, sel, out11, out53);
        if (out11 != A11 || out53 != A53) begin
            dutpassed = 0;
        end

        // select 1
        sel=1; #10
        // $display("%-3d  %-3d  %b   | %-3d    %-3d", A11, B11, sel, out11, out53);
        if (out11 != B11 || out53 != B53) begin
            dutpassed = 0;
        end

        #5 endtest = 1;
    end

endmodule

