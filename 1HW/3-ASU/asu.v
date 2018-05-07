module asu (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0]out;
wire carry0,carry1;
wire [7:0] out0,out1;

/*Write your code here*/
barrel_shifter	b(x,y[2:0],out0);
assign carry0=1'b0;
adder	a(x, y, carry1, out1);
assign out=(mode?out1:out0);
assign carry=(mode?carry1:carry0);
/*End of code*/
endmodule
