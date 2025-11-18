scoreboard players set nearby_facing wander.temp 0

execute as @a[tag=wander.potential_target,distance=0..40,tag=!wander.target] run function wander:ai/stalk/are_nearby_players_looking2

execute if score nearby_facing wander.temp matches 1 run return 1
execute if score nearby_facing wander.temp matches 0 run return 0
return 0