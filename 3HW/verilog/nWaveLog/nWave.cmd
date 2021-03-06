wvResizeWindow -win $_nWave1 0 1 1280 751
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 121.896552 18632.758621
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/ALU_to_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/alu_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 5646.258510 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 3878.462683 -snap {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 6768.128938 -snap {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvExpandBus -win $_nWave1 {("G1" 11)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvExpandBus -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 49)}
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvCollapseBus -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 43)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvExpandBus -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 49)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvCollapseBus -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 43)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvCollapseBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvExpandBus -win $_nWave1 {("G1" 11)}
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvSelectSignal -win $_nWave1 {( "G1" 24 )} 
wvScrollUp -win $_nWave1 13
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvCollapseBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 6870.117159 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 6972.105380 -snap {("G1" 12)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 6904.113233 -snap {("G1" 13)}
wvPrevView -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd"
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 278.620690 17779.482759
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd"
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2657.066591
wvSetCursor -win $_nWave1 2657.066591
wvSetCursor -win $_nWave1 1724.972927
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 )} 
wvSetPosition -win $_nWave1 {("G1" 14)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 15 )} 
wvSetPosition -win $_nWave1 {("G1" 15)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 0 0 1280 751
wvSetCursor -win $_nWave1 2578.114765 -snap {("G1" 11)}
wvZoomIn -win $_nWave1
wvZoomAll -win $_nWave1
wvZoomAll -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 16)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 16 )} 
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 1466.191388 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 2074.124402 -snap {("G1" 16)}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvExpandBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 48)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvCollapseBus -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 16)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvSetPosition -win $_nWave1 {("G1" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 17 18 )} 
wvSetPosition -win $_nWave1 {("G1" 18)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd"
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvSetPosition -win $_nWave1 {("G1" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 19 )} 
wvSetPosition -win $_nWave1 {("G1" 19)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 3450.913876 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 4380.693780 -snap {("G1" 12)}
wvSetCursor -win $_nWave1 4487.976077 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 3182.708134 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 3021.784689 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 2968.143541 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 1948.961722 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 2896.622010 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 2896.622010 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 2896.622010 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 2896.622010 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 4434.334928 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 4523.736842 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 4791.942584 -snap {("G1" 18)}
wvSetCursor -win $_nWave1 2825.100478 -snap {("G1" 0)}
wvSetCursor -win $_nWave1 3182.708134
wvSetCursor -win $_nWave1 4791.942584 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 5095.909091 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 4076.727273 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 3218.468900 -snap {("G1" 16)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/ALU_to_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_rom"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_rom"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 1752.277512 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 1680.755981 -snap {("G1" 13)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvExpandBus -win $_nWave1 {("G1" 20)}
wvScrollUp -win $_nWave1 3
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvCollapseBus -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 21 22 23 24 )} 
wvSetPosition -win $_nWave1 {("G1" 24)}
wvGetSignalClose -win $_nWave1
wvZoomAll -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvExpandBus -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 56)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 1001.301435 -snap {("G1" 27)}
wvSetCursor -win $_nWave1 947.660287 -snap {("G1" 28)}
wvSetCursor -win $_nWave1 965.540670 -snap {("G1" 29)}
wvSetCursor -win $_nWave1 965.540670 -snap {("G1" 30)}
wvSetCursor -win $_nWave1 1037.062201 -snap {("G1" 32)}
wvSelectSignal -win $_nWave1 {( "G1" 20 )} 
wvSetPosition -win $_nWave1 {("G1" 20)}
wvCollapseBus -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 20)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 25 )} 
wvSetPosition -win $_nWave1 {("G1" 25)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSetPosition -win $_nWave1 {("G1" 25)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvSetPosition -win $_nWave1 {("G1" 26)}
wvSetPosition -win $_nWave1 {("G1" 26)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_y\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 26 )} 
wvSetPosition -win $_nWave1 {("G1" 26)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/ALU_to_mem"
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSetPosition -win $_nWave1 {("G1" 29)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_y\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/out\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/x\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/y\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 27 28 29 )} 
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSetPosition -win $_nWave1 {("G1" 29)}
wvSetPosition -win $_nWave1 {("G1" 29)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_y\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/out\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/x\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/y\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 27 28 29 )} 
wvSetPosition -win $_nWave1 {("G1" 29)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/ALU_to_mem"
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_y\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/out\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/x\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/y\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/ctrl\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSetPosition -win $_nWave1 {("G1" 30)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSelectSignal -win $_nWave1 {( "G1" 30 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvExpandBus -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 32)}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvCollapseBus -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 30)}
wvSetCursor -win $_nWave1 858.258373 -snap {("G1" 16)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/Data_memory/read_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/ALU_to_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/registers"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/top_control"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/ALU_to_mem"
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb/i_MIPS/alu_control"
wvSetPosition -win $_nWave1 {("G1" 32)}
wvSetPosition -win $_nWave1 {("G1" 32)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/i_MIPS/PC\[31:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/top_control/ALUSrc} \
{/SingleCycle_tb/i_MIPS/top_control/Branch} \
{/SingleCycle_tb/i_MIPS/top_control/Jump} \
{/SingleCycle_tb/i_MIPS/top_control/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/MemWrite} \
{/SingleCycle_tb/i_MIPS/top_control/RegDST} \
{/SingleCycle_tb/i_MIPS/top_control/RegWrite} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/MemToReg} \
{/SingleCycle_tb/i_MIPS/top_control/instruction\[5:0\]} \
{/SingleCycle_tb/i_MIPS/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/clk} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/RF_writedata\[31:0\]} \
{/SingleCycle_tb/i_MIPS/WD\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALUresult_mem\[31:0\]} \
{/SingleCycle_tb/i_MIPS/IR\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD1\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RD2\[31:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR1\[4:0\]} \
{/SingleCycle_tb/i_MIPS/registers/RR2\[4:0\]} \
{/SingleCycle_tb/i_MIPS/A\[6:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_y\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/out\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/x\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/y\[31:0\]} \
{/SingleCycle_tb/i_MIPS/ALU_to_mem/ctrl\[3:0\]} \
{/SingleCycle_tb/i_MIPS/alu_control/ALUOp\[1:0\]} \
{/SingleCycle_tb/i_MIPS/alu_control/ALUctrl\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 31 32 )} 
wvSetPosition -win $_nWave1 {("G1" 32)}
wvGetSignalClose -win $_nWave1
