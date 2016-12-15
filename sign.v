// Compute Output Sign
// op: 0=>add, 1=>sub

module signComputer
(
    output eop,
    output sign,
    input flop,
    input esign,
    input A,
    input B
);
    wire flop, A, B;

    wire AxorB;
    xor (AxorB, A, B);
    xor (eop, flop, AxorB);

    // ADD equal -> add x by A/B sign
    // ADD diff  -> sub x by A sign
    // SUB equal -> sub x by A/B sign
    // SUB diff  -> add x by A sign
    
    assign sign = ~A&eop&esign | A&~eop | A&eop&~esign;

endmodule