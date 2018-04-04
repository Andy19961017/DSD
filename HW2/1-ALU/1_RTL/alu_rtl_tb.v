//rtl_tb
`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5
`define INFILE "Bin.pattern"
`define OUTFILE "Bout_golden.pattern" 

module alu_rtl_tb;
    parameter pattern_num = 8;
    reg  [3:0] ctrl;
    reg  [7:0] x;
    reg  [7:0] y;
    wire       carry;
    wire [7:0] out;
    integer i, num, error;
    
    reg [7:0] ans_out;
    reg [7:0] alu_out;

    reg [7:0] data_base1 [0:100];
    reg [7:0] data_base2 [0:100];
    
    alu_rtl alu1(
        ctrl     ,
        x        ,
        y        ,
        carry    ,
        out  
    );

    initial begin
    $readmemh(`INFILE  , data_base1);
    $readmemh(`OUTFILE , data_base2);
    clk = 1'b1;
    error = 0;
    stop = 0;
    i=0;
    end

    always begin #(`CYCLE * 0.5) clk = ~clk;
    end

    initial begin
        x[7:0] = data_base1[0];
        y[7:0] = data_base1[1];
        
        for(num = 2; num < (pattern_num * 2); num = num + 2) begin
            @(posedge clk) begin
                x[7:0] = data_base1[num];
                y[7:0] = data_base1[num + 1];
            end
        end
    end


    always@(posedge clk) begin
        i <= i + 1;
        if (i >= pattern_num)
            stop <= 1;
    end

    always@(posedge clk ) begin
        alu_out <= out;
        ans_out <= data_base2[i];
        if(alu_out != ans_out) begin
            error <= error + 1;
            $display("An ERROR occurs at no.%d pattern: Output %b != answer %b.\n", i, barrel_out, ans_out);
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
    $dumpfile("barrel.vcd");
    $dumpvars;
    /*  $fsdbDumpfile("barrel.fsdb");
        $fsdbDumpvars;  */
    end

endmodule
