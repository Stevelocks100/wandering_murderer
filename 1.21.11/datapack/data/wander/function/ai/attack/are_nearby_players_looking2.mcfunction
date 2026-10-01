# execute as @a[tag=wander.potential_target,distance=0..40] run function wander:ai/stalk/are_nearby_players_looking2
# ^^ why the fuck was this here??????? this would have caused lag.

execute facing entity abb5e532-ba94-447e-8b50-7b463008a14c eyes summon item_display run function wander:temp_rotation_entity

execute store result score current wander.temp run data get entity @s Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:65}

tag @s add wander.target
execute if score successful wander.temp matches 1 run scoreboard players set nearby_facing wander.temp 1