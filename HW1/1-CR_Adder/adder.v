

module Full_Adder(Sum,Cout,a,b,Cin);

    input A, B, Cin;
    output Sum, Cout;

    wire W1, W2, W3;

    assign W1 = A^B;
    assign W2 = W1&Cin;
    assign W3 = A&B;
    assign Sum = W1^Cin;
    assign Cout = W2|W3;

endmodule

module adder(x, y, carry, out);
	input [7:0] x, y;
	output carry;
	output [7:0] out;
	wire w1,w2,w3,w4,w5,w6,w7;
/*Write your code here*/
	Full_Adder fa0(out[0],w1,x[0],y[0],1'b0);
	Full_Adder fa1(out[1],w2,x[1],y[1],w1);
	Full_Adder fa2(out[2],w3,x[2],y[2],w2);
	Full_Adder fa3(out[3],w4,x[3],y[3],w3);
	Full_Adder fa4(out[4],w5,x[4],y[4],w4);
	Full_Adder fa5(out[5],w6,x[5],y[5],w5);
	Full_Adder fa6(out[6],w7,x[6],y[6],w6);
	Full_Adder fa7(out[7],carry,x[7],y[7],w7);
/*End of code*/

endmodule

