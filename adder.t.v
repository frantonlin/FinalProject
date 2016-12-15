`timescale 1 ns / 1 ps
`include "adder.v"

module testAdder(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    reg op;
    reg [52:0] A, B;
    wire [52:0] res;
    wire sign, ovfl;

    adder adder0(res, sign, ovfl, op, A, B);

    always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $display("A                 B                 op  | res               sign  ovfl");

        // basic add
        A=53'd9007100000000000;B=53'd99200000000;op=0; #10;
        // $display("%-16d  %-16d  %b   | %-16d  %b     %b", A, B, op, res, sign, ovfl);
        if (res != 9007199200000000 || sign || ovfl) begin
            dutpassed = 0;
            $display("adder:\t\tfailed basic add");
        end

        // add that overflows
        A=53'd9007100000000000;B=53'd99400000000;op=0; #10;
        // $display("%-16d  %-16d  %b   | %-16d  %b     %b", A, B, op, res, sign, ovfl);
        if (sign || !ovfl) begin
            dutpassed = 0;
            $display("adder:\t\tfailed overflow add");
        end

        // basic sub to positive
        A=53'd20;B=53'd17;op=1; #10;
        // $display("%-16d  %-16d  %b   | %-16d  %b     %b", A, B, op, res, sign, ovfl);
        if (res != 3 || sign || ovfl) begin
            dutpassed = 0;
            $display("adder:\t\tfailed basic sub");
        end

        // basic sub to negative
        A=53'd99400000000;B=53'd9007100000000000;op=1; #10;
        // $display("%-16d  %-16d  %b   | %-16d  %b     %b", A, B, op, res, sign, ovfl);
        if (res != 9007000600000000 || !sign || ovfl) begin
            dutpassed = 0;
            $display("adder:\t\tfailed basic sub");
        end

        #5 endtest = 1;
    end

endmodule

