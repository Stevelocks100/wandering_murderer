tag @s add wander.current_entity
execute on vehicle run data modify storage wander:temp entity_type set from entity @s Passengers[{Tags:["wander.current_entity"]}].id
tag @s remove wander.current_entity