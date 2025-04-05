module tb();
reg clk;
reg rst;
wire [2:0] out;
mod8counter uut(clk, rst, out);
always #5 clk = ~clk;
initial
begin
{clk,rst}<=1'b1;
$monitor ("T=%t rst=%b out=%b", $time, rst, out);
repeat (2) @(posedge clk);
rst<=0;
repeat (20) @(posedge clk);
end
initial
begin
#100 $finish;
end
endmodule
