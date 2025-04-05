primitive dff_udp(q, clk, rst, d);
  output reg q;
  input clk, rst, d;
  initial q = 0;
  table
//clk rst   d :  q  :  q+1
 ?     1     ?  :  ?  :  0; // rst condition
 ?    (10)   ?  :  ?  :  -; // ignoring negative transiton of rst 
(01)   0     1  :  ?  :  1; // q = d
(01)   0     0  :  ?  :  0; // q = d
(0x)   0     ?  :  ?  : - ; // for unknown clk transition, hold previous state of q  
(1?)   0     ?  :  ?  :  -; // ignoring negative transiton of clk
(x0)   0     ?  :  ?  :  -; // ignoring negative transiton of clk    
?      0   (??) :  ?  :  -; // ignoring changes in d for no changes in clk
  endtable
endprimitive

module dff(input d,clk,rst,output q);
dff_udp(q,clk,rst,d);
endmodule

