execute as @e[tag=wander.tower_bottom2] store result score @s wander.temp run data get entity @s Pos[1]
scoreboard players set lowest wander.temp 9999
execute as @e[tag=wander.tower_bottom2] run scoreboard players operation lowest wander.temp < @s wander.temp
execute as @e[tag=wander.tower_bottom2] unless score @s wander.temp = lowest wander.temp run kill @s
tag @e[tag=wander.tower_bottom2,sort=random,limit=1] add wander.tower_bottom
tag @n[tag=wander.tower_bottom] remove wander.tower_bottom2
kill @e[tag=wander.tower_bottom2]
kill @e[tag=wander.tower_checked]