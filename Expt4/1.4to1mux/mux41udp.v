primitive mux41 (y,sel1,sel0,i3,i2,i1,i0);
output y;
input sel1,sel0,i3,i2,i1,i0;
table
    //sel      i         y
      0 0   ? ? ? 0  :   0;
      0 0   ? ? ? 1  :   1;
      0 1   ? ? 0 ?  :   0;
      0 1   ? ? 1 ?  :   1;
      1 0   ? 0 ? ?  :   0;
      1 0   ? 1 ? ?  :   1;
      1 1   0 ? ? ?  :   0;
      1 1   1 ? ? ?  :   1;
endtable
endprimitive       

module mux4to1(output y, input [1:0]s,input [3:0]i);
mux41(y,s[1],s[0],i[3],i[2],i[1],i[0]);
endmodule
