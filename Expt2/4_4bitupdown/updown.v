module updown(input clk, input down, input rst, output reg [3:0]count);
always @(posedge clk)
begin
if(!rst)
count <= down? count-1 : count+1;
else
count <= down? 4'b1111 : 4'b0000;
end
endmodule
