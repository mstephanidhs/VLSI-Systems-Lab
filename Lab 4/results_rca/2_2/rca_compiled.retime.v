/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 13:13:29 2023
/////////////////////////////////////////////////////////////


module rca_pipelined ( clk, rstn, data_ina, data_inb, data_out );
  input [3:0] data_ina;
  input [3:0] data_inb;
  output [4:0] data_out;
  input clk, rstn;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n43, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61;
  wire   [3:0] a;
  wire   [3:0] b;
  wire   [6:2] pipeline;
  assign a[1] = data_ina[1];
  assign a[0] = data_ina[0];
  assign b[1] = data_inb[1];
  assign b[0] = data_inb[0];
  assign pipeline[6] = data_ina[3];
  assign pipeline[5] = data_ina[2];
  assign pipeline[4] = data_inb[3];
  assign pipeline[3] = data_inb[2];

  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG0_S1 ( .D(n40), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n61) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG1_S2 ( .D(n39), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n59) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG2_S3 ( .D(n38), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n58) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG3_S1 ( .D(n37), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n57) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG4_S2 ( .D(n36), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n56) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG7_S1 ( .D(n35), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n55) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG15_S1 ( .D(n33), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n54) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG16_S2 ( .D(n32), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n53) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG17_S3 ( .D(n31), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n52) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG18_S1 ( .D(n30), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n51) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG19_S2 ( .D(n29), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n50) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG20_S1 ( .D(n28), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n49) );
  ASYNC_DFFHx1_ASAP7_75t_R R_4_clk_r_REG11_S1 ( .D(n20), .CLK(clk), .RESET(n14), .SET(n60), .QN(n48) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG8_S2 ( .D(n27), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n47) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG5_S3 ( .D(n26), .CLK(clk), .RESET(n14), 
        .SET(n60), .QN(n46) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG13_S2 ( .D(n25), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n45) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG14_S3 ( .D(n24), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(data_out[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG9_S2 ( .D(n23), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(n43) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG10_S3 ( .D(n22), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(data_out[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R clk_r_REG6_S3 ( .D(n21), .CLK(clk), .RESET(n60), 
        .SET(n14), .QN(data_out[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R R_5_clk_r_REG11_S1 ( .D(n15), .CLK(clk), .RESET(n14), .SET(n60), .QN(n25) );
  HB1xp67_ASAP7_75t_R U19 ( .A(a[0]), .Y(n34) );
  INVxp33_ASAP7_75t_R U20 ( .A(b[1]), .Y(n28) );
  INVxp67_ASAP7_75t_R U21 ( .A(pipeline[6]), .Y(n40) );
  INVxp67_ASAP7_75t_R U22 ( .A(pipeline[3]), .Y(n30) );
  INVxp67_ASAP7_75t_R U23 ( .A(pipeline[4]), .Y(n33) );
  INVxp67_ASAP7_75t_R U24 ( .A(pipeline[5]), .Y(n37) );
  INVxp67_ASAP7_75t_R U25 ( .A(a[1]), .Y(n35) );
  OA21x2_ASAP7_75t_R U26 ( .A1(n34), .A2(b[0]), .B(n13), .Y(n15) );
  INVxp67_ASAP7_75t_R U27 ( .A(n45), .Y(n24) );
  INVxp67_ASAP7_75t_R U28 ( .A(n57), .Y(n36) );
  INVxp67_ASAP7_75t_R U29 ( .A(n51), .Y(n29) );
  INVxp67_ASAP7_75t_R U30 ( .A(n54), .Y(n32) );
  INVxp67_ASAP7_75t_R U31 ( .A(n53), .Y(n31) );
  INVxp67_ASAP7_75t_R U32 ( .A(n59), .Y(n38) );
  INVxp67_ASAP7_75t_R U33 ( .A(n43), .Y(n22) );
  INVxp67_ASAP7_75t_R U34 ( .A(n61), .Y(n39) );
  INVxp67_ASAP7_75t_R U35 ( .A(n20), .Y(n13) );
  AND2x4_ASAP7_75t_R U36 ( .A(a[0]), .B(b[0]), .Y(n20) );
  TIELOx1_ASAP7_75t_R U37 ( .L(n14) );
  BUFx2_ASAP7_75t_R U38 ( .A(n50), .Y(n9) );
  INVx1_ASAP7_75t_R U39 ( .A(n10), .Y(n26) );
  MAJIxp5_ASAP7_75t_R U40 ( .A(n56), .B(n9), .C(n12), .Y(n10) );
  BUFx3_ASAP7_75t_R U41 ( .A(n47), .Y(n12) );
  XNOR2xp5_ASAP7_75t_R U42 ( .A(n55), .B(n16), .Y(n23) );
  HB1xp67_ASAP7_75t_R U43 ( .A(n49), .Y(n11) );
  XNOR2xp5_ASAP7_75t_R U44 ( .A(n48), .B(n49), .Y(n16) );
  INVxp67_ASAP7_75t_R U45 ( .A(rstn), .Y(n60) );
  FAx1_ASAP7_75t_R U46 ( .A(n47), .B(n56), .CI(n50), .SN(n21) );
  INVxp67_ASAP7_75t_R U47 ( .A(n48), .Y(n17) );
  MAJIxp5_ASAP7_75t_R U48 ( .A(n17), .B(n11), .C(n55), .Y(n27) );
  FAx1_ASAP7_75t_R U49 ( .A(n46), .B(n58), .CI(n52), .SN(data_out[3]) );
  NOR2xp33_ASAP7_75t_R U50 ( .A(n58), .B(n52), .Y(n19) );
  NAND2xp33_ASAP7_75t_R U51 ( .A(n58), .B(n52), .Y(n18) );
  OAI21xp33_ASAP7_75t_R U52 ( .A1(n19), .A2(n46), .B(n18), .Y(data_out[4]) );
endmodule

