module tb();
wire [4:0]S;
wire [3:0]Co;
reg [3:0]A,B,Ci;
carrysave uut(.S(S),.Co(Co),.A(A),.B(B),.Ci(Ci));
initial begin
$monitor ($time,"a=%b , b=%b , cin=%b ,s=%b ,cout=%b ",A,B,Ci,S,Co);
A=4'b1000; B=4'b0111; Ci=4'b0000; #2
A=4'b0010; B=4'b1011; Ci=4'b0001; #2
A=4'b1010; B=4'b0101; Ci=4'b0000; #2
A=4'b0010; B=4'b1110; Ci=4'b0001; #2
A=4'b0110; B=4'b1001; Ci=4'b0000; #2
$finish;
end
endmodule
