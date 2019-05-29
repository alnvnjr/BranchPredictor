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