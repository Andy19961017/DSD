module asu_gate (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0] out;
wire [7:0]out0;
wire [7:0]out1;
wire carry1;
/*Write your code here*/
barrel_shifter_gate shifter(x,y[2:0],out0);
adder_gate  adder(x,y,carry1,out1);
mymux mx_out0(out0[0],out1[0],mode,out[0]);
mymux mx_out1(out0[1],out1[1],mode,out[1]);
mymux mx_out2(out0[2],out1[2],mode,out[2]);
mymux mx_out3(out0[3],out1[3],mode,out[3]);
mymux mx_out4(out0[4],out1[4],mode,out[4]);
mymux mx_out5(out0[5],out1[5],mode,out[5]);
mymux mx_out6(out0[6],out1[6],mode,out[6]);
mymux mx_out7(out0[7],out1[7],mode,out[7]);
mymux mu_carry(1'b0,carry1,mode,carry);
/*End of code*/
endmodule

module mymux (x0,x1,s,f);
input   x0,x1,s;
output  f;
wire si,w0,w1;
not  n0(si,s);
and  a0(w0,x0,si);
and  a1(w1,x1,s);
or  #2.5 o1(f,w0,w1);
endmodule
