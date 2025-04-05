module tb();
reg [3:0]g;
wire [3:0]b;
graytobin4 uut(b,g);
initial begin
g=4'b1000; // bin 1111
#5 g=4'b1110; // bin 1011
#5 g=4'b1100; // bin 1000
end 
initial begin
$monitor ($time,"g=%b,b=%b",g,b); 
#15 $finish;
end
endmodule

