wvResizeWindow -win $_nWave1 1 22 1280 751
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/raid7_2/userb04/b04067/DSD/HW1/1-CR_Adder/adder.vcd.fsdb}
wvZoom -win $_nWave1 224.698236 18261.838440
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/adder_gate_test"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/adder_gate_test/adder_out\[8:0\]} \
{/adder_gate_test/ans_out\[8:0\]} \
{/adder_gate_test/x\[7:0\]} \
{/adder_gate_test/y\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 571.959146 18228.833609
wvExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         wvExit
