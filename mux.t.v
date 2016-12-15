`timescale 1 ns / 1 ps
`include "mux.v"

module testMux();
    
    reg signed [10:0] A11;
    reg signed [10:0] B11;
    wire signed [10:0] out11;

    reg signed [52:0] A53;
    reg signed [52:0] B53;
    wire signed [52:0] out53;

    reg sel;

    mux11bit mux11(out11, sel, A11, B11);
    mux53bit mux53(out53, sel, A53, B53);

    initial begin
        $display("A    B    sel | out11  out53");
        A11=-11'd2;B11=11'd3;A53=-53'd2;B53=53'd3;sel=0; #1000;
        $display("%-3d  %-3d  %b   | %-3d   %-3d", A11, B11, sel, out11, out53);
        A11=-11'd2;B11=11'd3;A53=-53'd2;B53=53'd3;sel=1; #1000;
        $display("%-3d  %-3d  %b   | %-3d   %-3d", A11, B11, sel, out11, out53);
    end

endmodule

