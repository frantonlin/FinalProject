`timescale 1 ns / 1 ps
`include "fpuAdder.v"

module testFpuAdder();
    wire [63:0] Z;
    reg op;
    reg [63:0] A, B;

    real Afrac;

    fpuAdder fpuAdder0(Z, op, A, B);

    initial begin
        $dumpfile("fpuAdder_all.vcd");
        $dumpvars();

        $display("A                     op    B                    =  Z");

        // Add same sign positive
        A=$realtobits(3);
        B=$realtobits(4);
        op=0;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Add same sign negative
        A=$realtobits(-3);
        B=$realtobits(-4);
        op=0;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Add negative first, result positive
        A=$realtobits(-3);
        B=$realtobits(4);
        op=0;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Add negative first, result negative
        A=$realtobits(-4);
        B=$realtobits(3);
        op=0;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Add negative second, result positive
        A=$realtobits(4);
        B=$realtobits(-3);
        op=0;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Add negative second, result negative
        A=$realtobits(3);
        B=$realtobits(-4);
        op=0;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));


        // Sub same sign positive
        A=$realtobits(3);
        B=$realtobits(4);
        op=1;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Sub same sign negative
        A=$realtobits(-3);
        B=$realtobits(-4);
        op=1;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Sub negative first, result positive
        A=$realtobits(-3);
        B=$realtobits(4);
        op=1;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Sub negative first, result negative
        A=$realtobits(-4);
        B=$realtobits(3);
        op=1;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Sub negative second, result positive
        A=$realtobits(4);
        B=$realtobits(-3);
        op=1;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        // Sub negative second, result negative
        A=$realtobits(3);
        B=$realtobits(-4);
        op=1;#1000;
        // $display();
        // $display("%s * 2^%-1d * %f  %s  %s * 2^%-1d * %f  =  %s * 2^%-1d * %f    %b", A[63]?"-1":"+1",$signed(A[62:52]-1023),$itor({1'b1,A[51:22]})*(2.0**-30.0), op?"MINUS":"PLUS", B[63]?"-1":"+1",$signed(B[62:52]-1023),$itor({1'b1,B[51:22]})*(2.0**-30.0), Z[63]?"-1":"+1",$signed(Z[62:52]-1023),$itor({1'b1,Z[51:22]})*(2.0**-30.0), Z);
        $display("%f %s %f = %f", $bitstoreal(A), op?"-":"+", $bitstoreal(B), $bitstoreal(Z));

        $dumpflush;
    end

endmodule
