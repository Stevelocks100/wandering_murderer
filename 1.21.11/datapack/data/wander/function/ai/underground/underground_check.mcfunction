execute summon marker run function wander:ai/underground/underground_check3 {score:"current_y wander.temp"}
execute positioned over motion_blocking_no_leaves summon marker run function wander:ai/underground/underground_check3 {score:"desired_y wander.temp"}
scoreboard players operation desired_y wander.temp -= current_y wander.temp
#execute if score desired_y wander.temp matches 1.. positioned over motion_blocking_no_leaves positioned ~ ~-2 ~ unless predicate wander:lone_tower run function wander:ai/underground/underground_check2
execute if score desired_y wander.temp matches 2.. run return 1
return 0