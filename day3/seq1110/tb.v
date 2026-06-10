module seq_tb(

   );

reg clk_tb,rst_tb,din_tb;
wire detected_tb;
seq dut(
clk_tb,
rst_tb,
din_tb,
detected_tb
);
initial
begin
clk_tb=0;
rst_tb=0;
din_tb=0;
end
always #5 clk_tb=~clk_tb;
initial
begin
rst_tb=1;
#12;
rst_tb=0;
#8  din_tb=1;
#10 din_tb=1;
#10 din_tb=1;
#10 din_tb=0;
#20;
$finish;
end
endmodule
