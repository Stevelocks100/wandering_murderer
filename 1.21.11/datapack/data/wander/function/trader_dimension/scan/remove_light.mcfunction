# Generated with MC-Build

execute as @e[tag=wander.trader_dimension.light,distance=0..] at @s if block ~ ~ ~ light run setblock ~ ~ ~ air strict
kill @e[tag=wander.trader_dimension.light,distance=0..]