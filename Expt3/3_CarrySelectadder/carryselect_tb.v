module tb();
reg [3:0]a,b;
reg cin;
wire [3:0]s,s0,s1,c0,c1;
wire cout;
carryselect uut(.s(s),.s0(s0),.s1(s1),.c0(c0),.c1(c1),.cout(cout),.a(a),.b(b),.cin(cin));
initial begin
$monitor($time," a=%b b=%b cin=%b s=%b cout=%b ",a,b,cin,s,cout);
a = 4'b1100; b = 4'b0001; cin = 1'b0;#2;
a = 4'b1100; b = 4'b0001; cin = 1'b1;#2;
a = 4'b1001; b = 4'b0100; cin = 1'b0;#2;
a = 4'b1001; b = 4'b0100; cin = 1'b1;#2;
a = 4'b1111; b = 4'b0001; cin = 1'b0;#2;
a = 4'b1111; b = 4'b0001; cin = 1'b1;#2;
$finish;
end
endmodule

