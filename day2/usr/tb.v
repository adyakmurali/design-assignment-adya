
module usr_tb(

);
   
reg clk,rst,sin,shift,load;
 reg[3:0] p_in;
 reg [1:0] mode;
wire [3:0] p_out;
wire s_out;
usr dut(clk,rst,sin,p_in,shift,load,mode,p_out,s_out);
always #5 clk = ~clk;
initial
begin
clk=0;
rst=1;
sin=0;
p_in=4'b0000;
shift=0;
load=0;
mode=2'b00;

#10 
rst=0;
mode=2'b00;
shift=1;
sin=1; #10;
sin=0; #10;
sin=1; #10;
sin=1; #10;

mode=2'b01;
sin=1; #10;
sin=0; #10;
sin=1; #10;
sin=0; #10;

mode=2'b10;
load=1;
p_in=4'b1101;
#10;
load=0;
shift=1;
#10;
mode=2'b11;
load=1;
p_in=4'b1010;
#10;
$finish;
end
initial
begin
$monitor("time=%0t mode=%b p_in=%b sin=%b p_out=%b s_out=%b",$time,mode,p_in,sin,p_out,s_out);
end
endmodule
