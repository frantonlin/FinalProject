`timescale 1 ns / 1 ps
`include "sign.v"

module testSign(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    wire eop, sign;
    reg flop, esign, A, B;

    signComputer signComputer0(eop, sign, flop, esign, A, B);

    always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $display("A  B  flop  esign | eop  sign");

        // positive A and B
        A=0;B=0;flop=0;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || sign) begin
          dutpassed = 0;
        end
        A=0;B=0;flop=0;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || sign) begin
          dutpassed = 0;
        end
        A=0;B=0;flop=1;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || sign) begin
          dutpassed = 0;
        end
        A=0;B=0;flop=1;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || !sign) begin
          dutpassed = 0;
        end

        // positive A, negative B
        A=0;B=1;flop=0;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || sign) begin
          dutpassed = 0;
        end
        A=0;B=1;flop=0;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || !sign) begin
          dutpassed = 0;
        end
        A=0;B=1;flop=1;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || sign) begin
          dutpassed = 0;
        end
        A=0;B=1;flop=1;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || sign) begin
          dutpassed = 0;
        end

        // positive B, negative A
        A=1;B=0;flop=0;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || !sign) begin
          dutpassed = 0;
        end
        A=1;B=0;flop=0;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || sign) begin
          dutpassed = 0;
        end
        A=1;B=0;flop=1;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || !sign) begin
          dutpassed = 0;
        end
        A=1;B=0;flop=1;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || !sign) begin
          dutpassed = 0;
        end

        // negative A and B
        A=1;B=1;flop=0;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || !sign) begin
          dutpassed = 0;
        end
        A=1;B=1;flop=0;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (eop || !sign) begin
          dutpassed = 0;
        end
        A=1;B=1;flop=1;esign=0; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || !sign) begin
          dutpassed = 0;
        end
        A=1;B=1;flop=1;esign=1; #10;
        // $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        if (!eop || sign) begin
          dutpassed = 0;
        end

        #5 endtest = 1;
    end

endmodule

