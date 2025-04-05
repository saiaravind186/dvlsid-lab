module elevator(
    input clk,
    input reset,
    input [1:0] current_floor,
    input [3:0] buttons_in,
    input [3:0] buttons_out,
    output reg [3:0] motor,
    output reg dir_up,
    output reg dir_down
  );
  reg [3:0] floor_requests;
  reg [1:0] next_floor;
  always @(posedge clk or posedge reset)
  begin
    if (reset)
    begin
      motor <= 4'b0000;
      dir_up <= 1'b0;
      dir_down <= 1'b0;
      next_floor <= current_floor;
      floor_requests <= 4'b0000;
    end
    else
    begin
      floor_requests <= buttons_in | buttons_out;
      if (floor_requests[current_floor])
      begin
        motor <= 4'b0000;  // Stop at current floor
        dir_up <= 1'b0;
        dir_down <= 1'b0;
      end
      else
      begin
        if (current_floor == 2'b00 && floor_requests[1])
        begin
          next_floor <= 2'b01;
          motor <= 4'b0010;
          dir_up <= 1'b1;
          dir_down <= 1'b0;
        end
        else if (current_floor <= 2'b01 && floor_requests[2])
        begin
          next_floor <= 2'b10;
          motor <= 4'b0100;
          dir_up <= 1'b1;
          dir_down <= 1'b0;
        end
        else if (current_floor <= 2'b10 && floor_requests[3])
        begin
          next_floor <= 2'b11;
          motor <= 4'b1000;
          dir_up <= 1'b1;
          dir_down <= 1'b0;
        end
        else if (current_floor >= 2'b01 && floor_requests[0])
        begin
          next_floor <= 2'b00;
          motor <= 4'b0001;
          dir_up <= 1'b0;
          dir_down <= 1'b1;
        end
        else if (current_floor >= 2'b10 && floor_requests[1])
        begin
          next_floor <= 2'b01;
          motor <= 4'b0010;
          dir_up <= 1'b0;
          dir_down <= 1'b1;
        end
        else if (current_floor >= 2'b11 && floor_requests[2])
        begin
          next_floor <= 2'b10;
          motor <= 4'b0100;
          dir_up <= 1'b0;
          dir_down <= 1'b1;
        end
        else
        begin
          motor <= 4'b0000; // No movement if no requests in any direction
          dir_up <= 1'b0;
          dir_down <= 1'b0;
        end
      end
    end
  end
endmodule

