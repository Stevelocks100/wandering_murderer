# Generated with MC-Build

execute as @e[tag=wander.trader_dimension.light,x=0] at @s if block ~ ~ ~ light run setblock ~ ~ ~ air strict
kill @e[tag=wander.trader_dimension.light,x=0]
execute if block ~ ~ ~ air run function wander:trader_dimension/scan/zzz/6
execute as @e[tag=wander.trader_dimension.light,x=0] at @s if block ~ ~ ~ air run setblock ~ ~ ~ light strict