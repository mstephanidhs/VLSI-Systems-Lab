/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue Jul  4 04:41:52 2023
/////////////////////////////////////////////////////////////


module gcd_fsm ( x_eq_y, x_gt_y, x_lt_y, clk, rst, data_en, x_sel, y_sel, 
        keep_x, keep_y, x_ld, y_ld, ready );
  input x_eq_y, x_gt_y, x_lt_y, clk, rst;
  output data_en, x_sel, y_sel, keep_x, keep_y, x_ld, y_ld, ready;
  wire   N60, N62, N63, n1, n2, x_ld, n4, data_en, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [2:0] state;
  assign y_ld = x_ld;
  assign ready = data_en;

  DHLx1_ASAP7_75t_R keep_x_reg ( .CLK(N60), .D(N62), .Q(keep_x) );
  DHLx1_ASAP7_75t_R keep_y_reg ( .CLK(N60), .D(N63), .Q(keep_y) );
  DHLx1_ASAP7_75t_R x_sel_reg ( .CLK(N60), .D(n4), .Q(x_sel) );
  DHLx1_ASAP7_75t_R y_sel_reg ( .CLK(N60), .D(n4), .Q(y_sel) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[2]  ( .D(n20), .CLK(clk), .RESET(rst), 
        .SET(n1), .QN(state[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[0]  ( .D(n22), .CLK(clk), .RESET(rst), 
        .SET(n1), .QN(state[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \state_reg[1]  ( .D(n21), .CLK(clk), .RESET(rst), 
        .SET(n1), .QN(state[1]) );
  TIELOx1_ASAP7_75t_R U3 ( .L(n1) );
  OAI22xp5_ASAP7_75t_R U4 ( .A1(n12), .A2(n15), .B1(n8), .B2(n10), .Y(n20) );
  HB1xp67_ASAP7_75t_R U5 ( .A(state[2]), .Y(n10) );
  AOI21xp5_ASAP7_75t_R U6 ( .A1(state[2]), .A2(state[1]), .B(n15), .Y(n2) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n16), .B(n2), .Y(n22) );
  INVx1_ASAP7_75t_R U8 ( .A(n17), .Y(n16) );
  AO21x1_ASAP7_75t_R U9 ( .A1(n2), .A2(n7), .B(n4), .Y(N60) );
  AND2x2_ASAP7_75t_R U10 ( .A(n2), .B(n16), .Y(x_ld) );
  NOR2xp33_ASAP7_75t_R U11 ( .A(n8), .B(n17), .Y(n4) );
  NOR2xp33_ASAP7_75t_R U12 ( .A(n10), .B(n19), .Y(N62) );
  INVx1_ASAP7_75t_R U13 ( .A(n9), .Y(n19) );
  NOR2xp33_ASAP7_75t_R U14 ( .A(x_eq_y), .B(x_lt_y), .Y(n13) );
  NOR2xp33_ASAP7_75t_R U15 ( .A(x_gt_y), .B(x_eq_y), .Y(n11) );
  AND2x2_ASAP7_75t_R U16 ( .A(n10), .B(n9), .Y(data_en) );
  HB1xp67_ASAP7_75t_R U17 ( .A(state[1]), .Y(n6) );
  INVxp33_ASAP7_75t_R U18 ( .A(n16), .Y(n7) );
  INVx1_ASAP7_75t_R U19 ( .A(n15), .Y(n8) );
  AND2x2_ASAP7_75t_R U20 ( .A(state[1]), .B(state[0]), .Y(n9) );
  NOR2xp33_ASAP7_75t_R U21 ( .A(n6), .B(n18), .Y(N63) );
  OR2x2_ASAP7_75t_R U22 ( .A(state[1]), .B(state[2]), .Y(n17) );
  NOR4xp25_ASAP7_75t_R U23 ( .A(x_gt_y), .B(n13), .C(state[1]), .D(state[2]), 
        .Y(n14) );
  NOR3xp33_ASAP7_75t_R U24 ( .A(n11), .B(state[1]), .C(state[2]), .Y(n12) );
  OAI22xp33_ASAP7_75t_R U25 ( .A1(n14), .A2(n15), .B1(n8), .B2(n6), .Y(n21) );
  NAND2xp33_ASAP7_75t_R U26 ( .A(n10), .B(n8), .Y(n18) );
  INVx1_ASAP7_75t_R U27 ( .A(state[0]), .Y(n15) );
endmodule


module gcd_dataflow_word8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n4, n6, n8, n10, n12, n14, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;

  FAx1_ASAP7_75t_R U2_7 ( .A(A[7]), .B(n23), .CI(n4), .SN(n24) );
  FAx1_ASAP7_75t_R U2_6 ( .A(A[6]), .B(n22), .CI(n6), .CON(n25), .SN(n26) );
  FAx1_ASAP7_75t_R U2_5 ( .A(A[5]), .B(n21), .CI(n8), .CON(n27), .SN(n28) );
  FAx1_ASAP7_75t_R U2_4 ( .A(A[4]), .B(n20), .CI(n10), .CON(n29), .SN(n30) );
  FAx1_ASAP7_75t_R U2_3 ( .A(A[3]), .B(n19), .CI(n12), .CON(n31), .SN(n32) );
  FAx1_ASAP7_75t_R U2_2 ( .A(A[2]), .B(n18), .CI(n14), .CON(n33), .SN(n34) );
  FAx1_ASAP7_75t_R U2_1 ( .A(A[1]), .B(n17), .CI(n1), .CON(n35), .SN(n36) );
  OR2x2_ASAP7_75t_R U1 ( .A(n16), .B(A[0]), .Y(n1) );
  INVx1_ASAP7_75t_R U2 ( .A(n25), .Y(n4) );
  INVx1_ASAP7_75t_R U3 ( .A(B[6]), .Y(n22) );
  INVx1_ASAP7_75t_R U4 ( .A(n27), .Y(n6) );
  INVx1_ASAP7_75t_R U5 ( .A(B[1]), .Y(n17) );
  INVx1_ASAP7_75t_R U6 ( .A(B[5]), .Y(n21) );
  INVx1_ASAP7_75t_R U7 ( .A(n29), .Y(n8) );
  INVx1_ASAP7_75t_R U8 ( .A(B[2]), .Y(n18) );
  INVx1_ASAP7_75t_R U9 ( .A(n35), .Y(n14) );
  INVx1_ASAP7_75t_R U10 ( .A(B[3]), .Y(n19) );
  INVx1_ASAP7_75t_R U11 ( .A(n33), .Y(n12) );
  INVx1_ASAP7_75t_R U12 ( .A(B[4]), .Y(n20) );
  INVx1_ASAP7_75t_R U13 ( .A(n31), .Y(n10) );
  INVx1_ASAP7_75t_R U14 ( .A(n26), .Y(DIFF[6]) );
  INVx1_ASAP7_75t_R U15 ( .A(n28), .Y(DIFF[5]) );
  INVx1_ASAP7_75t_R U16 ( .A(n36), .Y(DIFF[1]) );
  XNOR2xp5_ASAP7_75t_R U17 ( .A(n16), .B(A[0]), .Y(DIFF[0]) );
  INVx1_ASAP7_75t_R U18 ( .A(n32), .Y(DIFF[3]) );
  INVx1_ASAP7_75t_R U19 ( .A(n34), .Y(DIFF[2]) );
  INVx1_ASAP7_75t_R U20 ( .A(n30), .Y(DIFF[4]) );
  INVx1_ASAP7_75t_R U21 ( .A(n24), .Y(DIFF[7]) );
  INVx1_ASAP7_75t_R U22 ( .A(B[7]), .Y(n23) );
  INVx1_ASAP7_75t_R U23 ( .A(B[0]), .Y(n16) );
endmodule


module gcd_dataflow_word8_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n4, n6, n8, n10, n12, n14, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;

  FAx1_ASAP7_75t_R U2_7 ( .A(A[7]), .B(n23), .CI(n4), .SN(n24) );
  FAx1_ASAP7_75t_R U2_6 ( .A(A[6]), .B(n22), .CI(n6), .CON(n25), .SN(n26) );
  FAx1_ASAP7_75t_R U2_5 ( .A(A[5]), .B(n21), .CI(n8), .CON(n27), .SN(n28) );
  FAx1_ASAP7_75t_R U2_4 ( .A(A[4]), .B(n20), .CI(n10), .CON(n29), .SN(n30) );
  FAx1_ASAP7_75t_R U2_3 ( .A(A[3]), .B(n19), .CI(n12), .CON(n31), .SN(n32) );
  FAx1_ASAP7_75t_R U2_2 ( .A(A[2]), .B(n18), .CI(n14), .CON(n33), .SN(n34) );
  FAx1_ASAP7_75t_R U2_1 ( .A(A[1]), .B(n17), .CI(n1), .CON(n35), .SN(n36) );
  OR2x2_ASAP7_75t_R U1 ( .A(n16), .B(A[0]), .Y(n1) );
  INVx1_ASAP7_75t_R U2 ( .A(n25), .Y(n4) );
  INVx1_ASAP7_75t_R U3 ( .A(B[6]), .Y(n22) );
  INVx1_ASAP7_75t_R U4 ( .A(n27), .Y(n6) );
  INVx1_ASAP7_75t_R U5 ( .A(B[2]), .Y(n18) );
  INVx1_ASAP7_75t_R U6 ( .A(n35), .Y(n14) );
  INVx1_ASAP7_75t_R U7 ( .A(B[3]), .Y(n19) );
  INVx1_ASAP7_75t_R U8 ( .A(n33), .Y(n12) );
  INVx1_ASAP7_75t_R U9 ( .A(B[4]), .Y(n20) );
  INVx1_ASAP7_75t_R U10 ( .A(n31), .Y(n10) );
  INVx1_ASAP7_75t_R U11 ( .A(B[1]), .Y(n17) );
  INVx1_ASAP7_75t_R U12 ( .A(B[5]), .Y(n21) );
  INVx1_ASAP7_75t_R U13 ( .A(n29), .Y(n8) );
  XNOR2xp5_ASAP7_75t_R U14 ( .A(n16), .B(A[0]), .Y(DIFF[0]) );
  INVx1_ASAP7_75t_R U15 ( .A(n26), .Y(DIFF[6]) );
  INVx1_ASAP7_75t_R U16 ( .A(n24), .Y(DIFF[7]) );
  INVx1_ASAP7_75t_R U17 ( .A(B[7]), .Y(n23) );
  INVx1_ASAP7_75t_R U18 ( .A(n30), .Y(DIFF[4]) );
  INVx1_ASAP7_75t_R U19 ( .A(n32), .Y(DIFF[3]) );
  INVx1_ASAP7_75t_R U20 ( .A(n34), .Y(DIFF[2]) );
  INVx1_ASAP7_75t_R U21 ( .A(n36), .Y(DIFF[1]) );
  INVx1_ASAP7_75t_R U22 ( .A(n28), .Y(DIFF[5]) );
  INVx1_ASAP7_75t_R U23 ( .A(B[0]), .Y(n16) );
endmodule


module gcd_dataflow_word8 ( x_i, y_i, x_sel, y_sel, keep_x, keep_y, y_ld, x_ld, 
        data_en, data_o, x_eq_y, x_gt_y, x_lt_y );
  input [7:0] x_i;
  input [7:0] y_i;
  output [7:0] data_o;
  input x_sel, y_sel, keep_x, keep_y, y_ld, x_ld, data_en;
  output x_eq_y, x_gt_y, x_lt_y;
  wire   n2, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n1, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59;
  wire   [7:0] x_reg;
  wire   [7:0] y_reg;
  wire   [7:0] x_sub;
  wire   [7:0] y_sub;

  AOI222xp33_ASAP7_75t_R U20 ( .A1(x_reg[7]), .A2(n20), .B1(x_sub[7]), .B2(n21), .C1(x_sel), .C2(x_i[7]), .Y(n19) );
  AOI222xp33_ASAP7_75t_R U21 ( .A1(x_reg[6]), .A2(n20), .B1(x_sub[6]), .B2(n21), .C1(x_i[6]), .C2(x_sel), .Y(n22) );
  AOI222xp33_ASAP7_75t_R U22 ( .A1(x_reg[5]), .A2(n20), .B1(x_sub[5]), .B2(n21), .C1(x_i[5]), .C2(x_sel), .Y(n23) );
  AOI222xp33_ASAP7_75t_R U23 ( .A1(x_reg[4]), .A2(n20), .B1(x_sub[4]), .B2(n21), .C1(x_i[4]), .C2(x_sel), .Y(n24) );
  AOI222xp33_ASAP7_75t_R U24 ( .A1(x_reg[3]), .A2(n20), .B1(x_sub[3]), .B2(n21), .C1(x_i[3]), .C2(x_sel), .Y(n25) );
  AOI222xp33_ASAP7_75t_R U25 ( .A1(x_reg[2]), .A2(n20), .B1(x_sub[2]), .B2(n21), .C1(x_i[2]), .C2(x_sel), .Y(n26) );
  AOI222xp33_ASAP7_75t_R U26 ( .A1(x_reg[1]), .A2(n20), .B1(x_sub[1]), .B2(n21), .C1(x_i[1]), .C2(x_sel), .Y(n27) );
  AOI222xp33_ASAP7_75t_R U27 ( .A1(x_reg[0]), .A2(n20), .B1(x_sub[0]), .B2(n21), .C1(x_i[0]), .C2(x_sel), .Y(n28) );
  AOI222xp33_ASAP7_75t_R U28 ( .A1(y_reg[7]), .A2(n30), .B1(y_sub[7]), .B2(n31), .C1(y_sel), .C2(y_i[7]), .Y(n29) );
  AOI222xp33_ASAP7_75t_R U29 ( .A1(y_reg[6]), .A2(n30), .B1(y_sub[6]), .B2(n31), .C1(y_i[6]), .C2(y_sel), .Y(n32) );
  AOI222xp33_ASAP7_75t_R U30 ( .A1(y_reg[5]), .A2(n30), .B1(y_sub[5]), .B2(n31), .C1(y_i[5]), .C2(y_sel), .Y(n33) );
  AOI222xp33_ASAP7_75t_R U31 ( .A1(y_reg[4]), .A2(n30), .B1(y_sub[4]), .B2(n31), .C1(y_i[4]), .C2(y_sel), .Y(n34) );
  AOI222xp33_ASAP7_75t_R U32 ( .A1(y_reg[3]), .A2(n30), .B1(y_sub[3]), .B2(n31), .C1(y_i[3]), .C2(y_sel), .Y(n35) );
  AOI222xp33_ASAP7_75t_R U33 ( .A1(y_reg[2]), .A2(n30), .B1(y_sub[2]), .B2(n31), .C1(y_i[2]), .C2(y_sel), .Y(n36) );
  AOI222xp33_ASAP7_75t_R U34 ( .A1(y_reg[1]), .A2(n30), .B1(y_sub[1]), .B2(n31), .C1(y_i[1]), .C2(y_sel), .Y(n37) );
  AOI222xp33_ASAP7_75t_R U35 ( .A1(y_reg[0]), .A2(n30), .B1(y_sub[0]), .B2(n31), .C1(y_i[0]), .C2(y_sel), .Y(n38) );
  gcd_dataflow_word8_DW01_sub_0 sub_21 ( .A(y_reg), .B(x_reg), .CI(n2), .DIFF(
        y_sub) );
  gcd_dataflow_word8_DW01_sub_1 sub_19 ( .A(x_reg), .B(y_reg), .CI(n2), .DIFF(
        x_sub) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[7]  ( .D(n29), .CLK(y_ld), .QN(y_reg[7]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[4]  ( .D(n34), .CLK(y_ld), .QN(y_reg[4]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[2]  ( .D(n36), .CLK(y_ld), .QN(y_reg[2]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[3]  ( .D(n35), .CLK(y_ld), .QN(y_reg[3]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[0]  ( .D(n38), .CLK(y_ld), .QN(y_reg[0]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[1]  ( .D(n37), .CLK(y_ld), .QN(y_reg[1]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[5]  ( .D(n33), .CLK(y_ld), .QN(y_reg[5]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[5]  ( .D(n23), .CLK(x_ld), .QN(x_reg[5]) );
  DFFHQNx1_ASAP7_75t_R \y_reg_reg[6]  ( .D(n32), .CLK(y_ld), .QN(y_reg[6]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[1]  ( .D(n27), .CLK(x_ld), .QN(x_reg[1]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[2]  ( .D(n26), .CLK(x_ld), .QN(x_reg[2]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[3]  ( .D(n25), .CLK(x_ld), .QN(x_reg[3]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[4]  ( .D(n24), .CLK(x_ld), .QN(x_reg[4]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[7]  ( .D(n19), .CLK(x_ld), .QN(x_reg[7]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[6]  ( .D(n22), .CLK(x_ld), .QN(x_reg[6]) );
  DFFHQNx1_ASAP7_75t_R \x_reg_reg[0]  ( .D(n28), .CLK(x_ld), .QN(x_reg[0]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[7]  ( .D(n46), .CLK(data_en), .QN(data_o[7]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[6]  ( .D(n47), .CLK(data_en), .QN(data_o[6]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[5]  ( .D(n57), .CLK(data_en), .QN(data_o[5]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[4]  ( .D(n48), .CLK(data_en), .QN(data_o[4]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[3]  ( .D(n49), .CLK(data_en), .QN(data_o[3]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[2]  ( .D(n50), .CLK(data_en), .QN(data_o[2]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[1]  ( .D(n56), .CLK(data_en), .QN(data_o[1]) );
  DFFHQNx1_ASAP7_75t_R \data_o_reg[0]  ( .D(n51), .CLK(data_en), .QN(data_o[0]) );
  INVx1_ASAP7_75t_R U3 ( .A(n9), .Y(n55) );
  INVx1_ASAP7_75t_R U4 ( .A(y_reg[6]), .Y(n52) );
  NOR2xp33_ASAP7_75t_R U5 ( .A(n58), .B(x_sel), .Y(n20) );
  INVx1_ASAP7_75t_R U6 ( .A(keep_x), .Y(n58) );
  NOR2xp33_ASAP7_75t_R U7 ( .A(n59), .B(y_sel), .Y(n30) );
  INVx1_ASAP7_75t_R U8 ( .A(keep_y), .Y(n59) );
  NOR2xp33_ASAP7_75t_R U9 ( .A(n20), .B(x_sel), .Y(n21) );
  NOR2xp33_ASAP7_75t_R U10 ( .A(n30), .B(y_sel), .Y(n31) );
  INVx1_ASAP7_75t_R U11 ( .A(x_reg[6]), .Y(n47) );
  INVx1_ASAP7_75t_R U12 ( .A(x_reg[0]), .Y(n51) );
  INVx1_ASAP7_75t_R U13 ( .A(x_reg[4]), .Y(n48) );
  INVx1_ASAP7_75t_R U14 ( .A(x_reg[2]), .Y(n50) );
  INVx1_ASAP7_75t_R U15 ( .A(x_reg[3]), .Y(n49) );
  INVx1_ASAP7_75t_R U16 ( .A(x_reg[7]), .Y(n46) );
  INVx1_ASAP7_75t_R U17 ( .A(y_reg[1]), .Y(n54) );
  INVx1_ASAP7_75t_R U18 ( .A(x_reg[1]), .Y(n56) );
  INVx1_ASAP7_75t_R U19 ( .A(x_reg[5]), .Y(n57) );
  INVx1_ASAP7_75t_R U36 ( .A(y_reg[5]), .Y(n53) );
  TIELOx1_ASAP7_75t_R U37 ( .L(n2) );
  NOR2xp33_ASAP7_75t_R U38 ( .A(n46), .B(y_reg[7]), .Y(n43) );
  NOR2xp33_ASAP7_75t_R U39 ( .A(n48), .B(y_reg[4]), .Y(n16) );
  AND2x2_ASAP7_75t_R U40 ( .A(y_reg[4]), .B(n48), .Y(n6) );
  NOR2xp33_ASAP7_75t_R U41 ( .A(n16), .B(n6), .Y(n17) );
  OR2x2_ASAP7_75t_R U42 ( .A(n49), .B(y_reg[3]), .Y(n12) );
  NAND2xp33_ASAP7_75t_R U43 ( .A(y_reg[0]), .B(n51), .Y(n1) );
  AND2x2_ASAP7_75t_R U44 ( .A(x_reg[1]), .B(n1), .Y(n5) );
  OA21x2_ASAP7_75t_R U45 ( .A1(x_reg[1]), .A2(n1), .B(n54), .Y(n4) );
  OR2x2_ASAP7_75t_R U46 ( .A(n50), .B(y_reg[2]), .Y(n11) );
  NAND2xp33_ASAP7_75t_R U47 ( .A(y_reg[2]), .B(n50), .Y(n3) );
  NAND2xp33_ASAP7_75t_R U48 ( .A(n11), .B(n3), .Y(n14) );
  NAND2xp33_ASAP7_75t_R U49 ( .A(y_reg[3]), .B(n49), .Y(n18) );
  OAI311xp33_ASAP7_75t_R U50 ( .A1(n5), .A2(n4), .A3(n14), .B1(n18), .C1(n3), 
        .Y(n7) );
  NOR2xp33_ASAP7_75t_R U51 ( .A(n53), .B(x_reg[5]), .Y(n41) );
  AOI311xp33_ASAP7_75t_R U52 ( .A1(n17), .A2(n12), .A3(n7), .B(n6), .C(n41), 
        .Y(n8) );
  AND2x2_ASAP7_75t_R U53 ( .A(x_reg[5]), .B(n53), .Y(n15) );
  XNOR2xp5_ASAP7_75t_R U54 ( .A(n47), .B(y_reg[6]), .Y(n42) );
  OAI32xp33_ASAP7_75t_R U55 ( .A1(n8), .A2(n15), .A3(n42), .B1(n52), .B2(
        x_reg[6]), .Y(n9) );
  NAND2xp33_ASAP7_75t_R U56 ( .A(y_reg[7]), .B(n46), .Y(n44) );
  OAI21xp33_ASAP7_75t_R U57 ( .A1(n43), .A2(n55), .B(n44), .Y(x_lt_y) );
  NOR2xp33_ASAP7_75t_R U58 ( .A(y_reg[0]), .B(n51), .Y(n10) );
  MAJIxp5_ASAP7_75t_R U59 ( .A(n10), .B(x_reg[1]), .C(n54), .Y(n13) );
  OAI211xp5_ASAP7_75t_R U60 ( .A1(n14), .A2(n13), .B(n12), .C(n11), .Y(n39) );
  AOI311xp33_ASAP7_75t_R U61 ( .A1(n39), .A2(n18), .A3(n17), .B(n16), .C(n15), 
        .Y(n40) );
  OAI32xp33_ASAP7_75t_R U62 ( .A1(n42), .A2(n41), .A3(n40), .B1(y_reg[6]), 
        .B2(n47), .Y(n45) );
  AO21x1_ASAP7_75t_R U63 ( .A1(n45), .A2(n44), .B(n43), .Y(x_gt_y) );
  NOR2xp33_ASAP7_75t_R U64 ( .A(x_lt_y), .B(x_gt_y), .Y(x_eq_y) );
endmodule


module gcd ( x_i, y_i, clk, rst, data_o, ready );
  input [7:0] x_i;
  input [7:0] y_i;
  output [7:0] data_o;
  input clk, rst;
  output ready;
  wire   x_eq_y, x_gt_y, x_lt_y, data_en, x_sel, y_sel, keep_x, keep_y, x_ld,
         y_ld;

  gcd_fsm fsm ( .x_eq_y(x_eq_y), .x_gt_y(x_gt_y), .x_lt_y(x_lt_y), .clk(clk), 
        .rst(rst), .data_en(data_en), .x_sel(x_sel), .y_sel(y_sel), .keep_x(
        keep_x), .keep_y(keep_y), .x_ld(x_ld), .y_ld(y_ld), .ready(ready) );
  gcd_dataflow_word8 dataflow ( .x_i(x_i), .y_i(y_i), .x_sel(x_sel), .y_sel(
        y_sel), .keep_x(keep_x), .keep_y(keep_y), .y_ld(x_ld), .x_ld(y_ld), 
        .data_en(data_en), .data_o(data_o), .x_eq_y(x_eq_y), .x_gt_y(x_gt_y), 
        .x_lt_y(x_lt_y) );
endmodule

