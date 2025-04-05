module mod8counter(input clk, input rst, output reg [2:0] out);
always @(posedge clk or rst)
begin
if (rst)
out<=0;
else if(out == 7)
out<=0;
else
out=out+1;
end
endmodule
