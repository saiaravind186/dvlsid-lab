module tb();
reg clk,reset;
reg [1:0] mode;
reg [3:0] in;
reg leftshift,rightshift;
wire [3:0] q;
universalshiftreg uut(.clk(clk),.reset(reset),.mode(mode),.in(in),.leftshift(leftshift),.rightshift(rightshift),.q(q));
always #5 clk = ~clk;
initial begin
clk = 0;
reset = 1;
mode = 2'b00;
in = 4'b0000;
leftshift = 0;
rightshift = 0;
#10 reset = 0;
#10 mode = 2'b11;
in = 4'b1010;
#10 mode = 2'b00;
#10 mode = 2'b01;
rightshift = 1;
#10 mode = 2'b00;
#10 mode = 2'b10;
leftshift = 1;
#10 mode = 2'b11;
in = 4'b0110;
#10 mode = 2'b00;
#10 $finish;
end
initial begin
$monitor($time, " mode = %b  q = %b",mode, q);
end
endmodule
