`timescale 1 ns / 1 ps
`include "fpuAdder.v"

module testFpuAdder(
    input	   		begintest,	// Triggers start of testing
    output reg 		endtest,	// Raise once test completes
    output reg 		dutpassed	// Signal test result
);
    wire [63:0] Z;
    reg op;
    reg [63:0] A, B;

    real Afrac;

    fpuAdder fpuAdder0(Z, op, A, B);

    always @(posedge begintest) begin
        endtest = 0;
        dutpassed = 1;
        // $dumpfile("fpuAdder_all.vcd");
        // $dumpvars();

        $display("A                     op    B                    =  Z");

        // Add same sign positive
        A=$realtobits(3);
        B=$realtobits(4);
        op=0;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(7)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed add same sign positive");
        end

        // Add same sign negative
        A=$realtobits(-3);
        B=$realtobits(-4);
        op=0;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(-7)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed add same sign negative");
        end

        // Add negative first, result positive
        A=$realtobits(-3);
        B=$realtobits(4);
        op=0;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed add negative first, result positive");
        end

        // Add negative first, result negative
        A=$realtobits(-4);
        B=$realtobits(3);
        op=0;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(-1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed add negative first, result negative");
        end

        // Add negative second, result positive
        A=$realtobits(4);
        B=$realtobits(-3);
        op=0;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed add negative second, result positive");
        end

        // Add negative second, result negative
        A=$realtobits(3);
        B=$realtobits(-4);
        op=0;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(-1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed add negative second, result negative");
        end


        // Sub same sign positive, result positive
        A=$realtobits(3);
        B=$realtobits(2);
        op=1;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed sub same sign positive, result positive");
        end

        // Sub same sign positive, result negative
        A=$realtobits(2);
        B=$realtobits(3);
        op=1;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(-1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed sub same sign positive, result negative");
        end

        // Sub same sign negative, result positive
        A=$realtobits(-2);
        B=$realtobits(-3);
        op=1;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed sub same sign negative, result positive");
        end

        // Sub same sign negative, result negative
        A=$realtobits(-3);
        B=$realtobits(-2);
        op=1;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(-1)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed sub same sign negative, result negative");
        end

        // Sub negative first
        A=$realtobits(-2);
        B=$realtobits(3);
        op=1;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(-5)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed sub negative first");
        end

        // Sub negative second
        A=$realtobits(3);
        B=$realtobits(-2);
        op=1;#10
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));
        if (Z != $realtobits(5)) begin
            dutpassed = 0;
            $display("fpuAdder:\tfailed sub negative second");
        end

        // $dumpflush;

        #5 endtest = 1;
    end

endmodule
