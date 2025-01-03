execute as @e[tag=wander.tower_collapse] at @s run function wander:tower_collapse/recursive_jenga_entity

scoreboard players add @e[tag=wander.jenga_checked] wander.temp 1
kill @e[tag=wander.jenga_checked,scores={wander.temp=3..}]
execute unless entity @n[tag=wander.tower_collapse] run kill @e[tag=wander.jenga_checked]

execute if entity @n[tag=wander.tower_collapse] run function wander:tower_collapse/recursive_jenga
