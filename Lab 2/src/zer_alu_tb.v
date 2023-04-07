module zer_alu_tb();
  parameter n = 4;
  parameter delay = 1;


  reg [n-1:0] A, B;
  reg [3:0] opcode;
  wire [n-1:0] Y;
  wire [4:0] status;
  reg Neg, Ov, c, z, p, V;
  reg [4:0] expstat;
  reg [n-1:0] expected;
  integer i, errors=0, errorstat=0;

  alu #(n) DUT (.A(A), .B(B), .opcode(opcode), .Y(Y), .status(status));
  
  initial begin
    for (i=0;i<1000;i=i+1)
    begin
        A = $random();
        B = $random();
        opcode = $random();
        if (opcode>=9 && opcode<14) B= B%(n);
        #(delay)
        //calc
        c=1'b0;
        expected=0;
        Neg=0;
        V=0;
        case(opcode)
            4'd0: begin {c,expected}=$signed(A)-$signed(B); Neg=expected[n-1]; if (A[n-1] == ~B[n-1] && A[n-1]!=expected[n-1]) V=1; end
            4'd1: begin {c,expected}=$signed(A)+$signed(B); Neg=expected[n-1]; if ( (A[n-1] == B[n-1]) && (A[n-1]!=expected[n-1]) ) V=1;  end
            4'd2: begin {c,expected}=$signed(A)-1; Neg=expected[n-1]; if (A[n-1] == 1'b1 && expected[n-1] == 1'b0) V=1; end
            4'd3: begin {c,expected}=$signed(A)+1; Neg=expected[n-1]; if (A[n-1] == 1'b0 && expected[n-1] == 1'b1) V=1; end
            4'd4: begin if (A[n-1]) expected=-$signed(A); else expected=A; end
            4'd5: expected= ~A;
            4'd6: expected= A & B;
            4'd7: expected= A | B;
            4'd8: expected= A ^ B;
            4'd9: begin expected = A <<< B; V=A[n-1]^expected[n-1]; if (B>0) c=A[n-B]; Neg=expected[n-1]; end
            4'd10: begin expected= $signed(A) >>> B; c=A[B-1]; Neg=expected[n-1]; end
            4'd11: begin expected= A >> B;  if (B>0) c=A[B-1]; Neg=expected[n-1]; end
            4'd12: begin if (B>0) begin expected = A << B | A >> (n-B);  c=A[n-1-B+1]; end  else expected = A; Neg=expected[n-1]; end 
            4'd13: begin if (B>0) begin expected = A >> B | A << (n-B);  c=A[B-1]; end else expected = A; Neg=expected[n-1];end
            4'd14: expected=0;
            4'd15: expected=1;
        endcase
        z = (expected==0);
        p = ~^expected;
        expstat={p,V,Neg,z,c};
        if (Y !== expected) begin
            $display("%0t, op=%0d A=%d B=%d | Expected: %0d got %0d", $time, opcode, $signed(A), $signed(B), expected, Y);
            errors=errors+1;
        end
        if (expstat !== status) begin
           // $display("%0t, op=%0d A=%d B=%d | Expected: %5b got %5b", $time, opcode, $signed(A), $signed(B), expstat, status);
            errorstat=errorstat+1;
        end
    end
    $display("Finished with %0d errors in compute", errors);
    $display("Finished with %0d errors in status", errorstat);
  end

endmodule