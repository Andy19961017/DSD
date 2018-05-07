wvResizeWindow -win $_nWave1 54 259 960 332
wvResizeWindow -win $_nWave1 -4 1 1280 751
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/HW2/3-SimpleCalculator/simple.vcd.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/HW2/3-SimpleCalculator/simple.vcd"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04067/DSD/HW2/3-SimpleCalculator/simple.vcd.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc/a"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc/r"
wvSetPosition -win $_nWave1 {("G1" 8)}
wvSetPosition -win $_nWave1 {("G1" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/simple_calculator_tb/u_calc/r/r0_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r1_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r2_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r3_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r4_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r5_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r6_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r7_w\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G1" 8)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 292.479109 35000.000000
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc/r"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/simple_calculator_tb/u_calc/r/r0_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r1_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r2_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r3_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r4_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r5_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r6_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r7_w\[7:0\]} \
{/simple_calculator_tb/Clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 7500.719952 12930.716359
wvZoom -win $_nWave1 552.460539 27785.515320
wvZoom -win $_nWave1 13519.034355 29962.859796
wvSetCursor -win $_nWave1 4459.628380 -snap {("G1" 6)}
wvZoom -win $_nWave1 210.625394 10666.671764
wvZoom -win $_nWave1 2209.842154 25055.710306
wvZoom -win $_nWave1 7279.480037 24113.277623
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc/r"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb/u_calc"
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/simple_calculator_tb/u_calc/r/r0_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r1_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r2_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r3_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r4_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r5_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r6_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r7_w\[7:0\]} \
{/simple_calculator_tb/Clk} \
{/simple_calculator_tb/u_calc/r/r0_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r1_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r2_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r3_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r4_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r5_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r6_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r7_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 13 14 15 16 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvSetPosition -win $_nWave1 {("G1" 17)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/simple_calculator_tb/u_calc/r/r0_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r1_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r2_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r3_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r4_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r5_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r6_w\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r7_w\[7:0\]} \
{/simple_calculator_tb/Clk} \
{/simple_calculator_tb/u_calc/r/r0_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r1_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r2_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r3_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r4_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r5_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r6_r\[7:0\]} \
{/simple_calculator_tb/u_calc/r/r7_r\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 11 12 13 14 15 16 17 )} 
wvSetPosition -win $_nWave1 {("G1" 17)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 16674.371645 -snap {("G1" 16)}
wvSetCursor -win $_nWave1 11576.487838 -snap {("G2" 0)}
