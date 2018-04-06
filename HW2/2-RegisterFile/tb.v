`timescale 1ns/10ps
`define CYCLE  10
`define HCYCLE  5

module simple_calculator_tb;
    // port declaration for design-under-test
    reg Clk, WEN;
    reg  [2:0] RW, RX, RY;
    reg  [7:0] busW;
    wire [7:0] busX, busY;

    reg  stop;
 
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
    // waveform dump
//    initial begin
//        $fsdbDumpfile("simple_calc.fsdb");
//        $fsdbDumpvars;
//    end
    
    // clock generation
    always#(`HCYCLE) Clk = ~Clk;
    
    integer err_count;
    initial begin
        // initialization
        Clk = 1'b0;
        
        #(`CYCLE*0.2)
        $display( "store 10101010 in REG#1");
        $display( "0:00000000");        
        $display( "1:10101010");        
        $display( "2:xxxxxxxx");     
        $display( "3:xxxxxxxx");     
        $display( "4:xxxxxxxx");     
        $display( "5:xxxxxxxx");     
        $display( "6:xxxxxxxx");     
        $display( "7:xxxxxxxx");     
        WEN = 1'b1; RW=3'd1; busW = 8'b10101010; RX = 3'd0; RY = 3'd0;
        #(`CYCLE*0.4)
        RX = 3'd0;
        $display("0X %b", busX );   
        RX = 3'd1;
        $display("1X %b", busX );   
        RX = 3'd2;
        $display("2X %b", busX );        
        RX = 3'd3;
        $display("3X %b", busX );        
        RX = 3'd4;
        $display("4X %b", busX );        
        RX = 3'd5;
        $display("5X %b", busX );        
        RX = 3'd6;
        $display("6X %b", busX ); 
        RX = 3'd7;
        $display("7X %b", busX ); 
        RY = 3'd0;
        $display("0Y %b", busY );   
        RY = 3'd1;
        $display("1Y %b", busY );   
        RY = 3'd2;
        $display("2Y %b", busY );        
        RY = 3'd3;
        $display("3Y %b", busY );        
        RY = 3'd4;
        $display("4Y %b", busY );        
        RY = 3'd5;
        $display("5Y %b", busY );        
        RY = 3'd6;
        $display("6Y %b", busY ); 
        RY = 3'd7;
        $display("7Y %b", busY ); 
        #(`CYCLE*0.4)

        #(`CYCLE*0.2)
        $display( "store 11111111 in REG#7");
        $display( "0:00000000");        
        $display( "1:10101010");        
        $display( "2:xxxxxxxx");     
        $display( "3:xxxxxxxx");     
        $display( "4:xxxxxxxx");     
        $display( "5:xxxxxxxx");     
        $display( "6:xxxxxxxx");     
        $display( "7:11111111");     
        WEN = 1'b1; RW=3'd7; busW = 8'b11111111; RX = 3'd0; RY = 3'd0;
        #(`CYCLE*0.4)
        RX = 3'd0;
        $display("0X %b", busX );   
        RX = 3'd1;
        $display("1X %b", busX );   
        RX = 3'd2;
        $display("2X %b", busX );        
        RX = 3'd3;
        $display("3X %b", busX );        
        RX = 3'd4;
        $display("4X %b", busX );        
        RX = 3'd5;
        $display("5X %b", busX );        
        RX = 3'd6;
        $display("6X %b", busX ); 
        RX = 3'd7;
        $display("7X %b", busX ); 
        RY = 3'd0;
        $display("0Y %b", busY );   
        RY = 3'd1;
        $display("1Y %b", busY );   
        RY = 3'd2;
        $display("2Y %b", busY );        
        RY = 3'd3;
        $display("3Y %b", busY );        
        RY = 3'd4;
        $display("4Y %b", busY );        
        RY = 3'd5;
        $display("5Y %b", busY );        
        RY = 3'd6;
        $display("6Y %b", busY ); 
        RY = 3'd7;
        $display("7Y %b", busY ); 
        #(`CYCLE*0.4)

        #(`CYCLE*0.2)
        $display( "store 11001100 in REG#0");
        $display( "0:00000000");        
        $display( "1:10101010");        
        $display( "2:xxxxxxxx");     
        $display( "3:xxxxxxxx");     
        $display( "4:xxxxxxxx");     
        $display( "5:xxxxxxxx");     
        $display( "6:xxxxxxxx");     
        $display( "7:11111111");     
        WEN = 1'b1; RW=3'd0; busW =  8'b11001100; RX = 3'd0; RY = 3'd0;
        #(`CYCLE*0.4)
        RX = 3'd0;
        $display("0X %b", busX );   
        RX = 3'd1;
        $display("1X %b", busX );   
        RX = 3'd2;
        $display("2X %b", busX );        
        RX = 3'd3;
        $display("3X %b", busX );        
        RX = 3'd4;
        $display("4X %b", busX );        
        RX = 3'd5;
        $display("5X %b", busX );        
        RX = 3'd6;
        $display("6X %b", busX ); 
        RX = 3'd7;
        $display("7X %b", busX ); 
        RY = 3'd0;
        $display("0Y %b", busY );   
        RY = 3'd1;
        $display("1Y %b", busY );   
        RY = 3'd2;
        $display("2Y %b", busY );        
        RY = 3'd3;
        $display("3Y %b", busY );        
        RY = 3'd4;
        $display("4Y %b", busY );        
        RY = 3'd5;
        $display("5Y %b", busY );        
        RY = 3'd6;
        $display("6Y %b", busY ); 
        RY = 3'd7;
        $display("7Y %b", busY ); 
        #(`CYCLE*0.4)

        #(`CYCLE*0.2)
        $display( "false store 11001100 in REG#3");
        $display( "0:00000000");        
        $display( "1:10101010");        
        $display( "2:xxxxxxxx");     
        $display( "3:xxxxxxxx");     
        $display( "4:xxxxxxxx");     
        $display( "5:xxxxxxxx");     
        $display( "6:xxxxxxxx");     
        $display( "7:11111111");     
        WEN = 1'b0; RW=3'd3; busW = 8'b11001100; RX = 3'd0; RY = 3'd0;
        #(`CYCLE*0.4)
        RX = 3'd0;
        $display("0X %b", busX );   
        RX = 3'd1;
        $display("1X %b", busX );   
        RX = 3'd2;
        $display("2X %b", busX );        
        RX = 3'd3;
        $display("3X %b", busX );        
        RX = 3'd4;
        $display("4X %b", busX );        
        RX = 3'd5;
        $display("5X %b", busX );        
        RX = 3'd6;
        $display("6X %b", busX ); 
        RX = 3'd7;
        $display("7X %b", busX ); 
        RY = 3'd0;
        $display("0Y %b", busY );   
        RY = 3'd1;
        $display("1Y %b", busY );   
        RY = 3'd2;
        $display("2Y %b", busY );        
        RY = 3'd3;
        $display("3Y %b", busY );        
        RY = 3'd4;
        $display("4Y %b", busY );        
        RY = 3'd5;
        $display("5Y %b", busY );        
        RY = 3'd6;
        $display("6Y %b", busY ); 
        RY = 3'd7;
        $display("7Y %b", busY ); 
        #(`CYCLE*0.4)

        $display("Use your eyes to debug. Ha ha !");
    end
endmodule
