/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : N-2017.09-SP2
// Date      : Thu May 31 17:04:34 2018
/////////////////////////////////////////////////////////////


module DFC ( clk, reset, datain, cmd, cmd_valid, dataout, output_valid, busy
 );
  input [7:0] datain;
  input [1:0] cmd;
  output [8:0] dataout;
  input clk, reset, cmd_valid;
  output output_valid, busy;
  wire   \out_buf_w[0][8] , \out_buf_w[0][7] , \out_buf_w[0][6] ,
         \out_buf_w[0][5] , \out_buf_w[0][4] , \out_buf_w[0][3] ,
         \out_buf_w[0][2] , \out_buf_w[0][1] , \out_buf_w[0][0] ,
         \out_buf_w[1][8] , \out_buf_w[1][7] , \out_buf_w[1][6] ,
         \out_buf_w[1][5] , \out_buf_w[1][4] , \out_buf_w[1][3] ,
         \out_buf_w[1][2] , \out_buf_w[1][1] , \out_buf_w[1][0] ,
         \out_buf_w[2][8] , \out_buf_w[2][7] , \out_buf_w[2][6] ,
         \out_buf_w[2][5] , \out_buf_w[2][4] , \out_buf_w[2][3] ,
         \out_buf_w[2][2] , \out_buf_w[2][1] , \out_buf_w[2][0] ,
         \out_buf_w[3][8] , \out_buf_w[3][7] , \out_buf_w[3][6] ,
         \out_buf_w[3][5] , \out_buf_w[3][4] , \out_buf_w[3][3] ,
         \out_buf_w[3][2] , \out_buf_w[3][1] , \out_buf_w[3][0] ,
         \data_buf[0][7] , \data_buf[0][6] , \data_buf[0][5] ,
         \data_buf[0][4] , \data_buf[0][3] , \data_buf[0][2] ,
         \data_buf[0][1] , \data_buf[0][0] , \data_buf[1][7] ,
         \data_buf[1][6] , \data_buf[1][5] , \data_buf[1][4] ,
         \data_buf[1][3] , \data_buf[1][2] , \data_buf[1][1] ,
         \data_buf[1][0] , \data_buf[2][7] , \data_buf[2][6] ,
         \data_buf[2][5] , \data_buf[2][4] , \data_buf[2][3] ,
         \data_buf[2][2] , \data_buf[2][1] , \data_buf[2][0] ,
         \data_buf[3][7] , \data_buf[3][6] , \data_buf[3][5] ,
         \data_buf[3][4] , \data_buf[3][3] , \data_buf[3][2] ,
         \data_buf[3][1] , \data_buf[3][0] , \data_buf[4][7] ,
         \data_buf[4][6] , \data_buf[4][5] , \data_buf[4][4] ,
         \data_buf[4][3] , \data_buf[4][2] , \data_buf[4][1] ,
         \data_buf[4][0] , \data_buf[5][7] , \data_buf[5][6] ,
         \data_buf[5][5] , \data_buf[5][4] , \data_buf[5][3] ,
         \data_buf[5][2] , \data_buf[5][1] , \data_buf[5][0] ,
         \data_buf[6][7] , \data_buf[6][6] , \data_buf[6][5] ,
         \data_buf[6][4] , \data_buf[6][3] , \data_buf[6][2] ,
         \data_buf[6][1] , \data_buf[6][0] , \data_buf[7][7] ,
         \data_buf[7][6] , \data_buf[7][5] , \data_buf[7][4] ,
         \data_buf[7][3] , \data_buf[7][2] , \data_buf[7][1] ,
         \data_buf[7][0] , n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n260, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425;
  wire   [2:0] state;

  ALU A0 ( .out({\out_buf_w[0][8] , \out_buf_w[0][7] , \out_buf_w[0][6] , 
        \out_buf_w[0][5] , \out_buf_w[0][4] , \out_buf_w[0][3] , 
        \out_buf_w[0][2] , \out_buf_w[0][1] , \out_buf_w[0][0] }), .mode(1'b1), 
        .in_a({\data_buf[0][7] , \data_buf[0][6] , \data_buf[0][5] , 
        \data_buf[0][4] , \data_buf[0][3] , \data_buf[0][2] , \data_buf[0][1] , 
        \data_buf[0][0] }), .in_b({\data_buf[4][7] , \data_buf[4][6] , 
        \data_buf[4][5] , \data_buf[4][4] , \data_buf[4][3] , \data_buf[4][2] , 
        \data_buf[4][1] , \data_buf[4][0] }) );
  ALU A1 ( .out({\out_buf_w[1][8] , \out_buf_w[1][7] , \out_buf_w[1][6] , 
        \out_buf_w[1][5] , \out_buf_w[1][4] , \out_buf_w[1][3] , 
        \out_buf_w[1][2] , \out_buf_w[1][1] , \out_buf_w[1][0] }), .mode(1'b1), 
        .in_a({\data_buf[1][7] , \data_buf[1][6] , \data_buf[1][5] , 
        \data_buf[1][4] , \data_buf[1][3] , \data_buf[1][2] , \data_buf[1][1] , 
        \data_buf[1][0] }), .in_b({\data_buf[5][7] , \data_buf[5][6] , 
        \data_buf[5][5] , \data_buf[5][4] , \data_buf[5][3] , \data_buf[5][2] , 
        \data_buf[5][1] , \data_buf[5][0] }) );
  ALU A2 ( .out({\out_buf_w[2][8] , \out_buf_w[2][7] , \out_buf_w[2][6] , 
        \out_buf_w[2][5] , \out_buf_w[2][4] , \out_buf_w[2][3] , 
        \out_buf_w[2][2] , \out_buf_w[2][1] , \out_buf_w[2][0] }), .mode(1'b1), 
        .in_a({\data_buf[2][7] , \data_buf[2][6] , \data_buf[2][5] , 
        \data_buf[2][4] , \data_buf[2][3] , \data_buf[2][2] , \data_buf[2][1] , 
        \data_buf[2][0] }), .in_b({\data_buf[6][7] , \data_buf[6][6] , 
        \data_buf[6][5] , \data_buf[6][4] , \data_buf[6][3] , \data_buf[6][2] , 
        \data_buf[6][1] , \data_buf[6][0] }) );
  ALU A3 ( .out({\out_buf_w[3][8] , \out_buf_w[3][7] , \out_buf_w[3][6] , 
        \out_buf_w[3][5] , \out_buf_w[3][4] , \out_buf_w[3][3] , 
        \out_buf_w[3][2] , \out_buf_w[3][1] , \out_buf_w[3][0] }), .mode(1'b1), 
        .in_a({\data_buf[3][7] , \data_buf[3][6] , \data_buf[3][5] , 
        \data_buf[3][4] , \data_buf[3][3] , \data_buf[3][2] , \data_buf[3][1] , 
        \data_buf[3][0] }), .in_b({\data_buf[7][7] , \data_buf[7][6] , 
        \data_buf[7][5] , \data_buf[7][4] , \data_buf[7][3] , \data_buf[7][2] , 
        \data_buf[7][1] , \data_buf[7][0] }) );
  EDFFX1 \com_reg[0]  ( .D(cmd[0]), .E(n135), .CK(clk), .QN(n422) );
  DFFRXL \count_reg[2]  ( .D(n148), .CK(clk), .RN(n260), .Q(n351), .QN(n423)
         );
  DFFRXL output_valid_reg ( .D(n145), .CK(clk), .RN(n260), .Q(output_valid), 
        .QN(n128) );
  DFFRXL \dataout_reg[1]  ( .D(n136), .CK(clk), .RN(n260), .Q(dataout[1]), 
        .QN(n339) );
  DFFRXL \dataout_reg[2]  ( .D(n137), .CK(clk), .RN(n260), .Q(dataout[2]), 
        .QN(n338) );
  DFFRXL \dataout_reg[3]  ( .D(n138), .CK(clk), .RN(n260), .Q(dataout[3]), 
        .QN(n337) );
  DFFRXL \dataout_reg[4]  ( .D(n139), .CK(clk), .RN(n260), .Q(dataout[4]), 
        .QN(n336) );
  DFFRXL \dataout_reg[5]  ( .D(n140), .CK(clk), .RN(n260), .Q(dataout[5]), 
        .QN(n335) );
  DFFRXL \dataout_reg[6]  ( .D(n141), .CK(clk), .RN(n260), .Q(dataout[6]), 
        .QN(n334) );
  DFFRXL \dataout_reg[7]  ( .D(n142), .CK(clk), .RN(n260), .Q(dataout[7]), 
        .QN(n333) );
  DFFRXL \dataout_reg[8]  ( .D(n143), .CK(clk), .RN(n260), .Q(dataout[8]), 
        .QN(n332) );
  DFFRXL \dataout_reg[0]  ( .D(n144), .CK(clk), .RN(n260), .Q(dataout[0]), 
        .QN(n331) );
  EDFFX1 \com_reg[1]  ( .D(cmd[1]), .E(n135), .CK(clk), .Q(n413) );
  DFFRXL \data_buf_reg[7][0]  ( .D(n127), .CK(clk), .RN(n260), .Q(
        \data_buf[7][0] ) );
  DFFRXL \data_buf_reg[7][7]  ( .D(n126), .CK(clk), .RN(n260), .Q(
        \data_buf[7][7] ) );
  DFFRXL \data_buf_reg[7][6]  ( .D(n125), .CK(clk), .RN(n260), .Q(
        \data_buf[7][6] ) );
  DFFRXL \data_buf_reg[7][5]  ( .D(n124), .CK(clk), .RN(n260), .Q(
        \data_buf[7][5] ) );
  DFFRXL \data_buf_reg[7][4]  ( .D(n123), .CK(clk), .RN(n260), .Q(
        \data_buf[7][4] ) );
  DFFRXL \data_buf_reg[7][3]  ( .D(n122), .CK(clk), .RN(n260), .Q(
        \data_buf[7][3] ) );
  DFFRXL \data_buf_reg[7][2]  ( .D(n121), .CK(clk), .RN(n260), .Q(
        \data_buf[7][2] ) );
  DFFRXL \data_buf_reg[7][1]  ( .D(n120), .CK(clk), .RN(n260), .Q(
        \data_buf[7][1] ) );
  DFFRXL \data_buf_reg[6][0]  ( .D(n119), .CK(clk), .RN(n260), .Q(
        \data_buf[6][0] ) );
  DFFRXL \data_buf_reg[6][7]  ( .D(n118), .CK(clk), .RN(n260), .Q(
        \data_buf[6][7] ) );
  DFFRXL \data_buf_reg[6][6]  ( .D(n117), .CK(clk), .RN(n260), .Q(
        \data_buf[6][6] ) );
  DFFRXL \data_buf_reg[6][5]  ( .D(n116), .CK(clk), .RN(n260), .Q(
        \data_buf[6][5] ) );
  DFFRXL \data_buf_reg[6][4]  ( .D(n115), .CK(clk), .RN(n260), .Q(
        \data_buf[6][4] ) );
  DFFRXL \data_buf_reg[6][3]  ( .D(n114), .CK(clk), .RN(n260), .Q(
        \data_buf[6][3] ) );
  DFFRXL \data_buf_reg[6][2]  ( .D(n113), .CK(clk), .RN(n260), .Q(
        \data_buf[6][2] ) );
  DFFRXL \data_buf_reg[6][1]  ( .D(n112), .CK(clk), .RN(n260), .Q(
        \data_buf[6][1] ) );
  DFFRXL \data_buf_reg[2][0]  ( .D(n111), .CK(clk), .RN(n260), .Q(
        \data_buf[2][0] ) );
  DFFRXL \data_buf_reg[2][7]  ( .D(n110), .CK(clk), .RN(n260), .Q(
        \data_buf[2][7] ) );
  DFFRXL \data_buf_reg[2][6]  ( .D(n109), .CK(clk), .RN(n260), .Q(
        \data_buf[2][6] ) );
  DFFRXL \data_buf_reg[2][5]  ( .D(n108), .CK(clk), .RN(n260), .Q(
        \data_buf[2][5] ) );
  DFFRXL \data_buf_reg[2][4]  ( .D(n107), .CK(clk), .RN(n260), .Q(
        \data_buf[2][4] ) );
  DFFRXL \data_buf_reg[2][3]  ( .D(n106), .CK(clk), .RN(n260), .Q(
        \data_buf[2][3] ) );
  DFFRXL \data_buf_reg[2][2]  ( .D(n105), .CK(clk), .RN(n260), .Q(
        \data_buf[2][2] ) );
  DFFRXL \data_buf_reg[2][1]  ( .D(n104), .CK(clk), .RN(n260), .Q(
        \data_buf[2][1] ) );
  DFFRXL \data_buf_reg[3][0]  ( .D(n103), .CK(clk), .RN(n260), .Q(
        \data_buf[3][0] ) );
  DFFRXL \data_buf_reg[3][7]  ( .D(n102), .CK(clk), .RN(n260), .Q(
        \data_buf[3][7] ) );
  DFFRXL \data_buf_reg[3][6]  ( .D(n101), .CK(clk), .RN(n260), .Q(
        \data_buf[3][6] ) );
  DFFRXL \data_buf_reg[3][5]  ( .D(n100), .CK(clk), .RN(n260), .Q(
        \data_buf[3][5] ) );
  DFFRXL \data_buf_reg[3][4]  ( .D(n99), .CK(clk), .RN(n260), .Q(
        \data_buf[3][4] ) );
  DFFRXL \data_buf_reg[3][3]  ( .D(n98), .CK(clk), .RN(n260), .Q(
        \data_buf[3][3] ) );
  DFFRXL \data_buf_reg[3][2]  ( .D(n97), .CK(clk), .RN(n260), .Q(
        \data_buf[3][2] ) );
  DFFRXL \data_buf_reg[3][1]  ( .D(n96), .CK(clk), .RN(n260), .Q(
        \data_buf[3][1] ) );
  DFFRXL \data_buf_reg[0][0]  ( .D(n95), .CK(clk), .RN(n260), .Q(
        \data_buf[0][0] ) );
  DFFRXL \data_buf_reg[0][7]  ( .D(n94), .CK(clk), .RN(n260), .Q(
        \data_buf[0][7] ) );
  DFFRXL \data_buf_reg[0][6]  ( .D(n93), .CK(clk), .RN(n260), .Q(
        \data_buf[0][6] ) );
  DFFRXL \data_buf_reg[0][5]  ( .D(n92), .CK(clk), .RN(n260), .Q(
        \data_buf[0][5] ) );
  DFFRXL \data_buf_reg[0][4]  ( .D(n91), .CK(clk), .RN(n260), .Q(
        \data_buf[0][4] ) );
  DFFRXL \data_buf_reg[0][3]  ( .D(n90), .CK(clk), .RN(n260), .Q(
        \data_buf[0][3] ) );
  DFFRXL \data_buf_reg[0][2]  ( .D(n89), .CK(clk), .RN(n260), .Q(
        \data_buf[0][2] ) );
  DFFRXL \data_buf_reg[0][1]  ( .D(n88), .CK(clk), .RN(n260), .Q(
        \data_buf[0][1] ) );
  DFFRXL \data_buf_reg[5][0]  ( .D(n87), .CK(clk), .RN(n260), .Q(
        \data_buf[5][0] ) );
  DFFRXL \data_buf_reg[5][7]  ( .D(n86), .CK(clk), .RN(n260), .Q(
        \data_buf[5][7] ) );
  DFFRXL \data_buf_reg[5][6]  ( .D(n85), .CK(clk), .RN(n260), .Q(
        \data_buf[5][6] ) );
  DFFRXL \data_buf_reg[5][5]  ( .D(n84), .CK(clk), .RN(n260), .Q(
        \data_buf[5][5] ) );
  DFFRXL \data_buf_reg[5][4]  ( .D(n83), .CK(clk), .RN(n260), .Q(
        \data_buf[5][4] ) );
  DFFRXL \data_buf_reg[5][3]  ( .D(n82), .CK(clk), .RN(n260), .Q(
        \data_buf[5][3] ) );
  DFFRXL \data_buf_reg[5][2]  ( .D(n81), .CK(clk), .RN(n260), .Q(
        \data_buf[5][2] ) );
  DFFRXL \data_buf_reg[5][1]  ( .D(n80), .CK(clk), .RN(n260), .Q(
        \data_buf[5][1] ) );
  DFFRXL \data_buf_reg[1][0]  ( .D(n79), .CK(clk), .RN(n260), .Q(
        \data_buf[1][0] ) );
  DFFRXL \data_buf_reg[1][7]  ( .D(n78), .CK(clk), .RN(n260), .Q(
        \data_buf[1][7] ) );
  DFFRXL \data_buf_reg[1][6]  ( .D(n77), .CK(clk), .RN(n260), .Q(
        \data_buf[1][6] ) );
  DFFRXL \data_buf_reg[1][5]  ( .D(n76), .CK(clk), .RN(n260), .Q(
        \data_buf[1][5] ) );
  DFFRXL \data_buf_reg[1][4]  ( .D(n75), .CK(clk), .RN(n260), .Q(
        \data_buf[1][4] ) );
  DFFRXL \data_buf_reg[1][3]  ( .D(n74), .CK(clk), .RN(n260), .Q(
        \data_buf[1][3] ) );
  DFFRXL \data_buf_reg[1][2]  ( .D(n73), .CK(clk), .RN(n260), .Q(
        \data_buf[1][2] ) );
  DFFRXL \data_buf_reg[1][1]  ( .D(n72), .CK(clk), .RN(n260), .Q(
        \data_buf[1][1] ) );
  DFFRXL \data_buf_reg[4][0]  ( .D(n71), .CK(clk), .RN(n260), .Q(
        \data_buf[4][0] ) );
  DFFRXL \data_buf_reg[4][7]  ( .D(n70), .CK(clk), .RN(n260), .Q(
        \data_buf[4][7] ) );
  DFFRXL \data_buf_reg[4][6]  ( .D(n69), .CK(clk), .RN(n260), .Q(
        \data_buf[4][6] ) );
  DFFRXL \data_buf_reg[4][5]  ( .D(n68), .CK(clk), .RN(n260), .Q(
        \data_buf[4][5] ) );
  DFFRXL \data_buf_reg[4][4]  ( .D(n67), .CK(clk), .RN(n260), .Q(
        \data_buf[4][4] ) );
  DFFRXL \data_buf_reg[4][3]  ( .D(n66), .CK(clk), .RN(n260), .Q(
        \data_buf[4][3] ) );
  DFFRXL \data_buf_reg[4][2]  ( .D(n65), .CK(clk), .RN(n260), .Q(
        \data_buf[4][2] ) );
  DFFRXL \data_buf_reg[4][1]  ( .D(n64), .CK(clk), .RN(n260), .Q(
        \data_buf[4][1] ) );
  DFFRXL \count_reg[0]  ( .D(n149), .CK(clk), .RN(n260), .Q(n425), .QN(n349)
         );
  DFFRXL \count_reg[1]  ( .D(n150), .CK(clk), .RN(n260), .Q(n424), .QN(n352)
         );
  DFFRXL \state_reg[2]  ( .D(n147), .CK(clk), .RN(n260), .Q(state[2]), .QN(
        n350) );
  DFFRXL \state_reg[1]  ( .D(n146), .CK(clk), .RN(n260), .Q(state[1]), .QN(
        n353) );
  DFFRXL \state_reg[0]  ( .D(n151), .CK(clk), .RN(n260), .Q(state[0]), .QN(
        n348) );
  EDFFX1 \datain1_reg[7]  ( .D(datain[7]), .E(n260), .CK(clk), .Q(n419) );
  EDFFX1 \datain1_reg[6]  ( .D(datain[6]), .E(n260), .CK(clk), .Q(n420) );
  EDFFX1 \datain1_reg[5]  ( .D(datain[5]), .E(n260), .CK(clk), .Q(n421) );
  EDFFX1 \datain1_reg[4]  ( .D(datain[4]), .E(n260), .CK(clk), .Q(n414) );
  EDFFX1 \datain1_reg[3]  ( .D(datain[3]), .E(n260), .CK(clk), .Q(n415) );
  EDFFX1 \datain1_reg[2]  ( .D(datain[2]), .E(n260), .CK(clk), .Q(n416) );
  EDFFX1 \datain1_reg[1]  ( .D(datain[1]), .E(n260), .CK(clk), .Q(n417) );
  EDFFX1 \datain1_reg[0]  ( .D(datain[0]), .E(n260), .CK(clk), .Q(n418) );
  INVX6 U280 ( .A(reset), .Y(n260) );
  CLKMX2X2 U281 ( .A(\data_buf[3][4] ), .B(n414), .S0(n354), .Y(n99) );
  CLKMX2X2 U282 ( .A(\data_buf[3][3] ), .B(n415), .S0(n354), .Y(n98) );
  CLKMX2X2 U283 ( .A(\data_buf[3][2] ), .B(n416), .S0(n354), .Y(n97) );
  CLKMX2X2 U284 ( .A(\data_buf[3][1] ), .B(n417), .S0(n354), .Y(n96) );
  CLKMX2X2 U285 ( .A(\data_buf[0][0] ), .B(n418), .S0(n355), .Y(n95) );
  CLKMX2X2 U287 ( .A(\data_buf[0][7] ), .B(n419), .S0(n355), .Y(n94) );
  CLKMX2X2 U288 ( .A(\data_buf[0][6] ), .B(n420), .S0(n355), .Y(n93) );
  CLKMX2X2 U289 ( .A(\data_buf[0][5] ), .B(n421), .S0(n355), .Y(n92) );
  CLKMX2X2 U290 ( .A(\data_buf[0][4] ), .B(n414), .S0(n355), .Y(n91) );
  CLKMX2X2 U291 ( .A(\data_buf[0][3] ), .B(n415), .S0(n355), .Y(n90) );
  CLKMX2X2 U292 ( .A(\data_buf[0][2] ), .B(n416), .S0(n355), .Y(n89) );
  CLKMX2X2 U293 ( .A(\data_buf[0][1] ), .B(n417), .S0(n355), .Y(n88) );
  NOR2BX1 U294 ( .AN(n356), .B(n357), .Y(n355) );
  CLKMX2X2 U295 ( .A(\data_buf[5][0] ), .B(n418), .S0(n358), .Y(n87) );
  CLKMX2X2 U296 ( .A(\data_buf[5][7] ), .B(n419), .S0(n358), .Y(n86) );
  CLKMX2X2 U297 ( .A(\data_buf[5][6] ), .B(n420), .S0(n358), .Y(n85) );
  CLKMX2X2 U298 ( .A(\data_buf[5][5] ), .B(n421), .S0(n358), .Y(n84) );
  CLKMX2X2 U299 ( .A(\data_buf[5][4] ), .B(n414), .S0(n358), .Y(n83) );
  CLKMX2X2 U300 ( .A(\data_buf[5][3] ), .B(n415), .S0(n358), .Y(n82) );
  CLKMX2X2 U301 ( .A(\data_buf[5][2] ), .B(n416), .S0(n358), .Y(n81) );
  CLKMX2X2 U302 ( .A(\data_buf[5][1] ), .B(n417), .S0(n358), .Y(n80) );
  AND2X1 U303 ( .A(n359), .B(n360), .Y(n358) );
  CLKMX2X2 U304 ( .A(\data_buf[1][0] ), .B(n418), .S0(n361), .Y(n79) );
  CLKMX2X2 U305 ( .A(\data_buf[1][7] ), .B(n419), .S0(n361), .Y(n78) );
  CLKMX2X2 U306 ( .A(\data_buf[1][6] ), .B(n420), .S0(n361), .Y(n77) );
  CLKMX2X2 U307 ( .A(\data_buf[1][5] ), .B(n421), .S0(n361), .Y(n76) );
  CLKMX2X2 U308 ( .A(\data_buf[1][4] ), .B(n414), .S0(n361), .Y(n75) );
  CLKMX2X2 U309 ( .A(\data_buf[1][3] ), .B(n415), .S0(n361), .Y(n74) );
  CLKMX2X2 U310 ( .A(\data_buf[1][2] ), .B(n416), .S0(n361), .Y(n73) );
  CLKMX2X2 U311 ( .A(\data_buf[1][1] ), .B(n417), .S0(n361), .Y(n72) );
  AND2X1 U312 ( .A(n360), .B(n356), .Y(n361) );
  CLKMX2X2 U313 ( .A(\data_buf[4][0] ), .B(n418), .S0(n362), .Y(n71) );
  CLKMX2X2 U314 ( .A(\data_buf[4][7] ), .B(n419), .S0(n362), .Y(n70) );
  CLKMX2X2 U315 ( .A(\data_buf[4][6] ), .B(n420), .S0(n362), .Y(n69) );
  CLKMX2X2 U316 ( .A(\data_buf[4][5] ), .B(n421), .S0(n362), .Y(n68) );
  CLKMX2X2 U317 ( .A(\data_buf[4][4] ), .B(n414), .S0(n362), .Y(n67) );
  CLKMX2X2 U318 ( .A(\data_buf[4][3] ), .B(n415), .S0(n362), .Y(n66) );
  CLKMX2X2 U319 ( .A(\data_buf[4][2] ), .B(n416), .S0(n362), .Y(n65) );
  CLKMX2X2 U320 ( .A(\data_buf[4][1] ), .B(n417), .S0(n362), .Y(n64) );
  NOR2BX1 U321 ( .AN(n359), .B(n357), .Y(n362) );
  OAI21XL U322 ( .A0(n422), .A1(n363), .B0(n364), .Y(n151) );
  MXI2X1 U323 ( .A(state[0]), .B(n365), .S0(n366), .Y(n364) );
  OAI221XL U324 ( .A0(n367), .A1(n368), .B0(n352), .B1(n369), .C0(n370), .Y(
        n150) );
  XNOR2X1 U325 ( .A(n371), .B(n372), .Y(n368) );
  NAND2X1 U326 ( .A(n373), .B(n357), .Y(n371) );
  NAND2X1 U327 ( .A(n374), .B(n370), .Y(n149) );
  CLKMX2X2 U328 ( .A(n369), .B(n367), .S0(n349), .Y(n374) );
  OAI21XL U329 ( .A0(n375), .A1(n376), .B0(n377), .Y(n148) );
  AO21X1 U330 ( .A0(n369), .A1(n376), .B0(n423), .Y(n377) );
  NAND2X1 U331 ( .A(n367), .B(n378), .Y(n369) );
  CLKINVX1 U332 ( .A(n379), .Y(n367) );
  OAI21XL U333 ( .A0(n423), .A1(n375), .B0(n379), .Y(n376) );
  NAND2X1 U334 ( .A(n380), .B(n381), .Y(n379) );
  MXI2X1 U335 ( .A(n382), .B(n383), .S0(n372), .Y(n375) );
  OAI21XL U336 ( .A0(n350), .A1(n366), .B0(n370), .Y(n147) );
  NAND2BX1 U337 ( .AN(n384), .B(n413), .Y(n370) );
  OAI21XL U338 ( .A0(n353), .A1(n366), .B0(n363), .Y(n146) );
  OAI211X1 U339 ( .A0(n385), .A1(n351), .B0(n386), .C0(n378), .Y(n366) );
  AND3X1 U340 ( .A(n387), .B(n363), .C(n384), .Y(n378) );
  NAND3X1 U341 ( .A(state[0]), .B(n388), .C(n422), .Y(n384) );
  NAND3BX1 U342 ( .AN(n413), .B(n388), .C(state[0]), .Y(n363) );
  OA22X1 U343 ( .A0(n372), .A1(n357), .B0(n373), .B1(n389), .Y(n385) );
  MXI2X1 U344 ( .A(n128), .B(n380), .S0(n390), .Y(n145) );
  OAI2BB1X1 U345 ( .A0N(n423), .A1N(n391), .B0(n387), .Y(n390) );
  OAI22XL U346 ( .A0(n373), .A1(n372), .B0(n357), .B1(n389), .Y(n391) );
  MXI2X1 U347 ( .A(n392), .B(n331), .S0(n380), .Y(n144) );
  AOI221XL U348 ( .A0(\out_buf_w[2][0] ), .A1(n393), .B0(\out_buf_w[3][0] ), 
        .B1(n383), .C0(n394), .Y(n392) );
  AO22X1 U349 ( .A0(\out_buf_w[1][0] ), .A1(n360), .B0(\out_buf_w[0][0] ), 
        .B1(n382), .Y(n394) );
  MXI2X1 U350 ( .A(n395), .B(n332), .S0(n380), .Y(n143) );
  AOI221XL U351 ( .A0(\out_buf_w[2][8] ), .A1(n393), .B0(\out_buf_w[3][8] ), 
        .B1(n383), .C0(n396), .Y(n395) );
  AO22X1 U352 ( .A0(\out_buf_w[1][8] ), .A1(n360), .B0(\out_buf_w[0][8] ), 
        .B1(n382), .Y(n396) );
  MXI2X1 U353 ( .A(n397), .B(n333), .S0(n380), .Y(n142) );
  AOI221XL U354 ( .A0(\out_buf_w[2][7] ), .A1(n393), .B0(\out_buf_w[3][7] ), 
        .B1(n383), .C0(n398), .Y(n397) );
  AO22X1 U355 ( .A0(\out_buf_w[1][7] ), .A1(n360), .B0(\out_buf_w[0][7] ), 
        .B1(n382), .Y(n398) );
  MXI2X1 U356 ( .A(n399), .B(n334), .S0(n380), .Y(n141) );
  AOI221XL U357 ( .A0(\out_buf_w[2][6] ), .A1(n393), .B0(\out_buf_w[3][6] ), 
        .B1(n383), .C0(n400), .Y(n399) );
  AO22X1 U358 ( .A0(\out_buf_w[1][6] ), .A1(n360), .B0(\out_buf_w[0][6] ), 
        .B1(n382), .Y(n400) );
  MXI2X1 U359 ( .A(n401), .B(n335), .S0(n380), .Y(n140) );
  AOI221XL U360 ( .A0(\out_buf_w[2][5] ), .A1(n393), .B0(\out_buf_w[3][5] ), 
        .B1(n383), .C0(n402), .Y(n401) );
  AO22X1 U361 ( .A0(\out_buf_w[1][5] ), .A1(n360), .B0(\out_buf_w[0][5] ), 
        .B1(n382), .Y(n402) );
  MXI2X1 U362 ( .A(n403), .B(n336), .S0(n380), .Y(n139) );
  AOI221XL U363 ( .A0(\out_buf_w[2][4] ), .A1(n393), .B0(\out_buf_w[3][4] ), 
        .B1(n383), .C0(n404), .Y(n403) );
  AO22X1 U364 ( .A0(\out_buf_w[1][4] ), .A1(n360), .B0(\out_buf_w[0][4] ), 
        .B1(n382), .Y(n404) );
  MXI2X1 U365 ( .A(n405), .B(n337), .S0(n380), .Y(n138) );
  AOI221XL U366 ( .A0(\out_buf_w[2][3] ), .A1(n393), .B0(\out_buf_w[3][3] ), 
        .B1(n383), .C0(n406), .Y(n405) );
  AO22X1 U367 ( .A0(\out_buf_w[1][3] ), .A1(n360), .B0(\out_buf_w[0][3] ), 
        .B1(n382), .Y(n406) );
  MXI2X1 U368 ( .A(n407), .B(n338), .S0(n380), .Y(n137) );
  AOI221XL U369 ( .A0(\out_buf_w[2][2] ), .A1(n393), .B0(\out_buf_w[3][2] ), 
        .B1(n383), .C0(n408), .Y(n407) );
  AO22X1 U370 ( .A0(\out_buf_w[1][2] ), .A1(n360), .B0(\out_buf_w[0][2] ), 
        .B1(n382), .Y(n408) );
  MXI2X1 U371 ( .A(n409), .B(n339), .S0(n380), .Y(n136) );
  AND2X1 U372 ( .A(n389), .B(n372), .Y(n380) );
  NAND3X1 U373 ( .A(n348), .B(n353), .C(state[2]), .Y(n372) );
  NAND3X1 U374 ( .A(state[1]), .B(n350), .C(state[0]), .Y(n389) );
  AOI221XL U375 ( .A0(\out_buf_w[2][1] ), .A1(n393), .B0(\out_buf_w[3][1] ), 
        .B1(n383), .C0(n410), .Y(n409) );
  AO22X1 U376 ( .A0(\out_buf_w[1][1] ), .A1(n360), .B0(\out_buf_w[0][1] ), 
        .B1(n382), .Y(n410) );
  CLKINVX1 U377 ( .A(n357), .Y(n382) );
  NAND2X1 U378 ( .A(n349), .B(n352), .Y(n357) );
  NOR2X1 U379 ( .A(n349), .B(n424), .Y(n360) );
  NOR2X1 U380 ( .A(reset), .B(n387), .Y(n135) );
  NAND2X1 U381 ( .A(cmd_valid), .B(n365), .Y(n387) );
  CLKINVX1 U382 ( .A(busy), .Y(n365) );
  CLKMX2X2 U383 ( .A(n418), .B(\data_buf[7][0] ), .S0(n386), .Y(n127) );
  CLKMX2X2 U384 ( .A(n419), .B(\data_buf[7][7] ), .S0(n386), .Y(n126) );
  CLKMX2X2 U385 ( .A(n420), .B(\data_buf[7][6] ), .S0(n386), .Y(n125) );
  CLKMX2X2 U386 ( .A(n421), .B(\data_buf[7][5] ), .S0(n386), .Y(n124) );
  CLKMX2X2 U387 ( .A(n414), .B(\data_buf[7][4] ), .S0(n386), .Y(n123) );
  CLKMX2X2 U388 ( .A(n415), .B(\data_buf[7][3] ), .S0(n386), .Y(n122) );
  CLKMX2X2 U389 ( .A(n416), .B(\data_buf[7][2] ), .S0(n386), .Y(n121) );
  CLKMX2X2 U390 ( .A(n417), .B(\data_buf[7][1] ), .S0(n386), .Y(n120) );
  NAND2X1 U391 ( .A(n359), .B(n383), .Y(n386) );
  CLKINVX1 U392 ( .A(n373), .Y(n383) );
  CLKMX2X2 U393 ( .A(\data_buf[6][0] ), .B(n418), .S0(n411), .Y(n119) );
  CLKMX2X2 U394 ( .A(\data_buf[6][7] ), .B(n419), .S0(n411), .Y(n118) );
  CLKMX2X2 U395 ( .A(\data_buf[6][6] ), .B(n420), .S0(n411), .Y(n117) );
  CLKMX2X2 U396 ( .A(\data_buf[6][5] ), .B(n421), .S0(n411), .Y(n116) );
  CLKMX2X2 U397 ( .A(\data_buf[6][4] ), .B(n414), .S0(n411), .Y(n115) );
  CLKMX2X2 U398 ( .A(\data_buf[6][3] ), .B(n415), .S0(n411), .Y(n114) );
  CLKMX2X2 U399 ( .A(\data_buf[6][2] ), .B(n416), .S0(n411), .Y(n113) );
  CLKMX2X2 U400 ( .A(\data_buf[6][1] ), .B(n417), .S0(n411), .Y(n112) );
  AND2X1 U401 ( .A(n393), .B(n359), .Y(n411) );
  NOR2X1 U402 ( .A(n381), .B(n423), .Y(n359) );
  CLKMX2X2 U403 ( .A(\data_buf[2][0] ), .B(n418), .S0(n412), .Y(n111) );
  CLKMX2X2 U404 ( .A(\data_buf[2][7] ), .B(n419), .S0(n412), .Y(n110) );
  CLKMX2X2 U405 ( .A(\data_buf[2][6] ), .B(n420), .S0(n412), .Y(n109) );
  CLKMX2X2 U406 ( .A(\data_buf[2][5] ), .B(n421), .S0(n412), .Y(n108) );
  CLKMX2X2 U407 ( .A(\data_buf[2][4] ), .B(n414), .S0(n412), .Y(n107) );
  CLKMX2X2 U408 ( .A(\data_buf[2][3] ), .B(n415), .S0(n412), .Y(n106) );
  CLKMX2X2 U409 ( .A(\data_buf[2][2] ), .B(n416), .S0(n412), .Y(n105) );
  CLKMX2X2 U410 ( .A(\data_buf[2][1] ), .B(n417), .S0(n412), .Y(n104) );
  AND2X1 U411 ( .A(n393), .B(n356), .Y(n412) );
  NOR2X1 U412 ( .A(n352), .B(n425), .Y(n393) );
  CLKMX2X2 U413 ( .A(\data_buf[3][0] ), .B(n418), .S0(n354), .Y(n103) );
  CLKMX2X2 U414 ( .A(\data_buf[3][7] ), .B(n419), .S0(n354), .Y(n102) );
  CLKMX2X2 U415 ( .A(\data_buf[3][6] ), .B(n420), .S0(n354), .Y(n101) );
  CLKMX2X2 U416 ( .A(\data_buf[3][5] ), .B(n421), .S0(n354), .Y(n100) );
  NOR2BX1 U417 ( .AN(n356), .B(n373), .Y(n354) );
  NAND2X1 U418 ( .A(n424), .B(n425), .Y(n373) );
  NOR2X1 U419 ( .A(n351), .B(n381), .Y(n356) );
  NAND3X1 U420 ( .A(n348), .B(n350), .C(state[1]), .Y(n381) );
  NAND2X1 U421 ( .A(n388), .B(n348), .Y(busy) );
  NOR2X1 U422 ( .A(state[2]), .B(state[1]), .Y(n388) );
endmodule

