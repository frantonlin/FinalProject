// Multiplexors

module mux53bit
(
    output [52:0] out,
    input sel,
    input [52:0] A,
    input [52:0] B
);
    wire sel;
    wire signed [52:0] A, B;
    assign out = sel ? B : A;
endmodule

module mux11bit
(
    output [10:0] out,
    input sel,
    input [10:0] A,
    input [10:0] B
);
    wire sel;
    wire signed [10:0] A, B;
    assign out = sel ? B : A;
    // assign out = ~A+1;
endmodule