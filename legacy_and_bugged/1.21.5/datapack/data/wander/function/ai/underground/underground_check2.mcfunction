function wander:ai/underground/find_true_ground
execute summon area_effect_cloud run function wander:ai/underground/zzz/cloud9
execute at @n[tag=wander.true_ground] summon area_effect_cloud run function wander:ai/underground/zzz/cloud10
scoreboard players operation desired_y wander.temp -= current_y wander.temp
