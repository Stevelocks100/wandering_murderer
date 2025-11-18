#execute if entity @s[type=!wandering_trader] run scoreboard players set spawn_search_method wander.data 1
#execute if entity @s[type=wandering_trader] run scoreboard players set spawn_search_method wander.data 2

kill @e[tag=wander.potential_spawn]
kill @e[tag=wander.spawn_pos]
#function animated_java:wander/remove/all
tag @s add wander.spawn_checking
tag @s[type=player] add wander.target
execute store result score @s wander.temp run data get entity @s Rotation[0]
execute if score spawn_search_method wander.data matches 1 at @s positioned over motion_blocking_no_leaves unless entity @s[distance=0..2] run return 0
scoreboard players set rotation wander.data 72

execute at @s rotated as @s rotated ~ 0 run function wander:spawn_search/rotate
execute if score spawn_search_method wander.data matches 1 run kill @e[tag=wander.potential_spawn,distance=0..10]
execute if score spawn_search_method wander.data matches 1 run kill @e[tag=wander.potential_spawn,distance=40..]
execute if score spawn_search_method wander.data matches 1 if entity @n[tag=wander.potential_spawn,distance=23..28] run kill @e[tag=wander.potential_spawn,distance=0..22.9]
execute if score spawn_search_method wander.data matches 1 if entity @n[tag=wander.potential_spawn,distance=23..28] run kill @e[tag=wander.potential_spawn,distance=28.1..]
execute if score spawn_search_method wander.data matches 1 as @n[tag=wander.potential_spawn,sort=random] run tag @s add wander.spawn_pos
execute if score spawn_search_method wander.data matches 2 at @n[tag=wander.target] as @n[tag=wander.potential_spawn,distance=8..] run tag @s add wander.spawn_pos

tag @n[tag=wander.spawn_pos] remove wander.potential_spawn
kill @e[tag=wander.potential_spawn]
tag @s remove wander.spawn_checking
scoreboard players set spawn_search_method wander.data 1