wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/raid7_2/userb04/b04067/4HW/cache.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb_cache"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_cache/sr\[31:0\]} \
{/tb_cache/sw\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalSetScope -win $_nWave1 "/tb_cache/u_cache"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_cache/sr\[31:0\]} \
{/tb_cache/sw\[31:0\]} \
{/tb_cache/u_cache/rh\[31:0\]} \
{/tb_cache/u_cache/rm\[31:0\]} \
{/tb_cache/u_cache/wh\[31:0\]} \
{/tb_cache/u_cache/wm\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb_cache/sr\[31:0\]} \
{/tb_cache/sw\[31:0\]} \
{/tb_cache/u_cache/rh\[31:0\]} \
{/tb_cache/u_cache/rm\[31:0\]} \
{/tb_cache/u_cache/wh\[31:0\]} \
{/tb_cache/u_cache/wm\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoom -win $_nWave1 38574.747340 516920.060146
wvZoom -win $_nWave1 33064.069149 5130441.396277
