execute if entity @s[type=player] run return run data modify storage wander:temp entity_type set value "minecraft:player"

execute if predicate wander:is_mounted run return run function wander:sword/get_entity_id2

execute at @s run summon item_display ~ ~ ~ {Tags:["wander.get_id"]}
execute at @s run ride @s mount @n[tag=wander.get_id,x=0]
execute at @s on vehicle run data modify storage wander:temp entity_type set from entity @s Passengers[0].id
ride @s dismount
kill @n[tag=wander.get_id]