//1bit comparator testbench

`timescale 1ns / 100ps

module tb1bitcomp;
    wire eq;
    reg [2:0] addr;
    reg i0;
    reg i1;
    reg clk;

        onebitcomp UUT(eq, addr, i0, i1);

    always
        #10 clk = ~clk;

    initial begin
        $timeformat(-9, 1, " ns", 6);
        clk = 1'b0;
        addr = 3'b001;
        i0 = 1'b0;
        i1 = 1'b0;

        @(negedge clk)
         i0 <= 1'b1;
         i1 <= 1'b0;
        @(negedge clk)
         i0 <= 1'b1;
         i1 <= 1'b1;
        @(negedge clk)
         i0 <= 1'b0;
         i1 <= 1'b1;
        @(negedge clk)
         i0 <= 1'b0;
         i1 <= 1'b0;
        @(negedge clk)
         $finish;    
    end
    
    always @(i0 or i1)
        #1 $display("At t=%t otA=%b otB=%h missA=%h missB = %h", $time, otA, otB, missA, missB);

endmodule
