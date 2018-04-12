wvResizeWindow -win $_nWave1 54 259 960 332
wvResizeWindow -win $_nWave1 -4 1 1280 751
wvConvertFile -win $_nWave1 -o \
           "/home/raid7_2/userb04/b04067/DSD/HW2/2-RegisterFile/register_file.fsdb.fsdb" \
           "/home/raid7_2/userb04/b04067/DSD/HW2/2-RegisterFile/register_file.fsdb"
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04067/DSD/HW2/2-RegisterFile/register_file.fsdb.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/simple_calculator_tb/Clk} \
{/simple_calculator_tb/busX\[7:0\]} \
{/simple_calculator_tb/busY\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvGetSignalSetScope -win $_nWave1 "/simple_calculator_tb"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/simple_calculator_tb/Clk} \
{/simple_calculator_tb/busX\[7:0\]} \
{/simple_calculator_tb/busY\[7:0\]} \
{/simple_calculator_tb/rf/r0_w\[7:0\]} \
{/simple_calculator_tb/rf/r1_w\[7:0\]} \
{/simple_calculator_tb/rf/r2_w\[7:0\]} \
{/simple_calculator_tb/rf/r3_w\[7:0\]} \
{/simple_calculator_tb/rf/r4_w\[7:0\]} \
{/simple_calculator_tb/rf/r5_w\[7:0\]} \
{/simple_calculator_tb/rf/r6_w\[7:0\]} \
{/simple_calculator_tb/rf/r7_w\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 311.049211 4986.072423
wvZoom -win $_nWave1 27.855153 4977.517944
