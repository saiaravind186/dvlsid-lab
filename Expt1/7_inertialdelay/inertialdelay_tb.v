module tb();
reg a,b;
wire c;
inertialdelay uut(a,b,c);
initial begin
a=0;b=0;
#5 a=1;b=0;
#5 a=1;b=1;
end
initial begin
$monitor($time,"a=%b b=%b c=%b",a,b,c);
#15 $finish;
end
endmodule
