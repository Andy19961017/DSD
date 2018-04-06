module register_file(
    Clk  ,
    WEN  ,
    RW   ,
    busW ,
    RX   ,
    RY   ,
    busX ,
    busY
);
input        Clk, WEN;
input  [2:0] RW, RX, RY;
input  [7:0] busW;
output reg [7:0] busX, busY;
 
// write your design here
reg [7:0] r0_w, r1_w, r2_w, r3_w, r4_w, r5_w, r6_w, r7_w;
reg [7:0] r0_r, r1_r, r2_r, r3_r, r4_r, r5_r, r6_r, r7_r;

    
always@(*) begin
	if(WEN==1'b1)
	begin
		case(RW)
			3'b000: r0_w=busW;
			3'b001: r1_w=busW;
			3'b010: r2_w=busW;
			3'b011: r3_w=busW;
			3'b100: r4_w=busW;
			3'b101: r5_w=busW;
			3'b110: r6_w=busW;
			3'b111: r7_w=busW;
		endcase
	end
	case(RX)
		3'b000: busX=r0_r;
		3'b001: busX=r1_r;
		3'b010: busX=r2_r;
		3'b011: busX=r3_r;
		3'b100: busX=r4_r;
		3'b101: busX=r5_r;
		3'b110: busX=r6_r;
		3'b111: busX=r7_r;
   	endcase
	case(RY)
		3'b000: busY=r0_r;
		3'b001: busY=r1_r;
		3'b010: busY=r2_r;
		3'b011: busY=r3_r;
		3'b100: busY=r4_r;
		3'b101: busY=r5_r;
		3'b110: busY=r6_r;
		3'b111: busY=r7_r;
	endcase
end

always@(posedge Clk) begin
	r0_r<=8'b00000000;
	r1_r<=r1_w;
	r2_r<=r2_w;
	r3_r<=r3_w;
	r4_r<=r4_w;
	r5_r<=r5_w;
	r6_r<=r6_w;
	r7_r<=r7_w;
end	

endmodule
