module mod14ripplecounter(input clk,reset,output wire [3:0]q);
TFF tff0(.t(1),.clk(clk),.clear(clr),.reset(reset),.q(q[0]));
TFF tff1(.t(1),.clk(q[0]),.clear(clr),.reset(reset),.q(q[1]));
TFF tff2(.t(1),.clk(q[1]),.clear(clr),.reset(reset),.q(q[2]));
TFF tff3(.t(1),.clk(q[2]),.clear(clr),.reset(reset),.q(q[3]));
and (clr,q[3],q[2],q[1],~q[0]);
endmodule
module TFF(input t,clk,clear,reset,output reg q);
always@(clear)
q<=0;
always @(negedge clk or posedge reset) begin
if (reset)
q <= 0;
else if (t)
q <= ~q;
else 
q <= q;
end
endmodule
