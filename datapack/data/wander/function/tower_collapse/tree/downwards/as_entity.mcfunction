execute if entity @n[tag=wander.tower_checked,distance=0..0.2] run kill @s
execute if entity @n[tag=wander.tower_checked,distance=0..0.2] run return 0
execute positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection"]}
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection"]}
execute positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection"]}
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection"]}
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:motion_ish unless predicate wander:lone_tower run summon marker ~ ~ ~ {Tags:["wander.tower_detection"]}

scoreboard players set tower_top wander.temp 0
execute positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:motion_ish unless predicate wander:lone_tower run scoreboard players add tower_top wander.temp 1

execute positioned ~ ~-1 ~ if predicate wander:lone_tower run tag @s remove wander.tower_detection
execute positioned ~ ~-1 ~ if predicate wander:lone_tower run tag @s add wander.tower_bottom2

execute if score tower_top wander.temp matches 0 run tag @s remove wander.tower_detection
execute if score tower_top wander.temp matches 0 run tag @s add wander.tower_bottom2
execute unless score tower_top wander.temp matches 0 run tag @s remove wander.tower_detection
execute unless score tower_top wander.temp matches 0 run tag @s add wander.tower_checked