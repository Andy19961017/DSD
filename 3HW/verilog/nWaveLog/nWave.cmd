wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04067/DSD/3HW/verilog/SingleCycleRTL.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/SingleCycle_tb"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/A\[6:0\]} \
{/SingleCycle_tb/CEN} \
{/SingleCycle_tb/IR\[31:0\]} \
{/SingleCycle_tb/IR_addr\[31:0\]} \
{/SingleCycle_tb/OEN} \
{/SingleCycle_tb/RF_writedata\[31:0\]} \
{/SingleCycle_tb/ReadData2\[31:0\]} \
{/SingleCycle_tb/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/WEN} \
{/SingleCycle_tb/clk} \
{/SingleCycle_tb/error_cnt} \
{/SingleCycle_tb/i} \
{/SingleCycle_tb/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/SingleCycle_tb/A\[6:0\]} \
{/SingleCycle_tb/CEN} \
{/SingleCycle_tb/IR\[31:0\]} \
{/SingleCycle_tb/IR_addr\[31:0\]} \
{/SingleCycle_tb/OEN} \
{/SingleCycle_tb/RF_writedata\[31:0\]} \
{/SingleCycle_tb/ReadData2\[31:0\]} \
{/SingleCycle_tb/ReadDataMem\[31:0\]} \
{/SingleCycle_tb/WEN} \
{/SingleCycle_tb/clk} \
{/SingleCycle_tb/error_cnt} \
{/SingleCycle_tb/i} \
{/SingleCycle_tb/rst_n} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvExit
                                                                                                                                                                                                                                                                                              wvExit
