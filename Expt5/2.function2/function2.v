module function2(f,a,b,c,d,e);
output f;
input a,b,c,d,e;
supply1 vdd;
supply0 gnd;
wire f;
pmos m1(w1,vdd,a);
pmos m2(w1,vdd,b);
pmos m3(w1,vdd,c);
pmos m4(f,w1,d);
pmos m5(f,w1,e);
nmos m6(f,w2,a);
nmos m7(w2,w3,b);
nmos m8(w3,gnd,c);
nmos m9(f,w4,d);
nmos m10(w4,gnd,e);
endmodule
