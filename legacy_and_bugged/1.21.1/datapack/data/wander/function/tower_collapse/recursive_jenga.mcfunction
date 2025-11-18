execute as @e[tag=wander.tower_collapse] at @s run function wander:tower_collapse/recursive_jenga_entity

scoreboard players add @e[tag=wander.jenga_checked] wander.temp 1
kill @e[tag=wander.jenga_checked,scores={wander.temp=2..}]
execute unless entity @n[tag=wander.tower_collapse] run kill @e[tag=wander.jenga_checked]

execute if score max_jenga wander.temp matches 700.. run kill @e[tag=wander.jenga_checked]
execute if score max_jenga wander.temp matches 700.. run kill @e[tag=wander.tower_collapse]

execute if entity @n[tag=wander.tower_collapse] run schedule function wander:tower_collapse/recursive_jenga 1t
