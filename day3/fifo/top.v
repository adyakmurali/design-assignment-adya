//face module

module face_mod(input clk,rst,
input [7:0] s_in,
output reg [7:0] s_out
   );
always @(posedge clk)
begin
if(rst)
s_out<=8'b00000000;
else
s_out<=s_in;
end
endmodule

//fifo

module fifo(input clk,rst,
input wrenb,
input rdenb,
input [7:0] data_in,
output reg [7:0] data_out,
output full,
 output empty
   );
reg [7:0] mem[7:0];
reg [2:0] wr_ptr;
reg [2:0] rd_ptr;
integer i;
always @(posedge clk)
begin
if(rst)
begin
for(i=0;i<8;i=i+1)
mem[i]<=0;
wr_ptr<=0;
rd_ptr<=0;
data_out<=0;
end
else
begin
if(wrenb && !full)
begin
mem[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+1'b1;
end
if(rdenb && !empty)
begin
data_out<=mem[rd_ptr];
rd_ptr<=rd_ptr+1'b1;
end
end
end
assign empty=(wr_ptr==rd_ptr);
assign full=((wr_ptr+1'b1)==rd_ptr);
endmodule

//mod out
module mod_out(input clk,rst,
input [7:0] d_in,
input empty,
output reg rdenb,
output reg [7:0] d_out
    );
parameter idle=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
reg [1:0] ps,ns;
always @(posedge clk)
begin
if(rst)
ps<=idle;
else
ps<=ns;
end
always @(*)
begin
case(ps)
idle:
begin
if(!empty)
ns=s1;
else
ns=idle;
end
s1:
ns=s2;
s2:
ns=idle;
default:
ns=idle;
endcase
end
always @(posedge clk)
begin
if(rst)
begin
rdenb<=0;
d_out<=0;
end
else
begin
case(ps)
idle:
begin
rdenb<=0;
end
s1:
begin
rdenb<=1;
end
s2:
begin
rdenb<=0;
if(!empty)
d_out<=d_in;
end
default:
begin
rdenb<=0;
end
endcase
end
end
endmodule

//final top module

module final_top(input clk,rst,
input [7:0] s_in,
output [7:0] d_out,
output full,
output empty
  );
wire [7:0] face_out;
wire [7:0] fifo_out;
wire rdenb;
face_mod fm(clk,rst,s_in,face_out);
fifo f1(clk,rst,1'b1,rdenb,face_out,fifo_out,full,empty);
mod_out mo(clk,rst,fifo_out,empty,rdenb,d_out);
endmodule
