module tb();
  reg clk, rst, d;
  wire q;
  
  dff uut(d, clk, rst, q);
  
  initial clk = 0;
  always #1 clk=~clk;
  
  initial begin
    $monitor($time, "| clk=%b | reset=%b | d=%b | q+1=%b",clk,rst,d,q);
    rst = 1;
#2; rst = 0; d=0;
#2; d = 1;
#4; d = 0;
#4; d = 1;rst = 1;
#4; d = 0;
#4; d = 1;rst = 0;
#4; $finish;
  end
endmodule
