module tb();
reg [3:0]b;
wire g3,g2,g1,g0;
bintogray uut(b,g3,g2,g1,g0);
initial begin
    $monitor($time,"| Binary input = %b | Gray Code = %b%b%b%b ",b,g3,g2,g1,g0);
b[3]=1;b[2]=1;b[1]=1;b[0]=1;#2 //gray =1000
b[3]=1;b[2]=0;b[1]=1;b[0]=1;#2 //gray =1110
b[3]=1;b[2]=0;b[1]=0;b[0]=0;#2 //gray =1100
$finish;
end
endmodule
