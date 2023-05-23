/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Tue May 23 04:18:09 2023
/////////////////////////////////////////////////////////////


module gcd ( x_i, y_i, clk, rst, data_o, ready );
  input [7:0] x_i;
  input [7:0] y_i;
  output [7:0] data_o;
  input clk, rst;
  output ready;
  wire   data_en, x_sel, keep_x, keep_y, \fsm/N63 , \fsm/N62 , \fsm/N61 , n56,
         n57, n58, n59, n61, n63, n65, n67, n69, n71, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207;
  wire   [7:0] \dataflow/y_reg ;
  wire   [7:0] \dataflow/x_reg ;
  assign ready = data_en;

  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[7]  ( .D(n83), .CLK(n198), .QN(
        \dataflow/x_reg [7]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[7]  ( .D(n207), .CLK(n88), .QN(
        data_o[7]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[6]  ( .D(n81), .CLK(n198), .QN(
        \dataflow/y_reg [6]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[7]  ( .D(n80), .CLK(n198), .QN(
        \dataflow/y_reg [7]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[0]  ( .D(n79), .CLK(n198), .QN(
        \dataflow/y_reg [0]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[1]  ( .D(n78), .CLK(n198), .QN(
        \dataflow/y_reg [1]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[2]  ( .D(n77), .CLK(n198), .QN(
        \dataflow/y_reg [2]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[3]  ( .D(n76), .CLK(n198), .QN(
        \dataflow/y_reg [3]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[4]  ( .D(n75), .CLK(n198), .QN(
        \dataflow/y_reg [4]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/y_reg_reg[5]  ( .D(n74), .CLK(n198), .QN(
        \dataflow/y_reg [5]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[6]  ( .D(n73), .CLK(n198), .QN(
        \dataflow/x_reg [6]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[6]  ( .D(n206), .CLK(n88), .QN(
        data_o[6]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[0]  ( .D(n71), .CLK(n198), .QN(
        \dataflow/x_reg [0]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[0]  ( .D(n203), .CLK(data_en), 
        .QN(data_o[0]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[1]  ( .D(n69), .CLK(n198), .QN(
        \dataflow/x_reg [1]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[1]  ( .D(n202), .CLK(data_en), 
        .QN(data_o[1]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[2]  ( .D(n67), .CLK(n198), .QN(
        \dataflow/x_reg [2]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[2]  ( .D(n201), .CLK(data_en), 
        .QN(data_o[2]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[3]  ( .D(n65), .CLK(n198), .QN(
        \dataflow/x_reg [3]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[3]  ( .D(n199), .CLK(data_en), 
        .QN(data_o[3]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[4]  ( .D(n63), .CLK(n198), .QN(
        \dataflow/x_reg [4]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[4]  ( .D(n204), .CLK(data_en), 
        .QN(data_o[4]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/x_reg_reg[5]  ( .D(n61), .CLK(n198), .QN(
        \dataflow/x_reg [5]) );
  DFFHQNx1_ASAP7_75t_R \dataflow/data_o_reg[5]  ( .D(n205), .CLK(data_en), 
        .QN(data_o[5]) );
  ASYNC_DFFHx1_ASAP7_75t_R \fsm/state_reg[1]  ( .D(n84), .CLK(clk), .RESET(n57), .SET(rst), .QN(n59) );
  ASYNC_DFFHx1_ASAP7_75t_R \fsm/state_reg[2]  ( .D(n86), .CLK(clk), .RESET(n57), .SET(rst), .QN(n58) );
  ASYNC_DFFHx1_ASAP7_75t_R \fsm/state_reg[0]  ( .D(n85), .CLK(clk), .RESET(n57), .SET(rst), .QN(n56) );
  DHLx1_ASAP7_75t_R \fsm/keep_y_reg  ( .CLK(n200), .D(\fsm/N63 ), .Q(keep_y)
         );
  DHLx1_ASAP7_75t_R \fsm/keep_x_reg  ( .CLK(n200), .D(\fsm/N62 ), .Q(keep_x)
         );
  DHLx1_ASAP7_75t_R \fsm/x_sel_reg  ( .CLK(n200), .D(\fsm/N61 ), .Q(x_sel) );
  NOR2xp33_ASAP7_75t_R U90 ( .A(n56), .B(n125), .Y(n87) );
  NOR2xp33_ASAP7_75t_R U91 ( .A(n56), .B(n125), .Y(n121) );
  NOR2xp33_ASAP7_75t_R U92 ( .A(n58), .B(n192), .Y(n88) );
  OAI21xp5_ASAP7_75t_R U93 ( .A1(n127), .A2(n89), .B(n111), .Y(n86) );
  INVxp33_ASAP7_75t_R U94 ( .A(n124), .Y(n89) );
  INVxp33_ASAP7_75t_R U95 ( .A(n127), .Y(n90) );
  INVx1_ASAP7_75t_R U96 ( .A(n56), .Y(n127) );
  NAND2xp33_ASAP7_75t_R U97 ( .A(n58), .B(n59), .Y(n91) );
  INVxp33_ASAP7_75t_R U98 ( .A(n124), .Y(n92) );
  NAND2xp5_ASAP7_75t_R U99 ( .A(n58), .B(n59), .Y(n125) );
  OAI21xp33_ASAP7_75t_R U100 ( .A1(n126), .A2(n56), .B(n91), .Y(n85) );
  INVxp33_ASAP7_75t_R U101 ( .A(n119), .Y(n131) );
  INVxp33_ASAP7_75t_R U102 ( .A(n148), .Y(n116) );
  INVxp33_ASAP7_75t_R U103 ( .A(n118), .Y(n130) );
  NAND2xp5_ASAP7_75t_R U104 ( .A(n110), .B(n121), .Y(n111) );
  INVxp33_ASAP7_75t_R U105 ( .A(n58), .Y(n124) );
  NAND2xp33_ASAP7_75t_R U106 ( .A(n104), .B(n103), .Y(n93) );
  INVxp33_ASAP7_75t_R U107 ( .A(\dataflow/y_reg [2]), .Y(n94) );
  INVxp33_ASAP7_75t_R U108 ( .A(n133), .Y(n98) );
  NAND2xp33_ASAP7_75t_R U109 ( .A(\dataflow/y_reg [6]), .B(n206), .Y(n134) );
  NAND2xp33_ASAP7_75t_R U110 ( .A(n101), .B(n172), .Y(n171) );
  INVxp33_ASAP7_75t_R U111 ( .A(\dataflow/x_reg [6]), .Y(n206) );
  NOR2xp33_ASAP7_75t_R U112 ( .A(n58), .B(n192), .Y(data_en) );
  TIELOx1_ASAP7_75t_R U113 ( .L(n57) );
  INVxp33_ASAP7_75t_R U114 ( .A(\dataflow/x_reg [4]), .Y(n204) );
  INVxp33_ASAP7_75t_R U115 ( .A(\dataflow/x_reg [2]), .Y(n201) );
  INVxp33_ASAP7_75t_R U116 ( .A(\dataflow/x_reg [7]), .Y(n207) );
  INVxp33_ASAP7_75t_R U117 ( .A(\dataflow/y_reg [5]), .Y(n102) );
  NOR2xp33_ASAP7_75t_R U118 ( .A(\dataflow/x_reg [5]), .B(n102), .Y(n159) );
  NAND2xp33_ASAP7_75t_R U119 ( .A(\dataflow/y_reg [4]), .B(n204), .Y(n166) );
  INVxp33_ASAP7_75t_R U120 ( .A(\dataflow/y_reg [3]), .Y(n96) );
  NOR2xp33_ASAP7_75t_R U121 ( .A(\dataflow/x_reg [3]), .B(n96), .Y(n133) );
  NAND2xp33_ASAP7_75t_R U122 ( .A(\dataflow/x_reg [2]), .B(n94), .Y(n99) );
  INVxp33_ASAP7_75t_R U123 ( .A(n99), .Y(n114) );
  INVxp33_ASAP7_75t_R U124 ( .A(\dataflow/y_reg [1]), .Y(n95) );
  NOR2xp33_ASAP7_75t_R U125 ( .A(\dataflow/x_reg [1]), .B(n95), .Y(n113) );
  INVxp33_ASAP7_75t_R U126 ( .A(\dataflow/y_reg [0]), .Y(n100) );
  NAND2xp33_ASAP7_75t_R U127 ( .A(\dataflow/x_reg [0]), .B(n100), .Y(n172) );
  NAND2xp33_ASAP7_75t_R U128 ( .A(\dataflow/x_reg [1]), .B(n95), .Y(n112) );
  OAI21xp33_ASAP7_75t_R U129 ( .A1(n113), .A2(n172), .B(n112), .Y(n179) );
  NAND2xp33_ASAP7_75t_R U130 ( .A(\dataflow/y_reg [2]), .B(n201), .Y(n115) );
  OAI21xp33_ASAP7_75t_R U131 ( .A1(n114), .A2(n179), .B(n115), .Y(n182) );
  NAND2xp33_ASAP7_75t_R U132 ( .A(\dataflow/x_reg [3]), .B(n96), .Y(n132) );
  INVxp33_ASAP7_75t_R U133 ( .A(n113), .Y(n97) );
  NAND2xp33_ASAP7_75t_R U134 ( .A(n112), .B(n97), .Y(n174) );
  NAND2xp33_ASAP7_75t_R U135 ( .A(n132), .B(n98), .Y(n193) );
  NAND2xp33_ASAP7_75t_R U136 ( .A(n99), .B(n115), .Y(n180) );
  NOR2xp33_ASAP7_75t_R U137 ( .A(\dataflow/x_reg [0]), .B(n100), .Y(n175) );
  INVxp33_ASAP7_75t_R U138 ( .A(n175), .Y(n101) );
  NOR4xp25_ASAP7_75t_R U139 ( .A(n174), .B(n193), .C(n180), .D(n171), .Y(n104)
         );
  NOR2xp33_ASAP7_75t_R U140 ( .A(\dataflow/y_reg [7]), .B(n207), .Y(n119) );
  NOR2xp33_ASAP7_75t_R U141 ( .A(\dataflow/y_reg [6]), .B(n206), .Y(n148) );
  NAND2xp33_ASAP7_75t_R U142 ( .A(\dataflow/x_reg [5]), .B(n102), .Y(n154) );
  INVxp33_ASAP7_75t_R U143 ( .A(n154), .Y(n158) );
  NOR2xp33_ASAP7_75t_R U144 ( .A(\dataflow/y_reg [4]), .B(n204), .Y(n168) );
  NOR4xp25_ASAP7_75t_R U145 ( .A(n119), .B(n148), .C(n158), .D(n168), .Y(n103)
         );
  OAI211xp5_ASAP7_75t_R U146 ( .A1(n133), .A2(n182), .B(n132), .C(n93), .Y(
        n105) );
  AOI211xp5_ASAP7_75t_R U147 ( .A1(n166), .A2(n105), .B(n158), .C(n168), .Y(
        n109) );
  INVxp33_ASAP7_75t_R U148 ( .A(n134), .Y(n147) );
  INVxp33_ASAP7_75t_R U149 ( .A(\dataflow/y_reg [7]), .Y(n106) );
  NOR2xp33_ASAP7_75t_R U150 ( .A(\dataflow/x_reg [7]), .B(n106), .Y(n118) );
  NOR2xp33_ASAP7_75t_R U151 ( .A(n147), .B(n118), .Y(n107) );
  INVxp33_ASAP7_75t_R U152 ( .A(n107), .Y(n108) );
  OAI321xp33_ASAP7_75t_R U153 ( .A1(n159), .A2(n109), .A3(n108), .B1(n118), 
        .B2(n116), .C(n131), .Y(n110) );
  OAI21xp33_ASAP7_75t_R U154 ( .A1(n175), .A2(n113), .B(n112), .Y(n177) );
  AOI21xp33_ASAP7_75t_R U155 ( .A1(n115), .A2(n177), .B(n114), .Y(n194) );
  OAI21xp33_ASAP7_75t_R U156 ( .A1(n133), .A2(n194), .B(n132), .Y(n169) );
  O2A1O1Ixp33_ASAP7_75t_R U157 ( .A1(n168), .A2(n169), .B(n166), .C(n158), .Y(
        n117) );
  O2A1O1Ixp33_ASAP7_75t_R U158 ( .A1(n159), .A2(n117), .B(n116), .C(n147), .Y(
        n140) );
  OAI211xp5_ASAP7_75t_R U159 ( .A1(n119), .A2(n140), .B(n93), .C(n130), .Y(
        n122) );
  NOR2xp33_ASAP7_75t_R U160 ( .A(n127), .B(n59), .Y(n120) );
  AOI21xp5_ASAP7_75t_R U161 ( .A1(n122), .A2(n87), .B(n120), .Y(n123) );
  INVxp67_ASAP7_75t_R U162 ( .A(n123), .Y(n84) );
  OR2x2_ASAP7_75t_R U163 ( .A(n59), .B(n56), .Y(n192) );
  NOR2xp33_ASAP7_75t_R U164 ( .A(n59), .B(n58), .Y(n126) );
  NOR2xp33_ASAP7_75t_R U165 ( .A(n90), .B(n91), .Y(n198) );
  INVxp33_ASAP7_75t_R U166 ( .A(\dataflow/x_reg [5]), .Y(n205) );
  INVxp33_ASAP7_75t_R U167 ( .A(\dataflow/x_reg [3]), .Y(n199) );
  INVxp33_ASAP7_75t_R U168 ( .A(\dataflow/x_reg [1]), .Y(n202) );
  INVxp33_ASAP7_75t_R U169 ( .A(\dataflow/x_reg [0]), .Y(n203) );
  NOR2xp33_ASAP7_75t_R U170 ( .A(n127), .B(n91), .Y(\fsm/N61 ) );
  INVxp33_ASAP7_75t_R U171 ( .A(n59), .Y(n128) );
  NOR3xp33_ASAP7_75t_R U172 ( .A(n90), .B(n128), .C(n92), .Y(\fsm/N63 ) );
  INVxp33_ASAP7_75t_R U173 ( .A(n85), .Y(n129) );
  NOR2xp33_ASAP7_75t_R U174 ( .A(n198), .B(n129), .Y(n200) );
  NAND2xp33_ASAP7_75t_R U175 ( .A(n131), .B(n130), .Y(n145) );
  INVxp33_ASAP7_75t_R U176 ( .A(n145), .Y(n139) );
  OAI21xp33_ASAP7_75t_R U177 ( .A1(n133), .A2(n182), .B(n132), .Y(n191) );
  OAI21xp33_ASAP7_75t_R U178 ( .A1(n168), .A2(n191), .B(n166), .Y(n160) );
  OAI21xp33_ASAP7_75t_R U179 ( .A1(n159), .A2(n160), .B(n154), .Y(n150) );
  OAI21xp33_ASAP7_75t_R U180 ( .A1(n148), .A2(n150), .B(n134), .Y(n138) );
  NOR2xp33_ASAP7_75t_R U181 ( .A(x_sel), .B(keep_y), .Y(n183) );
  INVxp33_ASAP7_75t_R U182 ( .A(n183), .Y(n186) );
  AOI21xp33_ASAP7_75t_R U183 ( .A1(n138), .A2(n139), .B(n186), .Y(n137) );
  INVxp33_ASAP7_75t_R U184 ( .A(keep_y), .Y(n135) );
  NOR2xp33_ASAP7_75t_R U185 ( .A(x_sel), .B(n135), .Y(n187) );
  AO22x1_ASAP7_75t_R U186 ( .A1(\dataflow/y_reg [7]), .A2(n187), .B1(x_sel), 
        .B2(y_i[7]), .Y(n136) );
  O2A1O1Ixp33_ASAP7_75t_R U187 ( .A1(n139), .A2(n138), .B(n137), .C(n136), .Y(
        n80) );
  INVxp33_ASAP7_75t_R U188 ( .A(n140), .Y(n146) );
  NOR2xp33_ASAP7_75t_R U189 ( .A(x_sel), .B(keep_x), .Y(n196) );
  INVxp33_ASAP7_75t_R U190 ( .A(n196), .Y(n141) );
  AOI21xp33_ASAP7_75t_R U191 ( .A1(n146), .A2(n145), .B(n141), .Y(n144) );
  INVxp33_ASAP7_75t_R U192 ( .A(keep_x), .Y(n142) );
  NOR2xp33_ASAP7_75t_R U193 ( .A(x_sel), .B(n142), .Y(n195) );
  AO22x1_ASAP7_75t_R U194 ( .A1(\dataflow/x_reg [7]), .A2(n195), .B1(x_sel), 
        .B2(x_i[7]), .Y(n143) );
  O2A1O1Ixp33_ASAP7_75t_R U195 ( .A1(n146), .A2(n145), .B(n144), .C(n143), .Y(
        n83) );
  NOR2xp33_ASAP7_75t_R U196 ( .A(n148), .B(n147), .Y(n156) );
  INVxp33_ASAP7_75t_R U197 ( .A(n150), .Y(n149) );
  NAND2xp33_ASAP7_75t_R U198 ( .A(n156), .B(n149), .Y(n153) );
  INVxp33_ASAP7_75t_R U199 ( .A(n156), .Y(n151) );
  AOI21xp33_ASAP7_75t_R U200 ( .A1(n151), .A2(n150), .B(n186), .Y(n152) );
  AOI222xp33_ASAP7_75t_R U201 ( .A1(n153), .A2(n152), .B1(x_sel), .B2(y_i[6]), 
        .C1(\dataflow/y_reg [6]), .C2(n187), .Y(n81) );
  AOI21xp33_ASAP7_75t_R U202 ( .A1(n169), .A2(n166), .B(n168), .Y(n164) );
  AOI21xp33_ASAP7_75t_R U203 ( .A1(n164), .A2(n154), .B(n159), .Y(n155) );
  XOR2xp5_ASAP7_75t_R U204 ( .A(n156), .B(n155), .Y(n157) );
  AOI222xp33_ASAP7_75t_R U205 ( .A1(\dataflow/x_reg [6]), .A2(n195), .B1(n196), 
        .B2(n157), .C1(x_sel), .C2(x_i[6]), .Y(n73) );
  NOR2xp33_ASAP7_75t_R U206 ( .A(n159), .B(n158), .Y(n163) );
  OR2x2_ASAP7_75t_R U207 ( .A(n163), .B(n160), .Y(n162) );
  AOI21xp33_ASAP7_75t_R U208 ( .A1(n163), .A2(n160), .B(n186), .Y(n161) );
  AOI222xp33_ASAP7_75t_R U209 ( .A1(n162), .A2(n161), .B1(x_sel), .B2(y_i[5]), 
        .C1(\dataflow/y_reg [5]), .C2(n187), .Y(n74) );
  XNOR2xp5_ASAP7_75t_R U210 ( .A(n164), .B(n163), .Y(n165) );
  AOI222xp33_ASAP7_75t_R U211 ( .A1(n165), .A2(n196), .B1(x_sel), .B2(x_i[5]), 
        .C1(\dataflow/x_reg [5]), .C2(n195), .Y(n61) );
  INVxp33_ASAP7_75t_R U212 ( .A(n166), .Y(n167) );
  NOR2xp33_ASAP7_75t_R U213 ( .A(n168), .B(n167), .Y(n185) );
  XOR2xp5_ASAP7_75t_R U214 ( .A(n185), .B(n169), .Y(n170) );
  AOI222xp33_ASAP7_75t_R U215 ( .A1(n170), .A2(n196), .B1(x_sel), .B2(x_i[4]), 
        .C1(\dataflow/x_reg [4]), .C2(n195), .Y(n63) );
  AOI222xp33_ASAP7_75t_R U216 ( .A1(n171), .A2(n196), .B1(x_sel), .B2(x_i[0]), 
        .C1(\dataflow/x_reg [0]), .C2(n195), .Y(n71) );
  AOI222xp33_ASAP7_75t_R U217 ( .A1(n171), .A2(n183), .B1(x_sel), .B2(y_i[0]), 
        .C1(\dataflow/y_reg [0]), .C2(n187), .Y(n79) );
  XNOR2xp5_ASAP7_75t_R U218 ( .A(n172), .B(n174), .Y(n173) );
  AOI222xp33_ASAP7_75t_R U219 ( .A1(n173), .A2(n183), .B1(x_sel), .B2(y_i[1]), 
        .C1(\dataflow/y_reg [1]), .C2(n187), .Y(n78) );
  XOR2xp5_ASAP7_75t_R U220 ( .A(n175), .B(n174), .Y(n176) );
  AOI222xp33_ASAP7_75t_R U221 ( .A1(n176), .A2(n196), .B1(x_sel), .B2(x_i[1]), 
        .C1(\dataflow/x_reg [1]), .C2(n195), .Y(n69) );
  XNOR2xp5_ASAP7_75t_R U222 ( .A(n180), .B(n177), .Y(n178) );
  AOI222xp33_ASAP7_75t_R U223 ( .A1(\dataflow/x_reg [2]), .A2(n195), .B1(n196), 
        .B2(n178), .C1(x_sel), .C2(x_i[2]), .Y(n67) );
  XOR2xp5_ASAP7_75t_R U224 ( .A(n180), .B(n179), .Y(n181) );
  AOI222xp33_ASAP7_75t_R U225 ( .A1(n181), .A2(n183), .B1(x_sel), .B2(y_i[2]), 
        .C1(\dataflow/y_reg [2]), .C2(n187), .Y(n77) );
  XNOR2xp5_ASAP7_75t_R U226 ( .A(n182), .B(n193), .Y(n184) );
  AOI222xp33_ASAP7_75t_R U227 ( .A1(n184), .A2(n183), .B1(x_sel), .B2(y_i[3]), 
        .C1(\dataflow/y_reg [3]), .C2(n187), .Y(n76) );
  INVxp33_ASAP7_75t_R U228 ( .A(n185), .Y(n190) );
  AOI21xp33_ASAP7_75t_R U229 ( .A1(n190), .A2(n191), .B(n186), .Y(n189) );
  AO22x1_ASAP7_75t_R U230 ( .A1(\dataflow/y_reg [4]), .A2(n187), .B1(x_sel), 
        .B2(y_i[4]), .Y(n188) );
  O2A1O1Ixp33_ASAP7_75t_R U231 ( .A1(n191), .A2(n190), .B(n189), .C(n188), .Y(
        n75) );
  NOR2xp33_ASAP7_75t_R U232 ( .A(n124), .B(n192), .Y(\fsm/N62 ) );
  XOR2xp5_ASAP7_75t_R U233 ( .A(n194), .B(n193), .Y(n197) );
  AOI222xp33_ASAP7_75t_R U234 ( .A1(n197), .A2(n196), .B1(x_sel), .B2(x_i[3]), 
        .C1(\dataflow/x_reg [3]), .C2(n195), .Y(n65) );
endmodule

