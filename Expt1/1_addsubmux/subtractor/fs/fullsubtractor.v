module fullsubtractor(a,b,bin,bout,d);
input a,b,bin;
output bout,d;
assign d=a^b^bin;
assign bout=(~a&b)|(~a&bin)|(b&bin);
endmodule
