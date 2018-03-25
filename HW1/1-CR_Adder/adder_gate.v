module adder_gate(x, y, carry, out);
	input [7:0] x, y;
	output carry;
	output [7:0] out;
	wire w1,w2,w3,w4,w5,w6,w7;
/*Write your code here*/
	FA_gatelevel fa0(out[0],w1,x[0],y[0],1'b0);
	FA_gatelevel fa1(out[1],w2,x[1],y[1],w1);
	FA_gatelevel fa2(out[2],w3,x[2],y[2],w2);
	FA_gatelevel fa3(out[3],w4,x[3],y[3],w3);
	FA_gatelevel fa4(out[4],w5,x[4],y[4],w4);
	FA_gatelevel fa5(out[5],w6,x[5],y[5],w5);
	FA_gatelevel fa6(out[6],w7,x[6],y[6],w6);
	FA_gatelevel fa7(out[7],carry,x[7],y[7],w7);
/*End of code*/
endmodule


module FA_co (co,a,b,ci);
	input	a,b,ci;
	output  co;
	wire   	ab,bc,ca;

	and g0(ab,a,b);
	and g1(bc,b,c);
	and g3(ca,c,a);
	or 	g3(co,ab,bc,ca);
endmodule

module FA_sum (sum,a,c,ci)
	input	a,b,ci;
	output	sum,co;

	xor	g1(sum,a,b,ci)
endmodule

module FA_gatelevel (sum,co,a,b,ci)
	input	a,b,ci;
	output	sum,co;

	FA_co	ins_c(co,a,b,ci);
	FA_sum	ins_s(sum,a,c,ci);
endmodule