module tb();
reg [3:0] A, B;
reg Cin;
wire [3:0] Sum;
wire Cout;
claa uut (.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
initial begin
$monitor($time," A:%b,B:%b,Cin:%b,Sum:%b,Cout:%b ",A,B,Cin,Sum,Cout);
A=4'b0000; B=4'b1111; Cin=1;
#10;
A=4'b0011; B=4'b1001; Cin=0;
#10;
A=4'b0110; B=4'b0011; Cin=1;
#10;
A=4'b0101; B=4'b1000; Cin=1;
#10;
A=4'b1111; B=4'b0000; Cin=1;
#10;
$finish;
end
endmodule
