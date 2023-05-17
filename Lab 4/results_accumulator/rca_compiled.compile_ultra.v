/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 14:45:16 2023
/////////////////////////////////////////////////////////////


module accumulator ( clk, rstn, pl, din, sum, ready );
  input [31:0] din;
  output [9:0] sum;
  input clk, rstn, pl;
  output ready;
  wire   N10, N13, N14, N15, N16, N18, N19, N20, N21, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122;
  tri   clk;
  tri   rstn;
  tri   mypl;
  tri   [7:0] addend;
  tri   n133;
  tri   n134;

  sreg summands ( .clk(clk), .rstn(rstn), .pl(mypl), .en(1'b1), .si({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .din(din[31:8]), .so(
        addend) );
  ASYNC_DFFHx1_ASAP7_75t_R ready_reg_reg ( .D(n13), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(ready) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[9]  ( .D(n122), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n12) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[8]  ( .D(N21), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n11) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[7]  ( .D(N20), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n10) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[6]  ( .D(N19), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n9) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[5]  ( .D(N18), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n8) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[4]  ( .D(n121), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n7) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[3]  ( .D(N16), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n6) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[2]  ( .D(N15), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n5) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[1]  ( .D(N14), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n4) );
  ASYNC_DFFHx1_ASAP7_75t_R \sum_reg_reg[0]  ( .D(N13), .CLK(clk), .RESET(n3), 
        .SET(N10), .QN(n2) );
  AND2x4_ASAP7_75t_R U27 ( .A(pl), .B(ready), .Y(mypl) );
  NOR2x1_ASAP7_75t_R U28 ( .A(mypl), .B(n110), .Y(n111) );
  NOR2xp33_ASAP7_75t_R U29 ( .A(n55), .B(n54), .Y(n113) );
  NOR2x1p5_ASAP7_75t_R U30 ( .A(n50), .B(n81), .Y(n110) );
  NAND2xp5_ASAP7_75t_R U31 ( .A(n103), .B(n6), .Y(n67) );
  NAND2x1_ASAP7_75t_R U32 ( .A(n109), .B(n9), .Y(n48) );
  NOR2x1_ASAP7_75t_R U33 ( .A(n109), .B(n9), .Y(n50) );
  BUFx2_ASAP7_75t_R U34 ( .A(n23), .Y(n22) );
  INVx5_ASAP7_75t_R U35 ( .A(mypl), .Y(n117) );
  INVx1_ASAP7_75t_R U36 ( .A(addend[1]), .Y(n101) );
  NAND2x1p5_ASAP7_75t_R U37 ( .A(n112), .B(n10), .Y(n53) );
  INVx1_ASAP7_75t_R U38 ( .A(addend[6]), .Y(n109) );
  NAND2x1_ASAP7_75t_R U39 ( .A(n106), .B(n8), .Y(n24) );
  OAI21xp5_ASAP7_75t_R U40 ( .A1(n47), .A2(n46), .B(n45), .Y(N19) );
  NAND2xp33_ASAP7_75t_R U41 ( .A(n117), .B(n69), .Y(n17) );
  NOR2xp67_ASAP7_75t_R U42 ( .A(mypl), .B(n113), .Y(n115) );
  INVxp67_ASAP7_75t_R U43 ( .A(n62), .Y(n68) );
  NOR2x1_ASAP7_75t_R U44 ( .A(n68), .B(n22), .Y(n21) );
  INVxp67_ASAP7_75t_R U45 ( .A(n66), .Y(n69) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(mypl), .B(din[3]), .Y(n18) );
  INVxp67_ASAP7_75t_R U47 ( .A(din[2]), .Y(n64) );
  INVxp67_ASAP7_75t_R U48 ( .A(addend[4]), .Y(n105) );
  AOI22xp5_ASAP7_75t_R U49 ( .A1(n104), .A2(n117), .B1(n21), .B2(n20), .Y(n19)
         );
  AND2x2_ASAP7_75t_R U50 ( .A(n117), .B(n70), .Y(n20) );
  AOI22xp33_ASAP7_75t_R U51 ( .A1(n117), .A2(n107), .B1(din[5]), .B2(mypl), 
        .Y(n108) );
  OAI22xp5_ASAP7_75t_R U52 ( .A1(n97), .A2(n65), .B1(n64), .B2(n117), .Y(N15)
         );
  INVxp33_ASAP7_75t_R U53 ( .A(n79), .Y(n77) );
  NAND2xp33_ASAP7_75t_R U54 ( .A(ready), .B(n117), .Y(n13) );
  INVxp33_ASAP7_75t_R U55 ( .A(n89), .Y(n88) );
  BUFx3_ASAP7_75t_R U56 ( .A(mypl), .Y(n97) );
  NAND2x1_ASAP7_75t_R U57 ( .A(n48), .B(n53), .Y(n49) );
  INVxp67_ASAP7_75t_R U58 ( .A(n11), .Y(sum[8]) );
  INVxp67_ASAP7_75t_R U59 ( .A(n12), .Y(sum[9]) );
  INVxp67_ASAP7_75t_R U60 ( .A(din[4]), .Y(n74) );
  INVxp67_ASAP7_75t_R U61 ( .A(din[1]), .Y(n60) );
  INVx2_ASAP7_75t_R U62 ( .A(n84), .Y(n114) );
  NAND2xp5_ASAP7_75t_R U63 ( .A(n67), .B(n62), .Y(n32) );
  AND2x2_ASAP7_75t_R U64 ( .A(n70), .B(n16), .Y(n104) );
  INVxp67_ASAP7_75t_R U65 ( .A(n69), .Y(n16) );
  OR2x2_ASAP7_75t_R U66 ( .A(n70), .B(n17), .Y(n71) );
  OAI211xp5_ASAP7_75t_R U67 ( .A1(n21), .A2(n71), .B(n19), .C(n18), .Y(N16) );
  AOI21x1_ASAP7_75t_R U68 ( .A1(n53), .A2(n50), .B(n55), .Y(n28) );
  NOR2x1_ASAP7_75t_R U69 ( .A(n112), .B(n10), .Y(n55) );
  OAI211xp5_ASAP7_75t_R U70 ( .A1(n87), .A2(n86), .B(n116), .C(n85), .Y(N20)
         );
  OAI21x1_ASAP7_75t_R U71 ( .A1(n23), .A2(n32), .B(n42), .Y(n119) );
  XOR2xp5_ASAP7_75t_R U72 ( .A(n63), .B(n22), .Y(n65) );
  AOI21x1_ASAP7_75t_R U73 ( .A1(n57), .A2(n33), .B(n56), .Y(n23) );
  AOI21x1_ASAP7_75t_R U74 ( .A1(n25), .A2(n24), .B(n75), .Y(n52) );
  INVxp67_ASAP7_75t_R U75 ( .A(n24), .Y(n35) );
  NAND2xp5_ASAP7_75t_R U76 ( .A(n24), .B(n76), .Y(n82) );
  NOR2x1_ASAP7_75t_R U77 ( .A(n106), .B(n8), .Y(n75) );
  AOI22x1_ASAP7_75t_R U78 ( .A1(n115), .A2(n114), .B1(mypl), .B2(din[7]), .Y(
        n116) );
  AOI21x1_ASAP7_75t_R U79 ( .A1(n66), .A2(n67), .B(n41), .Y(n42) );
  INVxp33_ASAP7_75t_R U80 ( .A(n25), .Y(n78) );
  NOR2x1p5_ASAP7_75t_R U81 ( .A(n105), .B(n7), .Y(n25) );
  NOR2xp33_ASAP7_75t_R U82 ( .A(n25), .B(n72), .Y(n73) );
  OAI211xp5_ASAP7_75t_R U83 ( .A1(n80), .A2(n27), .B(n108), .C(n26), .Y(N18)
         );
  NAND4xp25_ASAP7_75t_R U84 ( .A(n27), .B(n79), .C(n78), .D(n117), .Y(n26) );
  NAND2xp5_ASAP7_75t_R U85 ( .A(n76), .B(n119), .Y(n27) );
  OAI21x1_ASAP7_75t_R U86 ( .A1(n49), .A2(n52), .B(n28), .Y(n120) );
  OAI22xp5_ASAP7_75t_R U87 ( .A1(n97), .A2(n29), .B1(n74), .B2(n117), .Y(n121)
         );
  XOR2xp5_ASAP7_75t_R U88 ( .A(n31), .B(n73), .Y(n29) );
  AOI21xp5_ASAP7_75t_R U89 ( .A1(n30), .A2(n93), .B(n118), .Y(n94) );
  INVx1_ASAP7_75t_R U90 ( .A(n31), .Y(n30) );
  INVx1_ASAP7_75t_R U91 ( .A(n119), .Y(n31) );
  NOR2x1_ASAP7_75t_R U92 ( .A(n102), .B(n5), .Y(n66) );
  NOR2x1_ASAP7_75t_R U93 ( .A(n101), .B(n4), .Y(n56) );
  NOR2x1_ASAP7_75t_R U94 ( .A(n98), .B(n2), .Y(n33) );
  NAND2xp5_ASAP7_75t_R U95 ( .A(n102), .B(n5), .Y(n62) );
  INVx2_ASAP7_75t_R U96 ( .A(n48), .Y(n81) );
  INVxp33_ASAP7_75t_R U97 ( .A(addend[5]), .Y(n106) );
  NOR2xp33_ASAP7_75t_R U98 ( .A(n75), .B(n35), .Y(n79) );
  NOR2xp33_ASAP7_75t_R U99 ( .A(n78), .B(n79), .Y(n107) );
  AO22x1_ASAP7_75t_R U100 ( .A1(mypl), .A2(din[6]), .B1(n111), .B2(n36), .Y(
        n39) );
  NOR2xp33_ASAP7_75t_R U101 ( .A(addend[0]), .B(sum[0]), .Y(n100) );
  NOR2xp33_ASAP7_75t_R U102 ( .A(n56), .B(n58), .Y(n59) );
  NOR2xp33_ASAP7_75t_R U103 ( .A(n68), .B(n66), .Y(n63) );
  AOI21xp5_ASAP7_75t_R U104 ( .A1(n92), .A2(n119), .B(n120), .Y(n38) );
  INVxp67_ASAP7_75t_R U105 ( .A(rstn), .Y(N10) );
  AND2x2_ASAP7_75t_R U106 ( .A(n40), .B(sum[3]), .Y(n41) );
  AOI21xp5_ASAP7_75t_R U107 ( .A1(n44), .A2(n47), .B(n39), .Y(n45) );
  AND3x1_ASAP7_75t_R U108 ( .A(n92), .B(n117), .C(n91), .Y(n93) );
  XNOR2xp5_ASAP7_75t_R U109 ( .A(n33), .B(n59), .Y(n61) );
  OAI31xp33_ASAP7_75t_R U110 ( .A1(mypl), .A2(n100), .A3(n33), .B(n99), .Y(N13) );
  NAND2xp5_ASAP7_75t_R U111 ( .A(n67), .B(n34), .Y(n70) );
  INVxp67_ASAP7_75t_R U112 ( .A(n41), .Y(n34) );
  INVxp67_ASAP7_75t_R U113 ( .A(n76), .Y(n72) );
  NAND2x1p5_ASAP7_75t_R U114 ( .A(n105), .B(n7), .Y(n76) );
  INVxp67_ASAP7_75t_R U115 ( .A(n52), .Y(n36) );
  NOR2xp67_ASAP7_75t_R U116 ( .A(n97), .B(n37), .Y(N21) );
  XNOR2xp5_ASAP7_75t_R U117 ( .A(n11), .B(n38), .Y(n37) );
  NOR2x1_ASAP7_75t_R U118 ( .A(n49), .B(n82), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U119 ( .A(n119), .B(n43), .Y(n47) );
  INVxp33_ASAP7_75t_R U120 ( .A(n57), .Y(n58) );
  NAND2xp5_ASAP7_75t_R U121 ( .A(din[0]), .B(mypl), .Y(n99) );
  TIELOx1_ASAP7_75t_R U122 ( .L(n3) );
  INVxp67_ASAP7_75t_R U123 ( .A(n6), .Y(sum[3]) );
  NAND2xp5_ASAP7_75t_R U124 ( .A(n101), .B(n4), .Y(n57) );
  INVxp33_ASAP7_75t_R U125 ( .A(n103), .Y(n40) );
  INVxp67_ASAP7_75t_R U126 ( .A(n82), .Y(n43) );
  INVxp67_ASAP7_75t_R U127 ( .A(n111), .Y(n46) );
  AND3x1_ASAP7_75t_R U128 ( .A(n110), .B(n117), .C(n52), .Y(n44) );
  INVxp33_ASAP7_75t_R U129 ( .A(n7), .Y(sum[4]) );
  INVxp33_ASAP7_75t_R U130 ( .A(n4), .Y(sum[1]) );
  INVxp33_ASAP7_75t_R U131 ( .A(n8), .Y(sum[5]) );
  INVxp33_ASAP7_75t_R U132 ( .A(n5), .Y(sum[2]) );
  INVxp33_ASAP7_75t_R U133 ( .A(n9), .Y(sum[6]) );
  INVxp33_ASAP7_75t_R U134 ( .A(n10), .Y(sum[7]) );
  INVxp33_ASAP7_75t_R U135 ( .A(n50), .Y(n51) );
  OA21x2_ASAP7_75t_R U136 ( .A1(n52), .A2(n81), .B(n51), .Y(n84) );
  INVx1_ASAP7_75t_R U137 ( .A(n53), .Y(n54) );
  INVx1_ASAP7_75t_R U138 ( .A(n2), .Y(sum[0]) );
  OAI22xp5_ASAP7_75t_R U139 ( .A1(n97), .A2(n61), .B1(n60), .B2(n117), .Y(N14)
         );
  NAND2xp33_ASAP7_75t_R U140 ( .A(n117), .B(n77), .Y(n80) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(n82), .B(n81), .Y(n83) );
  NAND2xp5_ASAP7_75t_R U142 ( .A(n83), .B(n119), .Y(n87) );
  INVxp67_ASAP7_75t_R U143 ( .A(n115), .Y(n86) );
  NAND4xp25_ASAP7_75t_R U144 ( .A(n87), .B(n84), .C(n113), .D(n117), .Y(n85)
         );
  NOR2xp33_ASAP7_75t_R U145 ( .A(sum[9]), .B(n11), .Y(n91) );
  OR2x2_ASAP7_75t_R U146 ( .A(sum[8]), .B(n12), .Y(n89) );
  NOR2xp33_ASAP7_75t_R U147 ( .A(n91), .B(n88), .Y(n96) );
  OAI21xp33_ASAP7_75t_R U148 ( .A1(n92), .A2(n12), .B(n89), .Y(n90) );
  OAI21xp33_ASAP7_75t_R U149 ( .A1(n120), .A2(n90), .B(n117), .Y(n95) );
  A2O1A1Ixp33_ASAP7_75t_R U150 ( .A1(n96), .A2(n120), .B(n95), .C(n94), .Y(
        n122) );
  INVxp33_ASAP7_75t_R U151 ( .A(addend[7]), .Y(n112) );
  INVxp33_ASAP7_75t_R U152 ( .A(addend[0]), .Y(n98) );
  INVxp33_ASAP7_75t_R U153 ( .A(addend[3]), .Y(n103) );
  INVxp33_ASAP7_75t_R U154 ( .A(addend[2]), .Y(n102) );
  NOR4xp25_ASAP7_75t_R U155 ( .A(n120), .B(n119), .C(mypl), .D(n12), .Y(n118)
         );
endmodule

