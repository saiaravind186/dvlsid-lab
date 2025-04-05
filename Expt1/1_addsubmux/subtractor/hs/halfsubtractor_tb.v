module tb();
reg a,b;
wire d,bout;
halfsubtractor uut(a,b,d,bout);
initial begin
a=1;b=0; //d=1,bout=0
#5 a=1;b=1; //d=0,bout=0
#5 a=0;b=1; //d=1,bout=1
end 
initial #15 $finish;
endmodule

