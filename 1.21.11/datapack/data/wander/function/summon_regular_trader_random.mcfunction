execute store result score if_traders_can_spawn wander.temp run gamerule doTraderSpawning
execute if score if_traders_can_spawn wander.temp matches 0 run return 0
summon marker ~ ~ ~ {Tags:["wander.random_trader"]}
spreadplayers ~ ~ 3 48 false @n[tag=wander.random_trader]
execute at @n[tag=wander.random_trader] run function wander:summon_regular_trader
kill @n[tag=wander.random_trader]