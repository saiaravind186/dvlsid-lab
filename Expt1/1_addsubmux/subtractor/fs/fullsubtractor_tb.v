module tb();
reg a,b,bin;
wire d,bout;
fullsubtractor uut(a,b,bin,bout,d);
initial begin
   a=1;b=0;bin=0; //bout=0,d=1
#5 a=0;b=1;bin=0; //bout=1,d=1
#5 a=0;b=0;bin=1; //bout=1,d=1
#5 a=1;b=1;bin=0; //bout=0,d=0
#5 a=1;b=1;bin=1; //bout=1,d=1
end
initial begin
$monitor ($time,"a=%b,b=%b,bin=%b,bout=%b,d=%b",a,b,bin,bout,d);
#25 $finish;
end
endmodule
