module tb();
reg a,b,c; 
wire out;
integer i;
cmosnand uut (.a(a), .b(b), .c(c), .out(out));
initial begin
$monitor($time," | a = %b | b = %b | c = %b | out = %b", a, b, c, out);
a=0;b=0;c=0;
for(i=0;i<=7;i=i+1)
begin
{a,b,c}=i;
#2;
end
$finish; 
end 
endmodule
