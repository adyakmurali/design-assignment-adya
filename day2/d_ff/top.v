
module d_ff(input d,clk,output reg q,qbar

    );
   always @(posedge clk)
begin
    q <= d;
    qbar = ~d;
end

endmodule
