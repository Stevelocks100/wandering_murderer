$execute if score slaughter_forceload wander.data matches 1 positioned $(x) $(y) $(z) if entity @p[distance=0..30] run forceload remove ~ ~
$execute if score slaughter_forceload wander.data matches 1 positioned $(x) $(y) $(z) if entity @p[distance=0..30] run return run scoreboard players set slaughter_forceload wander.data 0

execute if score slaughter_forceload wander.data matches 1 run return 0
execute in wander:pocket unless entity @p[distance=0..1000] run return 0
$execute in wander:pocket if entity @p[distance=0..1000] in minecraft:overworld positioned $(x) $(y) $(z) if loaded ~ ~ ~ run return 0

$execute in minecraft:overworld positioned $(x) $(y) $(z) run forceload add ~ ~
scoreboard players set slaughter_forceload wander.data 1