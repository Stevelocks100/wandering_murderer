tag @s add new

execute if entity @n[tag=wander.collapse_detection,distance=0..0.1,tag=!new] run kill
execute if entity @n[tag=wander.collapse_detection,distance=0..0.1,tag=!new] run return 0

tag @s remove new

execute if predicate wander:lone_tower run kill
execute if predicate wander:lone_tower run return 0

scoreboard players add highest_checks wander.temp 1

execute positioned ~1 ~ ~ unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.collapse_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.collapse_detection","new"]}
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.collapse_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.collapse_detection","new"]}
execute positioned ~ ~ ~1 unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.collapse_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.collapse_detection","new"]}
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.collapse_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.collapse_detection","new"]}
execute positioned ~ ~1 ~ unless block ~ ~ ~ #wander:motion_ish unless entity @n[tag=wander.collapse_checked,distance=0..0.1] run summon marker ~ ~ ~ {Tags:["wander.collapse_detection","new"]}


tag @s remove wander.collapse_detection
tag @s add wander.collapse_checked

execute if block ~ ~ ~ #wander:immovable run return 0

execute if block ~ ~ ~ #wander:motion_ish run return 0

execute if predicate wander:lone_tower run return 0

#execute unless block ~ ~-1 ~ #wander:air_ish run return 0

function wander:tower_collapse/replace

setblock ~ ~ ~ air
