module tb();
  reg reset;
  reg [3:0] a, b;
  reg cin;
  reg [2:0] sel;
  wire [4:0] out;
  wire cout;

  alu_fsm uut(reset, a, b, cin, out, sel, cout);
  initial
  begin
    reset=1;
    #10 reset=0;
    a=4'b0101;
    b=4'b1100;
    cin=0;
    sel=2'bxx;

    #10 sel=2'b00;
    #10 sel=2'b01;
    #10 sel=2'b10;
    #10 sel=2'b11;
  end
  initial
  begin
    $display("reset=%d, a=%d, b=%d, cin=%d, sel=%d,out=%d,cout=%d",reset,a,b,cin,sel,out,cout);
  end
  initial
  begin
    #100 $finish();
  end
endmodule
