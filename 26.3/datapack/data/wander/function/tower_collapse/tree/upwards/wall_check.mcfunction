scoreboard players set adjacent_walls wander.temp 0
scoreboard players set vertical_walls wander.temp 0
scoreboard players set diagonal_walls wander.temp 0

execute unless block ~1 ~ ~ #wander:can_pass_with_leaves run scoreboard players add adjacent_walls wander.temp 1
execute unless block ~-1 ~ ~ #wander:can_pass_with_leaves run scoreboard players add adjacent_walls wander.temp 1
execute unless block ~ ~ ~1 #wander:can_pass_with_leaves run scoreboard players add adjacent_walls wander.temp 1
execute unless block ~ ~ ~-1 #wander:can_pass_with_leaves run scoreboard players add adjacent_walls wander.temp 1


execute unless block ~1 ~ ~1 #wander:can_pass_with_leaves run scoreboard players add diagonal_walls wander.temp 1
execute unless block ~-1 ~ ~-1 #wander:can_pass_with_leaves run scoreboard players add diagonal_walls wander.temp 1
execute unless block ~-1 ~ ~1 #wander:can_pass_with_leaves run scoreboard players add diagonal_walls wander.temp 1
execute unless block ~1 ~ ~-1 #wander:can_pass_with_leaves run scoreboard players add diagonal_walls wander.temp 1

execute unless block ~ ~1 ~ #wander:can_pass_with_leaves run scoreboard players add vertical_walls wander.temp 1
execute unless block ~ ~-1 ~ #wander:can_pass_with_leaves run scoreboard players add vertical_walls wander.temp 1

#execute if score vertical_walls wander.temp matches 0 run return 0
execute if score vertical_walls wander.temp matches 2 if score adjacent_walls wander.temp matches 3.. run return 1
return 0