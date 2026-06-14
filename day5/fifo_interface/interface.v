interface fifo_io();
logic clk,rst;
logic wrenb,rdenb;
logic [7:0]data_in;
logic [7:0]data_out;
logic full,empty;
endinterface
module fifo_test();
fifo_io aif();
fifo dut(aif.clk,aif.rst,aif.wrenb,aif.rdenb,aif.data_in,aif.data_out,aif.full,aif.empty);
initial
begin
aif.clk=0;
forever #5 aif.clk=~aif.clk;
end
initial
begin
aif.rst=1;
aif.wrenb=0;
aif.rdenb=0;
aif.data_in=0;
#10;
aif.rst=0;
aif.wrenb=1;
aif.data_in=8'd10;
#10;
aif.data_in=8'd20;
#10;
aif.data_in=8'd30;
#10;
aif.wrenb=0;
aif.rdenb=1;
#10;
#10;
#10;
aif.rdenb=0;
#20;
$finish;
end
initial
begin
$monitor(
"time=%0t clk=%b rst=%b wrenb=%b rdenb=%b data_in=%d data_out=%d full=%b empty=%b",$time,aif.clk,aif.rst,aif.wrenb,aif.rdenb,aif.data_in,aif.data_out,aif.full,aif.empty);
end
endmodule
