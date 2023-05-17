/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 14:04:10 2023
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \fas[0].fa/N0 , n11, n12, n13, n14, n15, n16;
  assign sum_o[0] = \fas[0].fa/N0 ;

  NAND2xp33_ASAP7_75t_R U17 ( .A(a_i[0]), .B(b_i[0]), .Y(n16) );
  OA21x2_ASAP7_75t_R U18 ( .A1(a_i[0]), .A2(b_i[0]), .B(n16), .Y(
        \fas[0].fa/N0 ) );
  INVxp33_ASAP7_75t_R U19 ( .A(n16), .Y(n11) );
  MAJIxp5_ASAP7_75t_R U20 ( .A(b_i[1]), .B(a_i[1]), .C(n11), .Y(n15) );
  INVxp33_ASAP7_75t_R U21 ( .A(n15), .Y(n12) );
  MAJIxp5_ASAP7_75t_R U22 ( .A(b_i[2]), .B(a_i[2]), .C(n12), .Y(n14) );
  INVxp33_ASAP7_75t_R U23 ( .A(n14), .Y(n13) );
  MAJx2_ASAP7_75t_R U24 ( .A(n13), .B(b_i[3]), .C(a_i[3]), .Y(sum_o[4]) );
  FAx1_ASAP7_75t_R U25 ( .A(b_i[3]), .B(a_i[3]), .CI(n14), .SN(sum_o[3]) );
  FAx1_ASAP7_75t_R U26 ( .A(b_i[2]), .B(a_i[2]), .CI(n15), .SN(sum_o[2]) );
  FAx1_ASAP7_75t_R U27 ( .A(b_i[1]), .B(a_i[1]), .CI(n16), .SN(sum_o[1]) );
endmodule

