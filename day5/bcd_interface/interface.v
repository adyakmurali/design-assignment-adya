interface bcd_io();
logic [3:0]x;
logic [3:0]y;
logic carry_in,s0,s1,s2,s3,carry_out;
endinterface

module bcd_test();
bcd_io sig();
bcd_adder b1(.a(sig.x),.b(sig.y),.cin(sig.carry_in),.s0(sig.s0),.s1(sig.s1),.s2(sig.s2),.s3(sig.s3),.cout(sig.carry_out));
initial begin
sig.x=4'd5;
sig.y=4'd2;
sig.carry_in=1'b0;
#10;
sig.x=4'd8;
sig.y=4'd1;
sig.carry_in=1'b1;
#10;
sig.x=4'd6;
sig.y=4'd3;
sig.carry_in=1'b0;
#10;
end
initial begin
$monitor("time=%0t A=%d B=%d Cin=%d Sum=%b%b%b%b Cout=%d",$time,sig.x,sig.y,sig.carry_in,sig.s3,sig.s2,sig.s1,sig.s0,sig.carry_out);
#35;
$finish;
end
endmodule
