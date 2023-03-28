module adder #(
  parameter width = 8
)(
  input  [width-1:0] a_i,
  input  [width-1:0] b_i,
  output [width:0] sum_o
);

  assign sum_o = a_i + b_i;
endmodule