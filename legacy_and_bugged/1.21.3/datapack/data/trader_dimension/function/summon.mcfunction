execute in trader_dimension:pocket run clone 3 0 3 12 10 12 3 30 3

execute in trader_dimension:pocket run forceload add 0 0 1 0
execute positioned 3.5 0.0 3.5 rotated -90 0 in trader_dimension:pocket unless entity @n[tag=aj.trader_dimension.root] run function animated_java:trader_dimension/summon {args:{animation:'trees',start_animation:true}}

execute in trader_dimension:pocket run fill 15 -2 0 0 12 15 minecraft:moving_piston hollow

function trader_dimension:closelid
execute as @n[tag=aj.trader_dimension.root] run function animated_java:trader_dimension/animations/open_chest/stop

execute in trader_dimension:pocket run fill 3 -1 3 12 -1 12 barrier
execute in trader_dimension:pocket run fill 14 -1 14 1 7 13 barrier
execute in trader_dimension:pocket run fill 13 7 12 14 -1 1 barrier
execute in trader_dimension:pocket run fill 12 7 2 1 -1 1 barrier
execute in trader_dimension:pocket run fill 2 7 3 1 -1 12 barrier
execute in trader_dimension:pocket run fill 2 7 3 1 -1 12 barrier


execute in trader_dimension:pocket run clone 3 30 3 12 40 12 3 0 3
execute in trader_dimension:pocket run fill 3 30 3 12 40 12 air
