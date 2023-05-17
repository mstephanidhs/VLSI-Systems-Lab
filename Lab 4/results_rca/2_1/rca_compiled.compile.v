/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 14:04:38 2023
/////////////////////////////////////////////////////////////


module fulladder_0 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3, n4;

  XNOR2xp5_ASAP7_75t_R U1 ( .A(b), .B(a), .Y(n3) );
  OAI21xp5_ASAP7_75t_R U2 ( .A1(n3), .A2(n2), .B(n1), .Y(cout) );
  INVxp67_ASAP7_75t_R U3 ( .A(n3), .Y(n4) );
  INVx1_ASAP7_75t_R U4 ( .A(cin), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U5 ( .A(cin), .B(n4), .Y(s) );
  NAND2xp5_ASAP7_75t_R U6 ( .A(b), .B(a), .Y(n1) );
endmodule


module fulladder_1 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3, n4;

  INVx1_ASAP7_75t_R U1 ( .A(cin), .Y(n1) );
  XNOR2xp5_ASAP7_75t_R U2 ( .A(b), .B(a), .Y(n3) );
  OAI21xp5_ASAP7_75t_R U3 ( .A1(n3), .A2(n1), .B(n2), .Y(cout) );
  INVx1_ASAP7_75t_R U4 ( .A(n3), .Y(n4) );
  NAND2xp5_ASAP7_75t_R U5 ( .A(b), .B(a), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U6 ( .A(n4), .B(cin), .Y(s) );
endmodule


module fulladder_2 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3, n4;

  XNOR2xp5_ASAP7_75t_R U1 ( .A(n1), .B(n2), .Y(s) );
  INVx2_ASAP7_75t_R U2 ( .A(cin), .Y(n2) );
  NAND2xp5_ASAP7_75t_R U3 ( .A(b), .B(a), .Y(n3) );
  XNOR2xp5_ASAP7_75t_R U4 ( .A(b), .B(a), .Y(n4) );
  XOR2xp5_ASAP7_75t_R U5 ( .A(b), .B(a), .Y(n1) );
  AOI22x1_ASAP7_75t_R U6 ( .A1(n2), .A2(n3), .B1(n4), .B2(n3), .Y(cout) );
endmodule


module fulladder_3 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1, n2, n3, n4, n5;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n5), .Y(s) );
  BUFx3_ASAP7_75t_R U2 ( .A(n3), .Y(n1) );
  XNOR2xp5_ASAP7_75t_R U3 ( .A(b), .B(a), .Y(n4) );
  INVx1_ASAP7_75t_R U4 ( .A(n4), .Y(n5) );
  INVx1_ASAP7_75t_R U5 ( .A(cin), .Y(n2) );
  NAND2xp33_ASAP7_75t_R U6 ( .A(b), .B(a), .Y(n3) );
  AOI22x1_ASAP7_75t_R U7 ( .A1(n2), .A2(n1), .B1(n4), .B2(n1), .Y(cout) );
endmodule


module rca_width4 ( a_i, b_i, sum_o );
  input [3:0] a_i;
  input [3:0] b_i;
  output [4:0] sum_o;
  wire   \*Logic0* ;
  wire   [3:1] temp_c;

  fulladder_0 \fas[0].fa  ( .a(a_i[0]), .b(b_i[0]), .cin(\*Logic0* ), .s(
        sum_o[0]), .cout(temp_c[1]) );
  fulladder_3 \fas[1].fa  ( .a(a_i[1]), .b(b_i[1]), .cin(temp_c[1]), .s(
        sum_o[1]), .cout(temp_c[2]) );
  fulladder_2 \fas[2].fa  ( .a(a_i[2]), .b(b_i[2]), .cin(temp_c[2]), .s(
        sum_o[2]), .cout(temp_c[3]) );
  fulladder_1 \fas[3].fa  ( .a(a_i[3]), .b(b_i[3]), .cin(temp_c[3]), .s(
        sum_o[3]), .cout(sum_o[4]) );
  TIELOx1_ASAP7_75t_R U2 ( .L(\*Logic0* ) );
endmodule


module rca_w_regs ( clk, rstn, data_ina, data_inb, data_out );
  input [3:0] data_ina;
  input [3:0] data_inb;
  output [4:0] data_out;
  input clk, rstn;
  wire   n1, n3, n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n28, n29;
  wire   [3:0] a;
  wire   [3:0] b;
  wire   [4:0] sum;

  rca_width4 adder ( .a_i(a), .b_i(b), .sum_o(sum) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[3]  ( .D(n25), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(b[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[0]  ( .D(n19), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(b[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[3]  ( .D(n17), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(a[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[2]  ( .D(n15), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(a[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[2]  ( .D(n23), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(b[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[1]  ( .D(n21), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(b[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[1]  ( .D(n13), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(a[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[0]  ( .D(n11), .CLK(clk), .RESET(n29), .SET(
        n28), .QN(a[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[3]  ( .D(n3), .CLK(clk), .RESET(n29), 
        .SET(n28), .QN(data_out[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[4]  ( .D(n1), .CLK(clk), .RESET(n29), 
        .SET(n28), .QN(data_out[4]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[0]  ( .D(n9), .CLK(clk), .RESET(n29), 
        .SET(n28), .QN(data_out[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[1]  ( .D(n7), .CLK(clk), .RESET(n29), 
        .SET(n28), .QN(data_out[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[2]  ( .D(n5), .CLK(clk), .RESET(n29), 
        .SET(n28), .QN(data_out[2]) );
  TIELOx1_ASAP7_75t_R U30 ( .L(n28) );
  INVx1_ASAP7_75t_R U31 ( .A(sum[3]), .Y(n3) );
  INVx1_ASAP7_75t_R U32 ( .A(sum[4]), .Y(n1) );
  INVx1_ASAP7_75t_R U33 ( .A(sum[2]), .Y(n5) );
  INVx1_ASAP7_75t_R U34 ( .A(sum[1]), .Y(n7) );
  INVx1_ASAP7_75t_R U35 ( .A(sum[0]), .Y(n9) );
  INVx1_ASAP7_75t_R U36 ( .A(data_inb[1]), .Y(n21) );
  INVx1_ASAP7_75t_R U37 ( .A(data_inb[2]), .Y(n23) );
  INVx1_ASAP7_75t_R U38 ( .A(data_ina[2]), .Y(n15) );
  INVx1_ASAP7_75t_R U39 ( .A(data_ina[3]), .Y(n17) );
  INVx1_ASAP7_75t_R U40 ( .A(data_inb[0]), .Y(n19) );
  INVx1_ASAP7_75t_R U41 ( .A(data_inb[3]), .Y(n25) );
  INVx1_ASAP7_75t_R U42 ( .A(rstn), .Y(n29) );
  INVx1_ASAP7_75t_R U43 ( .A(data_ina[1]), .Y(n13) );
  INVx1_ASAP7_75t_R U44 ( .A(data_ina[0]), .Y(n11) );
endmodule

