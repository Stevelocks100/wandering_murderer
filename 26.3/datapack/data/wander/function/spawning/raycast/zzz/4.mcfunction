# Generated with MC-Build

data merge entity @s {Tags:["wander.potential_spawn","wander.entity"]}
rotate @s ~180 ~
execute store result score desired wander.temp run data get entity @s Rotation[0]
execute store result score success wander.temp run function wander:rotation_threshold {current:"current wander.temp",desired:"desired wander.temp",threshold:"120"}
execute if score success wander.temp matches 1 run return run kill @s
execute unless predicate wander:enough_height run return run kill @s
rotate @s ~ ~