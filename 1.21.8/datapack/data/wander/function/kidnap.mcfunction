data modify storage wander:temp kidnap_pos.x set from entity @s Pos[0]
data modify storage wander:temp kidnap_pos.y set from entity @s Pos[1]
data modify storage wander:temp kidnap_pos.z set from entity @s Pos[2]

execute at @s run particle minecraft:campfire_cosy_smoke ~ ~ ~ 0 0 0 0.2 50 normal @a
execute at @s if entity @a[distance=0..2.7,tag=wander.potential_target] run scoreboard players add timer wander.data 600
execute at @s as @a[distance=0..2.7,tag=wander.potential_target] in trader_dimension:pocket run tp @s 5 0 5