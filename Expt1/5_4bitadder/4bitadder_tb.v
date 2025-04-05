module tb();
reg [3:0]a;
reg [3:0]b,cin;
wire [4:0]s,cout;
bitadder uut(a,b,cin,s,cout);
initial begin
a=4'b0000;b=4'b0000;cin=1'b0;
#10 a=4'b0010;b=4'b1000;cin=1'b0;
#10 a=4'b0110;b=4'b1001;cin=1'b0;
#10 a=4'b1101;b=4'b1111;cin=1'b1;
#10 a=4'b1000;b=4'b0000;cin=1'b0;
#10 a=4'b0110;b=4'b1000;cin=1'b0;
#10 a=4'b0110;b=4'b1001;cin=1'b0;
#10 a=4'b1111;b=4'b1011;cin=0'b1;
end
initial begin
$monitor ($time,"a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout); 
#80 $finish;
end
endmodule
