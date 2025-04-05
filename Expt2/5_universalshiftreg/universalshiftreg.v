module universalshiftreg(input clk,reset,input [1:0] mode,input [3:0] in,leftshift,rightshift,output reg [3:0] q);
always @(posedge clk or posedge reset) begin
if (reset) begin
q <= 4'b0000;
end else begin
 case (mode)
 2'b00: q <= q; //hold                 
 2'b01: q <= {q[2:0], rightshift};
 2'b10: q <= {leftshift, q[3:1]};
 2'b11: q <= in; //load
 default: q <= q;
endcase
end
end
endmodule

