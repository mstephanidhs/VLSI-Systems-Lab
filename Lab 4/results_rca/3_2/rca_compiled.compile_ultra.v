/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 14:05:06 2023
/////////////////////////////////////////////////////////////


module vmcoffee ( C5, C10, NFC, BEANS, rstn, clk, WATER, COFFEE, ERROR );
  input [4:0] WATER;
  input C5, C10, NFC, BEANS, rstn, clk;
  output COFFEE, ERROR;
  wire   n14, n16, n17, n18, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n44;

  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[1]  ( .D(n17), .CLK(clk), .RESET(n42), 
        .SET(n44), .QN(n14) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[0]  ( .D(n18), .CLK(clk), .RESET(n42), 
        .SET(n44), .QN(n16) );
  INVx1_ASAP7_75t_R U22 ( .A(n38), .Y(n24) );
  INVxp33_ASAP7_75t_R U23 ( .A(C5), .Y(n28) );
  INVxp33_ASAP7_75t_R U24 ( .A(n37), .Y(ERROR) );
  INVxp33_ASAP7_75t_R U25 ( .A(NFC), .Y(n27) );
  NAND2xp5_ASAP7_75t_R U26 ( .A(BEANS), .B(n31), .Y(n38) );
  OAI21xp5_ASAP7_75t_R U27 ( .A1(n24), .A2(ERROR), .B(n21), .Y(n18) );
  NAND2xp5_ASAP7_75t_R U28 ( .A(n14), .B(n22), .Y(n21) );
  NAND2xp5_ASAP7_75t_R U29 ( .A(n23), .B(n36), .Y(n22) );
  OR2x2_ASAP7_75t_R U30 ( .A(n16), .B(n29), .Y(n36) );
  A2O1A1Ixp33_ASAP7_75t_R U31 ( .A1(n38), .A2(n30), .B(C5), .C(n16), .Y(n23)
         );
  NOR2xp33_ASAP7_75t_R U32 ( .A(n16), .B(n14), .Y(n37) );
  NAND2xp33_ASAP7_75t_R U33 ( .A(n38), .B(n37), .Y(n39) );
  TIELOx1_ASAP7_75t_R U34 ( .L(n42) );
  NOR2xp33_ASAP7_75t_R U35 ( .A(WATER[4]), .B(WATER[3]), .Y(n26) );
  NOR2xp33_ASAP7_75t_R U36 ( .A(WATER[2]), .B(WATER[1]), .Y(n25) );
  NAND2xp33_ASAP7_75t_R U37 ( .A(n26), .B(n25), .Y(n31) );
  NOR2xp33_ASAP7_75t_R U38 ( .A(C10), .B(n27), .Y(n30) );
  NAND2xp33_ASAP7_75t_R U39 ( .A(n28), .B(n30), .Y(n29) );
  INVxp33_ASAP7_75t_R U40 ( .A(rstn), .Y(n44) );
  NAND2xp33_ASAP7_75t_R U41 ( .A(BEANS), .B(n30), .Y(n33) );
  INVxp33_ASAP7_75t_R U42 ( .A(n31), .Y(n32) );
  NOR2xp33_ASAP7_75t_R U43 ( .A(n33), .B(n32), .Y(n34) );
  OAI21xp33_ASAP7_75t_R U44 ( .A1(C5), .A2(n34), .B(n16), .Y(n35) );
  NAND3xp33_ASAP7_75t_R U45 ( .A(n14), .B(n36), .C(n35), .Y(n40) );
  NAND2xp5_ASAP7_75t_R U46 ( .A(n40), .B(n39), .Y(n17) );
  INVxp33_ASAP7_75t_R U47 ( .A(n16), .Y(n41) );
  NOR2xp33_ASAP7_75t_R U48 ( .A(n41), .B(n14), .Y(COFFEE) );
endmodule

