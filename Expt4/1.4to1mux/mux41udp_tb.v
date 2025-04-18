module tb();
reg [1:0]s;
reg [3:0]i;
wire y;
mux4to1 uut(y,s,i);
initial begin
    $monitor($time,"| sel = %b %b | i[3] = %b | i[2] = %b | i[1] = %b | i[0] = %b | y = %b ",s[1],s[0],i[3],i[2],i[1],i[0],y);
s[1]=0; s[0]=0; i[3]=1; i[2]=1; i[1]=0; i[0]=1;#2
s[1]=0; s[0]=1; i[3]=1; i[2]=1; i[1]=0; i[0]=1;#2
s[1]=1; s[0]=0; i[3]=1; i[2]=1; i[1]=0; i[0]=1;#2
s[1]=1; s[0]=1; i[3]=1; i[2]=1; i[1]=0; i[0]=1;#2
s[1]=0; s[0]=0; i[3]=0; i[2]=1; i[1]=0; i[0]=1;#2
s[1]=0; s[0]=1; i[3]=1; i[2]=0; i[1]=0; i[0]=1;#2
s[1]=1; s[0]=0; i[3]=1; i[2]=1; i[1]=1; i[0]=0;#2
s[1]=1; s[0]=1; i[3]=1; i[2]=1; i[1]=0; i[0]=1;#2
$finish();
end
   
endmodule
