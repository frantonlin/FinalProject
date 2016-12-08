`timescale 1 ns / 1 ps
`include "sign.v"

module testSign();
    wire eop, sign;
    reg flop, esign, A, B;

    signComputer signComputer0(eop, sign, flop, esign, A, B);

    initial begin
        $display("A  B  flop  esign | eop  sign");
        A=0;B=0;flop=0;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=0;B=0;flop=0;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=0;B=0;flop=1;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=0;B=0;flop=1;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);

        A=0;B=1;flop=0;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=0;B=1;flop=0;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=0;B=1;flop=1;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=0;B=1;flop=1;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);

        A=1;B=0;flop=0;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=1;B=0;flop=0;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=1;B=0;flop=1;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=1;B=0;flop=1;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);

        A=1;B=1;flop=0;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=1;B=1;flop=0;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=1;B=1;flop=1;esign=0; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        A=1;B=1;flop=1;esign=1; #1000;
        $display("%b  %b  %b     %b     | %b    %b", A, B, eop, esign, eop, sign);
        
    end

endmodule

