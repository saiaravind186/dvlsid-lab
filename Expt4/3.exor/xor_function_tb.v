module tb();
  reg x, y;
  wire z;
  xorfunction uut (.z(z), .x(x), .y(y));
  initial
  begin
    $monitor($time ," | x=%b  | y=%b  | z=%b ", x, y, z);
    x = 0;y = 0; #10;
    x = 0;y = 1; #10;
    x = 1;y = 0; #10;
    x = 1;y = 1; #10;
    $finish;
  end
endmodule
