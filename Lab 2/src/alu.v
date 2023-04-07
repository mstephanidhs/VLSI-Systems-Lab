module alu #(
    parameter n=4
) (
    input signed [n-1:0] A,B,
    input [3:0] opcode,
    output reg [n-1:0] Y,
    output reg [4:0] status //{Parity, Overflow, Negative, Zero, Carry-out} 
);

reg abs_overflow ;
reg [$clog2(n):0] i;




always @(A,B,opcode) begin
  Y = 0;  
  abs_overflow = 0;
  status = 0 ;


  case (opcode)
      0: {status[0],Y} = A-B; //A-B
      1: {status[0],Y} = A+B; //A+B
      2: {status[0],Y} = A-1; //A-1
      3: {status[0],Y} = A+1; //A+1
      4: begin    //|A|
          if (A[n-1]) begin
              {abs_overflow,Y} = -A;
              end
              else Y=A;
        
      end
      5: Y = ~A; //not a
      6: Y = A & B; // A and B
      7: Y = A | B; // A or B
      8: Y = A^B; // A XOR B
      9: Y = A <<< B; // Arithmetic left sift A for B bits
      10: Y = A >>> B; // Arithmetic right sift A for B bits
      11: Y = A >> B;// Right sift A for B bits
      12: for (i=0; i<n; i=i+1) Y[i] = A[(i-B)%n]; // Circular left sift A for B bits
  
      13: for (i=0; i<n; i=i+1) Y[i] = A[(i+B)%n]; // Circular right sift A for B bits
      14: Y= 0; //0
      15: Y= 1; //1
  endcase



  status[4] = ^Y; //parity
  status[3] = abs_overflow |(~Y[n-1]&A[n-1]&B[n-1]) | (Y[n-1]&(~A[n-1])&(~B[-1]));//overflow
  status[2] =  A>B;//negative
  status[1] = Y==0?1:0; //zero
  status[0] = 0;
end

endmodule


    

