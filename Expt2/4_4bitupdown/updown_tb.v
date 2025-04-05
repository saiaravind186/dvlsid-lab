module tb();
reg clk, down, rst;
wire [3:0] count;
updown uut(clk, down, rst, count);
initial
clk = 1;
always
#5 clk = ~clk;
initial
begin
rst = 1;
down = 0;
#15 rst = 0;
#80 down = 1;
#200 $finish;
end
initial
$monitor($time,"rst=%b, down=%b, count=%b", rst, down, count);
endmodule
