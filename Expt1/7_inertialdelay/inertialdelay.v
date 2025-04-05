module inertialdelay(a,b,c);
input a,b;
output c;
assign #5 c=a|b;
endmodule 
