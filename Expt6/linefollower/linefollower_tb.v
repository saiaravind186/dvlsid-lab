module tb();
  reg clk, reset;
  reg sensorLeft, sensorRight;
  wire motorLeft, motorRight;
  linefollower uut (  .clk(clk),
                      .reset(reset),
                      .sensorLeft(sensorLeft),
                      .sensorRight(sensorRight),
                      .motorLeft(motorLeft),
                      .motorRight(motorRight)
                    );

  always #5 clk = ~clk;
  initial begin
$monitor($time," | clk = %b | reset = %b | sensorLeft = %b | sensorRight = %b | motorLeft = %b | motorRight = %b", clk,reset,sensorLeft,sensorRight,motorLeft,motorRight);
    clk=0;
    reset = 0;
    sensorLeft = 0;
    sensorRight = 0;
    reset = 1; #10;
    reset = 0;
    sensorLeft = 1;
    sensorRight = 1; #10; // Both sensors detect white
    sensorLeft = 0;
    sensorRight = 1; #10; // Left sensor detects black
    sensorLeft = 1;
    sensorRight = 0;#10; // Right sensor detects black
    sensorLeft = 0;
    sensorRight = 0;#10; // Both sensors detect black
    #60;
    $finish;
  end
endmodule
