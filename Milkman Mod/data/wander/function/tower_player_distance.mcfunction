summon marker ~ ~ ~ {Tags:["wander.tower_player_distance"]}
data modify entity @n[tag=wander.tower_player_distance] Pos[1] set from entity @p[tag=wander.target]
execute as @p[tag=wander.target] at @s unless entity @n[tag=wander.tower_player_distance,distance=0..1.5] positioned ~ ~-2 ~ run function wander:tower_collapse/get_tower_bottom

kill @n[tag=wander.tower_player_distance]