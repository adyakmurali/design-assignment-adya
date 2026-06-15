class transaction;
rand bit rst;
rand bit wrenb;
rand bit rdenb;
rand bit [7:0] data_in;
bit [7:0] data_out;
bit full;
bit empty;

  constraint c1 { wrenb dist {0:=3, 1:=7};}

function void display(string s);

  $display("[%s] rst=%0b wrenb=%0b rdenb=%0b data_in=%0h data_out=%0h full=%0b empty=%0b",s,rst,wrenb,rdenb,data_in,data_out,full,empty);
endfunction
endclass
