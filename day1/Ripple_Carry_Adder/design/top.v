
module rca(input [3:0] a, b,cin,output s0, s1, s2, s3,cout
);

wire c1, c2, c3;

fulladder fa1(a[0], b[0], cin, s0, c1);
fulladder fa2(a[1], b[1], c1, s1, c2);
fulladder fa3(a[2], b[2], c2, s2, c3);
fulladder fa4(a[3], b[3], c3, s3, cout);

endmodule
