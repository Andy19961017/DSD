module simple_calculator(
    Clk,
    WEN,
    RW,
    RX,
    RY,
    DataIn,
    Sel,
    Ctrl,
    busY,
    Carry
);

    input        Clk;
    input        WEN;
    input  [2:0] RW, RX, RY;
    input  [7:0] DataIn;
    input        Sel;
    input  [3:0] Ctrl;
    output [7:0] busY;
    output       Carry;
    reg   [7:0] x;
    reg   [7:0] y;
    wire  [7:0] busX, out;

register_file r(
    Clk  ,
    WEN  ,
    RW   ,
    out  ,
    RX   ,
    RY   ,
    busX ,
    busY
    );

    alu a(
    Ctrl,
    x,
    y,
    carry,
    out
    );

// declaration of wire/reg
always@(*) begin

    if (Sel==1)
        x=busX;
    else
        x=DataIn;
    y=busY;
    
end
    
// submodule instantiation

endmodule
