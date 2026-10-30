scoreboard players set nearby_facing wander.temp 0

execute as @a[tag=wander.potential_target,distance=0..90,tag=!wander.target] at @s run function wander:ai/attack/are_nearby_players_looking2

tag @a[tag=wander.target] add wander.new_target
tag @r[tag=wander.new_target] add wander.target
tag @a remove wander.new_target
execute if score nearby_facing wander.temp matches 1 run return 1
return 0