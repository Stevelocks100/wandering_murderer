execute as @e[tag=wander.tower_bottom2] at @s positioned ~ ~1 ~ if predicate wander:lone_tower run kill @s
#execute as @e[tag=wander.tower_bottom2] at @s if predicate wander:lone_tower_any run kill @s
#execute at @n[tag=wander.executor] run tag @e[tag=wander.tower_bottom2,sort=nearest,limit=3] add wander.tower_bottom_closest
#kill @e[tag=wander.tower_bottom2,tag=!wander.tower_bottom_closest]

#return 0
execute as @e[tag=wander.tower_bottom2] store result score @s wander.temp run data get entity @s Pos[1]
scoreboard players set lowest wander.temp 9999
execute as @e[tag=wander.tower_bottom2] run scoreboard players operation lowest wander.temp < @s wander.temp

scoreboard players operation lowest_min wander.temp = lowest wander.temp
scoreboard players remove lowest_min wander.temp 2

scoreboard players operation lowest_max wander.temp = lowest wander.temp
scoreboard players add lowest_max wander.temp 2

execute as @e[tag=wander.tower_bottom2] unless predicate wander:within_height_range run kill @s

execute as @e[tag=wander.tower_bottom2] at @s run function wander:tower_collapse/tree/downwards/get_nearby_blocks

execute at @n[tag=wander.executor] run function wander:tower_collapse/tree/downwards/get_nearest
tag @n[tag=wander.tower_bottom] remove wander.tower_bottom2
kill @e[tag=wander.tower_bottom2]
kill @e[tag=wander.tower_checked]

execute at @n[tag=wander.tower_bottom] run summon marker ~ ~ ~ {Tags:["wander.tower_bottom_target"]}
tag @e[tag=wander.executor] remove wander.executor