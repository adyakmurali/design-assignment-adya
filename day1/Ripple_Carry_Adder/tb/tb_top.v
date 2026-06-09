
module rca_tb(

    );
   reg [3:0] a_tb, b_tb;
reg cin_tb;
wire s0_tb, s1_tb, s2_tb, s3_tb;
wire cout_tb;
integer i;
rca dut( a_tb,b_tb, cin_tb,s0_tb, s1_tb,s2_tb,s3_tb, cout_tb
);
initial
begin
  cin_tb = 0;
a_tb = 4'b0000; b_tb = 4'b0000; #10;
a_tb = 4'b0001; b_tb = 4'b0001; #10;
a_tb = 4'b0010; b_tb = 4'b0010; #10;
a_tb = 4'b0011; b_tb = 4'b0011; #10;

a_tb = 4'b0100; b_tb = 4'b0100; #10;
a_tb = 4'b0101; b_tb = 4'b0101; #10;
a_tb = 4'b0110; b_tb = 4'b0110; #10;
a_tb = 4'b0111; b_tb = 4'b0111; #10;

a_tb = 4'b1000; b_tb = 4'b1000; #10;
a_tb = 4'b1001; b_tb = 4'b1001; #10;
a_tb = 4'b1010; b_tb = 4'b1010; #10;
a_tb = 4'b1011; b_tb = 4'b1011; #10;

a_tb = 4'b1100; b_tb = 4'b1100; #10;
a_tb = 4'b1101; b_tb = 4'b1101; #10;
a_tb = 4'b1110; b_tb = 4'b1110; #10;
a_tb = 4'b1111; b_tb = 4'b1111; #10;
    $finish;
end
endmodule
