module DFC(clk, reset, datain, cmd, cmd_valid, dataout, output_valid, busy);
input           clk;
input           reset;
input   [7:0]   datain;
input   [1:0]   cmd;
input           cmd_valid;
output  [8:0]   dataout;
output          output_valid;
output          busy;

parameter IDLE = 3'd0;
parameter LOAD_CMD = 3'd1;
parameter Load_Data = 3'd2;
parameter FIFO = 3'd3;
parameter LIFO = 3'd4;
parameter Out = 3'd5;

reg [7:0] data_buf [0:7];
reg [2:0] state;
reg busy,output_valid;
reg [8:0] out_buf [0:3];
reg [8:0] dataout;
reg [1:0] com;
reg [2:0] count;

reg [7:0] data_buf_w [0:7];
wire [8:0] out_buf_w [0:3];

reg [8:0] debug0;
reg [8:0] debug1;
reg [8:0] debug2;
reg [8:0] debug3;
reg   [7:0]   datain1;



integer i;

ALU A0	(.out(out_buf_w[0]), .mode(1'b1), .in_a(data_buf_w[0]), .in_b(data_buf_w[4]));       
ALU A1	(.out(out_buf_w[1]), .mode(1'b1), .in_a(data_buf_w[1]), .in_b(data_buf_w[5]));       
ALU A2	(.out(out_buf_w[2]), .mode(1'b1), .in_a(data_buf_w[2]), .in_b(data_buf_w[6]));       
ALU A3	(.out(out_buf_w[3]), .mode(1'b1), .in_a(data_buf_w[3]), .in_b(data_buf_w[7]));       
    
				
//========== Sequential
always @(posedge clk or posedge reset) begin  
	if (reset) begin
		for(i=0;i<8;i=i+1)
			data_buf[i] <= 8'd0;
		state <= IDLE;
		//for(i=0;i<4;i=i+1)
			//out_buf[i] <= 9'd0;
		output_valid<=1'b0;
		count<=3'b0;
		dataout<=8'b0;
	end
	else begin
		datain1<=datain;
		case (state)
		IDLE: begin
			if (cmd_valid==1'b1) begin
				com<=cmd;
				state<=LOAD_CMD;
				count<=3'b0;
				output_valid<=1'b0;
			end
		end
		LOAD_CMD: begin
			case (com) 
				0: begin state<=Load_Data; count <=3'd0; end
				1: begin state<=FIFO; count <=3'd0; end
				2: begin state<=LIFO; count <=3'd3; end
			endcase
		end
		Load_Data: begin
			data_buf[count]<=datain1;
			if (count==3'd7) begin
				state<=IDLE;
			end
			count<=count+1;
		end
		FIFO: begin
			dataout<=out_buf[count];
			if (count==3'b0) begin
				output_valid<=1'b1;
			end
			count<=count+1;
			if (count==3'd3) begin
				state<=IDLE;
			end
		end
		LIFO: begin
			dataout<=out_buf[count];
			if (count==3'd3) begin
				output_valid<=1'b1;
			end
			count<=count-1;
			if (count==3'd0) begin
				state<=IDLE;
			end
		end
		endcase
	end
end

always @(*) begin		//busy
	if (state==IDLE)
		busy = 1'b0;
	else
		busy = 1'b1;
	out_buf[0]=out_buf_w[0];
	out_buf[1]=out_buf_w[1];
	out_buf[2]=out_buf_w[2];
	out_buf[3]=out_buf_w[3];
	data_buf_w[0]=data_buf[0];
	data_buf_w[1]=data_buf[1];
	data_buf_w[2]=data_buf[2];
	data_buf_w[3]=data_buf[3];
	data_buf_w[4]=data_buf[4];
	data_buf_w[5]=data_buf[5];
	data_buf_w[6]=data_buf[6];
	data_buf_w[7]=data_buf[7];
	debug0<=data_buf_w[3];
	debug1<=data_buf_w[7];
	debug2<=out_buf[2];
	debug3<=out_buf[3];
end

//========= Combinational
//always@(*) begin  //FSM


//end


//always @(*) begin  // dataout, output_valid
//	if (state==Out) begin
//		output_valid = 1'b1;
//		dataout = ;
//	end
//	else begin
//		output_valid = 1'b0;
//		dataout = 8'd0;
//	end
//end




endmodule
