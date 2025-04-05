module carrysave(output [4:0]S,output [3:0]Co,input [3:0]A,B,Ci);
wire [2:0]Si;
wire [3:0]Cio;
fulladder f0(S[0],Cio[0],A[0],B[0],Ci[0]);
fulladder f1(Si[0],Cio[1],A[1],B[1],Ci[1]);
fulladder f2(Si[1],Cio[2],A[2],B[2],Ci[2]);
fulladder f3(Si[2],Cio[3],A[3],B[3],Ci[3]);
fulladder f4(S[1],Co[0],Si[0],Cio[0],1'b0);
fulladder f5(S[2],Co[1],Si[1],Cio[1],Co[0]);
fulladder f6(S[3],Co[2],Si[2],Cio[2],Co[1]);
fulladder f7(S[4],Co[3],1'b0,Cio[3],Co[2]);
endmodule

module fulladder(output S,Co,input A,B,Ci);
xor sum(S,A,B,Ci);
and a1(c1,A,B);
and a2(c2,B,Ci);
and a3(c3,Ci,A);
or carry(Co,c1,c2,c3);
endmodule

