module tb();
parameter P=6;
reg [P-1:0]a,b;
reg cin;
wire [P-1:0]sum;
wire cout;
nbitfa uut(sum,cout,a,b,cin);
initial begin
    a=6'b000000; b=6'b000000; cin=1'b0;
#10 a=6'b000001; b=6'b000010; cin=1'b1;
#10 a=6'b000000; b=6'b100111; cin=1'b1;
#10 a=6'b010101; b=6'b101010; cin=1'b0;
end
initial begin
$monitor($time,"a= %b, b= %b, cin=%b, sum=%b, cout=%b",a,b,cin,sum,cout);
#50 $finish;
end
endmodule
