module tb();
reg [31:0]a;
reg [4:0]s;
wire b;
mux uut (a,b,s);
initial begin
a= 32'b1100_0010_1011_1010_0000_0001_1101_1111;
for(s=0;s<32;s=s+1)
begin
#5; $display("in=%b,out=%b,sel=%b",a,b,s);
end
end
initial begin
#100 $finish;
$monitor ("in=%b,out=%b,sel=%b",$time,a,b,s);
end
endmodule
