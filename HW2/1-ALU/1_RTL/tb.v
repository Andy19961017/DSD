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

    integer i;
    
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
        i=0;

        //add
        #(`CYCLE*0.2)
        ctrl=4'd0;
        x=8'd3;
        y=8'd10;
        #(`CYCLE*0.4)
        if (out != 8'd13 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        #(`CYCLE*0.2)
        ctrl=4'd0;
        x=8'b11111111;
        y=8'b00000001;
        #(`CYCLE*0.4)
        if (out != 8'd0 or carry != 1'b1) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        #(`CYCLE*0.2)
        ctrl=4'd0;
        x=8'b01111111;
        y=8'd01111111;
        #(`CYCLE*0.4)
        if (out != 8'b11111110 or carry != 1'b1) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //sub
        #(`CYCLE*0.2)
        ctrl=4'd1;
        x=8'd14;
        y=8'd7;
        #(`CYCLE*0.4)
        if (out != 8'd7 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //and
        #(`CYCLE*0.2)
        ctrl=4'd2;
        x=8'b11110011;
        y=8'b00001001;
        #(`CYCLE*0.4)
        if (out != 8'b11111011 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //Shift left logical variable
        #(`CYCLE*0.2)
        ctrl=4'd7;
        x=8'b11110011;
        y=8'b11110011;
        #(`CYCLE*0.4)
        if (out != 8'b10011000 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //Shift right logical variable
        #(`CYCLE*0.2)
        ctrl=4'd7;
        x=8'b10110011;
        y=8'b00000100;
        #(`CYCLE*0.4)
        if (out != 8'b00001011 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //Shift right arithmetic
        #(`CYCLE*0.2)
        ctrl=4'd9;
        x=8'b10110011;
        y=8'b00000000;
        #(`CYCLE*0.4)
        if (out != 8'b11011001 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //Shift right arithmetic
        #(`CYCLE*0.2)
        ctrl=4'd10;
        x=8'b10110011;
        y=8'b11111111;
        #(`CYCLE*0.4)
        if (out != 8'b101100111 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //equal
        #(`CYCLE*0.2)
        ctrl=4'd12;
        x=8'b10110011;
        y=8'b10110011;
        #(`CYCLE*0.4)
        if (out != 8'b00000001 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //equal
        #(`CYCLE*0.2)
        ctrl=4'd12;
        x=8'b10110011;
        y=8'b10100011;
        #(`CYCLE*0.4)
        if (out != 8'b00000000 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)

        //nop
        #(`CYCLE*0.2)
        ctrl=4'd12;
        x=8'b10110011;
        y=8'b10101111;
        #(`CYCLE*0.4)
        if (out != 8'b00000000 or carry != 1'b0) $display( "error on (%b)", i );
        i=i+1;
        #(`CYCLE*0.4)