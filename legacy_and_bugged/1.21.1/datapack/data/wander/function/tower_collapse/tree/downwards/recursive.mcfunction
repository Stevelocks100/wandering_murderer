kill @e[tag=wander.tower_checked2]
tag @e[tag=wander.tower_checked] add wander.tower_checked2

execute store result score tower_detection_count wander.temp if entity @e[tag=wander.tower_detection]
execute if score tower_detection_count wander.temp matches 150.. run kill @e[tag=wander.tower_checked,tag=!wander.tower_bottom2]
execute if score tower_detection_count wander.temp matches 150.. run kill @e[tag=wander.tower_detection,tag=!wander.tower_bottom2]

execute if score lowest_checks wander.temp matches 500.. run kill @e[tag=wander.tower_detection]
execute if score lowest_checks wander.temp matches 500.. run kill @e[tag=wander.tower_checked]

execute store result score tower_bottom2_count wander.temp if entity @n[tag=wander.tower_bottom2]
execute if score tower_bottom2_count wander.temp matches 12.. run kill @e[tag=wander.tower_detection]
execute if score tower_bottom2_count wander.temp matches 12.. run kill @e[tag=wander.tower_checked]

execute as @e[tag=wander.tower_detection,tag=!new] at @s run function wander:tower_collapse/tree/downwards/as_entity
tag @e[tag=wander.tower_detection,tag=new] remove new

execute unless entity @n[tag=wander.tower_detection] run function wander:tower_collapse/tree/downwards/find_lowest

execute unless entity @n[tag=wander.tower_detection] run kill @e[tag=wander.tower_checked]
execute unless entity @n[tag=wander.tower_detection] run scoreboard players set active_downwards_check wander.data 0
execute if entity @n[tag=wander.tower_detection] run function wander:tower_collapse/tree/downwards/recursive