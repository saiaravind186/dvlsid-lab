module carryselect(output [3:0]s,s0,s1,c0,c1,output cout,input [3:0]a,b,input cin);

fulladder f0(s0[0],c0[0],a[0],b[0],1'b0);
fulladder f1(s0[1],c0[1],a[1],b[1],c0[0]);
fulladder f2(s0[2],c0[2],a[2],b[2],c0[1]);
fulladder f3(s0[3],c0[3],a[3],b[3],c0[2]);

fulladder f4(s1[0],c1[0],a[0],b[0],1'b1);
fulladder f5(s1[1],c1[1],a[1],b[1],c1[0]);
fulladder f6(s1[2],c1[2],a[2],b[2],c1[1]);
fulladder f7(s1[3],c1[3],a[3],b[3],c1[2]);

mux m0(s[0],s1[0],s0[0],cin);
mux m1(s[1],s1[1],s0[1],cin);
mux m2(s[2],s1[2],s0[2],cin);
mux m3(s[3],s1[3],s0[3],cin);
mux m4(cout,c1[3],c0[3],cin);

endmodule

module mux(output out,input a,b,sel);
not n1(sel_n,sel);
and a1(sel_b,b,sel_n); //sel=0 out=b
and a2(sel_a,a,sel); //sel=1 out=a
or o1(out,sel_b,sel_a);
endmodule

module fulladder(output s,cout,input a,b,cin);
xor sum(s,a,b,cin);
and a1(c1,a,b);
and a2(c2,b,cin);
and a3(c3,cin,a);
or carry(cout,c1,c2,c3);
endmodule
