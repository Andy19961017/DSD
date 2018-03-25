module barrel_shifter_gate(in, shift, out);
input  [7:0] in;
input  [2:0] shift;
output [7:0] out;

wire   [7:0] 1to2;
wire   [7:0] 2to3;
/*Write your code here*/
level l_1(shift[0],in[0:7],{1'b0,in[0:7]},1to2[0:7]);
level l_2(shift[1],1to2[0:7],{1'b0*2,1to2[0:5]},2to3[0:7]);
level l_3(shift[2],2to3[0:7],{1'b0*4,2to3[0:3]},out[0:7]);
/*End of code*/
endmodule

module mux (x0,x1,s,f);
input 	x0,x1,s;
output 	f;
wire si,w0,w1;

not n0(si,s);
and a0(w0,x0,si);
and a1(w1,x1,s);
or  o1(f,w0,w1);

endmodule

module level (s,x0,x1,f);
input	[7:0] x1;
input	[7:0] x2;
input	s;
output	[7:0] f;

mux m0(x0[0],x1[0],s,f[0]);
mux m1(x0[1],x1[1],s,f[1]);
mux m2(x0[2],x1[2],s,f[2]);
mux m3(x0[3],x1[3],s,f[3]);
mux m4(x0[4],x1[4],s,f[4]);
mux m5(x0[5],x1[5],s,f[5]);
mux m6(x0[6],x1[6],s,f[6]);
mux m7(x0[7],x1[7],s,f[7]);

endmodule