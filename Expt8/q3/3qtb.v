module tb();
  reg clock,reset,req_0,req_1;
  wire gnt_0,gnt_1;
  fsm_using_single_always uut(clock,reset,req_0,req_1,gnt_0,gnt_1);
  initial
  begin
    clock=0;
    forever
      #5 clock=~clock;
  end
  initial
  begin
    reset=1;
    #10;
    reset=0;
  end
  initial
  begin
    req_1=1'b1;
    req_0=1'b0;
    #10;
    req_1=1'b1;
    req_0=1'b1;
    #10;
    req_1=1'b0;
    req_0=1'b0;
    #10;
    req_1=1'b0;
    req_0=1'b1;
    #10;
    req_1=1'b1;
    req_0=1'b1;
    #10;
    req_1=1'b0;
    req_0=1'b0;
    #10;
    $finish;
  end
endmodule