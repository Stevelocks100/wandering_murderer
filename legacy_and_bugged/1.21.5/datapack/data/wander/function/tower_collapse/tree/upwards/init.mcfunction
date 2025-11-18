
execute if score active_upwards_check wander.data matches 1 run return 0
scoreboard players set highest_checks wander.temp 0

kill @e[tag=wander.collapse_checked]
execute align y run summon marker ~ ~2.5 ~ {Tags:["wander.collapse_detection"]}
scoreboard players set active_upwards_check wander.data 1
execute positioned ~ ~2 ~ run function wander:tower_collapse/tree/upwards/recursive