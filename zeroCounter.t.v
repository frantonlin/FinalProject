`timescale 1 ns / 1 ps
`include "zeroCounter.v"

module testZeroCounter();
    wire [5:0] numZeroes;
    reg [52:0] value;

    zeroCounter zeroCounter0(numZeroes, {value,{11{1'b1}}});

    initial begin
        $display("value                                                            | numZeroes");
        value=53'b00000000000000000000000000000000000000000000000000000; #1000;
        $display("%b | %d", {value,{11{1'b1}}}, numZeroes);
        value=53'b10001000100010001000100010001000100010001000100010001; #1000;
        $display("%b | %d", {value,{11{1'b1}}}, numZeroes);
        value=53'b00000000000010001000100010001000100010001000100010001; #1000;
        $display("%b | %d", {value,{11{1'b1}}}, numZeroes);
    end

endmodule

