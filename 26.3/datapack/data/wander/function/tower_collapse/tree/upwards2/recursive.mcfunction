kill @e[tag=wander.collapse_checked2]
tag @e[tag=wander.collapse_checked] add wander.collapse_checked2

execute store result score collapse_detection_count wander.temp if entity @e[tag=wander.collapse_detection]
execute if score collapse_detection_count wander.temp matches 150.. run kill @e[tag=wander.collapse_checked]
execute if score collapse_detection_count wander.temp matches 150.. run kill @e[tag=wander.collapse_detection]

execute if score highest_checks wander.temp matches 500.. run kill @e[tag=wander.collapse_detection]
execute if score highest_checks wander.temp matches 500.. run kill @e[tag=wander.collapse_checked]


execute as @e[tag=wander.collapse_detection,tag=!new] at @s run function wander:tower_collapse/tree/upwards2/as_entity
tag @e[tag=wander.collapse_detection,tag=new] remove new


execute unless entity @n[tag=wander.collapse_detection] run kill @e[tag=wander.collapse_checked]
execute unless entity @n[tag=wander.collapse_detection] run scoreboard players set active_upwards_check wander.data 0
#execute if entity @n[tag=wander.collapse_detection] run schedule function wander:tower_collapse/tree/upwards/recursive 1t