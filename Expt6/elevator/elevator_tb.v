module tb();
  reg clk;
  reg reset;
  reg [1:0] current_floor;
  reg [3:0] buttons_in;
  reg [3:0] buttons_out;
  wire [3:0] motor;
  wire dir_up;
  wire dir_down;


  elevator uut (
             .clk(clk),
             .reset(reset),
             .current_floor(current_floor),
             .buttons_in(buttons_in),
             .buttons_out(buttons_out),
             .motor(motor),
             .dir_up(dir_up),
             .dir_down(dir_down)
           );


  always #5 clk = ~clk;

  initial begin
$monitor($time," |Floor=%d | Buttons In=%b | Buttons Out=%b | Motor=%b | Dir_Up=%b | Dir_Down=%b", current_floor, buttons_in, buttons_out, motor, dir_up, dir_down);
    clk = 0;
    reset = 1;
    current_floor = 2'b00;
    buttons_in = 4'b0000;
    buttons_out = 4'b0000;
    #10;
    reset = 0;
    // Request to go to the 3rd floor (external)
    #10;
    buttons_out = 4'b1000;  // Request for 3rd floor
    #20;
    current_floor = 2'b01;  // Move to 1st floor
    #20;
    current_floor = 2'b10;  // Move to 2nd floor
    #20;
    current_floor = 2'b11;  // Reach 3rd floor
    #20;
    buttons_out = 4'b0000;  // Clear requests

    // Request from 1st and 2nd floors (internal)
    #10;
    buttons_in = 4'b0110;   // Requests for 1st and 2nd floors
    #20;
    current_floor = 2'b10;  // Move to 2nd floor
    #20;
    buttons_in = 4'b0000;   // Clear requests

    // Request to go down to ground floor (external)
    #10;
    buttons_out = 4'b0001;  // Request for ground floor
    #20;
    current_floor = 2'b10;  // Move to 2nd floor
    #20;
    current_floor = 2'b01;  // Move to 1st floor
    #20;
    current_floor = 2'b00;  // Reach ground floor
    #20;
    buttons_out = 4'b0000;  // Clear requests
    $finish;
  end
endmodule
