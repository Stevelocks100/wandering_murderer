tag @s add new
execute if entity @n[tag=wander.tower_bottom2,distance=0..0.1,tag=!new] run kill
execute if entity @n[tag=wander.tower_bottom2,distance=0..0.1,tag=!new] run return 0

execute if entity @n[tag=wander.tower_detection,distance=0..0.1,tag=!new] run kill
execute if entity @n[tag=wander.tower_detection,distance=0..0.1,tag=!new] run return 0
tag @s remove new

execute unless block ~ ~ ~ #wander:low_explosion_resistance run return run kill

execute positioned ~ ~-1 ~ if predicate wander:lone_tower positioned ~ ~-1 ~ if predicate wander:lone_tower run tag @s add wander.tower_bottom2
execute positioned ~ ~-1 ~ if predicate wander:lone_tower positioned ~ ~-1 ~ if predicate wander:lone_tower run tag @s remove wander.tower_detection
execute positioned ~ ~-1 ~ if predicate wander:lone_tower positioned ~ ~-1 ~ if predicate wander:lone_tower run return 0

scoreboard players add lowest_checks wander.temp 1

execute positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.tower_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.tower_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.tower_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.tower_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.tower_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.tower_detection","new"]}


tag @s remove wander.tower_detection
tag @s add wander.tower_checked