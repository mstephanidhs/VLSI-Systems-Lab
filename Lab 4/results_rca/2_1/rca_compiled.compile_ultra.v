/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue May 16 19:54:22 2023
/////////////////////////////////////////////////////////////


module rca_w_regs ( clk, rstn, data_ina, data_inb, data_out );
  input [3:0] data_ina;
  input [3:0] data_inb;
  output [4:0] data_out;
  input clk, rstn;
  wire   \adder/fas[0].fa/N0 , n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;
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
  INVxp67_ASAP7_75t_R U23 ( .A(rstn), .Y(n23) );
  TIELOx1_ASAP7_75t_R U24 ( .L(n10) );
  INVxp33_ASAP7_75t_R U25 ( .A(n13), .Y(data_out[4]) );
  INVxp33_ASAP7_75t_R U26 ( .A(n9), .Y(data_out[1]) );
  INVxp33_ASAP7_75t_R U27 ( .A(n14), .Y(data_out[0]) );
  INVxp33_ASAP7_75t_R U28 ( .A(n12), .Y(data_out[3]) );
  INVxp33_ASAP7_75t_R U29 ( .A(n11), .Y(data_out[2]) );
  NOR2xp33_ASAP7_75t_R U30 ( .A(n19), .B(n15), .Y(n24) );
  AOI21xp33_ASAP7_75t_R U31 ( .A1(n15), .A2(n19), .B(n24), .Y(
        \adder/fas[0].fa/N0 ) );
  INVxp33_ASAP7_75t_R U32 ( .A(n24), .Y(n29) );
  MAJIxp5_ASAP7_75t_R U33 ( .A(n20), .B(n16), .C(n29), .Y(n28) );
  INVxp33_ASAP7_75t_R U34 ( .A(n17), .Y(n25) );
  INVxp33_ASAP7_75t_R U35 ( .A(n21), .Y(n27) );
  MAJIxp5_ASAP7_75t_R U36 ( .A(n28), .B(n25), .C(n27), .Y(n26) );
  MAJIxp5_ASAP7_75t_R U37 ( .A(n22), .B(n18), .C(n26), .Y(sum[4]) );
  FAx1_ASAP7_75t_R U38 ( .A(n22), .B(n18), .CI(n26), .SN(sum[3]) );
  FAx1_ASAP7_75t_R U39 ( .A(n17), .B(n28), .CI(n27), .SN(sum[2]) );
  FAx1_ASAP7_75t_R U40 ( .A(n20), .B(n16), .CI(n29), .SN(sum[1]) );
endmodule

