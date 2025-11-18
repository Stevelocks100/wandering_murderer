function wander:ai/underground/find_true_ground
execute summon area_effect_cloud store result score current_y wander.temp run data get entity @s Pos[1]
execute at @n[tag=wander.true_ground] summon area_effect_cloud store result score desired_y wander.temp run data get entity @s Pos[1]
scoreboard players operation desired_y wander.temp -= current_y wander.temp
