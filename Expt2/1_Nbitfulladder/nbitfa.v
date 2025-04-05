module nbitfa #(parameter P=6)(sum,cout,a,b,cin);
input wire [P-1:0]a,b,cin;
output reg [P-1:0]sum,cout;
reg [P:0]s;
integer i;
always @(*)
begin
s[0]=cin;
for(i=0;i<=P-1;i=i+1)
begin
sum[i]=a[i]^b[i]^s[i];
s[i+1]=(a[i]&b[i])|(b[i]&s[i])|(s[i]&a[i]);
end
cout = s[P];
end
endmodule
