execute facing entity @p[tag=wander.spawn_checking] feet run rotate @s ~180 0

execute store result score @s wander.temp run data get entity @s Rotation[0]
execute store result score correct_direction wander.temp run function wander:rotation_threshold {current:"@p[tag=wander.spawn_checking] wander.temp",desired:"@s wander.temp",threshold:"120"}

execute if score correct_direction wander.temp matches 1 run return run kill @s


execute unless predicate wander:enough_height run return run kill @s

#current
#desired
#threshold
tag @s remove new