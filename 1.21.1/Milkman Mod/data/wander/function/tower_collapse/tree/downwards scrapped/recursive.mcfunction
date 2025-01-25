execute store result score tower_bottom2_check wander.temp if entity @e[tag=wander.tower_bottom2]
execute unless score tower_bottom2_check wander.temp matches 200.. if entity @n[tag=wander.tower_detection] as @e[tag=wander.tower_detection,tag=!new] at @s run function wander:tower_collapse/tree/downwards/as_entity
execute if score tower_bottom2_check wander.temp matches 200.. run tag @e[tag=wander.tower_detection] add wander.tower_checked
execute if score tower_bottom2_check wander.temp matches 200.. run tag @e[tag=wander.tower_detection] remove wander.tower_detection

tag @e[tag=wander.tower_detection,tag=new] remove new
execute as @e[tag=wander.tower_checked] run scoreboard players add @s wander.temp 1
kill @e[tag=wander.tower_checked,scores={wander.temp=3..}]

scoreboard players add lowest_checks wander.temp 1
execute if score lowest_checks wander.temp matches 40.. run kill @e[tag=wander.tower_detection]

execute unless entity @n[tag=wander.tower_detection] run function wander:tower_collapse/tree/downwards/find_lowest

execute if entity @n[tag=wander.tower_bottom] as @n[tag=wander.tower_bottom] at @s run summon marker ~ ~ ~ {Tags:["wander.tower_bottom_target"]}
execute unless entity @n[tag=wander.tower_bottom] run scoreboard players set active_downwards_check wander.data 0
execute unless entity @n[tag=wander.tower_bottom] run kill @e[tag=wander.tower_checked]
execute unless entity @n[tag=wander.tower_bottom] run schedule function wander:tower_collapse/tree/downwards/recursive 1t