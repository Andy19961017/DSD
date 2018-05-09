// Single Cycle MIPS
//=========================================================
// Input/Output Signals:
// positive-edge triggered         clk
// active low asynchronous reset   rst_n
// instruction memory interface    IR_addr, IR
// output for testing purposes     RF_writedata  
//=========================================================
// Wire/Reg Specifications:
// control signals             MemToReg, MemRead, MemWrite, 
//                             RegDST, RegWrite, Branch, 
//                             Jump, ALUSrc, ALUOp
// ALU control signals         ALUctrl
// ALU input signals           ALUin1, ALUin2
// ALU output signals          ALUresult, ALUzero
// instruction specifications  r, j, jal, jr, lw, sw, beq
// sign-extended signal        SignExtend
// MUX output signals          MUX_RegDST, MUX_MemToReg, 
//                             MUX_Src, MUX_Branch, MUX_Jump
// registers input signals     Reg_R1, Reg_R2, Reg_W, WriteData 
// registers                   Register
// registers output signals    ReadData1, ReadData2
// data memory contral signals CEN, OEN, WEN
// data memory output signals  ReadDataMem
// program counter/address     PCin, PCnext, JumpAddr, BranchAddr
//=========================================================

module SingleCycle_MIPS( 
    clk,
    rst_n,
    IR_addr,
    IR,
    RF_writedata,
    ReadDataMem,
    CEN,
    WEN,
    A,
    ReadData2,
    OEN
);

//==== in/out declaration =================================
    //-------- processor ----------------------------------
    input         clk, rst_n;
    input  [31:0] IR;
    output reg [31:0] IR_addr, RF_writedata;
    //-------- data memory --------------------------------
    input  [31:0] ReadDataMem;  // read_data from memory
    output reg    CEN;  // chip_enable, 0 when you read/write data from/to memory
    output reg    WEN;  // write_enable, 0 when you write data into SRAM & 1 when you read data from SRAM
    output reg  [6:0] A;  // address
    output reg [31:0] ReadData2;  // write_data to memory
    output reg    OEN;  // output_enable, 0

//==== reg/wire declaration ===============================
    wire [31:0] ALUresult_mem, RD1, RD2;
    wire [1:0] ALUOp , RegDST, MemToReg, Jump;
    wire [3:0] ALUctrl;
    wire Branch, MemWrite, ALUSrc, RegWrite, zero;

    reg [31:0] ALU_y, WD;
    reg [4:0] WR;
    reg [31:0] nextPC, PCplus4;
    reg [31:0]  PC;

//==== combinational part =================================
    control top_control(
        .instruction(IR[31:26]) ,
        .func(IR[5:0]) ,
        .RegDST(RegDST) ,
        .Jump(Jump) ,
        .Branch(Branch) ,
        .MemToReg(MemToReg) ,
        .ALUOp(ALUOp) ,
        .MemWrite(MemWrite) ,
        .ALUSrc(ALUSrc) ,
        .RegWrite(RegWrite)
    );

    ALU_control alu_control(
        .instruction(IR[5:0]) ,
        .ALUOp(ALUOp) ,
        .ALUctrl(ALUctrl)
    );

    alu ALU_to_mem(
        .ctrl(ALUctrl) ,
        .x(RD1) , //ALU x
        .y(ALU_y) , //ALU y
        .zero(zero) , //Zero
        .out(ALUresult_mem) //ALU result
    );

    register_file registers(
        .Clk(clk)  ,
        .WEN(RegWrite)  ,  //WEN
        .WR(WR)   , //write register
        .WD(WD) , //write data
        .RR1(IR[25:21])   , //read register 1
        .RR2(IR[20:16])   , //read register 2
        .RD1(RD1) ,   //read data 1
        .RD2(RD2) ,   //read data 2
        .reset(rst_n)
    );


//==== sequential part ====================================
    always@(*)begin
        //output
        /*
        ReadData2=RD2;
        A=ALUresult_mem[8:2];
        RF_writedata=WD;
        WEN=~MemWrite;
        OEN=1'b0;
        CEN=1'b0;
        IR_addr=PC;*/

        //wire
        PCplus4=PC+4;
        ALU_y=(ALUSrc ? { {16{IR[15]}} ,IR[15:0]} : RD2);
        WR=(RegDST[0] ? IR[15:11] : (RegDST[1]? 5'd31:IR[20:16]) );
        WD=(MemToReg[0] ? ReadDataMem : (MemToReg[1] ? PCplus4:ALUresult_mem) );
        nextPC=Jump[0]?{PCplus4[31:28],IR[25:0],2'b00}: (Jump[1] ? RD1 :  ((Branch & zero)? ({{14{IR[15]}},IR[15:0],2'b00}+PCplus4) :PCplus4 ) );
	
	//output
	ReadData2=RD2;
	A=ALUresult_mem[8:2];
	RF_writedata=WD;
	WEN=~MemWrite;
	OEN=1'b0;
	CEN=1'b0;
	IR_addr=PC;
    end
    
    always@(posedge clk or negedge rst_n) begin
	if (rst_n==1'b0) PC <= 0;
	else PC<=nextPC;
    end

//=========================================================
endmodule

module alu(
    ctrl,
    x,
    y,
    zero,
    out 
);

    input  [3:0] ctrl;
    input  [31:0] x;
    input  [31:0] y;
    output reg  zero;
    output reg [31:0] out;

    always@(*) begin
        case(ctrl) //synopsys full_case
            4'b0010: out=x+y;
            4'b0110: out=x-y;
	    4'b0000: out=x&y;
            4'b0001: out=x|y;
            4'b0111: out=(x<y)? 31'b01:31'b0;
        endcase
        if (ctrl==4'b0110)
            zero=(x==y)? 1'b1:0;
        else
            zero=1'b0;
    end
endmodule


module control(
    instruction ,
    func ,
    RegDST ,
    Jump ,
    Branch ,
    MemToReg ,
    ALUOp ,
    MemWrite ,
    ALUSrc ,
    RegWrite
);

    input [5:0] instruction, func;
    output reg Branch, MemWrite, ALUSrc, RegWrite;
    output reg [1:0] ALUOp, RegDST, Jump, MemToReg;

    always@(*) begin
	case(instruction) //synopsys full_case
		
        6'b000000: begin
            if (func==6'b001000)
                {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b000000000010;
            else
                {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b010001001000;
        end
        6'b100011:
            {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b001011000000;
        6'b101011:
            {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b001000100000;
        6'b000100:
            {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b000000010100;
        6'b000010:
            {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b000000000001;
        6'b000011:
            {RegDST, ALUSrc, MemToReg, RegWrite, MemWrite, Branch, ALUOp, Jump}=12'b100101000001;
            endcase
	end

endmodule


module ALU_control(
    instruction ,
    ALUOp ,
    ALUctrl
);
    input [5:0] instruction;
    input [1:0] ALUOp;
    output reg [3:0] ALUctrl;

    always@(*) begin
	case(ALUOp) //synopsys full_case
	    2'b00: ALUctrl=4'b0010;
	    2'b01: ALUctrl=4'b0110;
	    2'b10: begin
		    case(instruction[3:0]) //synopsys full_case
		        4'b0000: ALUctrl=4'b0010;
			4'b0010: ALUctrl=4'b0110;
			4'b0100: ALUctrl=4'b0000;
			4'b0101: ALUctrl=4'b0001;
			4'b1010: ALUctrl=4'b0111;
		    endcase
                  end
	endcase
       /* if ({ALUOp, instruction}===8'b00xxxxxx) ALUctrl=4'b0010;
        else if ({ALUOp, instruction}===8'bx1xxxxxx) ALUctrl=4'b0110;
        else if ({ALUOp, instruction}===8'b1xxx0000) ALUctrl=4'b0010;
        else if ({ALUOp, instruction}===8'b1xxx0010) ALUctrl=4'b0110;
        else if ({ALUOp, instruction}===8'b1xxx0100) ALUctrl=4'b0000;
        else if ({ALUOp, instruction}===8'b1xxx0101) ALUctrl=4'b0001;
        else if ({ALUOp, instruction}===8'b1xxx1010) ALUctrl=4'b1111;*/
    end

endmodule

module register_file(
    Clk  ,
    WEN  ,
    WR   ,
    WD ,
    RR1   ,
    RR2   ,
    RD1 ,
    RD2 ,
    reset
);
    input        Clk, WEN, reset;
    input  [4:0] WR, RR1, RR2;
    input  [31:0] WD;
    output reg [31:0] RD1, RD2;
    integer i;

    reg [31:0] demux;
    reg [31:0] r_w[31:0];
    reg [31:0] r_r[31:0];

    always@(*) begin
        demux[0]=(~WR[4] & ~WR[3]) & (~WR[2] & ~WR[1]) & ~WR[0];
        demux[1]=(~WR[4] & ~WR[3]) & (~WR[2] & ~WR[1]) & WR[0];
        demux[2]=(~WR[4] & ~WR[3]) & (~WR[2] & WR[1]) & ~WR[0];
        demux[3]=(~WR[4] & ~WR[3]) & (~WR[2] & WR[1]) & WR[0];
        demux[4]=(~WR[4] & ~WR[3]) & (WR[2] & ~WR[1]) & ~WR[0];
        demux[5]=(~WR[4] & ~WR[3]) & (WR[2] & ~WR[1]) & WR[0];
        demux[6]=(~WR[4] & ~WR[3]) & (WR[2] & WR[1]) & ~WR[0];
        demux[7]=(~WR[4] & ~WR[3]) & (WR[2] & WR[1]) & WR[0];
        demux[8]=(~WR[4] & WR[3]) & (~WR[2] & ~WR[1]) & ~WR[0];
        demux[9]=(~WR[4] & WR[3]) & (~WR[2] & ~WR[1]) & WR[0];
        demux[10]=(~WR[4] & WR[3]) & (~WR[2] & WR[1]) & ~WR[0];
        demux[11]=(~WR[4] & WR[3]) & (~WR[2] & WR[1]) & WR[0];
        demux[12]=(~WR[4] & WR[3]) & (WR[2] & ~WR[1]) & ~WR[0];
        demux[13]=(~WR[4] & WR[3]) & (WR[2] & ~WR[1]) & WR[0];
        demux[14]=(~WR[4] & WR[3]) & (WR[2] & WR[1]) & ~WR[0];
        demux[15]=(~WR[4] & WR[3]) & (WR[2] & WR[1]) & WR[0];
        demux[16]=(WR[4] & ~WR[3]) & (~WR[2] & ~WR[1]) & ~WR[0];
        demux[17]=(WR[4] & ~WR[3]) & (~WR[2] & ~WR[1]) & WR[0];
        demux[18]=(WR[4] & ~WR[3]) & (~WR[2] & WR[1]) & ~WR[0];
        demux[19]=(WR[4] & ~WR[3]) & (~WR[2] & WR[1]) & WR[0];
        demux[20]=(WR[4] & ~WR[3]) & (WR[2] & ~WR[1]) & ~WR[0];
        demux[21]=(WR[4] & ~WR[3]) & (WR[2] & ~WR[1]) & WR[0];
        demux[22]=(WR[4] & ~WR[3]) & (WR[2] & WR[1]) & ~WR[0];
        demux[23]=(WR[4] & ~WR[3]) & (WR[2] & WR[1]) & WR[0];
        demux[24]=(WR[4] & WR[3]) & (~WR[2] & ~WR[1]) & ~WR[0];
        demux[25]=(WR[4] & WR[3]) & (~WR[2] & ~WR[1]) & WR[0];
        demux[26]=(WR[4] & WR[3]) & (~WR[2] & WR[1]) & ~WR[0];
        demux[27]=(WR[4] & WR[3]) & (~WR[2] & WR[1]) & WR[0];
        demux[28]=(WR[4] & WR[3]) & (WR[2] & ~WR[1]) & ~WR[0];
        demux[29]=(WR[4] & WR[3]) & (WR[2] & ~WR[1]) & WR[0];
        demux[30]=(WR[4] & WR[3]) & (WR[2] & WR[1]) & ~WR[0];
        demux[31]=(WR[4] & WR[3]) & (WR[2] & WR[1]) & WR[0];

        for ( i = 0 ; i <= 31 ; i = i + 1 ) begin
            r_w[i]=(demux[i] & WEN )?WD:r_r[i];
        end
        
	case(RR1)
0:
1:
2:
3:
4:
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23

	
	endcase
        //RD1=r_r[RR1];
        //RD2=r_r[RR2];
        r_r[0]=32'b0;
    end

    always@(posedge Clk or negedge reset) begin
        if (reset==1'b0) begin
            for ( i = 1 ; i <= 31 ; i = i + 1 ) begin
                r_r[i]<=32'b0;
            end
        end
        else begin
            for ( i = 1 ; i <= 31 ; i = i + 1 ) begin
                r_r[i]<=r_w[i];
            end
        end
    end
endmodule

/*
module register_file(
    input [4:0] read_reg1,output [31:0] read_data1,
    input [4:0] read_reg2,output [31:0] read_data2,
    input clk,
    input en_write,
    input [4:0] write_reg,input [31:0] write_data
);

 reg [31:0] registers[31:0];
 // 暫存器0永遠輸出0
 assign rd1 = (ra1 == 5'b00000) ? 32'h00000000 : registers[ra1];
 assign rd2 = (ra2 == 5'b00000) ? 32'h00000000 : registers[ra2];
 // 當en_write=1時，執行將wd寫入暫存器的動作
 always @(posedge clk)
 begin
  if ( en_write )
   registers[wa] <= wd;
 end

endmodule


module register_file(
    Clk  ,
    WEN  ,
    RW   ,
    busW ,
    R1   ,
    R2   ,
    bus1 ,
    bus2 ,
    reset
);
input        Clk, WEN, reset;
input  [4:0] RW, R1, R2;
input  [31:0] busW;
output reg [31:0] bus1, bus2;
 
// write your design here
reg [31:0] r0_w, r1_w, r2_w, r3_w, r4_w, r5_w, r6_w, r7_w;
reg [31:0] r8_w, r9_w, r10_w, r11_w, r12_w, r13_w, r14_w, r15_w;
reg [31:0] r16_w, r17_w, r18_w, r19_w, r20_w, r21_w, r22_w, r23_w;
reg [31:0] r24_w, r25_w, r26_w, r27_w, r28_w, r29_w, r30_w, r31_w;
reg [31:0] r0_r, r1_r, r2_r, r3_r, r4_r, r5_r, r6_r, r7_r;
reg [31:0] r8_r, r9_r, r10_r, r11_r, r12_r, r13_r, r14_r, r15_r;
reg [31:0] r16_r, r17_r, r18_r, r19_r, r20_r, r21_r, r22_r, r23_r;
reg [31:0] r24_r, r25_r, r26_r, r27_r, r28_r, r29_r, r30_r, r31_r;

    
always@(*) begin
    //if (WEN==1'b1) begin
        if (reset==1'b0) begin
            r0_r=32'b00000000000000000000000000000000;
            r1_r=32'b00000000000000000000000000000000;
            r2_r=32'b00000000000000000000000000000000;
            r3_r=32'b00000000000000000000000000000000;
            r4_r=32'b00000000000000000000000000000000;
            r5_r=32'b00000000000000000000000000000000;
            r6_r=32'b00000000000000000000000000000000;
            r7_r=32'b00000000000000000000000000000000;
            r8_r=32'b00000000000000000000000000000000;
            r9_r=32'b00000000000000000000000000000000;
            r10_r=32'b00000000000000000000000000000000;
            r11_r=32'b00000000000000000000000000000000;
            r12_r=32'b00000000000000000000000000000000;
            r13_r=32'b00000000000000000000000000000000;
            r14_r=32'b00000000000000000000000000000000;
            r15_r=32'b00000000000000000000000000000000;
            r16_r=32'b00000000000000000000000000000000;
            r17_r=32'b00000000000000000000000000000000;
            r18_r=32'b00000000000000000000000000000000;
            r19_r=32'b00000000000000000000000000000000;
            r20_r=32'b00000000000000000000000000000000;
            r21_r=32'b00000000000000000000000000000000;
            r22_r=32'b00000000000000000000000000000000;
            r23_r=32'b00000000000000000000000000000000;
            r24_r=32'b00000000000000000000000000000000;
            r25_r=32'b00000000000000000000000000000000;
            r26_r=32'b00000000000000000000000000000000;
            r27_r=32'b00000000000000000000000000000000;
            r28_r=32'b00000000000000000000000000000000;
            r29_r=32'b00000000000000000000000000000000;
            r30_r=32'b00000000000000000000000000000000;
            r31_r=32'b00000000000000000000000000000000;
            case(RW)
                5'b00000: begin 
                            if (WEN==1'b1)  r0_w=busW;
                            else r0_w=r0_r;
                        end
                5'b00001: begin 
                            if (WEN==1'b1)  r1_w=busW;
                            else r1_w=r1_r;
                        end
                5'b00010: begin 
                            if (WEN==1'b1)  r2_w=busW;
                            else r2_w=r2_r;
                        end
                5'b00011: begin 
                            if (WEN==1'b1)  r3_w=busW;
                            else r3_w=r3_r;
                        end
                5'b00100: begin 
                            if (WEN==1'b1)  r4_w=busW;
                            else r4_w=r4_r;
                        end
                5'b00101: begin 
                            if (WEN==1'b1)  r5_w=busW;
                            else r5_w=r5_r;
                        end
                5'b00110: begin 
                            if (WEN==1'b1)  r6_w=busW;
                            else r6_w=r6_r;
                        end
                5'b00111: begin 
                            if (WEN==1'b1)  r7_w=busW;
                            else r7_w=r7_r;
                        end
                5'b01000: begin 
                            if (WEN==1'b1)  r8_w=busW;
                            else r8_w=r8_r;
                        end
                5'b01001: begin 
                            if (WEN==1'b1)  r9_w=busW;
                            else r9_w=r9_r;
                        end
                5'b01010: begin 
                            if (WEN==1'b1)  r10_w=busW;
                            else r10_w=r10_r;
                        end
                5'b01011: begin 
                            if (WEN==1'b1)  r11_w=busW;
                            else r11_w=r11_r;
                        end
                5'b01100: begin 
                            if (WEN==1'b1)  r12_w=busW;
                            else r12_w=r12_r;
                        end
                5'b01101: begin 
                            if (WEN==1'b1)  r13_w=busW;
                            else r13_w=r13_r;
                        end
                5'b01110: begin 
                            if (WEN==1'b1)  r14_w=busW;
                            else r14_w=r14_r;
                        end
                5'b01111: begin 
                            if (WEN==1'b1)  r15_w=busW;
                            else r15_w=r15_r;
                        end
                5'b10000: begin 
                            if (WEN==1'b1)  r16_w=busW;
                            else r16_w=r16_r;
                        end
                5'b10001: begin 
                            if (WEN==1'b1)  r17_w=busW;
                            else r17_w=r17_r;
                        end
                5'b10010: begin 
                            if (WEN==1'b1)  r18_w=busW;
                            else r18_w=r18_r;
                        end
                5'b10011: begin 
                            if (WEN==1'b1)  r19_w=busW;
                            else r19_w=r19_r;
                        end
                5'b10100: begin 
                            if (WEN==1'b1)  r20_w=busW;
                            else r20_w=r20_r;
                        end
                5'b10101: begin 
                            if (WEN==1'b1)  r21_w=busW;
                            else r21_w=r21_r;
                        end
                5'b10110: begin 
                            if (WEN==1'b1)  r22_w=busW;
                            else r22_w=r22_r;
                        end
                5'b10111: begin 
                            if (WEN==1'b1)  r23_w=busW;
                            else r23_w=r23_r;
                        end
                5'b11000: begin 
                            if (WEN==1'b1)  r24_w=busW;
                            else r24_w=r24_r;
                        end
                5'b11001: begin 
                            if (WEN==1'b1)  r25_w=busW;
                            else r25_w=r25_r;
                        end
                5'b11010: begin 
                            if (WEN==1'b1)  r26_w=busW;
                            else r26_w=r26_r;
                        end
                5'b11011: begin 
                            if (WEN==1'b1)  r27_w=busW;
                            else r27_w=r27_r;
                        end
                5'b11100: begin 
                            if (WEN==1'b1)  r28_w=busW;
                            else r28_w=r28_r;
                        end
                5'b11101: begin 
                            if (WEN==1'b1)  r29_w=busW;
                            else r29_w=r29_r;
                        end
                5'b11110: begin 
                            if (WEN==1'b1)  r30_w=busW;
                            else r30_w=r30_r;
                        end
                5'b11111: begin 
                            if (WEN==1'b1)  r31_w=busW;
                            else r31_w=r31_r;
                        end
            endcase
        end
    //end
    case(R1)
        5'b00000: busX=r0_r;
        5'b00001: busX=r1_r;
        5'b00010: busX=r2_r;
        5'b00011: busX=r3_r;
        5'b00100: busX=r4_r;
        5'b00101: busX=r5_r;
        5'b00110: busX=r6_r;
        5'b00111: busX=r7_r;
        5'b01000: busX=r8_r;
        5'b01001: busX=r9_r;
        5'b01010: busX=r10_r;
        5'b01011: busX=r11_r;
        5'b01100: busX=r12_r;
        5'b01101: busX=r13_r;
        5'b01110: busX=r14_r;
        5'b01111: busX=r15_r;        
        5'b10000: busX=r16_r;
        5'b10001: busX=r17_r;
        5'b10010: busX=r18_r;
        5'b10011: busX=r19_r;
        5'b10100: busX=r20_r;
        5'b10101: busX=r21_r;
        5'b10110: busX=r22_r;
        5'b10111: busX=r23_r;
        5'b11000: busX=r24_r;
        5'b11001: busX=r25_r;
        5'b11010: busX=r26_r;
        5'b11011: busX=r27_r;
        5'b11100: busX=r28_r;
        5'b11101: busX=r29_r;
        5'b11110: busX=r30_r;
        5'b11111: busX=r31_r;
    endcase
    case(R2)
        5'b00000: busY=r0_r;
        5'b00001: busY=r1_r;
        5'b00010: busY=r2_r;
        5'b00011: busY=r3_r;
        5'b00100: busY=r4_r;
        5'b00101: busY=r5_r;
        5'b00110: busY=r6_r;
        5'b00111: busY=r7_r;
        5'b01000: busY=r8_r;
        5'b01001: busY=r9_r;
        5'b01010: busY=r10_r;
        5'b01011: busY=r11_r;
        5'b01100: busY=r12_r;
        5'b01101: busY=r13_r;
        5'b01110: busY=r14_r;
        5'b01111: busY=r15_r;        
        5'b10000: busY=r16_r;
        5'b10001: busY=r17_r;
        5'b10010: busY=r18_r;
        5'b10011: busY=r19_r;
        5'b10100: busY=r20_r;
        5'b10101: busY=r21_r;
        5'b10110: busY=r22_r;
        5'b10111: busY=r23_r;
        5'b11000: busY=r24_r;
        5'b11001: busY=r25_r;
        5'b11010: busY=r26_r;
        5'b11011: busY=r27_r;
        5'b11100: busY=r28_r;
        5'b11101: busY=r29_r;
        5'b11110: busY=r30_r;
        5'b11111: busY=r31_r;
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
    r8_r<=r8_w;
    r9_r<=r9_w;
    r10_r<=r10_w;
    r11_r<=r11_w;
    r12_r<=r12_w;
    r13_r<=r13_w;
    r14_r<=r14_w;
    r15_r<=r15_w;
    r16_r<=r16_w;
    r17_r<=r17_w;
    r18_r<=r18_w;
    r19_r<=r19_w;
    r20_r<=r20_w;
    r21_r<=r21_w;
    r22_r<=r22_w;
    r23_r<=r23_w;
    r24_r<=r24_w;
    r25_r<=r25_w;
    r26_r<=r26_w;
    r27_r<=r27_w;
    r28_r<=r28_w;
    r29_r<=r29_w;
    r30_r<=r30_w;
    r31_r<=r31_w;
end 

endmodule

module register_file(
    Clk  ,
    WEN  ,
    RW   ,
    busW ,
    R1   ,
    R2   ,
    bus1 ,
    bus2 ,
    reset
);
input        Clk, WEN, reset;
input  [4:0] RW, R1, R2;
input  [31:0] busW;
output reg [31:0] bus1, bus2;
 
// write your design here
reg [31:0] r_w[0:31];
reg [31:0] r_r[0:31];

    
always@(*) begin
    //if (WEN==1'b1) begin
        if (reset==1'b0) begin
            r0_r=32'b00000000000000000000000000000000;
            r1_r=32'b00000000000000000000000000000000;
            r2_r=32'b00000000000000000000000000000000;
            r3_r=32'b00000000000000000000000000000000;
            r4_r=32'b00000000000000000000000000000000;
            r5_r=32'b00000000000000000000000000000000;
            r6_r=32'b00000000000000000000000000000000;
            r7_r=32'b00000000000000000000000000000000;
            r8_r=32'b00000000000000000000000000000000;
            r9_r=32'b00000000000000000000000000000000;
            r10_r=32'b00000000000000000000000000000000;
            r11_r=32'b00000000000000000000000000000000;
            r12_r=32'b00000000000000000000000000000000;
            r13_r=32'b00000000000000000000000000000000;
            r14_r=32'b00000000000000000000000000000000;
            r15_r=32'b00000000000000000000000000000000;
            r16_r=32'b00000000000000000000000000000000;
            r17_r=32'b00000000000000000000000000000000;
            r18_r=32'b00000000000000000000000000000000;
            r19_r=32'b00000000000000000000000000000000;
            r20_r=32'b00000000000000000000000000000000;
            r21_r=32'b00000000000000000000000000000000;
            r22_r=32'b00000000000000000000000000000000;
            r23_r=32'b00000000000000000000000000000000;
            r24_r=32'b00000000000000000000000000000000;
            r25_r=32'b00000000000000000000000000000000;
            r26_r=32'b00000000000000000000000000000000;
            r27_r=32'b00000000000000000000000000000000;
            r28_r=32'b00000000000000000000000000000000;
            r29_r=32'b00000000000000000000000000000000;
            r30_r=32'b00000000000000000000000000000000;
            r31_r=32'b00000000000000000000000000000000;
            case(RW)
                5'b00000: begin 
                            if (WEN==1'b1)  r0_w=busW;
                            else r0_w=r0_r;
                        end
                5'b00001: begin 
                            if (WEN==1'b1)  r1_w=busW;
                            else r1_w=r1_r;
                        end
                5'b00010: begin 
                            if (WEN==1'b1)  r2_w=busW;
                            else r2_w=r2_r;
                        end
                5'b00011: begin 
                            if (WEN==1'b1)  r3_w=busW;
                            else r3_w=r3_r;
                        end
                5'b00100: begin 
                            if (WEN==1'b1)  r4_w=busW;
                            else r4_w=r4_r;
                        end
                5'b00101: begin 
                            if (WEN==1'b1)  r5_w=busW;
                            else r5_w=r5_r;
                        end
                5'b00110: begin 
                            if (WEN==1'b1)  r6_w=busW;
                            else r6_w=r6_r;
                        end
                5'b00111: begin 
                            if (WEN==1'b1)  r7_w=busW;
                            else r7_w=r7_r;
                        end
                5'b01000: begin 
                            if (WEN==1'b1)  r8_w=busW;
                            else r8_w=r8_r;
                        end
                5'b01001: begin 
                            if (WEN==1'b1)  r9_w=busW;
                            else r9_w=r9_r;
                        end
                5'b01010: begin 
                            if (WEN==1'b1)  r10_w=busW;
                            else r10_w=r10_r;
                        end
                5'b01011: begin 
                            if (WEN==1'b1)  r11_w=busW;
                            else r11_w=r11_r;
                        end
                5'b01100: begin 
                            if (WEN==1'b1)  r12_w=busW;
                            else r12_w=r12_r;
                        end
                5'b01101: begin 
                            if (WEN==1'b1)  r13_w=busW;
                            else r13_w=r13_r;
                        end
                5'b01110: begin 
                            if (WEN==1'b1)  r14_w=busW;
                            else r14_w=r14_r;
                        end
                5'b01111: begin 
                            if (WEN==1'b1)  r15_w=busW;
                            else r15_w=r15_r;
                        end
                5'b10000: begin 
                            if (WEN==1'b1)  r16_w=busW;
                            else r16_w=r16_r;
                        end
                5'b10001: begin 
                            if (WEN==1'b1)  r17_w=busW;
                            else r17_w=r17_r;
                        end
                5'b10010: begin 
                            if (WEN==1'b1)  r18_w=busW;
                            else r18_w=r18_r;
                        end
                5'b10011: begin 
                            if (WEN==1'b1)  r19_w=busW;
                            else r19_w=r19_r;
                        end
                5'b10100: begin 
                            if (WEN==1'b1)  r20_w=busW;
                            else r20_w=r20_r;
                        end
                5'b10101: begin 
                            if (WEN==1'b1)  r21_w=busW;
                            else r21_w=r21_r;
                        end
                5'b10110: begin 
                            if (WEN==1'b1)  r22_w=busW;
                            else r22_w=r22_r;
                        end
                5'b10111: begin 
                            if (WEN==1'b1)  r23_w=busW;
                            else r23_w=r23_r;
                        end
                5'b11000: begin 
                            if (WEN==1'b1)  r24_w=busW;
                            else r24_w=r24_r;
                        end
                5'b11001: begin 
                            if (WEN==1'b1)  r25_w=busW;
                            else r25_w=r25_r;
                        end
                5'b11010: begin 
                            if (WEN==1'b1)  r26_w=busW;
                            else r26_w=r26_r;
                        end
                5'b11011: begin 
                            if (WEN==1'b1)  r27_w=busW;
                            else r27_w=r27_r;
                        end
                5'b11100: begin 
                            if (WEN==1'b1)  r28_w=busW;
                            else r28_w=r28_r;
                        end
                5'b11101: begin 
                            if (WEN==1'b1)  r29_w=busW;
                            else r29_w=r29_r;
                        end
                5'b11110: begin 
                            if (WEN==1'b1)  r30_w=busW;
                            else r30_w=r30_r;
                        end
                5'b11111: begin 
                            if (WEN==1'b1)  r31_w=busW;
                            else r31_w=r31_r;
                        end
            endcase
        end
    //end
    case(R1)
        5'b00000: busX=r0_r;
        5'b00001: busX=r1_r;
        5'b00010: busX=r2_r;
        5'b00011: busX=r3_r;
        5'b00100: busX=r4_r;
        5'b00101: busX=r5_r;
        5'b00110: busX=r6_r;
        5'b00111: busX=r7_r;
        5'b01000: busX=r8_r;
        5'b01001: busX=r9_r;
        5'b01010: busX=r10_r;
        5'b01011: busX=r11_r;
        5'b01100: busX=r12_r;
        5'b01101: busX=r13_r;
        5'b01110: busX=r14_r;
        5'b01111: busX=r15_r;        
        5'b10000: busX=r16_r;
        5'b10001: busX=r17_r;
        5'b10010: busX=r18_r;
        5'b10011: busX=r19_r;
        5'b10100: busX=r20_r;
        5'b10101: busX=r21_r;
        5'b10110: busX=r22_r;
        5'b10111: busX=r23_r;
        5'b11000: busX=r24_r;
        5'b11001: busX=r25_r;
        5'b11010: busX=r26_r;
        5'b11011: busX=r27_r;
        5'b11100: busX=r28_r;
        5'b11101: busX=r29_r;
        5'b11110: busX=r30_r;
        5'b11111: busX=r31_r;
    endcase
    case(R2)
        5'b00000: busY=r0_r;
        5'b00001: busY=r1_r;
        5'b00010: busY=r2_r;
        5'b00011: busY=r3_r;
        5'b00100: busY=r4_r;
        5'b00101: busY=r5_r;
        5'b00110: busY=r6_r;
        5'b00111: busY=r7_r;
        5'b01000: busY=r8_r;
        5'b01001: busY=r9_r;
        5'b01010: busY=r10_r;
        5'b01011: busY=r11_r;
        5'b01100: busY=r12_r;
        5'b01101: busY=r13_r;
        5'b01110: busY=r14_r;
        5'b01111: busY=r15_r;        
        5'b10000: busY=r16_r;
        5'b10001: busY=r17_r;
        5'b10010: busY=r18_r;
        5'b10011: busY=r19_r;
        5'b10100: busY=r20_r;
        5'b10101: busY=r21_r;
        5'b10110: busY=r22_r;
        5'b10111: busY=r23_r;
        5'b11000: busY=r24_r;
        5'b11001: busY=r25_r;
        5'b11010: busY=r26_r;
        5'b11011: busY=r27_r;
        5'b11100: busY=r28_r;
        5'b11101: busY=r29_r;
        5'b11110: busY=r30_r;
        5'b11111: busY=r31_r;
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
    r8_r<=r8_w;
    r9_r<=r9_w;
    r10_r<=r10_w;
    r11_r<=r11_w;
    r12_r<=r12_w;
    r13_r<=r13_w;
    r14_r<=r14_w;
    r15_r<=r15_w;
    r16_r<=r16_w;
    r17_r<=r17_w;
    r18_r<=r18_w;
    r19_r<=r19_w;
    r20_r<=r20_w;
    r21_r<=r21_w;
    r22_r<=r22_w;
    r23_r<=r23_w;
    r24_r<=r24_w;
    r25_r<=r25_w;
    r26_r<=r26_w;
    r27_r<=r27_w;
    r28_r<=r28_w;
    r29_r<=r29_w;
    r30_r<=r30_w;
    r31_r<=r31_w;
end 

endmodule*/


