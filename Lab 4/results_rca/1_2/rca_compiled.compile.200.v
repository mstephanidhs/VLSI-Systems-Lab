/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue May 16 16:06:16 2023
/////////////////////////////////////////////////////////////


module fulladder_0 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1;

  AO22x1_ASAP7_75t_R U1 ( .A1(b), .A2(a), .B1(n1), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n1) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(cin), .B(n1), .Y(s) );
endmodule


module fulladder_1 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  AO22x1_ASAP7_75t_R U2 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(a), .B(b), .Y(n2) );
endmodule


module fulladder_2 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  AO22x1_ASAP7_75t_R U2 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(a), .B(b), .Y(n2) );
endmodule


module fulladder_3 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  AO22x1_ASAP7_75t_R U2 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(a), .B(b), .Y(n2) );
endmodule


module rca ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \*Logic0* ;
  wire   [3:1] temp_c;

  fulladder_0 \fas[0].fa  ( .a(a_i[0]), .b(b_i[0]), .cin(\*Logic0* ), .s(
        sum_o[0]), .cout(temp_c[1]) );
  fulladder_3 \fas[1].fa  ( .a(a_i[1]), .b(b_i[1]), .cin(temp_c[1]), .s(
        sum_o[1]), .cout(temp_c[2]) );
  fulladder_2 \fas[2].fa  ( .a(a_i[2]), .b(b_i[2]), .cin(temp_c[2]), .s(
        sum_o[2]), .cout(temp_c[3]) );
  fulladder_1 \fas[3].fa  ( .a(a_i[3]), .b(b_i[3]), .cin(temp_c[3]), .s(
        sum_o[3]), .cout(sum_o[4]) );
  TIELOx1_ASAP7_75t_R U2 ( .L(\*Logic0* ) );
endmodule

