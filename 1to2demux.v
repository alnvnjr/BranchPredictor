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