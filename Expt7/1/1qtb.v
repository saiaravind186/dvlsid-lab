module tb();
    reg clk, rst, start;
    reg [7:0] dividend, divisor;
    wire [7:0] quotient, remainder;
    wire done;
    Division uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder),
        .done(done)
    );
    initial begin
        clk = 0;
        forever #10 clk = ~clk;      end
    initial begin
        rst = 1;
        start = 0;
        dividend = 8'b0;
        divisor = 8'b0;
        #20;
        rst = 0;
        dividend = 8'd20;
        divisor = 8'd4;
        start = 1;
        #20 start = 0;          wait(done);
        #10;
        $display("Test Case 1: 20 / 4 = %d R %d", quotient, remainder);
        if (quotient != 5 || remainder != 0)
            $display("Error: Expected Quotient = 5, Remainder = 0");
        dividend = 8'd25;
        divisor = 8'd4;
        start = 1;
        #20 start = 0;          wait(done);
        #10;
        $display("Test Case 2: 25 / 4 = %d R %d", quotient, remainder);
        if (quotient != 6 || remainder != 1)
            $display("Error: Expected Quotient = 6, Remainder = 1");
        dividend = 8'd5;
        divisor = 8'd10;
        start = 1;
        #20 start = 0;          wait(done);
        #10;
        $display("Test Case 3: 5 / 10 = %d R %d", quotient, remainder);
        if (quotient != 0 || remainder != 5)
            $display("Error: Expected Quotient = 0, Remainder = 5");
        dividend = 8'd15;
        divisor = 8'd1;
        start = 1;
        #20 start = 0;          wait(done);
        #10;
        $display("Test Case 4: 15 / 1 = %d R %d", quotient, remainder);
        if (quotient != 15 || remainder != 0)
            $display("Error: Expected Quotient = 15, Remainder = 0");
        $finish;
    end
endmodule
