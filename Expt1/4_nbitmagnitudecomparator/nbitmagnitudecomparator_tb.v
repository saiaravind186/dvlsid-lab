module tb();
parameter n=4;
reg [n-1:0]a,b;
wire c,d,e;
magcomp uut (a,b,c,d,e);
initial begin
a=4'b0010; b=4'b1011;
#10 a=4'b1100; b=4'b1100;
#10 a=4'b1110; b=4'b1000;
end
initial begin
$monitor ($time,"a=%b,b=%b,a<b=%b,a=b=%b,a>b=%b",a,b,c,d,e); 
#30 $finish;
end
endmodule
