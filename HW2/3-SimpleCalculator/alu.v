//Behavior ¡Vlevel (event-driven) 
module alu(
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
    output reg [7:0] out;
    reg carry;
    reg carry_add,carry_sub;

always@(*) begin
    case(ctrl)
        4'b0000: out=x+y;
        4'b0001: out=x-y;
        4'b0010: out=x&y;
        4'b0011: out=x|y;
        4'b0100: out=~x;
        4'b0101: out=x^y;
        4'b0110: out=~(x|y);
        4'b0111: out=y<<x[2:0];
        4'b1000: out=y>>x[2:0];
        4'b1001: out={x[7],x[7:1]};
        4'b1010: out={x[6:0],x[7]};
        4'b1011: out={x[0],x[7:1]};
        4'b1100: out=(x==y)?1:0;
        4'b1101: out=0;
        4'b1110: out=0;
        4'b1111: out=0;
    endcase
    carry_add=((x+y)>;
    carry_sub=1'b0;
    case(ctrl)
        4'b0000: carry=carry_add;
        4'b0001: carry=carry_sub;
        4'b0010: carry=0;
        4'b0011: carry=0;
        4'b0100: carry=0;
        4'b0101: carry=0;
        4'b0110: carry=0;
        4'b0111: carry=0;
        4'b1000: carry=0;
        4'b1001: carry=0;
        4'b1010: carry=0;
        4'b1011: carry=0;
        4'b1100: carry=0;
        4'b1101: carry=0;
        4'b1110: carry=0;
        4'b1111: carry=0;
    endcase
end
endmodule
