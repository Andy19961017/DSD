`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5
`define INFILE "Bin.pattern"
`define OUTFILE "Bout_golden.pattern" 

module alu_rtl_tb;

    reg  [3:0] ctrl;
    reg  [7:0] x;
    reg  [7:0] y;
    wire       carry;
    wire [7:0] out;
    
    alu_rtl alu1(
        ctrl     ,
        x        ,
        y        ,
        carry    ,
        out  
    );

    always begin #(`CYCLE * 0.5) clk = ~clk;
    end

    initial begin
        // initialization
        Clk = 1'b0;

        //add
        #(`CYCLE*0.2)
        ctrl=0;
        x=8'd3;
        y=8'd10;
        #(`CYCLE*0.4)
        if 