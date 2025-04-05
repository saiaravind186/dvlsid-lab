module tb();
reg [3:0]a;
wire [3:0]b;
codeconverter uut(a,b);
initial begin
a=4'b0000; 
#5 a=4'b0001; 
#5 a=4'b0010;
#5 a=4'b0011;
#5 a=4'b0100;
#5 a=4'b0101;
#5 a=4'b0110;
#5 a=4'b0111;
#5 a=4'b1000;
#5 a=4'b1001;
end
initial begin
$monitor ($time,"a=%b,b=%b",a,b);
#50 $finish;
end
endmodule
