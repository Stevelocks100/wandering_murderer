scoreboard players set @s wander.temp 0
execute unless block ~1 ~ ~ #wander:motion_ish run scoreboard players add @s wander.temp 1
execute unless block ~-1 ~ ~ #wander:motion_ish run scoreboard players add @s wander.temp 1
execute unless block ~ ~ ~1 #wander:motion_ish run scoreboard players add @s wander.temp 1
execute unless block ~ ~ ~-1 #wander:motion_ish run scoreboard players add @s wander.temp 1
execute unless block ~ ~1 ~ #wander:motion_ish run scoreboard players add @s wander.temp 1
execute unless block ~ ~-1 ~ #wander:motion_ish run scoreboard players add @s wander.temp 1

execute if score @s wander.temp matches 4.. run kill