module Division (
    input clk, rst, start,
    input [7:0] dividend, divisor,
    output [7:0] quotient, remainder,
    output done
);

    wire load_dividend, load_divisor, load_quotient, subtract;
    wire div_geq_div;

    DP dp (
        .clk(clk), .rst(rst),
        .dividend_in(dividend), .divisor_in(divisor),
        .load_dividend(load_dividend), .load_divisor(load_divisor),
        .load_quotient(load_quotient), .subtract(subtract),
        .quotient(quotient), .remainder(remainder),
        .div_geq_div(div_geq_div),.done(done)
    );

    CP cp (
        .clk(clk), .rst(rst), .start(start),
        .div_geq_div(div_geq_div),
        .load_dividend(load_dividend), .load_divisor(load_divisor),
        .load_quotient(load_quotient), .subtract(subtract),
        .done(done)
    );

endmodule


module CP (
    input clk, rst, start,
    input div_geq_div,
    output reg load_dividend, load_divisor, load_quotient,
    output reg subtract, done
);

    parameter IDLE = 3'b000, LOAD = 3'b001, COMPARE = 3'b010,
              SUBTRACT = 3'b011, DONE = 3'b100;

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(posedge clk) begin
        load_dividend = 0;
        load_divisor = 0;
        load_quotient = 0;
        subtract = 0;
        done = 0;

        case (state)
            IDLE: begin
                if (start)
                    next_state = LOAD;
                else
                    next_state = IDLE;
            end

            LOAD: begin
                load_dividend = 1;
                load_divisor = 1;
                load_quotient = 1;
                next_state = COMPARE;
            end

            COMPARE: begin
                if (div_geq_div)
                    next_state = SUBTRACT;
                else
                    next_state = DONE;
            end

            SUBTRACT: begin
                subtract = 1;
                next_state = COMPARE;
            end

            DONE: begin
                done = 1;
                next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

endmodule


module DP (
    input clk, rst,
    input [7:0] dividend_in, divisor_in,
    input load_dividend, load_divisor, load_quotient,
    input subtract,
    input done,
    output reg [7:0] quotient,
    output reg [7:0] remainder,
    output reg div_geq_div
);

    reg [7:0] dividend, divisor;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            dividend <= 8'b0;
            divisor <= 8'b0;
            quotient <= 8'b0;
            remainder <= 8'b0;
        end else begin
            if (load_dividend) dividend <= dividend_in;
            if (load_divisor) divisor <= divisor_in;
            if (load_quotient) quotient <= 8'b0;
        end
    end

    always @(*) begin
        div_geq_div = (dividend >= divisor);
    end

    always @(posedge clk) begin
        if (subtract && div_geq_div) begin
            dividend <= dividend - divisor;
            quotient <= quotient + 1;
        end
        if (done==1) remainder <= dividend;
    end

endmodule
