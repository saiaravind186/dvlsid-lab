module decoder(a,y);
input [3:0]a;
output [15:0]y;
assign y=1<<a;
endmodule 
