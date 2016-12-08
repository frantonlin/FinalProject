// Multiplexors

module mux24bit
(
    output [23:0] out,
    input sel,
    input [23:0] A,
    input [23:0] B
);
    wire sel;
    wire signed [23:0] A, B;
    assign out = sel ? B : A;
endmodule

module mux8bit
(
    output [7:0] out,
    input sel,
    input [7:0] A,
    input [7:0] B
);
    wire sel;
    wire signed [7:0] A, B;
    assign out = sel ? B : A;
    // assign out = ~A+1;
endmodule