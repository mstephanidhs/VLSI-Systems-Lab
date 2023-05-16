/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue May 16 16:02:59 2023
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \fas[0].fa/N0 , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29;
  assign sum_o[0] = \fas[0].fa/N0 ;

  XOR2xp5_ASAP7_75t_R U17 ( .A(b_i[2]), .B(a_i[2]), .Y(n22) );
  AND2x2_ASAP7_75t_R U18 ( .A(a_i[1]), .B(b_i[1]), .Y(n20) );
  NAND2xp5_ASAP7_75t_R U19 ( .A(a_i[0]), .B(b_i[0]), .Y(n29) );
  INVx1_ASAP7_75t_R U20 ( .A(b_i[3]), .Y(n27) );
  INVx1_ASAP7_75t_R U21 ( .A(a_i[3]), .Y(n26) );
  OAI21xp5_ASAP7_75t_R U22 ( .A1(a_i[3]), .A2(b_i[3]), .B(n25), .Y(n28) );
  INVxp67_ASAP7_75t_R U23 ( .A(n24), .Y(n25) );
  NOR2x1p5_ASAP7_75t_R U24 ( .A(b_i[2]), .B(a_i[2]), .Y(n24) );
  NOR2x1_ASAP7_75t_R U25 ( .A(n24), .B(n23), .Y(n12) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(n20), .B(n11), .Y(n21) );
  NOR2x1p5_ASAP7_75t_R U27 ( .A(n11), .B(n13), .Y(n23) );
  NOR2x1p5_ASAP7_75t_R U28 ( .A(n15), .B(n14), .Y(n11) );
  XOR2xp5_ASAP7_75t_R U29 ( .A(n19), .B(n12), .Y(sum_o[3]) );
  OAI21x1_ASAP7_75t_R U30 ( .A1(n18), .A2(n17), .B(n16), .Y(n13) );
  OAI22xp33_ASAP7_75t_R U31 ( .A1(n23), .A2(n28), .B1(n27), .B2(n26), .Y(
        sum_o[4]) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(a_i[3]), .B(b_i[3]), .Y(n19) );
  NAND2x2_ASAP7_75t_R U33 ( .A(a_i[0]), .B(b_i[0]), .Y(n15) );
  NOR2x1p5_ASAP7_75t_R U34 ( .A(b_i[1]), .B(a_i[1]), .Y(n14) );
  INVx2_ASAP7_75t_R U35 ( .A(a_i[2]), .Y(n18) );
  INVx2_ASAP7_75t_R U36 ( .A(b_i[2]), .Y(n17) );
  NAND2x1p5_ASAP7_75t_R U37 ( .A(a_i[1]), .B(b_i[1]), .Y(n16) );
  XNOR2xp5_ASAP7_75t_R U38 ( .A(n22), .B(n21), .Y(sum_o[2]) );
  OA21x2_ASAP7_75t_R U39 ( .A1(a_i[0]), .A2(b_i[0]), .B(n29), .Y(
        \fas[0].fa/N0 ) );
  FAx1_ASAP7_75t_R U40 ( .A(b_i[1]), .B(a_i[1]), .CI(n29), .SN(sum_o[1]) );
endmodule

