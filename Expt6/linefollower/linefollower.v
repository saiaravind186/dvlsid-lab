module linefollower (
    input wire clk, reset,
    input wire sensorLeft, sensorRight,    // 1: White surface, 0: Black surface
    output reg motorLeft, motorRight
);
parameter [3:0]  
        STRAIGHT   = 4'b0001,
        TURN_LEFT  = 4'b0010,
        TURN_RIGHT = 4'b0100,
        STOP      = 4'b1000;

    reg [3:0] current_state, next_state;

    wire [1:0] sensors;
    assign sensors = {sensorLeft, sensorRight};

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= STRAIGHT;
        else
            current_state <= next_state;
    end
    always @(*) begin
        case (current_state)
            STRAIGHT: begin
                case (sensors)
                    2'b11:   next_state = STRAIGHT;    
                    2'b01:   next_state = TURN_LEFT;  
                    2'b10:   next_state = TURN_RIGHT; 
                    2'b00:   next_state = STOP;        
                    default: next_state = STRAIGHT;
                endcase
            end

            TURN_LEFT: begin
                case (sensors)
                    2'b01:   next_state = TURN_LEFT;   
                    2'b10:   next_state = TURN_RIGHT; 
                    2'b11:   next_state = STRAIGHT;    
                    2'b00:   next_state = STOP;        
                    default: next_state = TURN_LEFT;
                endcase
            end

            TURN_RIGHT: begin
                case (sensors)
                    2'b10:   next_state = TURN_RIGHT;  
                    2'b01:   next_state = TURN_LEFT;   
                    2'b11:   next_state = STRAIGHT;    
                    2'b00:   next_state = STOP;        
                    default: next_state = TURN_RIGHT;
                endcase
            end
            STOP: begin
                next_state = (sensors == 2'b00) ? STOP : STRAIGHT;
            end
            default: begin
                next_state = STRAIGHT;
            end
        endcase
    end
    always @(*) begin
        case (current_state)
            STRAIGHT:   {motorLeft, motorRight} = 2'b11; 
            TURN_LEFT:  {motorLeft, motorRight} = 2'b01; 
            TURN_RIGHT: {motorLeft, motorRight} = 2'b10; 
            STOP:       {motorLeft, motorRight} = 2'b00; 
            default:    {motorLeft, motorRight} = 2'b11; 
        endcase
    end

endmodule
