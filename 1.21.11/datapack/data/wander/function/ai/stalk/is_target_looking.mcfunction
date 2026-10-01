
execute at @p[tag=wander.target] facing entity abb5e532-ba94-447e-8b50-7b463008a14c eyes summon item_display run function wander:temp_rotation_entity
execute store result score current wander.temp run data get entity @p[tag=wander.target] Rotation[0]
execute store result score successful wander.temp run function wander:rotation_threshold {current:'current wander.temp',desired:'desired wander.temp',threshold:120}



execute if score successful wander.temp matches 1 run return 1
execute if score successful wander.temp matches 0 run return 0
return 0