`timescale 1 ns / 1 ps
`include "zeroCounter.v"

module testZeroCounter();
    wire [4:0] numZeroes;
    reg [23:0] value;

    zeroCounter zeroCounter0(numZeroes, value);

    initial begin
        $display("value                    | numZeroes");
        value=24'b000000000000000000000000; #1000;
        $display("%b | %d", value, numZeroes);
        value=24'b100010001000100010001000; #1000;
        $display("%b | %d", value, numZeroes);
        value=24'b000000000000100010001000; #1000;
        $display("%b | %d", value, numZeroes);
    end

endmodule

