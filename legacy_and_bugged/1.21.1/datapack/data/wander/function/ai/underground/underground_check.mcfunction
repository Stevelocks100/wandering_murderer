execute summon area_effect_cloud store result score current_y wander.temp run data get entity @s Pos[1]
execute positioned over motion_blocking_no_leaves summon area_effect_cloud store result score desired_y wander.temp run data get entity @s Pos[1]
scoreboard players operation desired_y wander.temp -= current_y wander.temp
#execute if score desired_y wander.temp matches 1.. positioned over motion_blocking_no_leaves positioned ~ ~-2 ~ unless predicate wander:lone_tower run function wander:ai/underground/underground_check2
execute if score desired_y wander.temp matches 1.. run return 1
execute unless score desired_y wander.temp matches 1.. run return 0