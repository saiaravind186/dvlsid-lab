primitive xorgate(y,x1,x0);
output y;
input x1,x0;
table
    // x1 x0 : y
       0  0  : 0;
       0  1  : 1;
       1  0  : 1;
       1  1  : 0;
endtable
endprimitive
module bintogray(input [3:0]b, output g3,g2,g1,g0);
wire [3:0]grey;
assign g3=b[3];
xorgate(g2,b[3],b[2]);
xorgate(g1,b[2],b[1]);
xorgate(g0,b[1],b[0]);
assign grey={g3,g2,g1,g0};
endmodule
