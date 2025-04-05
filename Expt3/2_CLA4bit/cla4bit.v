module claa(input [3:0]A,B,input Cin,output [3:0]Sum,output Cout);
wire [3:0] P, G, C;
wire pp1,pp2,pp3,pp4;
xor (P[0],A[0],B[0]);
xor (P[1],A[1],B[1]);
xor (P[2],A[2],B[2]);
xor (P[3],A[3],B[3]);

and (G[0],A[0],B[0]);
and (G[1],A[1],B[1]);
and (G[2],A[2],B[2]);
and (G[3],A[3],B[3]);

assign C[0] = Cin;

and a1(pp1,P[0],C[0]);
or o1(C[1],G[0],pp1);

and a2(pp2,P[1],C[1]);
or o2(C[2],G[1],pp2);

and a3(pp3,P[2],C[2]);
or o3(C[3],G[2],pp3);

and a4(pp4,P[3],C[3]);
or o4(Cout,G[3],pp4);

xor (Sum[0],P[0],C[0]);
xor (Sum[1],P[1],C[1]);
xor (Sum[2],P[2],C[2]);
xor (Sum[3],P[3],C[3]);

endmodule
