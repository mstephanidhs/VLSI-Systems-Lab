/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 14:04:50 2023
/////////////////////////////////////////////////////////////


module rca_w_regs ( clk, rstn, data_ina, data_inb, data_out );
  input [3:0] data_ina;
  input [3:0] data_inb;
  output [4:0] data_out;
  input clk, rstn;
  wire   \adder/fas[0].fa/N0 , n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [4:0] sum;

  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[3]  ( .D(data_inb[3]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n22) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[2]  ( .D(data_inb[2]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n21) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[1]  ( .D(data_inb[1]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n20) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[0]  ( .D(data_inb[0]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n19) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[3]  ( .D(data_ina[3]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n18) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[2]  ( .D(data_ina[2]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n17) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[1]  ( .D(data_ina[1]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n16) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[0]  ( .D(data_ina[0]), .CLK(clk), .RESET(n10), .SET(n23), .QN(n15) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[0]  ( .D(\adder/fas[0].fa/N0 ), .CLK(
        clk), .RESET(n10), .SET(n23), .QN(n14) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[4]  ( .D(sum[4]), .CLK(clk), .RESET(
        n10), .SET(n23), .QN(n13) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[3]  ( .D(sum[3]), .CLK(clk), .RESET(
        n10), .SET(n23), .QN(n12) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[2]  ( .D(sum[2]), .CLK(clk), .RESET(
        n10), .SET(n23), .QN(n11) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[1]  ( .D(sum[1]), .CLK(clk), .RESET(
        n10), .SET(n23), .QN(n9) );
  AOI21xp33_ASAP7_75t_R U23 ( .A1(n22), .A2(n18), .B(n37), .Y(n31) );
  NOR2xp67_ASAP7_75t_R U24 ( .A(n15), .B(n19), .Y(n29) );
  NAND2xp5_ASAP7_75t_R U25 ( .A(n38), .B(n24), .Y(n35) );
  AOI31xp33_ASAP7_75t_R U26 ( .A1(n24), .A2(n38), .A3(n39), .B(n37), .Y(n40)
         );
  NAND2xp5_ASAP7_75t_R U27 ( .A(n29), .B(n30), .Y(n24) );
  BUFx2_ASAP7_75t_R U28 ( .A(n16), .Y(n26) );
  HB1xp67_ASAP7_75t_R U29 ( .A(n29), .Y(n25) );
  HB1xp67_ASAP7_75t_R U30 ( .A(n17), .Y(n27) );
  HB1xp67_ASAP7_75t_R U31 ( .A(n21), .Y(n28) );
  AOI21xp33_ASAP7_75t_R U32 ( .A1(n15), .A2(n19), .B(n25), .Y(
        \adder/fas[0].fa/N0 ) );
  XOR2xp5_ASAP7_75t_R U33 ( .A(n42), .B(n25), .Y(sum[1]) );
  NAND2xp5_ASAP7_75t_R U34 ( .A(n16), .B(n20), .Y(n30) );
  XOR2xp5_ASAP7_75t_R U35 ( .A(n26), .B(n20), .Y(n42) );
  XNOR2xp5_ASAP7_75t_R U36 ( .A(n18), .B(n22), .Y(n41) );
  AO21x1_ASAP7_75t_R U37 ( .A1(n18), .A2(n39), .B(n22), .Y(n33) );
  INVxp67_ASAP7_75t_R U38 ( .A(rstn), .Y(n23) );
  OR2x2_ASAP7_75t_R U39 ( .A(n39), .B(n18), .Y(n32) );
  NAND2xp5_ASAP7_75t_R U40 ( .A(n31), .B(n35), .Y(n34) );
  TIELOx1_ASAP7_75t_R U41 ( .L(n10) );
  AND2x2_ASAP7_75t_R U42 ( .A(n17), .B(n21), .Y(n37) );
  OR2x2_ASAP7_75t_R U43 ( .A(n16), .B(n20), .Y(n38) );
  OR2x2_ASAP7_75t_R U44 ( .A(n17), .B(n21), .Y(n39) );
  NAND3xp33_ASAP7_75t_R U45 ( .A(n34), .B(n33), .C(n32), .Y(sum[4]) );
  XNOR2xp5_ASAP7_75t_R U46 ( .A(n27), .B(n28), .Y(n36) );
  XNOR2xp5_ASAP7_75t_R U47 ( .A(n36), .B(n35), .Y(sum[2]) );
  XNOR2xp5_ASAP7_75t_R U48 ( .A(n41), .B(n40), .Y(sum[3]) );
  INVxp33_ASAP7_75t_R U49 ( .A(n14), .Y(data_out[0]) );
  INVxp33_ASAP7_75t_R U50 ( .A(n9), .Y(data_out[1]) );
  INVxp33_ASAP7_75t_R U51 ( .A(n11), .Y(data_out[2]) );
  INVxp33_ASAP7_75t_R U52 ( .A(n12), .Y(data_out[3]) );
  INVxp33_ASAP7_75t_R U53 ( .A(n13), .Y(data_out[4]) );
endmodule

