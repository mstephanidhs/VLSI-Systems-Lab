/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Wed May 17 11:24:10 2023
/////////////////////////////////////////////////////////////


module fulladder_0 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n1;

  AO22x1_ASAP7_75t_R U1 ( .A1(b), .A2(a), .B1(n1), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n1) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(cin), .B(n1), .Y(s) );
endmodule


module fulladder_3 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n2) );
  AO22x1_ASAP7_75t_R U3 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
endmodule


module irca_width2_0 ( c_i, a_i, b_i, sum_o );
  input [1:0] a_i;
  input [1:0] b_i;
  output [2:0] sum_o;
  input c_i;
  wire   \temp_c[1] ;

  fulladder_0 \fas[0].fa  ( .a(a_i[0]), .b(b_i[0]), .cin(c_i), .s(sum_o[0]), 
        .cout(\temp_c[1] ) );
  fulladder_3 \fas[1].fa  ( .a(a_i[1]), .b(b_i[1]), .cin(\temp_c[1] ), .s(
        sum_o[1]), .cout(sum_o[2]) );
endmodule


module fulladder_1 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  XOR2xp5_ASAP7_75t_R U1 ( .A(cin), .B(n2), .Y(s) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n2) );
  AO22x1_ASAP7_75t_R U3 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
endmodule


module fulladder_2 ( a, b, cin, s, cout );
  input a, b, cin;
  output s, cout;
  wire   n2;

  AO22x1_ASAP7_75t_R U1 ( .A1(b), .A2(a), .B1(n2), .B2(cin), .Y(cout) );
  XOR2xp5_ASAP7_75t_R U2 ( .A(a), .B(b), .Y(n2) );
  XOR2xp5_ASAP7_75t_R U3 ( .A(cin), .B(n2), .Y(s) );
endmodule


module irca_width2_1 ( c_i, a_i, b_i, sum_o );
  input [1:0] a_i;
  input [1:0] b_i;
  output [2:0] sum_o;
  input c_i;
  wire   \temp_c[1] ;

  fulladder_2 \fas[0].fa  ( .a(a_i[0]), .b(b_i[0]), .cin(c_i), .s(sum_o[0]), 
        .cout(\temp_c[1] ) );
  fulladder_1 \fas[1].fa  ( .a(a_i[1]), .b(b_i[1]), .cin(\temp_c[1] ), .s(
        sum_o[1]), .cout(sum_o[2]) );
endmodule


module rca_pipelined ( clk, rstn, data_ina, data_inb, data_out );
  input [3:0] data_ina;
  input [3:0] data_inb;
  output [4:0] data_out;
  input clk, rstn;
  wire   n40, n1, n3, n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n27,
         n29, n31, n33, n35, n37, n39, n41;
  wire   [3:0] a;
  wire   [3:0] b;
  wire   [2:0] temp_sum;
  wire   [6:2] pipeline;
  wire   [4:0] sum;

  irca_width2_0 first_stage ( .c_i(n40), .a_i(a[1:0]), .b_i(b[1:0]), .sum_o(
        temp_sum) );
  irca_width2_1 second_stage ( .c_i(pipeline[2]), .a_i(pipeline[6:5]), .b_i(
        pipeline[4:3]), .sum_o(sum[4:2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[3]  ( .D(n39), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(b[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[4]  ( .D(n37), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(pipeline[4]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[2]  ( .D(n35), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(b[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[3]  ( .D(n33), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(pipeline[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[1]  ( .D(n31), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(b[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \b_reg[0]  ( .D(n29), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(b[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[3]  ( .D(n27), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(a[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[6]  ( .D(n25), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(pipeline[6]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[2]  ( .D(n23), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(a[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[5]  ( .D(n21), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(pipeline[5]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[1]  ( .D(n19), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(a[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \a_reg[0]  ( .D(n17), .CLK(clk), .RESET(n41), .SET(
        n40), .QN(a[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[0]  ( .D(n15), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(sum[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[0]  ( .D(n13), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(data_out[0]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[1]  ( .D(n11), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(sum[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[1]  ( .D(n9), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(data_out[1]) );
  ASYNC_DFFHx1_ASAP7_75t_R \pipeline_reg[2]  ( .D(n7), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(pipeline[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[2]  ( .D(n5), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(data_out[2]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[3]  ( .D(n3), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(data_out[3]) );
  ASYNC_DFFHx1_ASAP7_75t_R \data_out_reg[4]  ( .D(n1), .CLK(clk), .RESET(n41), 
        .SET(n40), .QN(data_out[4]) );
  INVx1_ASAP7_75t_R U3 ( .A(sum[4]), .Y(n1) );
  INVx1_ASAP7_75t_R U5 ( .A(sum[3]), .Y(n3) );
  INVx1_ASAP7_75t_R U7 ( .A(sum[2]), .Y(n5) );
  INVx1_ASAP7_75t_R U9 ( .A(temp_sum[2]), .Y(n7) );
  INVx1_ASAP7_75t_R U11 ( .A(sum[1]), .Y(n9) );
  INVx1_ASAP7_75t_R U13 ( .A(temp_sum[1]), .Y(n11) );
  INVx1_ASAP7_75t_R U15 ( .A(sum[0]), .Y(n13) );
  INVx1_ASAP7_75t_R U17 ( .A(temp_sum[0]), .Y(n15) );
  INVx1_ASAP7_75t_R U19 ( .A(data_ina[0]), .Y(n17) );
  INVx1_ASAP7_75t_R U21 ( .A(data_ina[1]), .Y(n19) );
  INVx1_ASAP7_75t_R U23 ( .A(a[2]), .Y(n21) );
  INVx1_ASAP7_75t_R U25 ( .A(data_ina[2]), .Y(n23) );
  INVx1_ASAP7_75t_R U27 ( .A(a[3]), .Y(n25) );
  INVx1_ASAP7_75t_R U29 ( .A(data_ina[3]), .Y(n27) );
  INVx1_ASAP7_75t_R U31 ( .A(data_inb[0]), .Y(n29) );
  INVx1_ASAP7_75t_R U33 ( .A(data_inb[1]), .Y(n31) );
  INVx1_ASAP7_75t_R U35 ( .A(b[2]), .Y(n33) );
  INVx1_ASAP7_75t_R U37 ( .A(data_inb[2]), .Y(n35) );
  INVx1_ASAP7_75t_R U39 ( .A(b[3]), .Y(n37) );
  INVx1_ASAP7_75t_R U41 ( .A(data_inb[3]), .Y(n39) );
  INVx1_ASAP7_75t_R U44 ( .A(rstn), .Y(n41) );
  TIELOx1_ASAP7_75t_R U45 ( .L(n40) );
endmodule

