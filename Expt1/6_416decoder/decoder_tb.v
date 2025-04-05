module tb();
reg [3:0]a;
wire [15:0]y;
decoder uut(a,y);
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
#5 a=4'b1010;
#5 a=4'b1011;
#5 a=4'b1100;
#5 a=4'b1101;
#5 a=4'b1110;
#5 a=4'b1111;
end
initial begin
$monitor($time,"a=%b y=%b ",a,y);
#80 $finish;
end
endmodule
