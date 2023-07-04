/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue Jul  4 04:38:12 2023
/////////////////////////////////////////////////////////////


module vmcoffee ( C5, C10, NFC, BEANS, rstn, clk, WATER, COFFEE, ERROR );
  input [4:0] WATER;
  input C5, C10, NFC, BEANS, rstn, clk;
  output COFFEE, ERROR;
  wire   n14, n15, n16, n17, n18, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[0]  ( .D(n18), .CLK(clk), .RESET(n15), 
        .SET(n41), .QN(n16) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[1]  ( .D(n17), .CLK(clk), .RESET(n15), 
        .SET(n41), .QN(n14) );
  NAND2x1_ASAP7_75t_R U22 ( .A(n28), .B(n27), .Y(n38) );
  NOR2xp67_ASAP7_75t_R U23 ( .A(C10), .B(n23), .Y(n35) );
  OAI21xp5_ASAP7_75t_R U24 ( .A1(n36), .A2(WATER[3]), .B(BEANS), .Y(n28) );
  INVxp67_ASAP7_75t_R U25 ( .A(C5), .Y(n31) );
  NOR2xp33_ASAP7_75t_R U26 ( .A(n16), .B(n25), .Y(n40) );
  INVx1_ASAP7_75t_R U27 ( .A(n22), .Y(n21) );
  INVx1_ASAP7_75t_R U28 ( .A(n14), .Y(n22) );
  INVx1_ASAP7_75t_R U29 ( .A(n16), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U30 ( .A(BEANS), .B(WATER[3]), .Y(n32) );
  INVxp33_ASAP7_75t_R U31 ( .A(NFC), .Y(n23) );
  OAI21xp33_ASAP7_75t_R U32 ( .A1(n30), .A2(n37), .B(n21), .Y(n39) );
  OAI21xp33_ASAP7_75t_R U33 ( .A1(n33), .A2(n32), .B(n31), .Y(n34) );
  NAND2xp33_ASAP7_75t_R U34 ( .A(n32), .B(n35), .Y(n24) );
  INVxp33_ASAP7_75t_R U35 ( .A(n35), .Y(n33) );
  INVxp33_ASAP7_75t_R U36 ( .A(n27), .Y(ERROR) );
  TIELOx1_ASAP7_75t_R U37 ( .L(n15) );
  INVxp33_ASAP7_75t_R U38 ( .A(rstn), .Y(n41) );
  AND2x2_ASAP7_75t_R U39 ( .A(n22), .B(n30), .Y(n27) );
  OR3x1_ASAP7_75t_R U40 ( .A(WATER[4]), .B(WATER[1]), .C(WATER[2]), .Y(n36) );
  A2O1A1Ixp33_ASAP7_75t_R U41 ( .A1(BEANS), .A2(n36), .B(n24), .C(n31), .Y(n26) );
  NAND3xp33_ASAP7_75t_R U42 ( .A(n14), .B(n35), .C(n31), .Y(n25) );
  AOI31xp33_ASAP7_75t_R U43 ( .A1(n21), .A2(n16), .A3(n26), .B(n40), .Y(n29)
         );
  NAND2xp5_ASAP7_75t_R U44 ( .A(n29), .B(n38), .Y(n18) );
  NOR2xp33_ASAP7_75t_R U45 ( .A(n30), .B(n21), .Y(COFFEE) );
  AOI31xp33_ASAP7_75t_R U46 ( .A1(n36), .A2(BEANS), .A3(n35), .B(n34), .Y(n37)
         );
  OAI21xp5_ASAP7_75t_R U47 ( .A1(n40), .A2(n39), .B(n38), .Y(n17) );
endmodule

