
module bcd_adder_tb(

    );
 reg [3:0] a_tb, b_tb;
reg cin_tb;
wire s0_tb, s1_tb, s2_tb, s3_tb, cout_tb;
bcd_adder dut(a_tb,b_tb,cin_tb,s0_tb,s1_tb,s2_tb,s3_tb,cout_tb);
initial
begin
a_tb = 4'b0000;
b_tb = 4'b0000;
cin_tb = 0;
#10;
a_tb = 4'b0011;
b_tb = 4'b0100;
cin_tb = 0;
#10;
a_tb = 4'b0101;
b_tb = 4'b0011;
cin_tb = 0;
#10;
a_tb = 4'b1000;
b_tb = 4'b0101;
cin_tb = 0;
#10;
a_tb = 4'b1001;
b_tb = 4'b1001;
cin_tb = 0;
#10;
a_tb = 4'b0110;
b_tb = 4'b0011;
cin_tb = 1;
#10;
$finish;
end
initial
begin
$monitor(
"time=%0t a=%b b=%b cin=%b s3=%b s2=%b s1=%b s0=%b cout=%b",$time,a_tb,b_tb,cin_tb,s3_tb,s2_tb,s1_tb,s0_tb,cout_tb);
end
endmodule
