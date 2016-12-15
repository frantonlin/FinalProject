`timescale 1 ns / 1 ps
`include "adder.v"

module testAdder();
    
    reg op;
    reg [52:0] A, B;
    wire [52:0] res;
    wire sign, cout;

    adder adder0(res, sign, cout, op, A, B);

    initial begin
        $display("A         B         op  | res       sign  cout");
        A=53'd7380000;B=53'd8607;op=0; #1000;
        $display("%-8d  %-8d  %b   | %-8d  %b     %b", A, B, op, res, sign, cout);
        A=53'd7380000;B=53'd8607;op=1; #1000;
        $display("%-8d  %-8d  %b   | %-8d  %b     %b", A, B, op, res, sign, cout);
        A=53'd17;B=53'd20;op=1; #1000;
        $display("%-8d  %-8d  %b   | %-8d  %b     %b", A, B, op, res, sign, cout);
        A=53'd20;B=53'd16777200;op=0; #1000;
        $display("%-8d  %-8d  %b   | %-8d  %b     %b", A, B, op, res, sign, cout);
        // A=53'd17;B=53'd16777200;op=0; #1000;
        // $display("%-8d  %-8d  %b   | %-8d  %b     %b", A, B, op, res, sign, cout);
    end

endmodule

