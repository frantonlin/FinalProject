`timescale 1 ns / 1 ps
`include "mux.v"

module testMux();
    
    reg signed [7:0] A8;
    reg signed [7:0] B8;
    wire signed [7:0] out8;

    reg signed [23:0] A24;
    reg signed [23:0] B24;
    wire signed [23:0] out24;

    reg sel;

    mux8bit mux8(out8, sel, A8, B8);
    mux24bit mux24(out24, sel, A24, B24);

    initial begin
        $display("A    B    sel | out8  out24");
        A8=-8'd2;B8=8'd3;A24=-24'd2;B24=24'd3;sel=0; #1000;
        $display("%-3d  %-3d  %b   | %-3d   %-3d", A8, B8, sel, out8, out24);
        A8=-8'd2;B8=8'd3;A24=-24'd2;B24=24'd3;sel=1; #1000;
        $display("%-3d  %-3d  %b   | %-3d   %-3d", A8, B8, sel, out8, out24);
    end

endmodule

