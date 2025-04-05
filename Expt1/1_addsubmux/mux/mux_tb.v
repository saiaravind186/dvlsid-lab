module tb();
reg a,b,sel;
wire out;
mux2_1 uut(a,b,sel,out);
initial begin
  a=1;b=0; sel=0;
#5 sel=1;
end
initial #10 $finish;
endmodule
