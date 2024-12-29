scoreboard players set tower_explosion wander.data 0
execute positioned ~ ~1 ~ run setblock ~ ~ ~ air destroy

execute positioned ~ ~2 ~ run function wander:tower_collapse/recursive_jenga