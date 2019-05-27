`timescale 1ns / 100ps

module tb1to2demux;
    wire otA, missA, otB, missB;
    reg [2:0] addr;
    reg miss;
    reg otcome;
    reg clk;

        muxonetotwo UUT(otA, missA, otB, missB, addr, otcome, miss);

    always
        #10 clk = ~clk;

    initial begin
        $timeformat(-9, 1, " ns", 6);
        clk = 1'b0;
        addr = 3'b001;
        otcome = 1'b1;
        miss = 1'b0;

        @(negedge clk)
         addr <= 3'b001;
        @(negedge clk)
         addr <= 3'b010;
        @(negedge clk)
         addr <= 3'b001;
        @(negedge clk)
        addr <= 3'b010;
        @(negedge clk)
        addr <= 3'b001;
        @(negedge clk)
         $finish;    
    end
    
    always @(otA or otB or missA or missB)
        #1 $display("At t=%t otA=%b otB=%h missA=%h missB = %h", $time, otA, otB, missA, missB);

endmodule