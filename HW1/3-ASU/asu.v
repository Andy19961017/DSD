module asu (x, y, mode, carry, out);
input [7:0] x, y;
input mode;
output carry;
output [7:0] out;

/*Write your code here*/
if (mode==1'b0)
begin
	barrel_shifter	b(x,y[2:0],out);
	assign carry=1'b0;
end
else
begin
	adder	a(x, y, carry, out)
end
/*End of code*/
endmodule