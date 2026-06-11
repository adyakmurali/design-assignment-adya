
module block_ram_tb(
  
   );
reg clk_tb, arstn_tb, wr_enb_tb;
reg [7:0] wr_address_tb;
reg [7:0] read_address_tb;
reg [7:0] data_in_tb;
wire [7:0] dout_tb;
  
block_ram dut(clk_tb,arstn_tb,wr_enb_tb,wr_address_tb,read_address_tb,data_in_tb,dout_tb);
initial
clk_tb=0;
always #5 clk_tb=~clk_tb;
initial
begin
arstn_tb=0;
wr_enb_tb=0;
wr_address_tb=0;
read_address_tb=0;
data_in_tb=0;
#10;
arstn_tb=1;
wr_enb_tb=1;
wr_address_tb=8'd5;
data_in_tb=8'd21;
#10;
wr_enb_tb=0;
read_address_tb=8'd5;
#10;
wr_enb_tb=1;
wr_address_tb=8'd18;
data_in_tb=8'd44;
#10;
wr_enb_tb=0;
read_address_tb=8'd18;
#10;
wr_enb_tb=1;
wr_address_tb=8'd40;
data_in_tb=8'd77;
#10;
wr_enb_tb=0;
read_address_tb=8'd40;
#10;
$finish;
end
endmodule
