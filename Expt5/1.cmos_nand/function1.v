module function1(f,a,b,c,d,e);
output f;
input a,b,c,d,e;
supply1 vdd;
supply0 gnd;
wire f;
pmos m1(w1,vdd,b);
pmos m2(w1,vdd,c);
pmos m3(w1,vdd,d);
pmos m4(f,w1,a);
pmos m5(f,vdd,e);
nmos m6(f,w2,b);
nmos m7(w2,w3,c);
nmos m8(w3,w4,d);
nmos m9(f,w4,a);
nmos m10(w4,gnd,e);
endmodule
