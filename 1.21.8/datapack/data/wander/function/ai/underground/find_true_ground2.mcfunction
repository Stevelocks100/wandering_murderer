scoreboard players remove execution_amount wander.temp 1

execute if score execution_amount wander.temp matches ..0 run return 0

execute positioned ~ ~-1 ~ if predicate wander:lone_tower run summon marker ~ ~1 ~ {Tags:["wander.true_ground"]}
execute positioned ~ ~-1 ~ unless predicate wander:lone_tower run function wander:ai/underground/find_true_ground2