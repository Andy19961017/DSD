wvResizeWindow -win $_nWave1 54 281 960 332
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/HW2/1-ALU/1_RTL/alu_rtl.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/HW2/1-ALU/1_RTL/alu_rtl.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04067/DSD/HW2/1-ALU/1_RTL/alu_rtl.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/alu_rtl_tb"
wvGetSignalSetScope -win $_nWave1 "/alu_rtl_tb/alu1"
wvGetSignalSetScope -win $_nWave1 "/alu_rtl_tb"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/alu_rtl_tb/carry} \
{/alu_rtl_tb/clk} \
{/alu_rtl_tb/ctrl\[3:0\]} \
{/alu_rtl_tb/out\[7:0\]} \
{/alu_rtl_tb/x\[7:0\]} \
{/alu_rtl_tb/y\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/alu_rtl_tb/carry} \
{/alu_rtl_tb/clk} \
{/alu_rtl_tb/ctrl\[3:0\]} \
{/alu_rtl_tb/out\[7:0\]} \
{/alu_rtl_tb/x\[7:0\]} \
{/alu_rtl_tb/y\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 -4 1 1280 751
wvZoom -win $_nWave1 89.136490 11955.431755
wvZoom -win $_nWave1 44.568245 11933.718497
