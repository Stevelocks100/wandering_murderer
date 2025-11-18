tag @s add wander.executor
execute if score active_downwards_check wander.data matches 1 run return 0
scoreboard players set lowest_checks wander.temp 0
kill @e[tag=wander.tower_bottom2]
kill @e[tag=wander.tower_bottom]
kill @e[tag=wander.tower_bottom_target]
kill @e[tag=wander.tower_checked]
execute align y run summon marker ~ ~-0.5 ~ {Tags:["wander.tower_detection"]}

#execute align y unless block ~ ~-0.5 ~ #wander:air_ish run summon marker ~ ~-0.5 ~ {Tags:["wander.tower_detection"]}
#execute align y if block ~ ~-0.5 ~ #wander:air_ish run summon marker ~ ~-1.5 ~ {Tags:["wander.tower_detection"]}

scoreboard players set active_downwards_check wander.data 1
function wander:tower_collapse/tree/downwards/recursive