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

execute unless block ~ ~ ~ #wander:low_explosion_resistance run return run kill

execute if block ~ ~ ~ #wander:immovable run return run kill

execute if block ~ ~ ~ #wander:motion_ish run return run kill

execute if predicate wander:lone_tower run return 0

#execute unless block ~ ~-1 ~ #wander:air_ish run return 0

execute if score do_griefing milk.settings matches 1 run function wander:tower_collapse/replace
execute if score do_griefing milk.settings matches 1 run setblock ~ ~ ~ air

execute if score do_griefing milk.settings matches -1 run particle explosion ~ ~ ~ 0.5 0.5 0.5 0 2 normal @a
execute if score do_griefing milk.settings matches -1 as @p[distance=0..2] run scoreboard players set $strength player_motion.api.launch -5000
execute if score do_griefing milk.settings matches -1 as @p[distance=0..2] at @s rotated as @s rotated ~ 20 run function player_motion:api/launch_looking