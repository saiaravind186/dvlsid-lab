module tb();
  reg clk, start;
  wire sel, ldA, ldB, ldC, ldD, ldO, opsel, done;
  reg [15:0] a, b, c, d;
  wire [31:0] out;

  datapath DP (out, sel, ldA, ldB, ldC, ldD, ldO, opsel, clk, a, b, c, d);
  controller CON (sel, ldA, ldB, ldC, ldD, ldO, opsel, done, start, clk);

  initial begin
    clk = 0;
    #3 start = 1;
    forever #5 clk = ~clk;
  end

  initial begin
    a = 16'd10;
    b = 16'd20;
    c = 16'd1;
    d = 16'd5;
    #300 $finish;
  end

  initial begin
    $monitor("Time: %0d, Output: %d, Done: %b", $time, out, done);
  end
endmodule

