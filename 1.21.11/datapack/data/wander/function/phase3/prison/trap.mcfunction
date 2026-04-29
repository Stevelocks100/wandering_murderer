# Generated with MC-Build

execute unless entity @n[tag=wander.phase3.wall_center] run return 0
execute if predicate wander:is_mounted run return 0
execute store result score playerhp wander.temp run data get entity @s Health
execute unless score playerhp wander.temp matches 1.. run return 0
scoreboard players set trapped_timer wander.data 100
tag @s add wander.phase3.trapped
tag @s add wander.current_player
execute at @n[tag=wander.phase3.wall_center] summon marker at @s run function wander:phase3/prison/zzz/4
tag @s remove wander.current_player
execute at @s run function wander:phase3/prison/zzz/5