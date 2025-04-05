module mux2_1(a,b,sel,out);
input a,b,sel;
output out;
not n1(sel_n,sel);
and a1(sel_b,b,sel_n);
and a2(sel_a,a,sel);
or o1(out,sel_b,sel_a);
endmodule
