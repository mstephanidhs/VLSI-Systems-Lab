/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue Jul  4 05:11:00 2023
/////////////////////////////////////////////////////////////


module rca ( a_i, b_i, sum_o );
  input [7:0] a_i;
  input [7:0] b_i;
  output [8:0] sum_o;
  wire   \fas[0].fa/N0 , n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63;
  assign sum_o[0] = \fas[0].fa/N0 ;

  INVx1_ASAP7_75t_R U28 ( .A(a_i[1]), .Y(n19) );
  INVx1_ASAP7_75t_R U29 ( .A(b_i[1]), .Y(n20) );
  INVx1_ASAP7_75t_R U30 ( .A(b_i[5]), .Y(n24) );
  INVxp67_ASAP7_75t_R U31 ( .A(b_i[4]), .Y(n55) );
  INVx1_ASAP7_75t_R U32 ( .A(a_i[5]), .Y(n25) );
  AOI22xp5_ASAP7_75t_R U33 ( .A1(n30), .A2(n27), .B1(b_i[6]), .B2(a_i[6]), .Y(
        n63) );
  NOR2x1p5_ASAP7_75t_R U34 ( .A(n53), .B(n59), .Y(n54) );
  AOI21x1_ASAP7_75t_R U35 ( .A1(n23), .A2(n47), .B(n22), .Y(n59) );
  NAND2x2_ASAP7_75t_R U36 ( .A(a_i[0]), .B(b_i[0]), .Y(n44) );
  OAI21x1_ASAP7_75t_R U37 ( .A1(n20), .A2(n19), .B(n44), .Y(n47) );
  NOR2x1_ASAP7_75t_R U38 ( .A(a_i[3]), .B(b_i[3]), .Y(n53) );
  INVxp33_ASAP7_75t_R U39 ( .A(n28), .Y(n40) );
  NAND2xp5_ASAP7_75t_R U40 ( .A(n24), .B(n25), .Y(n30) );
  INVxp33_ASAP7_75t_R U41 ( .A(n56), .Y(n57) );
  INVxp33_ASAP7_75t_R U42 ( .A(n45), .Y(n46) );
  NAND2xp33_ASAP7_75t_R U43 ( .A(n30), .B(n29), .Y(n31) );
  INVxp33_ASAP7_75t_R U44 ( .A(n38), .Y(n42) );
  OAI21xp33_ASAP7_75t_R U45 ( .A1(a_i[7]), .A2(b_i[7]), .B(n57), .Y(n62) );
  INVxp33_ASAP7_75t_R U46 ( .A(n27), .Y(n32) );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n25), .A2(n24), .B(n43), .Y(n27) );
  XOR2xp5_ASAP7_75t_R U48 ( .A(a_i[7]), .B(b_i[7]), .Y(n18) );
  NOR2x1_ASAP7_75t_R U49 ( .A(a_i[4]), .B(b_i[4]), .Y(n36) );
  NOR2xp67_ASAP7_75t_R U50 ( .A(n36), .B(n53), .Y(n28) );
  NAND2xp33_ASAP7_75t_R U51 ( .A(n30), .B(n28), .Y(n58) );
  NOR2x1p5_ASAP7_75t_R U52 ( .A(a_i[2]), .B(b_i[2]), .Y(n48) );
  NOR2x1_ASAP7_75t_R U53 ( .A(a_i[1]), .B(b_i[1]), .Y(n45) );
  NOR2xp67_ASAP7_75t_R U54 ( .A(n48), .B(n45), .Y(n23) );
  INVx2_ASAP7_75t_R U55 ( .A(b_i[3]), .Y(n52) );
  INVxp67_ASAP7_75t_R U56 ( .A(a_i[3]), .Y(n21) );
  NAND2x1_ASAP7_75t_R U57 ( .A(a_i[2]), .B(b_i[2]), .Y(n49) );
  OAI21xp5_ASAP7_75t_R U58 ( .A1(n52), .A2(n21), .B(n49), .Y(n22) );
  NAND2x1_ASAP7_75t_R U59 ( .A(a_i[4]), .B(b_i[4]), .Y(n43) );
  NOR2xp33_ASAP7_75t_R U60 ( .A(b_i[6]), .B(a_i[6]), .Y(n56) );
  O2A1O1Ixp33_ASAP7_75t_R U61 ( .A1(n58), .A2(n59), .B(n63), .C(n56), .Y(n26)
         );
  XOR2xp5_ASAP7_75t_R U62 ( .A(n26), .B(n18), .Y(sum_o[7]) );
  XOR2xp5_ASAP7_75t_R U63 ( .A(b_i[6]), .B(a_i[6]), .Y(n29) );
  NOR2xp33_ASAP7_75t_R U64 ( .A(n27), .B(n29), .Y(n35) );
  O2A1O1Ixp33_ASAP7_75t_R U65 ( .A1(n28), .A2(n27), .B(n30), .C(n29), .Y(n34)
         );
  O2A1O1Ixp33_ASAP7_75t_R U66 ( .A1(n59), .A2(n40), .B(n32), .C(n31), .Y(n33)
         );
  AOI211xp5_ASAP7_75t_R U67 ( .A1(n59), .A2(n35), .B(n34), .C(n33), .Y(
        sum_o[6]) );
  XOR2xp5_ASAP7_75t_R U68 ( .A(b_i[5]), .B(a_i[5]), .Y(n38) );
  AOI211xp5_ASAP7_75t_R U69 ( .A1(n53), .A2(n43), .B(n36), .C(n38), .Y(n37) );
  AO21x1_ASAP7_75t_R U70 ( .A1(n38), .A2(n43), .B(n37), .Y(n39) );
  OAI31xp33_ASAP7_75t_R U71 ( .A1(n59), .A2(n40), .A3(n42), .B(n39), .Y(n41)
         );
  AOI31xp33_ASAP7_75t_R U72 ( .A1(n59), .A2(n43), .A3(n42), .B(n41), .Y(
        sum_o[5]) );
  OA21x2_ASAP7_75t_R U73 ( .A1(a_i[0]), .A2(b_i[0]), .B(n44), .Y(
        \fas[0].fa/N0 ) );
  FAx1_ASAP7_75t_R U74 ( .A(a_i[1]), .B(b_i[1]), .CI(n44), .SN(sum_o[1]) );
  NAND2xp5_ASAP7_75t_R U75 ( .A(n47), .B(n46), .Y(n50) );
  FAx1_ASAP7_75t_R U76 ( .A(a_i[2]), .B(b_i[2]), .CI(n50), .SN(sum_o[2]) );
  AOI21xp5_ASAP7_75t_R U77 ( .A1(n50), .A2(n49), .B(n48), .Y(n51) );
  FAx1_ASAP7_75t_R U78 ( .A(a_i[3]), .B(n52), .CI(n51), .SN(sum_o[3]) );
  FAx1_ASAP7_75t_R U79 ( .A(a_i[4]), .B(n55), .CI(n54), .SN(sum_o[4]) );
  NOR3xp33_ASAP7_75t_R U80 ( .A(n59), .B(n58), .C(n62), .Y(n60) );
  AOI21xp33_ASAP7_75t_R U81 ( .A1(b_i[7]), .A2(a_i[7]), .B(n60), .Y(n61) );
  OAI21xp33_ASAP7_75t_R U82 ( .A1(n63), .A2(n62), .B(n61), .Y(sum_o[8]) );
endmodule

