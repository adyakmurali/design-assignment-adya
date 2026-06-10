
module final_top_tb(
  
);
reg clk_tb;
reg rst_tb;
reg [7:0] s_in_tb;
wire [7:0] d_out_tb;
wire full_tb;
wire empty_tb;
final_top dut(clk_tb,rst_tb,s_in_tb,d_out_tb,full_tb,empty_tb);
initial
begin
clk_tb=0;
end
always #5 clk_tb=~clk_tb;
initial
begin
rst_tb=1;
s_in_tb=0;
#10;
rst_tb=0;
#10 s_in_tb=8'd10;   
#10 s_in_tb=8'd20;  
#10 s_in_tb=8'd30;   
#10 s_in_tb=8'd40;   
#10 s_in_tb=8'd70;
#10 s_in_tb=8'd80;
#100;
$finish;
end
endmodule
