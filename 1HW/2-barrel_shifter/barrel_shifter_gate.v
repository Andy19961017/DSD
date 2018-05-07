module barrel_shifter_gate(in, shift, out);
input  [7:0] in;
input  [2:0] shift;
output [7:0] out;

wire   [7:0] atob;
wire   [7:0] btoc;
/*Write your code here*/
level l_1(shift[0],in[7:0],{in[6:0],1'b0},atob[7:0]);
level l_2(shift[1],atob[7:0],{atob[5:0],2'b00},btoc[7:0]);
level l_3(shift[2],btoc[7:0],{btoc[3:0],4'b0000},out[7:0]);
/*End of code*/
endmodule

module mux (x0,x1,s,f);
input 	x0,x1,s;
output 	f;
wire si,w0,w1;

not #1 n0(si,s);
and #1 a0(w0,x0,si);
and #1 a1(w1,x1,s);
or  #1 o1(f,w0,w1);

endmodule

module level (s,x0,x1,f);
input	[7:0] x0;
input	[7:0] x1;
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
