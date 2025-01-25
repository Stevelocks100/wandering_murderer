execute as @e[tag=wander.tower_bottom2] at @s run summon marker ~ 100 ~ {Tags:["wander.tower_nearest"]}
tag @n[tag=wander.tower_nearest] add wander.tower_nearest_winner
execute as @e[tag=wander.tower_bottom2] at @s positioned ~ 100 ~ if entity @n[tag=wander.tower_nearest_winner,distance=0..0.1] run tag @s add wander.tower_bottom
kill @e[tag=wander.tower_nearest]