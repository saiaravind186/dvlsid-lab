module cmosnand(a,b,c,out);
input a,b,c;
output out;
supply1 vdd;
supply0 gnd;
pmos p1(out,vdd,a);
pmos p2(out,vdd,b);
pmos p3(out,vdd,c);
nmos n1(out,w1,a);
nmos n2(w1,w2,b);
nmos n3(w2,gnd,c);
endmodule
