module fifo(input clk,rst,wrenb,rdenb,
input [7:0]data_in,
output reg [7:0]data_out,
output full,output empty);
reg [7:0]mem[7:0];
reg [2:0]wr_ptr;
reg [2:0]rd_ptr;
integer i;
assign full=((wr_ptr+1'b1)==rd_ptr);
assign empty=(wr_ptr==rd_ptr);
always@(posedge clk)
begin
if(rst)
begin
for(i=0;i<8;i=i+1)
mem[i]<=0;
wr_ptr<=0;
rd_ptr<=0;
data_out<=0;
end
else if(wrenb && !full)
begin
mem[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+1'b1;
end
else if(rdenb && !empty)
begin
data_out<=mem[rd_ptr];
rd_ptr<=rd_ptr+1'b1;
end
end
endmodule
