module tb();
reg a,b,cin;
wire s,cout;
fulladder uut(a,b,cin,cout,s);
initial begin
   a=0;b=0;cin=0; //cout=0,s=0
#5 a=0;b=1;cin=0; //cout=0,s=1
#5 a=0;b=0;cin=1; //cout=0,s=1
#5 a=1;b=1;cin=0; //cout=1,s=0
#5 a=1;b=1;cin=1; //cout=1,s=1
end
initial begin 
$monitor ($time,"a=%b,b=%b,cin=%b,cout=%b,s=%b",a,b,cin,cout,s);
#25 $finish;
end
endmodule

