module muxonetotwo(otA, missA, otB, missB, addr, otcome, miss);
    output reg otA;
    output reg missA;
    output reg otB;
    output reg missB;
    input [2:0] addr;
    input otcome;
    input miss;

    always @(addr or otcome or miss)
        if (addr == 3'b001) begin
           otB <= 1'b0;
           missB <= 1'b0;
	       missA <= miss;
	       otA <= otcome;
        end
        else if (addr == 3'b010) begin
            otB <= otcome;
            missB <= miss;
            otA <= 1'b0;
            missA <= 1'b0;
	end
        else begin
            otB <= 1'b0;
            missB <= 1'b0;
            otA <= 1'b0;
            missA <= 1'b0;
	end
endmodule

module up_counter(
    input clk, reset, 
    output[3:0] counter
    );
    reg [3:0] counter_up;

    always @(posedge clk or posedge reset)
    begin
        if(reset)
            counter_up <= 4'd0;
        else
            counter_up <= counter_up + 4'd1;
        end 
        
    assign counter = counter_up;

endmodule

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

module onebitcomp(i0,i1,clk,addr,eq);

    input wire i0, i1;
    input clk;
    input [2:0] addr;
    output wire eq;


    wire p0, p1;

    assign eq = p0 | p1;
    assign p0 = ~i0 & ~i1;
    assign p1 = i0 & i1;

endmodule

module onePred(
    input clk;
    input init;
    input [2:0] addr;
    output outcome;
);
    muxonetotwo aDemux(
        .otA(otA), .missA(missA), .otB(otB), .missB(missB), .addr(addr), .otcome(otcome), .miss(miss)
    );

    up_counter acounter(
        .clk(clk), .reset(reset), .counter(counterA)
    );

    up_counter bcounter(
        .clk(clk, .reset(reset), .counter(counterB))
    );

    muxtwotoone aMux(
        .out(out), .A(A), .B(B), .sel(sel)
    );

    onebitcomp aonebitcomp(
        .i0(i0), .i1(i1), .clk(clk), .addr(addr), .eq(eq)
    );
endmodule