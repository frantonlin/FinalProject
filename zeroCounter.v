// Count Number of Leading Zeroes

module zeroCounter
(
    output [4:0] numZeroes,
    input [23:0] value
);
    wire [23:0] value;
    wire [31:0] val32;
    wire [15:0] val16;
    wire [7:0] val8;
    wire [3:0] val4;

    assign val32 = {value, {8{1'b1}}};

    assign numZeroes[4] = (val32[31:16] == 16'b0);
    assign val16 = numZeroes[4] ? {val32[15:0]} : val32[31:16];
    assign numZeroes[3] = (val16[15:8] == 8'b0);
    assign val8      = numZeroes[3] ? val16[7:0] : val16[15:8];
    assign numZeroes[2] = (val8[7:4] == 4'b0);
    assign val4      = numZeroes[2] ? val8[3:0] : val8[7:4];
    assign numZeroes[1] = (val4[3:2] == 2'b0);
    assign numZeroes[0] = numZeroes[1] ? ~val4[1] : ~val4[3];

endmodule