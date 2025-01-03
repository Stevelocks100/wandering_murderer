execute if entity @n[tag=wander.tower_detection] as @e[tag=wander.tower_detection] at @s run function wander:tower_collapse/tree/downwards/as_entity
execute as @e[tag=wander.tower_checked] run scoreboard players add @s wander.temp 1
kill @e[tag=wander.tower_checked,scores={wander.temp=3..}]

execute unless entity @n[tag=wander.tower_detection] run function wander:tower_collapse/tree/downwards/find_lowest

execute if entity @n[tag=wander.tower_bottom] as @n[tag=wander.tower_bottom] at @s run summon marker ~ ~ ~ {Tags:["wander.tower_bottom_target"]}
execute unless entity @n[tag=wander.tower_bottom] run function wander:tower_collapse/tree/downwards/recursive