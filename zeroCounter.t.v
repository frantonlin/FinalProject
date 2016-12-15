`timescale 1 ns / 1 ps
`include "zeroCounter.v"

module testZeroCounter(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    wire [5:0] numZeroes;
    reg [52:0] value;

    zeroCounter zeroCounter0(numZeroes, {value,{11{1'b1}}});

    always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $display("value                                                            | numZeroes");

        // 53 leading zeroes
        value=53'b00000000000000000000000000000000000000000000000000000; #10;
        // $display("%b | %d", {value,{11{1'b1}}}, numZeroes);
        if (numZeroes != 53) begin
            dutpassed = 0;
        end

        // 0 leading zeroes
        value=53'b10001000100010001000100010001000100010001000100010001; #10;
        // $display("%b | %d", {value,{11{1'b1}}}, numZeroes);
        if (numZeroes != 0) begin
            dutpassed = 0;
        end

        // 12 leading zeroes
        value=53'b00000000000010001000100010001000100010001000100010001; #10;
        // $display("%b | %d", {value,{11{1'b1}}}, numZeroes);
        if (numZeroes != 12) begin
            dutpassed = 0;
        end

        #5 endtest = 1;
    end

endmodule
