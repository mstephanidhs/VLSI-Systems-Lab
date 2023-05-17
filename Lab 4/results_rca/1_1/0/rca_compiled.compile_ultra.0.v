/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 14:03:35 2023
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \fas[0].fa/N0 , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  assign sum_o[0] = \fas[0].fa/N0 ;

  INVxp33_ASAP7_75t_R U17 ( .A(a_i[3]), .Y(n31) );
  INVxp33_ASAP7_75t_R U18 ( .A(b_i[3]), .Y(n32) );
  XOR2xp5_ASAP7_75t_R U19 ( .A(a_i[3]), .B(b_i[3]), .Y(n13) );
  NAND2x1p5_ASAP7_75t_R U20 ( .A(b_i[0]), .B(a_i[0]), .Y(n20) );
  INVx2_ASAP7_75t_R U21 ( .A(a_i[1]), .Y(n24) );
  INVx2_ASAP7_75t_R U22 ( .A(b_i[1]), .Y(n23) );
  NOR2x1p5_ASAP7_75t_R U23 ( .A(n12), .B(n14), .Y(n26) );
  NOR2x2_ASAP7_75t_R U24 ( .A(b_i[1]), .B(a_i[1]), .Y(n12) );
  OAI21xp5_ASAP7_75t_R U25 ( .A1(a_i[3]), .A2(b_i[3]), .B(n30), .Y(n33) );
  INVx1_ASAP7_75t_R U26 ( .A(n29), .Y(n30) );
  NAND2x1p5_ASAP7_75t_R U27 ( .A(b_i[0]), .B(a_i[0]), .Y(n14) );
  NOR2x2_ASAP7_75t_R U28 ( .A(b_i[2]), .B(a_i[2]), .Y(n29) );
  OAI21xp5_ASAP7_75t_R U29 ( .A1(n19), .A2(n15), .B(n17), .Y(n16) );
  OAI21xp5_ASAP7_75t_R U30 ( .A1(n29), .A2(n34), .B(n13), .Y(n18) );
  NOR2xp67_ASAP7_75t_R U31 ( .A(n29), .B(n11), .Y(n17) );
  XOR2xp5_ASAP7_75t_R U32 ( .A(a_i[3]), .B(b_i[3]), .Y(n11) );
  NOR2x1_ASAP7_75t_R U33 ( .A(n15), .B(n19), .Y(n34) );
  XOR2xp5_ASAP7_75t_R U34 ( .A(b_i[2]), .B(a_i[2]), .Y(n28) );
  NOR2x1p5_ASAP7_75t_R U35 ( .A(n21), .B(n20), .Y(n15) );
  NAND2x1p5_ASAP7_75t_R U36 ( .A(b_i[2]), .B(a_i[2]), .Y(n22) );
  NAND2xp33_ASAP7_75t_R U37 ( .A(n16), .B(n18), .Y(sum_o[3]) );
  OAI21x1_ASAP7_75t_R U38 ( .A1(n23), .A2(n24), .B(n22), .Y(n19) );
  NOR2x2_ASAP7_75t_R U39 ( .A(b_i[1]), .B(a_i[1]), .Y(n21) );
  XNOR2xp5_ASAP7_75t_R U40 ( .A(n28), .B(n27), .Y(sum_o[2]) );
  AND2x2_ASAP7_75t_R U41 ( .A(a_i[1]), .B(b_i[1]), .Y(n25) );
  NOR2x1_ASAP7_75t_R U42 ( .A(n26), .B(n25), .Y(n27) );
  OAI22xp33_ASAP7_75t_R U43 ( .A1(n34), .A2(n33), .B1(n32), .B2(n31), .Y(
        sum_o[4]) );
  NAND2x2_ASAP7_75t_R U44 ( .A(a_i[0]), .B(b_i[0]), .Y(n35) );
  OA21x2_ASAP7_75t_R U45 ( .A1(a_i[0]), .A2(b_i[0]), .B(n35), .Y(
        \fas[0].fa/N0 ) );
  FAx1_ASAP7_75t_R U46 ( .A(b_i[1]), .B(a_i[1]), .CI(n35), .SN(sum_o[1]) );
endmodule

