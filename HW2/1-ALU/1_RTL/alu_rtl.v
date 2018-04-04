//RTL (use continuous assignment)
module alu_rtl(
    ctrl,
    x,
    y,
    carry,
    out  
);
    
    input  [3:0] ctrl;
    input  [7:0] x;
    input  [7:0] y;
    output       carry;
    output [7:0] out;
    wire carry_add,carry_sub;
    wire c000,c00,c0;
    wire [7:0] out0,out1,out2,out3,out4,out5,out6,out7;
    wire [7:0] out8,out9,out10,out11,out12,out13,out14,out15;
    wire [7:0] w000,w001,w010,w011,w100,w101,w110,w111;
    wire [7:0] w00,w01,w10,w11;
    wire [7:0] w0,w1;

    assign carry_add
    assign carry_sub

    assign c000=(ctrl[0])?carry_sub:carry_add;
    assign c00=(ctrl[1])?1'b0,c000;
    assign c0=(ctrl[2])?1'b0,c00;
    assign carry=(ctrl[3])?1'b0,c0;

    assign out0=x+y;
    assign out1=x-y;
    assign out2=x&y;
    assign out3=x|y;
    assign out4=~x;
    assign out5=x^y;
    assign out6=x~|y;
    assign out7=y<<x[2:0];
    assign out8=y>>x[2:0];
    assign out9={x[7],x[7:1]};
    assign out10={x[6:0],x[7]};
    assign out11={x[0],x[7:1]};
    assign out12=(x==y)?1:0;
    assign out13=0;
    assign out14=0;
    assign out15=0;

    assign w000=(ctrl[0])?out1:out0;
    assign w001=(ctrl[0])?out3:out2;
    assign w010=(ctrl[0])?out5:out4;
    assign w011=(ctrl[0])?out7:out6;
    assign w100=(ctrl[0])?out9:out8;
    assign w101=(ctrl[0])?out11:out10;
    assign w110=(ctrl[0])?out13:out12;
    assign w111=(ctrl[0])?out15:out14;

    assign w00=(ctrl[1])?w001:w000;
    assign w01=(ctrl[1])?w011:w010;
    assign w10=(ctrl[1])?w101:w100;
    assign w11=(ctrl[1])?w111:w110;

    assign w0=(ctrl[2])?w01:w00;
    assign w1=(ctrl[2])?w11:w10;

    assign out=(ctrl[3])?w1:w0;


endmodule
