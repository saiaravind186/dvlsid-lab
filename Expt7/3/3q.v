module datapath(out, sel, ldA, ldB, ldC, ldD, ldO, opsel, clk, a, b, c, d);
  input sel, ldA, ldB, ldC, ldD, ldO, opsel, clk;
  output [31:0] out;
  input [15:0] a, b, c, d;
  wire [15:0] x, y, ra, rb;
  wire [31:0] rc, rd;
  wire [31:0] m, n, opout;
  
  MUX m1 (x, sel, a, c, clk);
  MUX m2 (y, sel, b, d, clk);
  MUX1 m3 (opout, opsel, m, n, clk);
  REG1 r1 (ra, ldA, x, clk);
  REG1 r2 (rb, ldB, y, clk);
  REG2 r3 (rc, ldC, opout, clk);
  REG2 r4 (rd, ldD, opout, clk);
  REG2 r5 (out, ldO, opout, clk);
  MUL alu0 (m, ra, rb);
  DIV alu1 (n, rc, rd);
  
endmodule

module MUX (dout, sel, in1, in2, clk);
  input [15:0] in1, in2;
  input sel, clk;
  output reg [15:0] dout;
  
  always@(posedge clk)
    begin
      if(sel == 0)
        dout <= in1;
      else
        dout <= in2;
    end
endmodule

module MUX1 (dout, sel, in1, in2, clk);
  input [31:0] in1, in2;
  input sel, clk;
  output reg [31:0] dout;
  
  always@(posedge clk)
    begin
      if(sel == 0)
        dout <= in1;
      else
        dout <= in2;
    end
endmodule

module REG1 (dout, ld, din, clk);
  input ld, clk;
  input [15:0] din;
  output reg [15:0] dout;
  
  always@(posedge clk)
    begin
      if(ld) dout <= din;
    end
endmodule

module REG2 (dout, ld, din, clk);
  input ld, clk;
  input [31:0] din;
  output reg [31:0] dout;
  
  always@(posedge clk)
    begin
      if(ld) dout <= din;
    end
endmodule

module MUL (dout, in1, in2);
  input [15:0]in1, in2;
  output reg [31:0] dout;
  
  always@(*)
    begin
      dout = in1 * in2;
    end
endmodule

module DIV (dout, in1, in2);
  input [31:0] in1, in2;
  output reg [31:0] dout;
  
  always@(*)
    begin
      dout = in1 / in2;
    end
endmodule
module controller (sel, ldA, ldB, ldC, ldD, ldO, opsel, done, start, clk);
  input start, clk;
  output reg sel, ldA, ldB, ldC, ldD, ldO, opsel, done;
  
  reg [3:0] state;
 
  parameter s0 = 4'd0,
          s1 = 4'd1,
          s2 = 4'd2,
          s3 = 4'd3,
          s4 = 4'd4,
          s5 = 4'd5,
          s6 = 4'd6,
          s7 = 4'd7,
          s8 = 4'd8,
          s9 = 4'd9;
  
  always@(posedge clk)
    begin
      case(state)
          s0: if(start) state <= s1;
          s1: state <= s2;
          s2: state <= s3;
          s3: state <= s4;
          s4: state <= s5;
          s5: state <= s6;
          s6: #10 state <= s7;
          s7: state <= s8;
          s8: state <= s9;
          s9: state <= s9;
        default: state <= s0;
      endcase
    end

  always@(state)
    begin
      case(state)
        s0: begin
          #1 ldA = 0; ldB= 0; ldC = 0; ldD = 0; ldO = 0; opsel = 0; sel = 0;
        end
        s1: begin
          #1 sel = 0; ldA = 1; ldB = 1; opsel = 0;
        end
        s2: begin
          #1 opsel = 0; ldA = 0; ldB = 0;
        end
        s3: begin
          #1 ldC = 1;
        end
        s4: begin
          #1 ldC = 0;  sel = 1; ldA = 1; ldB = 1;
        end
        s5: begin
          #1 opsel = 0; 
        end
        s6: begin
          #1 ldD = 1;
        end
        s7: begin
          #1 opsel = 1; ldD = 0;
        end
        s8: begin
          #1 ldO = 1; opsel = 0;
        end
        s9: begin
          #1 done = 1; ldA = 0; ldB= 0; ldC = 0; ldD = 0; ldO = 0; opsel = 0; 
        end
        default: begin
          ldA = 0; ldB= 0; ldC = 0; ldD = 0; ldO = 0; opsel = 0; sel = 0; done = 0;
        end
      endcase
    end
endmodule

