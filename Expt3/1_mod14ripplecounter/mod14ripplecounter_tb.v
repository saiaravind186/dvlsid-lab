module tb();
reg clk,reset;
wire [3:0]q;
mod14ripplecounter uut(.clk(clk),.reset(reset),.q(q));
initial begin
clk = 0;
forever #2 clk = ~clk;
end
initial begin
reset = 0;
#2 reset =1;
#2 reset =0;
#60 reset =1;
#2 reset=0;
#60 $finish;
end
initial begin
$monitor($time, " clk=%b, q=%b",clk,q);
end
endmodule
