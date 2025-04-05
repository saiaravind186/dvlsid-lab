module magcomp #(parameter n=4)(a,b,c,d,e);
input [n-1:0]a;
input [n-1:0]b;
output c,d,e;
assign c=(a<b);
assign d=(a==b);
assign e=(a>b);
endmodule
