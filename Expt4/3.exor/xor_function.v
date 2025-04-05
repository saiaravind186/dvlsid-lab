module xorfunction(output z, input x,y);
  function exor;
    input a,b;
    exor = a ^ b;
  endfunction
assign  z = exor(x,y);
endmodule
