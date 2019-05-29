module mux2to1(out, A, B, sel);
   output [15:0] out;
    input [15:0] A,B;
    input sel;
    reg [15:0] out

    always @(A or B or sel)
        if (sel ==1'b0)
            out = A;
        else
            out = B;
endmodule
