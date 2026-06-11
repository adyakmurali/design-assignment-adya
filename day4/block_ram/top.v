
module block_ram(input clk, arstn, wr_enb,
input [7:0] wr_address, read_address, data_in,
output reg [7:0] dout
    );
reg [7:0] mem[255:0];
integer i;
always @(posedge clk or negedge arstn)
begin
if(!arstn)
begin
for(i=0;i<256;i=i+1)
mem[i]<=0;
dout<=0;
end
else
begin
if(wr_enb==1)
begin
mem[wr_address]<=data_in;
end
else
begin
dout<=mem[read_address];
end
end
end
endmodule
