module mux(a,b,s);
input [31:0]a;
input [4:0]s;
output b;
assign b=a[s];
endmodule

