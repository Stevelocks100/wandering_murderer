execute if predicate wander:lone_tower run kill
execute if predicate wander:lone_tower run return 0

execute positioned ~ ~-1 ~ if predicate wander:lone_tower unless block ~ ~1 ~ #leaves run tag @s remove wander.tower_detection
execute positioned ~ ~-1 ~ if predicate wander:lone_tower unless block ~ ~1 ~ #leaves run tag @s add wander.tower_bottom2
execute positioned ~ ~-1 ~ if predicate wander:lone_tower unless block ~ ~1 ~ #leaves run return 0

tag @s add new
execute if entity @n[tag=wander.tower_checked,distance=0..0.1,tag=!new] run kill
execute if entity @n[tag=wander.tower_bottom2,distance=0..0.1,tag=!new] run kill
execute if entity @n[tag=wander.tower_detection,distance=0..0.1,tag=!new] run kill
execute if entity @n[tag=wander.tower_checked,distance=0..0.1,tag=!new] run return 0
execute if entity @n[tag=wander.tower_bottom2,distance=0..0.1,tag=!new] run return 0
execute if entity @n[tag=wander.tower_detection,distance=0..0.1,tag=!new] run return 0
tag @s remove new


execute if entity @n[tag=wander.tower_checked,distance=0..0.2] run kill @s
execute if entity @n[tag=wander.tower_checked,distance=0..0.2] run return 0
execute store result score tower_detection_count wander.temp if entity @e[tag=wander.tower_detection]
execute if score tower_detection_count wander.temp matches ..200 positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute if score tower_detection_count wander.temp matches ..200 positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute if score tower_detection_count wander.temp matches ..200 positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute if score tower_detection_count wander.temp matches ..200 positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:motion_ish unless predicate wander:lone_tower run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}

scoreboard players set tower_top wander.temp 0
execute positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish run scoreboard players add tower_top wander.temp 1
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:motion_ish unless predicate wander:lone_tower run scoreboard players add tower_top wander.temp 1



execute if score tower_top wander.temp matches 0 run tag @s remove wander.tower_detection
execute if score tower_top wander.temp matches 0 run tag @s add wander.tower_bottom2
execute unless score tower_top wander.temp matches 0 run tag @s remove wander.tower_detection
execute unless score tower_top wander.temp matches 0 run tag @s add wander.tower_checked