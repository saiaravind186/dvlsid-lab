module bitadder(a,b,cin,s,cout);
input [3:0]a;
input [3:0]b,cin;
output [4:0]s,cout;
wire [3:1]c;
assign s[0]=a[0]^b[0]^cin;
assign c[1]=(a[0]&b[0])|((a[0]^b[0])&cin);
assign s[1]=(a[1]^b[1]^c[1]);
assign c[2]=(a[1]&b[1])|((a[1]^b[1])&c[1]);
assign s[2]=(a[2]^b[2]^c[2]);
assign c[3]=(a[2]&b[2])|((a[2]^b[2])&c[2]);
assign s[3]=(a[3]^b[3]^c[3]);
assign cout=(a[3]&b[3])|((a[3]^b[3])&c[3]);
endmodule
