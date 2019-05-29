`timescale 1ns / 100ps

module tb2to1mux;
    wire [15:0] MuxOut;
    reg [15:0] A, B;
    reg sel;
    reg clk;

        mux_2to1 BUT(MuxOut, A, B, sel);

    always
        #10 clk ~= clk;

    initial begin
        $timeformat(-9, 1, " ns", 6);
        clk = 1'b0;
        A = 16'hAAAA; B = 16'h5555; sel = 1'b0;

        @(negedge clk)
         A = 16'h0000;
        @(negedge clk)
         sel = 1'bl;
        @(negedge clk)
         B = 16'hffff;
        @(negedge clk)
         A = 16'hA5A5;
        @(negedge clk)
         sel = 1'b0;

        @(negedge clk)
         $finish;    
    end
    
    always @(A or B or sel)
        #1 $display("At t=%t sel=%b A=%h B=%h MuxOut = %h", $time, sel, A, B, MuxOut);

endmodule