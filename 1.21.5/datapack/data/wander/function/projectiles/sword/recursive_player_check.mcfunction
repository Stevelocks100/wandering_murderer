execute if block ~ ~ ~ #wander:air_ish positioned ~ ~-1 ~ unless predicate wander:lone_tower positioned ~ ~-1 ~ unless predicate wander:lone_tower positioned ~ ~2 ~ run function wander:tower_collapse/explode_top

execute if block ~ ~ ~ #wander:air_ish run return 0
execute positioned ~ ~1 ~ run function wander:projectiles/sword/recursive_player_check
