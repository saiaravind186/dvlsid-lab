module alu_fsm(reset, a, b, cin, out, sel, cout);
  input reset;
  input [3:0] a, b;
  input cin;
  input [2:0] sel;
  output reg [4:0] out;
  output cout;

  // Corrected parameters to be 2-bit
  parameter S1 = 3'b000;
  parameter S2 = 3'b001;
  parameter S3 = 3'b010;
  parameter S4 = 3'b011;
  parameter S5 = 3'b100;
  parameter S6 = 3'b101;

  reg [2:0] c_state, n_state;  // Corrected c_state and n_state to 2 bits
  reg r1, r2, r3, r4;
  // State Transition Logic
  always @(*)
  begin
    if (reset)
      c_state <= S6;
    else
      c_state <= n_state;
  end

  // Next State Logic
  always @(*)
  begin
    case (sel)
      3'b000:
        n_state <= S1;
      3'b001:
        n_state <= S2;
      3'b010:
        n_state <= S3;




      3'b011:
        n_state <= S4;
      3'b100:
        n_state <= S5;
      default:
        n_state <= S6;
    endcase
  end

  // Output Logic
  always @(*)
  begin
    case (c_state)
      S1:
      begin
        out <= a+b;
      end
      S2:
      begin
        out <= a-b;
      end
      S3:
      begin
        out <= a&b;
      end
      S4:
      begin
        out <= a|b;
      end
      S5:
      begin
        out <= ~b+1;
      end
      S6:
      begin
        out <= 5'bxxxx;
      end
    endcase
  end

  assign cout=out[4];

endmodule

