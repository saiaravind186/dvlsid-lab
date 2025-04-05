module tb();
reg a,b;
wire s,c;
halfadder uut(a,b,s,c);
initial begin
a=1;b=0; //s=1,c=0
#5 a=1;b=1; //s=0,c=1
end 
initial #10 $finish;
endmodule

