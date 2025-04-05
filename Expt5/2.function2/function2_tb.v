module tb();
reg a,b,c,d,e; 
wire f;
integer i;
function2 uut (.f(f), .a(a), .b(b), .c(c), .d(d), .e(e));
initial begin
$monitor($time," | a = %b | b = %b | c = %b | d = %b | e = %b | f = %b", a, b, c, d, e, f);
a=0;b=0;c=0;d=0;e=0;
for(i=0;i<=31;i=i+1)
begin
{a,b,c,d,e}=i;
#2;
end
$finish; 
end 
endmodule
