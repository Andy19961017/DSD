`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5
`define INFILE "in.pattern"
`define OUTFILE "out_golden.pattern" 

module register_file_tb;
    // port declaration for design-under-test
    parameter pattern_num = 5;
    reg Clk, WEN;
    reg  [2:0] RW, RX, RY;
    reg  [7:0] busW;
    wire [7:0] busX, busY;

    reg  stop;
    integer i, num, error;
    
    reg [11:0] ans_x_out;
    reg [11:0] ans_y_out;
    reg [11:0] my_x_out;
    reg [11:0] my_y_out;//first four bits are dummy

    reg [11:0] data_base1 [0:100]; //busW
    reg [11:0]data_base2 [0:100]; //WEN
    // instantiate the design-under-test
    register_file rf(
        Clk  ,
        WEN[0]  ,
        RW[2:0]   ,
        busW ,
        RX[2:0]   ,
        RY[2:0]   ,
        busX[7:0] ,
        busY[7:0]
    );

    // write your test pattern here
initial begin
    $readmemh(`INFILE  , data_base1);
    $readmemh(`OUTFILE , data_base2);
    Clk = 1'b1;
    error = 0;
    stop = 0;
    i=0;
end

always begin #(`CYCLE * 0.5) Clk = ~Clk;
end

initial begin
    busW[7:0] = data_base1[0];
    WEN[7:0] = data_base1[1];
    RW[7:0] = data_base1[2];
    RX[7:0] = data_base1[3];
    RY[7:0] = data_base1[4];

    for(num = 5; num < (pattern_num * 5); num = num + 5) begin
        @(posedge Clk) begin
            busW[7:0] = data_base1[num];
            WEN[7:0] = data_base1num+[1];
            RW[7:0] = data_base1[num+2];
            RX[7:0] = data_base1[num+3];
            RY[7:0] = data_base1[num+4];
        end
    end
end


always@(posedge Clk) begin
    i <= i + 1;
    if (i >= pattern_num)
        stop <= 1;
end

always@(posedge Clk ) begin
    my_x_out <= busX;
    my_y_out <= busY;
    ans_x_out <= data_base2[2*i];
    ans_y_out <= data_base2[2*i+1];
    if(my_x_out != ans_x_out) begin
        error <= error + 1;
        $display("An ERROR occurs at no.%d pattern: Output X %b != answer %b.\n", i, my_x_out, ans_x_out);
    end
    if(my_y_out != ans_y_out) begin
        error <= error + 1;
        $display("An ERROR occurs at no.%d pattern: Output Y %b != answer %b.\n", i, my_y_out, ans_y_out);
    end
end

initial begin
    @(posedge stop) begin
        if(error == 0) begin
            $display("==========================================\n");
            $display("======  Congratulation! You Pass!  =======\n");
            $display("==========================================\n");
        end
        else begin
            $display("===============================\n");
            $display("There are %d errors.", error);
            $display("===============================\n");
        end
        $finish;
    end
end

/*================Dumping Waveform files====================*/
initial begin
$dumpfile("register_file.vcd");
$dumpvars;
/*  $fsdbDumpfile("barrel.fsdb");
    $fsdbDumpvars;  */

endmodule
