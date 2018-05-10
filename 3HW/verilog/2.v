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
    wire [31:0] add;
carry_lookahead adder(x, y, 0, add, CarryOut);

    always@(*) begin
        case(ctrl) //synopsys full_case
            4'b0010: out=add;
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
        
        RD1=r_r[RR1];
        RD2=r_r[RR2];
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

 
////////////////////////////////////////////////////////
//4-bit Carry Look Ahead Adder 
////////////////////////////////////////////////////////
 

module carry_lookahead(p, g, CarryIn, c, CarryOut);
    input [31:0] p, g;
    input CarryIn;
    output [31:0] c;
    output CarryOut;
    
    genvar i;
    generate
    for(i=0; i<31; i=i+1)
        begin: CarryLookAhead
            cal_carry myCarry(p[i], g[i], c[i], c[i+1]);
        end
    endgenerate
    cal_carry myCarry31(p[31], g[31], c[31], CarryOut);
endmodule

module cal_carry(p, g, cin, cout);
    input p, g, cin;
    output cout;
    
    wire temp;
    
    and and0(temp, p, c);
    or  or0(cout, temp, g);
endmodule
